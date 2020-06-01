Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE751EA896
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jun 2020 19:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgFARvt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jun 2020 13:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgFARvs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20547C05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:48 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n9so260041plk.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4kQzqlSCAiGDPrwPoS10a6NS/WJiGKixInVwf23N/g=;
        b=jsMA2JyGDIA2nuPm/U8Q8emjpcS27scT4vh7LMJR8IPXxQsLi1oUbUHzimNDNTqPIa
         b1isEdpMDotZ0t9TLHTxyFpsHUX8Zf90IRJh6BKLJ9m5rgS7x5dFu3MnvbbD+ev0L+HQ
         ZVYTUKwVibT61Pv5o1OT4DhH8GY3h8Ux6dlxSO26HZZGpNf2OLWdpvyFpzLMd3P1dO6r
         ZvxhQirCPqo7fCWMMMZCGjhuPTgh3STIZwlyKSdVsosdrccbn0bZCxYBYQomYci+X08O
         cAOrV/Smjbyqm34RyA+QlZbH9QQHsFUS+OfqYVNjqzcpPZMUgY93oj14gxO/Hso1Jv2e
         4xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4kQzqlSCAiGDPrwPoS10a6NS/WJiGKixInVwf23N/g=;
        b=EcBwiBw78dZOjsaTouvgVxwyS17BqsCrUSSZS4KLNPCDZCyrQdnIW9BkzvaR5ZeMQo
         e2BvmcSKyk5RYnzLq0Y6DFB9XnmOY47cjc/YICV97Azw7EIE5dHdTxZCtQJ39h0sGpwQ
         M9Aehu0Pv8hoQsILDVzSmr2ueUcS91FP7FwD4XRtTb4YKe6SOYb3ib8enS/Yvl4OGkn2
         7iO3/PCbEG5djmOaMBuEgw5n6JSbBUL6dxRXaciHGwrI8PQ9gB0ZG4cJlMdohOaHY2T/
         KdqvIRAFYFADV4OkhLj4pF0yBmMQqBEpLw7/jszqODosOwmq4LQhjz6pj9qPEcot/fke
         BKjw==
X-Gm-Message-State: AOAM533CiQrspx8fWjcnS3XGuzy7yZyEFM9lLjiAd3ORjCm4Trn0l7hK
        euL1nfoTHsH9aSURDNxRjOj5xPANI88=
X-Google-Smtp-Source: ABdhPJzgGKvoHRtBwkv2pzmRwy7lyhLJmxlvRmupu2umM7NcN6smBZrrcXePAmh3ySolMbCMraLA/Q==
X-Received: by 2002:a17:902:6b0a:: with SMTP id o10mr19376036plk.121.1591033907658;
        Mon, 01 Jun 2020 10:51:47 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:47 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 6/9] remoteproc: Refactor function rproc_boot()
Date:   Mon,  1 Jun 2020 11:51:36 -0600
Message-Id: <20200601175139.22097-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_boot() to properly deal with scenarios
where the remoteproc core needs to attach with a remote
processor that has already been booted by an external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0be8343dd851..48ddc29814be 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1503,7 +1503,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
  */
-static int __maybe_unused rproc_actuate(struct rproc *rproc)
+static int rproc_actuate(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1923,24 +1923,30 @@ int rproc_boot(struct rproc *rproc)
 		goto unlock_mutex;
 	}
 
-	/* skip the boot process if rproc is already powered up */
+	/* skip the boot or attach process if rproc is already powered up */
 	if (atomic_inc_return(&rproc->power) > 1) {
 		ret = 0;
 		goto unlock_mutex;
 	}
 
-	dev_info(dev, "powering up %s\n", rproc->name);
+	if (rproc->state == RPROC_DETACHED) {
+		dev_info(dev, "attaching to %s\n", rproc->name);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto downref_rproc;
-	}
+		ret = rproc_actuate(rproc);
+	} else {
+		dev_info(dev, "powering up %s\n", rproc->name);
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+		/* load firmware */
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto downref_rproc;
+		}
 
-	release_firmware(firmware_p);
+		ret = rproc_fw_boot(rproc, firmware_p);
+
+		release_firmware(firmware_p);
+	}
 
 downref_rproc:
 	if (ret)
-- 
2.20.1

