Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3017617F0AB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 07:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgCJGj4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 02:39:56 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40964 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgCJGjz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 02:39:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id z65so6015034pfz.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2020 23:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YfsVrt7o0ODeUDzbZH0eQVL/Trhvd8Ql3RVuWDHCtRc=;
        b=KLDksvb8qftLeVhKdBJT4b7E2h5NmKPfyCN40KXtOLFGfxfnvKLioP1Tlz4NMxDVSd
         I1tO5lSgxS3RBwsfkFv4b+0HUosL/20Rpo853cTPbA7bAf5S9Ynw925F4w6jkm2NhL0G
         QZPMzSaVpt/eSYzyX8Z0KaxJ1aW2I5C3MH9iA9quuNmZeiQNdUNQibXXVPxhzzrw1pU2
         e+9TeD3gtFh+detgUv2b+97jv896tGRMGwiCotkd5zAkn1Hx+MROcj9Wl5l3dZ527ZN2
         tAIrn+DHQFNszG0c3ULjWAW7Ywvx5QS4WFbHJeW5mpNid+O4r/X+uZVtt3t8DYAs2tKA
         SEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YfsVrt7o0ODeUDzbZH0eQVL/Trhvd8Ql3RVuWDHCtRc=;
        b=dJbxmvSzSAutW/OiqXkRTNWu/IFinaWg2En9u/kmKFlAq3IS+XUV6AZxuE2OsDKjN8
         jXFeqtDv68VqTy5888KlENSuYI17sVVFcVgJb+Myp3+UsABNd2s9l4tCAZufCO6zVnds
         RtDD1+0EwdqTF2w/gh3AezfMbeT4PSRsd17T92Y6dwko30P2YsjRtxX0fCHC8D59vMZk
         ljySkDNtrwKw2sGzkokmQCz6QvRow7lJQXNWLygQGIP6GDf0TYJuP31Im8hBFlwRC40t
         ZDOVUG/S1AKrrLkZebQ1DMJUyZIpOJqa4Y1KuYuNhFqvF6GgByfaDDOx2sZfySucJ0Kn
         kVIw==
X-Gm-Message-State: ANhLgQ0ttxd1WxU1JkBKq9ORCfV9mMSFVlUIV0NKHdg/L2/UgUyclMW4
        6gzBA8RpK1VZTRXq41bVj6Y41w==
X-Google-Smtp-Source: ADFU+vtvxuY+C1k56CM5yxeOKK08r6aj22AtT1xpPxBLyuNs+JKtEgkVp7+ooNt5HIjluwmGBZq/5A==
X-Received: by 2002:a63:8f17:: with SMTP id n23mr20759591pgd.161.1583822393538;
        Mon, 09 Mar 2020 23:39:53 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j38sm42398468pgi.51.2020.03.09.23.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:39:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v4 3/4] remoteproc: qcom: q6v5: Add common panic handler
Date:   Mon,  9 Mar 2020 23:38:16 -0700
Message-Id: <20200310063817.3344712-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a common panic handler that invokes a stop request and sleep enough
to let the remoteproc flush it's caches etc in order to aid post mortem
debugging. For now a hard coded 200ms is returned to the remoteproc
core, this value is taken from the downstream kernel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v3:
 - Change return type to unsigned long

 drivers/remoteproc/qcom_q6v5.c | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index cb0f4a0be032..111a442c993c 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -15,6 +15,8 @@
 #include <linux/remoteproc.h>
 #include "qcom_q6v5.h"
 
+#define Q6V5_PANIC_DELAY_MS	200
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -162,6 +164,24 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
+/**
+ * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Set the stop bit and sleep in order to allow the remote processor to flush
+ * its caches etc for post mortem debugging.
+ *
+ * Return: 200ms
+ */
+unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
+{
+	qcom_smem_state_update_bits(q6v5->state,
+				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
+
+	return Q6V5_PANIC_DELAY_MS;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 7ac92c1e0f49..c4ed887c1499 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
+unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
 #endif
-- 
2.24.0

