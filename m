Return-Path: <linux-remoteproc+bounces-259-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6283899F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Jan 2024 09:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13561C2196A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Jan 2024 08:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713EA58AAE;
	Tue, 23 Jan 2024 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ajwf3Ln+"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827C958114
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705999876; cv=none; b=U4AEypeIR/7rcAsrOe5kgwI2PkcbX6JbM/fzO5GYgWTdUV7cg7mhV/VhAOnjw2mSEQcf2gYqc9ypTRsLsCn6wdVQwGqyIzDub3xN7Bq1UyhtWHTJdYri1aPSRHttWVi87Jq9lE6zfOWQF67SRc1elZIR5kJXkdrIvpjqE/whqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705999876; c=relaxed/simple;
	bh=rRR5cMdowQD37b1QLQeJzIMOWHeOKxWqLrlZA9RBV6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ty3BMZlWHtxUakpCMzknSb7BGs9vFNNfyfWIlBbeS8pjgr0iOc+xpdHRXhReyf6yB5l3UdrnaeKo0B+PeHAoWHm418Cd5oHq8/e9GfRN6RnptT3ivBjfo8TaQmL90VW76frlJCqXxp7I9iZPaR0tdUenQYoGUzsO7e7v9boq6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ajwf3Ln+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40eb95bd2c6so5149785e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 00:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705999873; x=1706604673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jYyhb3ce+oVfJ46+Ys6X9gpvFU4mxPDFw4WHRGQ0rI=;
        b=Ajwf3Ln+RfuXFiLLRQd8svqoyj82JYE1hq8P3MHka5s91lfbePqn1vZIMkBoLCyHsi
         EtDmjnKbsKDdny8Sqummj0apvD1krUPtdJ74gCnULBFVKp9kSCKMY60qk2JRQMFTj4EH
         FMUUs6h+vzQ38BO6C2Ow65/Hs5uou8elLJjWL9FeaIRm/hIMMz2D/thBWOBYN0eWaJC2
         +3c77O0ZXQZv97t4vS+l/D0WnzpBE5db+ZHQeeEif0DJ+mT41SRXWHIQNLnVoO+MdyX9
         6x4hN7GYex+Q5mZWmseNhAIpdl2smavEmcE7kWD87mojZA7V1ManwAJG73AEs2yGfr/Y
         DzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999873; x=1706604673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jYyhb3ce+oVfJ46+Ys6X9gpvFU4mxPDFw4WHRGQ0rI=;
        b=ad8SGRFqkuojqF9Y4YQOqtn+ZE8giWq4xUWtgexp4sxX4SCo73rOOIcVjCGh73ohKH
         Th9epYADu34Q5bi0RkPEAxJPH1WghlYoBgYibIghxEHWNT/uu8abRXqfyWbXl0nNR5Rk
         0KKrECoPOyTDRPVcDhWe+15jdidm1CWDXc4PS42EGgyYQsW1ABySB203mhmr7PJSbxgq
         126YjVaBcD2gNnDaDBDQkn4Qnrk5OvS21R30NtE86p4nGlg0h0YPAOG7GeH8bIoXpVGQ
         vh9klnomxzZCSpUXeT4OrmIJbM/mcq80b/pHtvzkYH5/1CZRfH/Jx38YHwuednyNGH8l
         JTqA==
X-Gm-Message-State: AOJu0YyZqoXi4Xt88522v8Yi5tgIgc5+KDv3YWemqlZmuQMw/6N/RVxv
	zDuhlXqevaYPE5pk9DWzSqO8HQLkOeSh/YhAuipc6O6EeJVjukOEujcUFN1OYQs=
X-Google-Smtp-Source: AGHT+IHN1PI/Kpe+y5W9HlwYZLEJus+4FRD6OsieLK3Ku/1nXXiffuqeBY8spFBO+FnYoXJ2leZJOw==
X-Received: by 2002:a05:600c:538f:b0:40e:76d9:e5ce with SMTP id hg15-20020a05600c538f00b0040e76d9e5cemr335701wmb.219.1705999872785;
        Tue, 23 Jan 2024 00:51:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b0040e541ddcb1sm41847342wms.33.2024.01.23.00.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:51:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 23 Jan 2024 09:51:04 +0100
Subject: [PATCH v7 3/4] remoteproc: qcom: pas: Add SM8650 remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-topic-sm8650-upstream-remoteproc-v7-3-61283f50162f@linaro.org>
References: <20240123-topic-sm8650-upstream-remoteproc-v7-0-61283f50162f@linaro.org>
In-Reply-To: <20240123-topic-sm8650-upstream-remoteproc-v7-0-61283f50162f@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rRR5cMdowQD37b1QLQeJzIMOWHeOKxWqLrlZA9RBV6U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlr3370qqzLAkmBP7Y/mGUgU6OjZrM1y2dPZFN23l6
 R0WlODSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZa99+wAKCRB33NvayMhJ0eabD/
 9tFFhliM5kTVOJ+0DWOd4Te/fjkGVS+mjAsHQs7H3ZgNauQlULtXTiPXwH1uUBzuXYbFebUrSbe5j4
 9/1ui5ZiOIQosMyjvVOgyF5lcI3b4slqWJUn2VcSsT+L4ZPBRcv9RDGV5jKIM1RMcVpjSbloJMBMZC
 RnbiEIed29ZOWFu8GdQGkr7aM36OSyc8WU/HTnEjRtQMpfWwZR7NuWN5MyM2wydRjo394709koRyXc
 IQVTgQURS/WnUhV2i4I/JMr5wpZ0LrvxYCojJzlFi6vaapo80ONlRt6yeqm3nrzySCUW6Ojg/cJLm2
 gEykbGz1iNC9jJjgvyy5wc6Fliz5mRxdlYfQqZ8xVuaNpQAkgxL7i2HBZ7eY7WH0JjVijqHC7YjBF0
 cdpBHiuthAKZYHixE8RpyGPRHtcLLOzKun8UDtDyYbqPOF0OPHEcnQROddllnPRcxSPvG6m5ZwtYxo
 B/vwRxTbAG9o7gzVv25Cx40IcJ6nhwXTa0freg1uFI2AC1NidR9QVauwqNSsk51q2vRqh5nf8EWXUy
 TL6TWdtchnz+dU0XLeMLs1geeATYy6Pby5vnULz2BM1styDwzrd+Y9n7ua23drdh+HjVm0H0N5w3zi
 pj0aVEFXZYUlwgJdFt1DoKzZw6YipxGoJpHLBRHmpUmMbKLWOY9YQYWCfsZw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DSP Peripheral Authentication Service support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 09e8ad9f08c4..d0b1f0f38347 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1213,6 +1213,53 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
+static const struct adsp_data sm8650_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
+static const struct adsp_data sm8650_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.region_assign_idx = 2,
+	.region_assign_count = 3,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1268,6 +1315,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
 	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
+	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
+	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.34.1


