Return-Path: <linux-remoteproc+bounces-1108-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC258A9365
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Apr 2024 08:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8521C20BF6
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Apr 2024 06:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AE86A353;
	Thu, 18 Apr 2024 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s1NcfIKl"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118BD2E403
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Apr 2024 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422670; cv=none; b=oe+/OLNNyLHCTE7NKWDSRYX0FKYYEw7btZE515ucYhrAKlI47o/XZtevx3I4JNSUUB9jN+UIZ6EGJJL9TXHE0xP/WhkzOC4N3AvZp8lzarulnFUHS5/2eYQErvnU0TArZkS38ILq1J0AqlxVaNujzgMIvg++H0FLr0tbUBQPA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422670; c=relaxed/simple;
	bh=70pmiyDT7BQXXFJR+o3WuyoVAvuck37NZMstmDFqk+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJ9kZCAWaowGYMjhavieNJGw4MeSLQ1jCxc3SBAslZIRVGZDgmTtlQzlmDDvGmi/Qrxyw2Xkcrqo1ghil08HbO9qCepLZvvLZ1Koy1yMIm/iVSioPgOmi3gkToYo8IyGqS48vjK3BT9rvKMV77/T3H3GQgQqFHDWtSiJPTtgy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s1NcfIKl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-519661ebd59so540819e87.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Apr 2024 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713422666; x=1714027466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjXAvADX9JoZN7Qlhb8cp4sVDIR5f7n51dedJ+CYLug=;
        b=s1NcfIKlMU5iuRYd3hE1lDjynkvNUhUHDHEiyoCceZPPvZUg8/fPN5O0Rs/EXTDNMa
         7ubHnHGgtmmXZoEGkbQXTs8vzHZtYnsd3aY/HG1QxxO6Hm1oWoMCsRXIz9RjviAyoexa
         aCi6uMoBhSpj3FPSJ+SHO1jBmXwXTqbeLc9W/ehgXGOAZogLLFz9p2BC1UD7z4bSTUO7
         TiURa6EIM6ucT7aJTLp5Sua/gxDv6y4YK94OqrtLYgIgbxVRRw4YhSCSmjKTraydJh+z
         rUEZ0a0Bqo7CQ/gokjKVT2hfJo9Ue3rbufQBIaDKL1iZZSW+BBzWgKMGJtcLkB93Z4wS
         fzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422666; x=1714027466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjXAvADX9JoZN7Qlhb8cp4sVDIR5f7n51dedJ+CYLug=;
        b=ijikBQLijCN7zyws+tp8FRfwx2uTkfM33ZeW7lqqOoA1X4zR2CG1Bh0t+P0z8vkbNn
         CENYu2lfFQKBEaC0tYTeVfkrzC/yLH70w76oeCrwoKX0egMB6z00r6BHVRR4D9DAz+LQ
         IAB9uY9f1P0Hgc4B++hcFZylL6Km529pnYtdQpRKAAO03baO7M0GlWGRaGP9clV451Ly
         zlBHzLOXKg6rH8Sao5YFVxwcIV2OZsvTzTtiT5TrRRM521N49zaTPVOhbigxCDjFG+S+
         xbfOOpc0SHoisdYgqjdbnn1siTgUL67b+bf0FSO6EbCbVLoBTMHrlsH9dI7TYfsv28Pg
         kKdA==
X-Forwarded-Encrypted: i=1; AJvYcCUPZirvD+Ho9H/wcLrB6zhfoY6sLjwQ6k5E4XT9aIzNx7Ff5UHbDWASKNZV+MmknUs+A1jYQuUL33fy+VKJ+pgufG/A0NN7JBNRQAGHMqPC2w==
X-Gm-Message-State: AOJu0Yw3VOMsR8hPCpuGNg4ClqU8AsAbNzKAVUWYqHSq0NJioYy5iil8
	0SMbJ9sT+X+AndsF9arfBcCNhiInjRyoESI181sny8LQi7rdeHovRtpj5xkLXY0=
X-Google-Smtp-Source: AGHT+IHpsFHaN9K3fNOfHySMF8H+EB0hRMiMnuU8ffnmLIJMj1OMq56Fw4KmeMVFVdoNqTMHKxrCHQ==
X-Received: by 2002:a19:7716:0:b0:518:a315:26c8 with SMTP id s22-20020a197716000000b00518a31526c8mr324766lfc.11.1713422666337;
        Wed, 17 Apr 2024 23:44:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020a0565120b8900b0051898448680sm122122lfv.261.2024.04.17.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:44:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Apr 2024 09:44:21 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8996: add glink-edge nodes
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-msm8996-remoteproc-v2-2-b9ae852bf6bc@linaro.org>
References: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
In-Reply-To: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=70pmiyDT7BQXXFJR+o3WuyoVAvuck37NZMstmDFqk+Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIMFIWv09H+1I7VKKUR/kqm1pmuT+GAUq0Ay1Q
 yd7pkjh4rOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiDBSAAKCRCLPIo+Aiko
 1ZHkCACCa4m/C2IKHd3a/G+i9SuOx6ebGFdaXDqWLCrYUuBrsIvoGHFHcmOMlsjRy+Q6pIaUDLO
 XjoZR3+Kx1W/a2Y0KpN8KQkuPHy2GQ19zUB/xv/F0uj8tsAXFAXEX4VvIoBWDYXZviYj4XPK5CC
 3XeQon6IQX8i/9qMnd7B2emXEWQ2aigGNrCAo++QZ+ZNkAD13ytGSwWinoQyNd8rLeAkufexb2v
 CUswFAlSJ2883SROQPgy23dZIjUMNsaQy8hSsUtZp1KLaNAPdixbN+ZsDXNTe5EoBoOLAJ5yq66
 2J5SwTZPVjFo9byobDjhMUXRvToIdDjSmwBJNizakRgs80Hy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

MSM8996 provides limited glink support, so add corresponding device tree
nodes. For example the following interfaces are provided on db820c:

modem:
2080000.remoteproc:glink-edge.LOOPBACK_CTL_MPSS.-1.-1
2080000.remoteproc:glink-edge.glink_ssr.-1.-1
2080000.remoteproc:glink-edge.rpmsg_chrdev.0.0

adsp:
9300000.remoteproc:glink-edge.LOOPBACK_CTL_LPASS.-1.-1
9300000.remoteproc:glink-edge.glink_ssr.-1.-1
9300000.remoteproc:glink-edge.rpmsg_chrdev.0.0

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1601e46549e7..7ae499fa7d91 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2453,6 +2453,13 @@ slpi_pil: remoteproc@1c00000 {
 
 			status = "disabled";
 
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "dsps";
+				qcom,remote-pid = <3>;
+				mboxes = <&apcs_glb 27>;
+			};
+
 			smd-edge {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_EDGE_RISING>;
 
@@ -2522,6 +2529,13 @@ metadata {
 				memory-region = <&mdata_mem>;
 			};
 
+			glink-edge {
+				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 15>;
+			};
+
 			smd-edge {
 				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
 
@@ -3467,6 +3481,14 @@ adsp_pil: remoteproc@9300000 {
 
 			status = "disabled";
 
+			glink-edge {
+				interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apcs_glb 9>;
+			};
+
+
 			smd-edge {
 				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 

-- 
2.39.2


