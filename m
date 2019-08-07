Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 950D8843E5
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2019 07:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfHGFjw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Aug 2019 01:39:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45437 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfHGFjv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so38952935plr.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Aug 2019 22:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DHLSpNf1LsuJ1wDDF5wISNJL3XiKw5OPuws/j+9mEZ4=;
        b=oKH3tIkLcOj5q28FdagPOcCl8w1CPiQNdCAVUaqi/AaD/hNMH2zdiCwbcoQ03uypze
         IaOOoFZXCjw3UyiXTHidDRMzG62oDDK4nU4GhB07Yl/+8300sDfaDJ0vAmpHO2kMFpg5
         Y9V0Vi+ARHOiGQqL0Q0GRpkLQNXFykRRKoD8H2lMZ29hPJrqx5VD/RGdyMhd2BP0YrKl
         upPN/mSJxWgdE3Z2eoaHAelNrz8Gu8oiDPfrgCUHOc1Rwx2W/+++AD9nIae/fJKRMIM3
         +kHiSMB4w/q3t45uQlUAzjnmg2/36p8PklnCYc4H68lwnZvqy4b8113aaezP2AjdwBIf
         VHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DHLSpNf1LsuJ1wDDF5wISNJL3XiKw5OPuws/j+9mEZ4=;
        b=WOAvx5qT0sBL3S0/f5GRYaXlVUezP8v3dReBl1si2gVyqOw/JiG0a4CpIsX4b76tJD
         iHubuoN0Bg2Im/cuEEWj/Ra9QNnepOF0HB9L0/VzYPeOu2iVapmZFyod3HRy7wklZvdX
         oj54yehOTGTt2u1DVY/qmLkYUX5tVgxB+jgOWNVCTK/Wt+tVcLyTiGpccTYaz43yPcl3
         3Q9qk8CsGc1xujHW10wjS1BAh65Ik+GNMbwdQ1OeKIj7Tn25oc7N3j8CNYAKNC8DPnlu
         GGwu4OqFJ1XIbXoBnZ4cPJxsohg1cauPjo2Abq1KOsAs7Y9G5EoETVSG8gEJsrzlN93n
         j9kg==
X-Gm-Message-State: APjAAAWp/jgpBvdUGI5Mbow6jXcAKzMAuO58yNhtTT98zabWc5ATErK3
        uTemFXSq4upQDfoHZoebB538Ew==
X-Google-Smtp-Source: APXvYqwUd+/t1/18/8l+XVokh3+ItPFBiNlUa9UXozM+ztWtnzV2TZs3IM70LQjnOiY+jk9Oscpzqg==
X-Received: by 2002:a63:4522:: with SMTP id s34mr6167748pga.362.1565156390665;
        Tue, 06 Aug 2019 22:39:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 4/9] remoteproc: qcom: wcnss: Update IMEM PIL info on load
Date:   Tue,  6 Aug 2019 22:39:37 -0700
Message-Id: <20190807053942.9836-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Store the relocated base address and size in the PIL relocation info
structure in IMEM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/Kconfig      |  1 +
 drivers/remoteproc/qcom_wcnss.c | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 2aa0743fc05b..3f976ce3df3c 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -185,6 +185,7 @@ config QCOM_WCNSS_PIL
 	depends on QCOM_SMEM
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index dc135754bb9c..9db9a3d25af4 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -27,6 +27,7 @@
 
 #include "qcom_common.h"
 #include "remoteproc_internal.h"
+#include "qcom_pil_info.h"
 #include "qcom_wcnss.h"
 
 #define WCNSS_CRASH_REASON_SMEM		422
@@ -145,10 +146,17 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
 static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
+	int ret;
+
+	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
+			    wcnss->mem_region, wcnss->mem_phys,
+			    wcnss->mem_size, &wcnss->mem_reloc);
+	if (ret)
+		return ret;
+
+	qcom_pil_info_store("wcnss", wcnss->mem_reloc, wcnss->mem_size);
 
-	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			     wcnss->mem_region, wcnss->mem_phys,
-			     wcnss->mem_size, &wcnss->mem_reloc);
+	return 0;
 }
 
 static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
-- 
2.18.0

