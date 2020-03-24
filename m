Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7F3191C17
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgCXVqI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:08 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54023 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:08 -0400
Received: by mail-pj1-f67.google.com with SMTP id l36so114496pjb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5shZRfndISXfBha4KClPHdNwLMErJ5rqxlgWFeBzywE=;
        b=KcV9y+P6sG8Dm3u1f2FKxOoovt7sm9RoqC36GrgkerWs9vC8u1m2vnMo1FEA2VE8Yf
         q4rVilECjPTydX3wgBrRbSCDFjb+rE3hYH1FcXASK3bN8cZH/g3ETaJE2Ksa/+infgU/
         SGoMp0ijYIJXKSNZPldD/6dOh1rXpjudi/HkhiFj/Y5CZgiXBdm5brtSNtRsFwAp0cH9
         VC6XgB+YEfZLl7f2fEdT0UhfupbVZAwhTuVo1ZQjuspPJ3iG0bJr+17zJ+Cr3aGDNII0
         4CxxUmcIvNxFZq6Owk4vsfsAt4eRkjHrEq2gbpq7SoUddlxTIHHGWs/QnoxMcfb7LR+z
         3Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5shZRfndISXfBha4KClPHdNwLMErJ5rqxlgWFeBzywE=;
        b=WdHT5YtfrvVCiA0DhVSdEwJrSR99J9JjYEztBXZ/ZjCF36PDeEjII+NVjqCxPfXhql
         iZUUq5hGa78hO1uiHNQmx3Utjt2eTvjUEPwsq8KDDvE/ZBu2p3rp4Fxwgx9JXatJuQ2y
         R91Y5qjKVAExWv78PvYBt+146ZkmJywIiRaz23neyw5xjLQIYzbLlM6BZysdtCsygXFv
         x9c7CSE5MOXQRweWxYqBL0DKzt0pM1n8UoM1cUC34DbDMwYDeZdGkG6oh7FBWKwHY7x5
         jNDxfdGqqyIb10mS0nfeTIzFCrBMehRW711h5qgtERKPsXY9L80vHMyNrfZqBih6+W0/
         LDwA==
X-Gm-Message-State: ANhLgQ1mwAYRgU4sP1bL0T4i6/fOalUMhw7uxxRNIPfn0zmjZ6DfbP7E
        UsEIJfgK4z5iL8zOdnc9cpeqzA==
X-Google-Smtp-Source: ADFU+vswBINdAa+zXGEKoz3fdVV99/9cCFPimm+nMfTd3XBUjAE8yEb6jL5an4OuKd2rS8F0oSowmQ==
X-Received: by 2002:a17:902:7488:: with SMTP id h8mr83004pll.264.1585086367389;
        Tue, 24 Mar 2020 14:46:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:06 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 02/17] remoteproc: Introduce function rproc_set_mcu_sync_state()
Date:   Tue, 24 Mar 2020 15:45:48 -0600
Message-Id: <20200324214603.14979-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
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

