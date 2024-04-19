Return-Path: <linux-remoteproc+bounces-1121-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E658AAFF7
	for <lists+linux-remoteproc@lfdr.de>; Fri, 19 Apr 2024 16:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB9661F242C2
	for <lists+linux-remoteproc@lfdr.de>; Fri, 19 Apr 2024 14:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB2412D744;
	Fri, 19 Apr 2024 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRgcUanc"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9C12D77D
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Apr 2024 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535249; cv=none; b=fxGWmGb1VRbfhWZBubZzXAmTSN/Q+V9xSOla1hNsPcL1dwJjKcbOmO6dv0A4e+QFOMAboUCFEHv0NrwJBMPg7HPEjczTl6iTyOvEjEOCxYjRBS9k3mQrRRuhObS3Jlddfu5RIK/wuXFc8PRIl8MWFqtyVNDd1iyu1ntlD8/4KVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535249; c=relaxed/simple;
	bh=T1QckubuuDLKzfbwGOe4bGJUpGxvHjLrV7SRAZt0Ryk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nG6aJBwkElYDKlMoecUpaCaOXfrG/VCzYtpo2rMYSfonGCzHg2NUDtMiThMNz84eVn61sIFYUFkjeXUestucrres2BRiV1UAqKqS3B91oNa0aeGycte5PLr56ySYUSukhVQzO4vja0LqiWxVquF8pgoxO6d/IEXEVu+/i7QqCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRgcUanc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso2367531a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Apr 2024 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535245; x=1714140045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXhJgQXYH8h9D6bhtZp9PtGZt8VvzcZTxKbXRO0AyF0=;
        b=nRgcUancxsRzL8aZBMeTvnOnJdFc80dx9MCul99fpdqksk7kfmWDuorx89E/rHmled
         QU5M9+F+tPXuDPah5iZpIKwkPnmSE5vJRJvet+VdwU9gle04E0iEIl5jpgc82m76/3i2
         fTCCbfwLUXAewI423uaqyB8IzPGy/57ACOEdAHR7HDWzRzmGEN48rWGrhE7NYJghZjGZ
         7tkE5dgfLxYGTt9dSajzvMY2NZ+Jh/REe+JTZ9ess43MPc+jPCywinR1ZKL0IS5JVQPY
         bBtP3Q6BYR7lZLZHtTuk8wPaKRgtTrsWqSWu2uvB9K4Uin+OK8t/ouBJr4HEZLSTY7Ky
         xOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535245; x=1714140045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXhJgQXYH8h9D6bhtZp9PtGZt8VvzcZTxKbXRO0AyF0=;
        b=ZCNXLAm3XivOqfuLVHILRGYhrHtdE2sjhgsXAaO4CnbCtqTwZUZxn+gOKAtJCUySVn
         RjayENOPjC7uysbJKze//H+F7Tnany18t3ZVcmLdUvT1HaxNzOC19sTv7pWFN1ZxJsQT
         f+kJlobKuUAlUi3J/X78+qwvJfEMCfWE+cgtPX3dr1rrmRZKDguwyWbcV4NLcbCrjkrD
         DPHtAFcCUR/6Z99UyztMuPpnZqhNKZsIxJbDQ8VMKAE9uejthvU0R6UEbl4jz2Ho31he
         +oAwMXerzvcty5QAg52gOCpU9HaAprW/qG03nweOtRGtyWw+p1l5RVCWuvnAbOIsbJ3/
         /viA==
X-Forwarded-Encrypted: i=1; AJvYcCVzMHZus0CLrmOiQK0l8orp5/r4ZUvqcG5UTxy5/alLaAioRThXnZZ2H8mla3KqAnCRnn9cUFSbntSAa+Kq8Tav9xvrca0xy9STi/SOz0mp7g==
X-Gm-Message-State: AOJu0Yz1bprZaxOZ0rTvsVR+cc2DN+/ryALHCW8sPaZURkG4XF7RiLgU
	h/UjUZC6CrzSmlzDuF/ARVzSCADSolc61hfZp3U/8tiRnbYgTD5FUB8TENIEb1opPmpysTcYykS
	/
X-Google-Smtp-Source: AGHT+IEBpoVn+rPVd97VIc+PrP3OBopoivhgD3YF2bfDmBFYnmHtYascQVGb/3nL5y3x6owBGUrXaQ==
X-Received: by 2002:a17:907:bb97:b0:a55:661d:8ab1 with SMTP id xo23-20020a170907bb9700b00a55661d8ab1mr1642070ejc.39.1713535245451;
        Fri, 19 Apr 2024 07:00:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id qy1-20020a170907688100b00a558be8bc03sm532390ejc.150.2024.04.19.07.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 17:00:34 +0300
