Return-Path: <linux-remoteproc+bounces-1107-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F128A9366
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Apr 2024 08:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 968DEB21188
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Apr 2024 06:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8A55B217;
	Thu, 18 Apr 2024 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0rqyeR+"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD62C86A
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Apr 2024 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422670; cv=none; b=g1qpOAjsyWDXB7JFYf8kLerYHbVagQubCHysD6GOYjUlVWYgiT5Dcgtj6q1bRno1Y/xOzfy83D4zikx1W355zuh1RRKJR49BWe5CXZnI8u8JnwTYpOVDxW2TyJ0N5dPI4QXl6EVRD/vBCY9+1DKbmkEbavMl2GKt9AcSJagBRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422670; c=relaxed/simple;
	bh=g9rM3ZF+8VtJg8dKONO4NS9lpO/x8djJ531mbN85ySA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpyadP12EjzUsPBfiSbil1Jv9YLyaR/GOqzRk2SWjKHscSIFILTiPAfen95lQEGuS3woX2o9QZE7vCfIO5x7QeJS3RN+pvnLpBXzt5IWNW5LjblKc7tiDNhxTtvxlGKyXBwEmrY3FZeVxsAJY3YiBIqedf5WV2IW5vCTPYD3wyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0rqyeR+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so469367e87.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Apr 2024 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713422667; x=1714027467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OcNt0nkZqzPu7J6lCmROXjwjldW7YY4lOONULn+wtY=;
        b=P0rqyeR+cgpWKkTiwTV50f5bu91D5GyuVZjt/Ls7MAJwjLAVyz6gnBqdPOOkJMJGDs
         FUE/XqsfjYKsbzPMxu+RszwBybXcHQsSVZ7FNbn2jSUh7tAxxKsZAJOaHWpMYQUaQixo
         Hejlvft+oJoT/vJnyVZuK8Kr15/aUIcYJ7nUQhqREVEwpME3GKpbS8hoNDITokCyfm1B
         6WOQTpnnzLB7wV2l6idkhxDn/WX2G5+foaM9usRiKPnwEMiBt0nX276aexQ8s613nTVQ
         tI+o7KM+6+wldoyEYRJOeJ4sNRQHpZwX4VRmze5XE/VNSNvXvLVIYIan9X037gUj/lcX
         D+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422667; x=1714027467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OcNt0nkZqzPu7J6lCmROXjwjldW7YY4lOONULn+wtY=;
        b=VnwPWbg0QPnxaFp6ahF2K4pNLx+k2b3Zp3Q/a3yx/maNvzNLZtkWsgO2az7XKe1Drh
         hSf8AjoGYNvqUgBSwbZc7Szdb/78uTTKtEOSW/etKEB0uZ0p4FBFIBOzO6auRjAFkOBK
         ywvfaEaaUp25SDuqKtrSTxYKg6Cpl7BdhwWD/I6QTQ4td/yh+2+hpwiXHvn5JH5eYfbe
         a2CmEbO5vTysjhJkpepZw0LEEa/c22MwYBLeVi+RF/TRbPhbx8v6hro+1ndjcKJfW0+l
         LRP0MlWu22AV8NDZPSX9uDrvdBpNCqaruMy9JfPsXI+BhUxszxg5ek31+iFAzaq0X1/u
         Td4A==
X-Forwarded-Encrypted: i=1; AJvYcCUOkP0V28qolQP+sQCd4p9gCDlb16bzcnEUUBD4GHP1ApEm38f9XkJQaQsiz5m0zj3KcmX8YZrs1vB8iiwntO+nHpX6Ll1E19/nBfUeVTCNkQ==
X-Gm-Message-State: AOJu0YxrN1q7z4+VKJNI257oKghm6FtJYGibsIerbRnnqle8E0egQyvV
	/ryDSJO+/kYiNPtEP8tujNExltgCzon2MuiSGZ855b2IOi3LuNSUonIwfa2r6Ug=
X-Google-Smtp-Source: AGHT+IG1Rtb5h1yYm2OYDh5lOwXnlBzUf0Gc6XVMdXdop/D1kJySdAcMgnw3i8ue+TVEw/vN8ZBNJw==
X-Received: by 2002:ac2:491d:0:b0:519:27e5:83b7 with SMTP id n29-20020ac2491d000000b0051927e583b7mr811254lfi.27.1713422666991;
        Wed, 17 Apr 2024 23:44:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020a0565120b8900b0051898448680sm122122lfv.261.2024.04.17.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:44:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Apr 2024 09:44:22 +0300
Subject: [PATCH v2 3/3] arm64: dts: msm8996: add fastrpc nodes
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-msm8996-remoteproc-v2-3-b9ae852bf6bc@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MEtHWaQG/4hA5mXZ79sLhC/nj3oaNW43ubhJtRJT56g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIMFI1MFTDPk/FQHJ9i5zXl6jZ6eVcWoMsApuC
 QnbdWy7+7iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiDBSAAKCRCLPIo+Aiko
 1ea8CACpiIkjydc48EPErNkVYj7B5XMF678G8QDd02VTbSw2IuP7EpvGjwP2IZn65IJP5XfRBRP
 2cnsXF8f5vQz5AAIk5XwtcYihYZlRFcxI2VMYxcfG3MtvjnKFg8askw30oyEyuBaQBMIIe8kkDc
 qUvE2wE9DpC9Hx8FZwdoEkWD82PhKT/xivxy3TzkmWR4ca/g6MigW0mvQNvo7Xc3e+fq8CR3XIL
 +py3wadGDMZyI/nhKDcjytJlswrs28F3cvTSP8NzH/1YK7fWdf5l83AZ07GLEAvANzJJzbqswcS
 U6gQaUMFYPcBBXrrcpbMe0z9f5IjDG4yWun6/18RjvY5qfZB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

The ADSP provides fastrpc/compute capabilities. Enable support for the
fastrpc on this DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7ae499fa7d91..f9bbb191661b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3545,6 +3545,63 @@ q6routing: routing {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,smd-channels = "fastrpcsmd-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&lpass_q6_smmu 5>;
+					};
+
+					cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&lpass_q6_smmu 6>;
+					};
+
+					cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&lpass_q6_smmu 7>;
+					};
+
+					cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&lpass_q6_smmu 8>;
+					};
+
+					cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&lpass_q6_smmu 9>;
+					};
+
+					cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&lpass_q6_smmu 10>;
+					};
+
+					cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&lpass_q6_smmu 11>;
+					};
+
+					cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&lpass_q6_smmu 12>;
+					};
+				};
 			};
 		};
 

-- 
2.39.2


