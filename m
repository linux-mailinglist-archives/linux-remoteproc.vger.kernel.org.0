Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A714479316
	for <lists+linux-remoteproc@lfdr.de>; Mon, 29 Jul 2019 20:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387811AbfG2Sbj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 29 Jul 2019 14:31:39 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:50178 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387397AbfG2Sbj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 29 Jul 2019 14:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564425094; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FcAGdPJjm/WMTlzjt6hmmuMxvU5mwY58SKXONjZ0mHo=;
        b=FgWlPQe2UhH3kzpVoP39R0lIiiXxDQLO7Mu0sanwZem3Jyi2hsP/NtJpW5zBhPTGO/hyi/
        0pSrMs788GN97pAoF62fYW0v8dCRpOzUZ1dwB1QX8JNWcwbYTTpY9+484U8I2P8XHF5JVz
        ga3JpE/PFpsn9Dcjl6VUTRPcm5NIYPY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Paul Burton <paul.burton@mips.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/3] remoteproc: Add prepare/unprepare callbacks
Date:   Mon, 29 Jul 2019 14:31:08 -0400
Message-Id: <20190729183109.18283-2-paul@crapouillou.net>
In-Reply-To: <20190729183109.18283-1-paul@crapouillou.net>
References: <20190729183109.18283-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The .prepare() callback is called before the firmware is loaded to
memory. This is useful for instance in the case where some setup is
required for the memory to be accessible.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..68faad3ef0c1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1300,11 +1300,19 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	if (rproc->ops->prepare) {
+		ret = rproc->ops->prepare(rproc);
+		if (ret) {
+			dev_err(dev, "Failed to prepare rproc: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* load the ELF segments to memory */
 	ret = rproc_load_segments(rproc, fw);
 	if (ret) {
 		dev_err(dev, "Failed to load program segments: %d\n", ret);
-		return ret;
+		goto unprepare_rproc;
 	}
 
 	/*
@@ -1355,6 +1363,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
 	rproc->table_ptr = rproc->cached_table;
+unprepare_rproc:
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
 
 	return ret;
 }
@@ -1484,6 +1495,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
+
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..be65c2a92c58 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -355,6 +355,8 @@ enum rsc_handling_status {
 
 /**
  * struct rproc_ops - platform-specific device handlers
+ * @prepare:	prepare the device for power up (before the firmware is loaded)
+ * @unprepare:	unprepare the device after it is stopped
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
@@ -371,6 +373,8 @@ enum rsc_handling_status {
  * @get_boot_addr:	get boot address to entry point specified in firmware
  */
 struct rproc_ops {
+	int (*prepare)(struct rproc *rproc);
+	void (*unprepare)(struct rproc *rproc);
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-- 
2.21.0.593.g511ec345e18

