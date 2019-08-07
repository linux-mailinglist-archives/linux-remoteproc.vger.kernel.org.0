Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E63843F1
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2019 07:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfHGFkC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Aug 2019 01:40:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45455 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbfHGFj4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:56 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so38953228plr.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Aug 2019 22:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fsAZ/nMaAQwkSV7ok0DKoJTylqdRDHaUnbG8Kv9af6Y=;
        b=o7CDKF6Q9zJTqEn21bYLJqPajiZGXPc5Y9e/zNWTyKu0+rkskbOrSSsGUkphqHIUHC
         L4OHacF4qz/6w8cQ32lfzrB1nkoknbDFJxBpQiIYgvrd88hm7N8DOaHYJb3Tah3UL39o
         t83/EM7kkNOm1uCsLc/QzL7k1O0ncR/5mxsy9z5vIslOVkpGjT63wF7ZjwgNvZ4UAjr/
         ljBgWOJYrDHfa2DfV7GeuAnipqrKg99clqucGsPDtJ0t79TgUtVilCHfVXmeE6bTTU/a
         2UjvkV3Pjiy5/OfMi72US0LbfusZ5Hd2hdKpVi+UsbQWJZMhxWKYWLonDywV2YhG8l5o
         N8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fsAZ/nMaAQwkSV7ok0DKoJTylqdRDHaUnbG8Kv9af6Y=;
        b=krdgHui7eqC/HhTUot13ujfV9m1EVzD5+4zLqFr5/bEUT4SeTHUXoCeYlfw2HYOLGV
         dMJsEi+nexG/p+4sMj0vtv9y1JobOSnQJf6HCvPv4EJ1ZYbQFj31FmNirCMGjrV2Vnq8
         r3pEeiHmcDTLLMIQXEWZtxgODB4M6G/jAzZok+P7FQfSlhdpgc8ZCrsLjEpmsL/kcGbN
         6Liy3OajHD0G0RcqCqsNUDn9hJTSv0IsajmCTW+MH59glmu7NCFAFrxC0oyzEdx3wVQT
         o5CpU9YamX9xqmQ5RDS+4PxAvreZns+UYUKPiyolQFvXwZq6sYP7QEXCC3STLknZ0DeO
         dyJA==
X-Gm-Message-State: APjAAAUIilGgrwA/rYCHNE/PyxO2zFRKb80dn8Dm9Zj2hGLVgryZAcTu
        S4hBm6LKWZX6bqHWbFq1BlNncw==
X-Google-Smtp-Source: APXvYqwYzZ7cbSTohFYWqK8L+390c3t/+Un1jgCkK4FhKNI89l4dBmXtgyyItDaDM+/UUu2V8QHg8Q==
X-Received: by 2002:a62:198d:: with SMTP id 135mr7484409pfz.169.1565156395121;
        Tue, 06 Aug 2019 22:39:55 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 8/9] remoteproc: qcom: q6v5: Add common panic handler
Date:   Tue,  6 Aug 2019 22:39:41 -0700
Message-Id: <20190807053942.9836-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a common panic handler that invokes a stop request and sleep enough
to let the remoteproc flush it's caches etc in order to aid post mortem
debugging.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 0d33e3079f0d..0aebae893362 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
@@ -15,6 +16,8 @@
 #include <linux/remoteproc.h>
 #include "qcom_q6v5.h"
 
+#define Q6V5_PANIC_DELAY_MS	200
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
+/**
+ * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Set the stop bit and sleep in order to allow the remote processor to flush
+ * its caches etc for post mortem debugging.
+ */
+void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
+{
+	qcom_smem_state_update_bits(q6v5->state,
+				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
+
+	mdelay(Q6V5_PANIC_DELAY_MS);
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 7ac92c1e0f49..c37e6fd063e4 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
+void qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
 #endif
-- 
2.18.0

