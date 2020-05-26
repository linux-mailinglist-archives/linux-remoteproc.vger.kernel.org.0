Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5421B7F96
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbgDXUCP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729468AbgDXUBu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:01:50 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1975C09B04A
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id c21so3308799plz.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6OcPgDxlDoD3A3IbU3oJZ47tnyLvhscA3C6+vgH47qU=;
        b=GBDPdl81YS026oKzjxXalCH6SHeaqvcvC7z4GqxoOJ9/4sSYXchN9jlXGBaM5n53v1
         cUGXZfYryAKTHCEnzG2UwQTSiLlpewsIJ3HyIAh3mcP+c6I4C4Mp/jpBDd0ivuPgrsZE
         SBBocN43/WUaJESo54oRwvcqCNY4j+CP++qehXbutx+HfQiQi4koJu4fyS9L+7v7roSF
         kHtBT9bmEfPCcZkJ9QT6wr99E8IRlXAucA8pUK4Hh7hhlD/d8lpOTN67thGHvALHrAHP
         4ASJMNACPCTnLiUoScLWds/NldfdCjpBsRdivCwDMqdiqlhCl5/fbLJ6h0XQsLAOg8cz
         6brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6OcPgDxlDoD3A3IbU3oJZ47tnyLvhscA3C6+vgH47qU=;
        b=ipKtQLDjCs9nIef0QM2GkNxTibLbrkRCDFgYl6anCKuZ4keiaCTn7cVDrCWH7uJ5QE
         19Ud+QGb8QigKj1kU7IirPkoLV1FXhE5aBBw3C9UMvXqW81dSbu9UvPRe0fpwdJ6y3MT
         3wddLzzp89VsMtF7M/c0UrP28JbPiTZBo0Q7WlFP9iaVAK995df3OIrIeqk7b95uWhGT
         YfBhp3dgG0b/NbQ4bQkdRhXY556gJp/MdgJ4s7StXDLnFfcniKgSQ9vhJldS+L5VoAk7
         cZcZErGUcKzOUTjZ7SDlPtNdsHqGVGfbTfE1W3tIYJK1odnOx0T4OwphXbVRov+UqRz0
         EINQ==
X-Gm-Message-State: AGi0Pubn+RejV5gHy5wr9pVYpHVXiN+tNanLQTfL3xzHBdHlw32Unnf7
        9Mt9/RIsbwKbGYXglbrQSVNdGw==
X-Google-Smtp-Source: APiQypLxQAxSRxFaS8jwHQdEsmoKibuUvOLUt19m1OR62aHIl5MDSfr/ah8WdHpf+QpT6Z3S9r/97A==
X-Received: by 2002:a17:90a:f995:: with SMTP id cq21mr8167228pjb.56.1587758509098;
        Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:48 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/14] remoteproc: Deal with synchronisation when crashing
Date:   Fri, 24 Apr 2020 14:01:30 -0600
Message-Id: <20200424200135.28825-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_trigger_recovery() in order to avoid
reloading the firmware image when synchronising with a remote
processor rather than booting it.  Also part of the process,
properly set the synchronisation flag in order to properly
recover the system.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     | 23 ++++++++++++++------
 drivers/remoteproc/remoteproc_internal.h | 27 ++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ef88d3e84bfb..3a84a38ba37b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1697,7 +1697,7 @@ static void rproc_coredump(struct rproc *rproc)
  */
 int rproc_trigger_recovery(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p = NULL;
 	struct device *dev = &rproc->dev;
 	int ret;
 
@@ -1718,14 +1718,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* generate coredump */
 	rproc_coredump(rproc);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto unlock_mutex;
+	/* load firmware if need be */
+	if (!rproc_needs_syncing(rproc)) {
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto unlock_mutex;
+		}
 	}
 
-	/* boot the remote processor up again */
+	/* boot up or synchronise with the remote processor again */
 	ret = rproc_start(rproc, firmware_p);
 
 	release_firmware(firmware_p);
@@ -1761,6 +1763,13 @@ static void rproc_crash_handler_work(struct work_struct *work)
 	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
 		rproc->name);
 
+	/*
+	 * The remote processor has crashed - tell the core what operation
+	 * to use from hereon, i.e whether an external entity will reboot
+	 * the MCU or it is now the remoteproc core's responsability.
+	 */
+	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_CRASHED);
+
 	mutex_unlock(&rproc->lock);
 
 	if (!rproc->recovery_disabled)
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 3985c084b184..61500981155c 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,33 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+/*
+ * enum rproc_sync_states - remote processsor sync states
+ *
+ * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
+ *				has crashed but has not been recovered by
+ *				the remoteproc core yet.
+ *
+ * Keeping these separate from the enum rproc_state in order to avoid
+ * introducing coupling between the state of the MCU and the synchronisation
+ * operation to use.
+ */
+enum rproc_sync_states {
+	RPROC_SYNC_STATE_CRASHED,
+};
+
+static inline void rproc_set_sync_flag(struct rproc *rproc,
+				       enum rproc_sync_states state)
+{
+	switch (state) {
+	case RPROC_SYNC_STATE_CRASHED:
+		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
+		break;
+	default:
+		break;
+	}
+}
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
-- 
2.20.1

