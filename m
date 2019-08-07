Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9882843F6
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2019 07:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfHGFkQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Aug 2019 01:40:16 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33234 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbfHGFju (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id c14so38853730plo.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Aug 2019 22:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vtVBkwA1h86i3IgqSipfDgtWxsjyT/oqz+jf2YjzTg0=;
        b=iDiNfOYEotcvnZDMgdSF14s4ZRODb3EgWflPP8UEq63YZ6JuonspSElpfLSHlmoxPo
         MX+ciKThLCRBrbSaIo1zbMQj2UuQ54eZQdhDOfsmP2assVHrNGLQSg+aH2QXqLcD1JyU
         +zWJ8soLGnEGo7wEmwfmXbfZ2sC54VvDaQAPdaBBZ+E6PJ5FPoGJK9uUWqPTnqaHYxPE
         gwhr+a5HX58ntzLFq/gUsB87gWlfl6RVnNf77xc0V01/fvK/whZvLUHku3r5Gc5wz/AF
         elNfZYSG+TyTdEf9pSPQQTl7I0IvBhnG31tHLDttd4QQkvoc9aNMWpX72GXnxKKGmrXn
         c1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vtVBkwA1h86i3IgqSipfDgtWxsjyT/oqz+jf2YjzTg0=;
        b=qBb2tsPtX2KmTo32HhLcp7E2KN1sNOLbgwiYoKgEf727wiettuio2r4s0mudNRWRc6
         32fDJpy0PdL+G9gTjcjOOFym9cHfJa92aH4DqnOrzaMdc0Sdx9Z/d2VSrSMR98r65IdN
         oT2VIPnffUFyIIKzbsxDZe6o4GtsWopD0tyLykEgLD+abH9hMOfWeEEPz0iAmmpM8LMh
         hPpk0nAiaNaI3y0P2gju3J6mek5n/RBn4zYZGJNVvVV/3XLOrGcYvGKXN9C8T8tR06r5
         TJC6oIutkCDVBGqgLFaBPoOrps6YX9xM8M/aKeSHGNQLTr9SECsDpWcolMpH2nMZim1m
         sT/A==
X-Gm-Message-State: APjAAAVoNF9vQYagotqU5Sc8WwEpEfZpuQ0hAkG7/FImjjpJYI4L9j6d
        GRHi3tMa0B+mFucff3hqrm1Xww==
X-Google-Smtp-Source: APXvYqzYQWYWNf5ijMzlNvQnGiClXZkVi04WghDqhwDQYKzd6NeApOL9QtUEQkEmhvej3QVDF3ZkNw==
X-Received: by 2002:a17:902:ac87:: with SMTP id h7mr6812117plr.36.1565156389577;
        Tue, 06 Aug 2019 22:39:49 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 3/9] remoteproc: qcom: pas: Update IMEM PIL info on load
Date:   Tue,  6 Aug 2019 22:39:36 -0700
Message-Id: <20190807053942.9836-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the sysmon_name as identifier and store the relocated base address
and size of the memory region in the PIL reloation info structure in
IMEM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index b88d74632d39..2aa0743fc05b 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -136,6 +136,7 @@ config QCOM_Q6V5_PAS
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
+	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index db4b3c4bacd7..bfb622d36cb3 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -23,6 +23,7 @@
 #include <linux/soc/qcom/smem_state.h>
 
 #include "qcom_common.h"
+#include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
 
@@ -52,6 +53,7 @@ struct qcom_adsp {
 	int pas_id;
 	int crash_reason_smem;
 	bool has_aggre2_clk;
+	const char *info_name;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -70,11 +72,17 @@ struct qcom_adsp {
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+	int ret;
 
-	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
-			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
-			     &adsp->mem_reloc);
+	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
+			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
+			    &adsp->mem_reloc);
+	if (ret)
+		return ret;
 
+	qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
+
+	return 0;
 }
 
 static int adsp_start(struct rproc *rproc)
@@ -278,6 +286,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->pas_id = desc->pas_id;
 	adsp->has_aggre2_clk = desc->has_aggre2_clk;
+	adsp->info_name = desc->sysmon_name;
 	platform_set_drvdata(pdev, adsp);
 
 	ret = adsp_alloc_memory_region(adsp);
-- 
2.18.0

