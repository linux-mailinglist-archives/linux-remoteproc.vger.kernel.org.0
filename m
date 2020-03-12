Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A635D183C06
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCLWMD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:03 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39843 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgCLWMD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id s2so3756062pgv.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5shZRfndISXfBha4KClPHdNwLMErJ5rqxlgWFeBzywE=;
        b=BFhFq2X7KQwK3uKbPtwbZBV09NhL3ivBezID3ytc3o88mN8i3HOBI7JwLVAnbYiZlN
         9Od8pE8FYObQoTQVAjWS7Yu1AVE62cK7BxJfAKLu1yrbCsqewrWYV8IXk20ziyQbHpsf
         EfIgP2ahCGs6E5K2Xs7l6z6a0aEkFYZiyoDoOXq70JQ7X+mR3V1bsfAo1ffYjgj2yyQJ
         2ryFSMgtas1XjeQ3YERQmpTaBDEKkH+z0gNTBBEETA5+T7kfPsGcFK9zgT1K15b7ogy+
         NzvtSsZSGwNCbMeQ0OIhJxeocfJaz5pG7jeckMMQe8GmvgYxDf0NuHE+ADxzIdOGWfTz
         qHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5shZRfndISXfBha4KClPHdNwLMErJ5rqxlgWFeBzywE=;
        b=JhNjpJxvfRFaq3WIZU035Jc5RZpf9ENygedoh4G/bVnZOIj9cYLAAm7FB+DGU5oQoG
         lZpG1r9EMx4+MheLngSF83KkPs/d6NxqADn7z1eOdWKZoLNt3ww5aIk2SxcBlpJ8KLFL
         ahRfFH+nLwTCRib8laTFh+fSj2pwtD47KL9w7AzPt3I/7eXdpABZiSAviOqlJSCWk/my
         sVTBPdRhXAZ8Nu9qKb9CwdyGAGK6RtH+IAH0Fuim1DFGFHiOiXjq4+7w2gxiBKqA2CXz
         usjqpH2Yl6hqfTXw5LWlSgNrEiAZ9+Utfwwztgs6lIuPwzyaj3o0QiUuHf6z/HB0I006
         DMJA==
X-Gm-Message-State: ANhLgQ0Et7Il5k5ycBZabqglJeFWXKeL15bCE0QtA0CrfSy3jb9BzbYX
        feNLOQVJcIOY5MeW33LnFG+/Iw==
X-Google-Smtp-Source: ADFU+vtx7vQQwNFhzcRfz8yTOymVQ7jLd1xJk23nmOH0KgIGgY0u+/gsg9Di8c2OVM1Myf1bxJEjjQ==
X-Received: by 2002:a63:b34d:: with SMTP id x13mr9964435pgt.317.1584051122241;
        Thu, 12 Mar 2020 15:12:02 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:01 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 02/18] remoteproc: Introduce function rproc_set_mcu_sync_state()
Date:   Thu, 12 Mar 2020 16:11:42 -0600
Message-Id: <20200312221158.3613-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function rproc_set_mcu_sync_state() to set the synchronisation
state of the MCU at various stages of the lifecycle process.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_internal.h | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 5c93de5e00bb..73ea32df0156 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,26 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+/*
+ * enum rproc_sync_states - remote processsor sync states
+ * @RPROC_SYNC_STATE_INIT	state to use when the remoteproc core
+ *				is initialising.
+ * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
+ *				has shutdown (rproc_shutdown()) the MCU.
+ * @RPROC_SYNC_STATE_CRASHED	state to use after the MCU has crashed but
+ *				has not been recovered by the remoteproc
+ *				core yet.
+ *
+ * Keeping these separate from the enum rproc_state in order to avoid
+ * introducing coupling between the state of the MCU and the synchronisation
+ * operation to use.
+ */
+enum rproc_mcu_sync_states {
+	RPROC_SYNC_STATE_INIT,
+	RPROC_SYNC_STATE_SHUTDOWN,
+	RPROC_SYNC_STATE_CRASHED,
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
@@ -68,6 +88,24 @@ static inline bool rproc_sync_with_mcu(struct rproc *rproc)
 	return rproc->sync_with_mcu;
 }
 
+static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
+					    unsigned int state)
+{
+	switch (state) {
+	case RPROC_SYNC_STATE_INIT:
+		rproc->sync_with_mcu = rproc->sync_states->on_init;
+		break;
+	case RPROC_SYNC_STATE_SHUTDOWN:
+		rproc->sync_with_mcu = rproc->sync_states->after_stop;
+		break;
+	case RPROC_SYNC_STATE_CRASHED:
+		rproc->sync_with_mcu = rproc->sync_states->after_crash;
+		break;
+	default:
+		break;
+	}
+}
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
-- 
2.20.1

