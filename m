Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C351B7F94
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbgDXUCP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbgDXUBv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:01:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1CCC09B04B
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t4so4111608plq.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/8EQG22JXL8ro/80I28EMVnMy622Pquoagwe6M0KrVU=;
        b=bkgpsJheMHUDzSTUosy/UAmwFCjhd6C93gLM9hF6tuH8HE0JtCUDwchMJgA4bHZwLP
         4+f1x8+0v/848OOPExzbK2I3sunvdbo5trOn22INE8ZwrpXG0YsszY6YCNaTw1LFt4lY
         XN72vfCJQTu+zmfwmIj5CHhW3OjXO2uMxf+/NdOGySfetVTtMhHgSzuchXCmesiwvz61
         sctlSYlMaonWSsoBknhQ0UeQXNbWCA5tw9GbaJPOEjMemh924mF1FKK/BSqAELRs7mpc
         1OLxUhPRlrtGb02Ieerk9XKr3T05xZzlamq5SxmhEy/mXhO79lDkbcb/RGM90w2y/YOM
         te2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8EQG22JXL8ro/80I28EMVnMy622Pquoagwe6M0KrVU=;
        b=VDhX2+ht28jNob/ikrwobyea3FNhJuPiYgat4pQD0FV4wM8ZgrB+M4Fq5N+JKbwPnH
         9WPHuA2gQvggIKogdd0x1hiYWXwtz5FmJ09I3E6bJS3OEpDlDkoLmCRG9+X17dAH9rmN
         Yyelom/joRl5/cRb+xiTEGhdXHlA9p6KZwb6q3f3HXZev+2JEAENAjILrNXcN+yPILs9
         tcasFWXTwxl6z0FA6YvuRuhKq+SDf0aJeRGLkxCnFml8tnMygMAgTLV1sADha5ExUjd1
         9vDhwFpv0lg8UrEwttzx0GlYtVAbARV2Sz67yPfuI3IodqYX7ROiOmNY3Y2ZibpEYqYB
         O5WQ==
X-Gm-Message-State: AGi0Pubfk1cKFEGn0WqL5/aATUboi89S6GIIbxSgavz9qHtKUIOR9kmW
        Gp/kXLOepM/R68a+B/5PvjHERw==
X-Google-Smtp-Source: APiQypJUSxhtBMeJ7MpTSeNvVV+NwnzwtOy8Co1PRQCOAmo3YYA+dJdsE6uygCk7p+wHrej+onVEZg==
X-Received: by 2002:a17:90a:c702:: with SMTP id o2mr8185535pjt.196.1587758510506;
        Fri, 24 Apr 2020 13:01:50 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/14] remoteproc: Deal with synchronisation when shutting down
Date:   Fri, 24 Apr 2020 14:01:31 -0600
Message-Id: <20200424200135.28825-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The remoteproc core must not allow function rproc_shutdown() to
proceed if currently synchronising with a remote processor and
the synchronisation operations of that remote processor does not
support it.  Also part of the process is to set the synchronisation
flag so that the remoteproc core can make the right decisions when
restarting the system.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  7 ++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3a84a38ba37b..48afa1f80a8f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1849,6 +1849,27 @@ int rproc_boot(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_boot);
 
+static bool rproc_can_shutdown(struct rproc *rproc)
+{
+	/*
+	 * The remoteproc core is the lifecycle manager, no problem
+	 * calling for a shutdown.
+	 */
+	if (!rproc_needs_syncing(rproc))
+		return true;
+
+	/*
+	 * The remoteproc has been loaded by another entity (as per above
+	 * condition) and the platform code has given us the capability
+	 * of stopping it.
+	 */
+	if (rproc->sync_ops->stop)
+		return true;
+
+	/* Any other condition should not be allowed */
+	return false;
+}
+
 /**
  * rproc_shutdown() - power off the remote processor
  * @rproc: the remote processor
@@ -1879,6 +1900,9 @@ void rproc_shutdown(struct rproc *rproc)
 		return;
 	}
 
+	if (!rproc_can_shutdown(rproc))
+		goto out;
+
 	/* if the remote proc is still needed, bail out */
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
@@ -1898,6 +1922,14 @@ void rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+
+	/*
+	 * The remote processor has been switched off - tell the core what
+	 * operation to use from hereon, i.e whether an external entity will
+	 * reboot the remote processor or it is now the remoteproc core's
+	 * responsability.
+	 */
+	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_SHUTDOWN);
 out:
 	mutex_unlock(&rproc->lock);
 }
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 61500981155c..7dcc0a26892b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -27,6 +27,9 @@ struct rproc_debug_trace {
 /*
  * enum rproc_sync_states - remote processsor sync states
  *
+ * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
+ *				has shutdown (rproc_shutdown()) the
+ *				remote processor.
  * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
  *				has crashed but has not been recovered by
  *				the remoteproc core yet.
@@ -36,6 +39,7 @@ struct rproc_debug_trace {
  * operation to use.
  */
 enum rproc_sync_states {
+	RPROC_SYNC_STATE_SHUTDOWN,
 	RPROC_SYNC_STATE_CRASHED,
 };
 
@@ -43,6 +47,9 @@ static inline void rproc_set_sync_flag(struct rproc *rproc,
 				       enum rproc_sync_states state)
 {
 	switch (state) {
+	case RPROC_SYNC_STATE_SHUTDOWN:
+		rproc->sync_with_rproc = rproc->sync_flags.after_stop;
+		break;
 	case RPROC_SYNC_STATE_CRASHED:
 		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
 		break;
-- 
2.20.1

