Return-Path: <linux-remoteproc+bounces-82-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE380A6CA
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Dec 2023 16:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17ACD1F2135D
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Dec 2023 15:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76FA23766;
	Fri,  8 Dec 2023 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uHePl+mO"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60BF19A4
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Dec 2023 07:09:03 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9e1021dbd28so288565866b.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Dec 2023 07:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048141; x=1702652941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJgQ/NHkfZyGsRA6kmIqgy2gaPo22Jj0YMIre8gEnCs=;
        b=uHePl+mOtzdpTLFWRACDlxDaWdkJHv938JnSmyW46u94O8E136XiWXvxgwCO0jTyBD
         weQawtGQ2f0BmsG29sihpBXyYf77zxlsOoenRhWBeJgpmwG7oomjamsNscVFLwSF6fSq
         eWu3zV/20WDDJKccFTwfpT0Qv4zPXE9Cm+W+1mwLOVPbuCwi456ReuC6ckYKIy4jS4kF
         g2fMRLL7Ln0cAKodODVL/PVvb3K2r4im+4RS2np+hemkZmqMatTuFmDpVgLwXIozsntn
         Ilz8ZtpGD9mOBOatuiYYrCxOz1Zuo1vtnnBC379Ahs73WAOei98flKhJlqj6bj1iNPjW
         u5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048141; x=1702652941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJgQ/NHkfZyGsRA6kmIqgy2gaPo22Jj0YMIre8gEnCs=;
        b=PMjOdKB3pU5t30UMQmn+5TDLbyRHTld7GVGhF3ZQd7pFiZoT6EOcOTnjBhEoXiTmDD
         9x/advVxNL6DgEFU7tGW5o3er6qW/NlC0HRbdw40MCy2PQu5jNiQGGPYIs0tvQP96XiR
         Sl4yoO4PnHe7XjOIHr/raZCS13Vi4JVO/Vxq94eHhMrtKx7eNmChMrwspUyUk14TRXYE
         3MDFM6GH+K1vpen2Gxrb5neL3/NK8fsGh7x1VtwyRV44KE9WqsSwCop30vxEhdRoE3ZQ
         crawYf4vCJdiwuxGp23md3S8N2zhJjJqyd7u+MB0zC5qqaub/cYOZqSbv6HTtxJLiFkV
         lOng==
X-Gm-Message-State: AOJu0YyvsfAVv45xJX37lPFoB0tv7sjWRfYBmREOiUBK9qFlVN9sBabh
	DX4plx8fPiffJsqqEWX8p1PmnR1eZTiueUZoVSKcuw==
X-Google-Smtp-Source: AGHT+IHungVZez92cNJRscDc6+GcjcIpV8r8IRuDH3Qu0ZtOU3MgjNRqwZmO2lRoDaZ7vjm2X1VYNg==
X-Received: by 2002:a17:906:fca5:b0:a1b:e80a:b68 with SMTP id qw5-20020a170906fca500b00a1be80a0b68mr54529ejb.143.1702048141722;
        Fri, 08 Dec 2023 07:09:01 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:09:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:02 +0100
Subject: [PATCH v3 06/11] remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP
 & WPSS
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-6-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add support for the ADSP, CDSP and WPSS remoteprocs found on the SC7280
SoC using the q6v5-pas driver.

This driver can be used on regular LA ("Linux Android") based releases,
however the SC7280 ChromeOS devices need different driver support due to
firmware differences.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 913a5d2068e8..a9dd58608052 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1165,6 +1165,22 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_idx = 2,
 };
 
+static const struct adsp_data sc7280_wpss_resource = {
+	.crash_reason_smem = 626,
+	.firmware_name = "wpss.mdt",
+	.pas_id = 6,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "wpss",
+	.ssr_name = "wpss",
+	.sysmon_name = "wpss",
+	.ssctl_id = 0x19,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1178,7 +1194,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},

-- 
2.43.0


