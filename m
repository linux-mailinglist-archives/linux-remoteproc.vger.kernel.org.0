Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2A912B169
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Dec 2019 06:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfL0FdM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Dec 2019 00:33:12 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34462 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbfL0Fc7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Dec 2019 00:32:59 -0500
Received: by mail-pf1-f195.google.com with SMTP id i6so7377574pfc.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Dec 2019 21:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F+FUx/nQYrrbDRHZLQaTu/i+aQlt0vK55dtnLQtWHsk=;
        b=s6aKJcPRJJGJbAml1ppgcXP7+X6cEcYvzbj5ZikmJLvE3xgaWOn8GBSNOF5+7cHUCD
         rSnvHuQMXXh06FEmihaYw24TBbiL0golafHaL3KOQ9wDhVG4YnBl+qrQ9uqgI4oiO2Oy
         nlzmQYHupUoiGCbMJ6PVO3PGj8HbG7meLWVw4Tc3YaQPIpnRJabfQpPSVIVGhr+lp2Xf
         cZjlsOodS5bv8pzEbU2KYJ5EkiAFF6PZxddVspdtnTqd+jhfb73q462eNxfySeHeBkh4
         mvYoXfWG1tLYdvXEt1TIQtIapnW/dZfC5d7wdyA3nZm5muq+Qi4AoqBEApa1SnAdcMdq
         0GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F+FUx/nQYrrbDRHZLQaTu/i+aQlt0vK55dtnLQtWHsk=;
        b=ZO5G+6sBcIvTo0LO4coRIqSWk/F3yn2DfnQMqnybJmgaL1HLgbzult/N20Bz56H4M5
         xzmwdHcniIKUFSMi/Eb2YlIAbJvDWUkogXnHPm07j1h3E5HXxKQk0FRlGktxXJ2kjS+4
         ulpVzaev97/nO6+wqH6c1FlDA1yfPm325jmKgjfGwr5LK/h7j+REonESgwcbax/nSgf2
         briMNz6bT6b612o1Gpxok6z389TGFDloy0DLaPrPC9K7KTrPBZfD9g3yi2p9HeKp9n92
         YPGbEhy+0GrQtM8s+/xAwzEShZ+wxDhQdWDSplFMM2TnZB/2dMYGD0BojdVqIu6TxtO6
         SXxQ==
X-Gm-Message-State: APjAAAVxJp2s1fNLNkN5pvF71WYdKTKgqrOFWFo6xpXrMbbCL/aP60ri
        M63J4W45Dca8UviqXwLxOpS0rA==
X-Google-Smtp-Source: APXvYqykVB6Sg275XYpp8OaYtFdA2J8FU9hIotZAajx009lRzRW7ol3l0HL7rchypMnYR7aapuCG7A==
X-Received: by 2002:a63:d906:: with SMTP id r6mr52775727pgg.440.1577424778722;
        Thu, 26 Dec 2019 21:32:58 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c22sm16789196pfo.50.2019.12.26.21.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 21:32:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 6/8] remoteproc: Introduce "panic" callback in ops
Date:   Thu, 26 Dec 2019 21:32:13 -0800
Message-Id: <20191227053215.423811-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227053215.423811-1-bjorn.andersson@linaro.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce a "panic" function in the remoteproc ops table, to allow
remoteproc instances to perform operations needed in order to aid in
post mortem system debugging, such as flushing caches etc, when the
kernel panics.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/remoteproc_core.c | 17 +++++++++++++++++
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 307df98347ba..779f19d6d8e7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1832,6 +1832,17 @@ void rproc_shutdown(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
+static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
+			       void *ptr)
+{
+	struct rproc *rproc = container_of(nb, struct rproc, panic_nb);
+
+	if (rproc->state == RPROC_RUNNING)
+		rproc->ops->panic(rproc);
+
+	return NOTIFY_DONE;
+}
+
 /**
  * rproc_get_by_phandle() - find a remote processor by phandle
  * @phandle: phandle to the rproc
@@ -2057,6 +2068,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
 	}
 
+	/* Register panic notifier for remoteprocs with "panic" callback */
+	if (rproc->ops->panic) {
+		rproc->panic_nb.notifier_call = rproc_panic_handler;
+		atomic_notifier_chain_register(&panic_notifier_list, &rproc->panic_nb);
+	}
+
 	mutex_init(&rproc->lock);
 
 	idr_init(&rproc->notifyids);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..7836c528d309 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -369,6 +369,7 @@ enum rsc_handling_status {
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
+ * @panic:	optional callback to react to system panic
  */
 struct rproc_ops {
 	int (*start)(struct rproc *rproc);
@@ -383,6 +384,7 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	void (*panic)(struct rproc *rproc);
 };
 
 /**
@@ -481,6 +483,7 @@ struct rproc_dump_segment {
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
+ * @panic_nb: notifier_block for remoteproc's panic handler
  */
 struct rproc {
 	struct list_head node;
@@ -514,6 +517,7 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	struct notifier_block panic_nb;
 };
 
 /**
-- 
2.24.0