Subject: [PATCH v5 6/6] remoteproc: qcom: enable in-kernel PD mapper
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-qcom-pd-mapper-v5-6-e35b6f847e99@linaro.org>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
In-Reply-To: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5226;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=T1QckubuuDLKzfbwGOe4bGJUpGxvHjLrV7SRAZt0Ryk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmInkFvvRIYipbRMqCm8lKYQre6oKb3JdARLkSs
 rzmPUpIJWqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiJ5BQAKCRCLPIo+Aiko
 1QE9B/9zJAYrwFz0VOLx/mahAvqLRwFBNj/9Ul9sn6p5hNgyo6T8Pncyta2rnT2AV1DflqUHP6G
 l79AK9FMEYLh+8fgZZEsDHqMf+E61/sOXEHGkUK2y0azrGiziosIlti0ltzvjQ/C8H9B/ASH3dy
 /C4JojilWTnnVZdO/bokkqj/1odp6nJPVICqxS3L9ym7PNdUG3FpZqWnjcBU7WF+percXoop7XS
 7xA7uObiCAWFOlRT5xd+L+qALa8lO4iv4ZFnf3l4xsb9pWc+R1ROiTaQ1pNj5eQIB2nkfkBxdvf
 8KcpWfFUL6xCPpBZBDZOJQgS/+91rmzfLdaJigfNsuVAO76y
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Request in-kernel protection domain mapper to be started before starting
Qualcomm DSP and release it once DSP is stopped. Once all DSPs are
stopped, the PD mapper will be stopped too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 11 ++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c  | 10 +++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c  | 12 +++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c | 11 ++++++++++-
 4 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 1d24c9b656a8..02d0c626b03b 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -23,6 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -375,10 +376,14 @@ static int adsp_start(struct rproc *rproc)
 	int ret;
 	unsigned int val;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto put_pdm;
+
 	ret = adsp_map_carveout(rproc);
 	if (ret) {
 		dev_err(adsp->dev, "ADSP smmu mapping failed\n");
@@ -446,6 +451,8 @@ static int adsp_start(struct rproc *rproc)
 	adsp_unmap_carveout(rproc);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
+put_pdm:
+	qcom_pdm_release();
 
 	return ret;
 }
@@ -478,6 +485,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_adsp_pil_handover(&adsp->q6v5);
 
+	qcom_pdm_release();
+
 	return ret;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 1779fc890e10..791f11e7adbf 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
@@ -1581,10 +1582,14 @@ static int q6v5_start(struct rproc *rproc)
 	int xfermemop_ret;
 	int ret;
 
-	ret = q6v5_mba_load(qproc);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = q6v5_mba_load(qproc);
+	if (ret)
+		goto put_pdm;
+
 	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
 		 qproc->dp_size ? "" : "out");
 
@@ -1613,6 +1618,8 @@ static int q6v5_start(struct rproc *rproc)
 reclaim_mpss:
 	q6v5_mba_reclaim(qproc);
 	q6v5_dump_mba_logs(qproc);
+put_pdm:
+	qcom_pdm_release();
 
 	return ret;
 }
@@ -1627,6 +1634,7 @@ static int q6v5_stop(struct rproc *rproc)
 		dev_err(qproc->dev, "timed out on wait\n");
 
 	q6v5_mba_reclaim(qproc);
+	qcom_pdm_release();
 
 	return 0;
 }
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..653e54f975fc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -23,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -261,10 +262,14 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto put_pdm;
+
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
 		goto disable_irqs;
@@ -356,6 +361,9 @@ static int adsp_start(struct rproc *rproc)
 	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
 	adsp->firmware = NULL;
 
+put_pdm:
+	qcom_pdm_release();
+
 	return ret;
 }
 
@@ -399,6 +407,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	qcom_pdm_release();
+
 	return ret;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 94f68c919ee6..33bd30e07bf0 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -240,13 +240,17 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	ret = qcom_pdm_get();
+	if (ret)
+		return ret;
+
 	qcom_q6v5_prepare(&wcss->q6v5);
 
 	/* Release Q6 and WCSS reset */
 	ret = reset_control_deassert(wcss->wcss_reset);
 	if (ret) {
 		dev_err(wcss->dev, "wcss_reset failed\n");
-		return ret;
+		goto put_pdm;
 	}
 
 	ret = reset_control_deassert(wcss->wcss_q6_reset);
@@ -288,6 +292,9 @@ static int q6v5_wcss_start(struct rproc *rproc)
 wcss_reset:
 	reset_control_assert(wcss->wcss_reset);
 
+put_pdm:
+	qcom_pdm_release();
+
 	return ret;
 }
 
@@ -735,6 +742,8 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
+	qcom_pdm_release();
+
 	return 0;
 }
 

-- 
2.39.2


