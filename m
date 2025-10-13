Return-Path: <linux-remoteproc+bounces-5021-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6402BD26F5
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Oct 2025 12:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FCE73AF404
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Oct 2025 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270782FF143;
	Mon, 13 Oct 2025 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsBzpj09"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8262FE594
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349835; cv=none; b=rbdYZ1zfC01kSoF2IbvX/LwU2QbYV0E2i5vs1yRoxFTSrhic5TZHkZzTcCm5LBU/T8K9Z1lh56C9sSCeeIzW6IKN/G8S3AO6fxYYGTniZ3JJMQjsshuKRG7OXMmVgNHm26vTdnBDQDZO/1qEddAmo0eRY0qD1FoSQbsN+7MDWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349835; c=relaxed/simple;
	bh=rtvm3+Ddz+f+13iqQLmokYM0aY2hnbKT1DANmSnuV5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuwsG0+Qmmj/7QjSbo6V6S026VmSeRSTabeRMTR5becxZUPrlrx5Uj4onH/7YRrvT0OGS2LLj7+GZDBPBpAPglGOwIh2pye61eq/D1nEaB7zWX7Gm9wn0jfNibKzhsXVRVjdNQcm+fOxg8lH6Dpkp64q5NKy//jNPvhYeBtmw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsBzpj09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7Qdk5013013
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vz/gQycZaJGjMl9k5XINZTrvGlzn+yuEewtwO6TWbs=; b=lsBzpj09pZHpyKa7
	z1hQpuLl9qdxJdvUObtRy2uXDdreQszQ3B/cZ3ufQmxWYzRi5fcPMud2tJYenfLG
	7NCexwFQ8kD5dI9eSY4RrVpzakuE0HAR/kP8ZFqYqWxgbma5WsukMVxrjcrLmdCH
	OUVdbDri70vWChQrysIF6G+PrIaP+/DqdrVuBeVVcE3mHDub1Kq2Q4ZAziWz+Hhc
	FEPVdAccYcpzs7ZgRC5R93jxpw5XBfMY5W+qZlb2uX4ExBzGBwZEkmA31tB7X1zk
	xrU04ubg5ZksnO5F46Cc/FQXwettybTOn2fjteWhIOKYBNnahpDc+mfvPAF4H0yO
	PpgE2w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1a8ga2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:03:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78108268ea3so8095676b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 03:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349831; x=1760954631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vz/gQycZaJGjMl9k5XINZTrvGlzn+yuEewtwO6TWbs=;
        b=G+4tnV5cKMACGUEeSWV2keUMWm9tU5ncE77En/RW3DOkqSiGzcLjw9i5To8LCACBmy
         DXH6uRZZ8exrdxkc/SSR24s6b33PP4OJIYmsnquOWtlWGXSHn7ShNfI9DognuHSj9O+9
         fv1zQYypgh20uCCOIpCklPbRg5g1/BdWTqbEWI5XyGF3JiWR+RntTMcJs2uJDR0Vb19f
         n/5xgkMEUHDrmeMWjwAyh/lUaR/sXCQRfbIzTr5Gf6ra/6uWSmApr5Q8JBng3yUCrOjW
         79yvwUE6PLUM32ffH8SK0L39Ejo/oZjHeyjIGmBSBjkfCY5ld4VemZaO5eLP9VRL8NDl
         qcWA==
X-Forwarded-Encrypted: i=1; AJvYcCX7DBDOMGfbs8VHit6MinU/99CZhZky0xgBQkbk+aCUXA70p2X5xslQmh7Ri92Y9ZYYTnbJ5AoQaTnVAd5mUyoS@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+IO6p2mcFeDUa0wYvj75qZRIqLwCLdUjvjuEGMcyixV0p5T3
	7pW+484bcx5lZ62J8qkufcfQwrV0fcxn/67ypbc0cKrJByqvQVJmV6zksleRPtO3Gn20rsr7Zop
	rlwHg+eWWZr4jzwUA9YEjy0vUkrSDy/lU8hJh7VCyRXSLZ639Xy/zezIUO/2qNlBrOF9E3iFz1r
	RPA8A9
X-Gm-Gg: ASbGncu9ZenX0UNukeUxBXXKmpp99XkeUCdUokFQSV0gL8y97166nkYiIH0F7ljsneI
	QDYNoF3coIX40tssUgX4mWQOgU6Vw/zw9tW1Cc6h+ZSh+6YDjf50345KpP6ot5rgmnsu+mxcj7l
	LyhSOjEjfwvWKoISZFMwkes0TZ96aeQkXiVCSJi0NFnCXsCuGFnUGCahvXS2dsffZMukwV82kJj
	Ojx14Lm2lOaBLxlchDptr4B8kAdMq5TxiMRyafKp0dK2Fb4jsvKPh6mHUBi/SjsLG9aU184A34O
	7xAaIHKUHjyvBBBp1hVaeZAI9LrBmI/n7q560e+1hW+epIXY/0UK8JyrfKa1IgffD2k=
X-Received: by 2002:a05:6a00:1887:b0:772:6856:e663 with SMTP id d2e1a72fcca58-79397c125e2mr23205747b3a.8.1760349831258;
        Mon, 13 Oct 2025 03:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ56tNmUbfI+6FrrVFlt5eaBpSXVaEhZpOJiyyBlYZ9eBoH502M3NXc5BwJCaMjpSWq4sC2A==
X-Received: by 2002:a05:6a00:1887:b0:772:6856:e663 with SMTP id d2e1a72fcca58-79397c125e2mr23205703b3a.8.1760349830613;
        Mon, 13 Oct 2025 03:03:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:03:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:06 +0530
Subject: [PATCH v5 02/13] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-2-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=6055;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=rtvm3+Ddz+f+13iqQLmokYM0aY2hnbKT1DANmSnuV5Q=;
 b=kfxQQn8d9CB6W4m+hiW5FjEowCO5eq9TVcHrr9vrjh1aantkqHtV9n+anIN7UAvpPAH9uVzNB
 B6s/GdC6J+5AKtqgVsWhIMJ3OP8hjO4zoNByttnLSATqDSvuiAA34x+
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ecce88 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fDFQFqZrUe5ZCi0-WEp4GQlqRf902EmT
X-Proofpoint-ORIG-GUID: fDFQFqZrUe5ZCi0-WEp4GQlqRf902EmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX5ytWwu2bmLiz
 6pH2VPWvgcdG4hoQqsCn63aSrwlqLSI+HfrJJ59LetUVPZPJk3GdVaRZAcEgqQxB93c8VXrsOrr
 Tkjna9cnkpgZvmWjyIQGCZDzVEEH60U3ylfX1iCB0JmnW3YqFFO9JaQVkfZByDoOx75P6XW6vNT
 CfeiyxgCTXr8aA3fsn9M4TXj/WrX3/e8bRnENGMBjYt9YcNWEZbCrB6erfo7v9SkJAmAgOljN5T
 bqOjhy+e92n39B0QL7vsjfXWFtnPz8Ve2VWKojwE4FJUDWSZ5pSTKoxanswon7I39lz39rULCJa
 J/G3qWwepiWosX0fYNvfzba91pACGsAl1/7iSdnd7hkYcKFfUExENYJnELcdIfrqq3M/r0U1c8Z
 fVyc12YdEdCyuafwShMWKfgpjwXQbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Peripheral and pas_id refers to unique id for a subsystem and used only
when peripheral authentication service from secure world is utilized.

Lets rename peripheral to pas_id to reflect closer to its meaning.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
 include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..3379607eaf94 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -562,7 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
  *			       metadata
- * @peripheral: peripheral id
+ * @pas_id:	peripheral authentication service id
  * @metadata:	pointer to memory containing ELF header, program header table
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
@@ -575,7 +575,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
  * track the metadata allocation, this needs to be released by invoking
  * qcom_scm_pas_metadata_release() by the caller.
  */
-int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
 	dma_addr_t mdata_phys;
@@ -585,7 +585,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
 		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -658,20 +658,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 /**
  * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
  *			      for firmware loading
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  * @addr:	start address of memory area to prepare
  * @size:	size of the memory area to prepare
  *
  * Returns 0 on success.
  */
-int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
 		.arginfo = QCOM_SCM_ARGS(3),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.args[1] = addr,
 		.args[2] = size,
 		.owner = ARM_SMCCC_OWNER_SIP,
@@ -699,18 +699,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 /**
  * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
  *				   and reset the remote processor
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Return 0 on success.
  */
-int qcom_scm_pas_auth_and_reset(u32 peripheral)
+int qcom_scm_pas_auth_and_reset(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -735,18 +735,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
- * @peripheral: peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Returns 0 on success.
  */
-int qcom_scm_pas_shutdown(u32 peripheral)
+int qcom_scm_pas_shutdown(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -772,18 +772,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
 /**
  * qcom_scm_pas_supported() - Check if the peripheral authentication service is
  *			      available for the given peripherial
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Returns true if PAS is supported for this peripheral, otherwise false.
  */
-bool qcom_scm_pas_supported(u32 peripheral)
+bool qcom_scm_pas_supported(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286b..a13f703b16cd 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,13 +72,13 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
-int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
-int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
-int qcom_scm_pas_auth_and_reset(u32 peripheral);
-int qcom_scm_pas_shutdown(u32 peripheral);
-bool qcom_scm_pas_supported(u32 peripheral);
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
+int qcom_scm_pas_auth_and_reset(u32 pas_id);
+int qcom_scm_pas_shutdown(u32 pas_id);
+bool qcom_scm_pas_supported(u32 pas_id);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


