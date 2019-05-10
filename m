Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAE9197A6
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 May 2019 06:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfEJEel (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 May 2019 00:34:41 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41757 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfEJEed (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 May 2019 00:34:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id f12so180480plt.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 May 2019 21:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K0FcWu1mVQWjlvQpogOKNfqp64A6KIyrywCpStMa3jQ=;
        b=dx6L97lkkdjv3dUyfokhgj5npiudPe84KV+OlAcP1fgsy1yKZmj3kmBZBs6QD2sFEU
         KmAb4nqIM9D7MvFsKi7aO1hLRQp39ezRgA408XQQuo/P3+BrEIvQhs8613YW/kDU1pVA
         jG4wuA2OMG+paovhGISm3LID+n7Qp3kWZGk2ACvBBjt/J+8TatblulGnfm33eIJtXxeI
         jE7a89J7fwszQI8dcZXYroS4BuQUir5qFpvzWZ2SWvAD6WGOXqtY6gfOzgvNCGiWEdNC
         bFvaMupqTSb+etVh36aLywqcZa8+We6riaRWTFN4SRDySsPzYRX5Ld6lKlLlM6Jlntgh
         5tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K0FcWu1mVQWjlvQpogOKNfqp64A6KIyrywCpStMa3jQ=;
        b=AtyvXbOsV30ou2iPPBwSHFrc+DtTezs81P4+dIJNbLp5s0+/Cjkv/zvuJ5sOBBWLx4
         jfItbJkSKfWTL2NNEusNn3Rht2ewXjuranTay56ax+XBfMrqR34CqGvkgvkq1aKySdIH
         mvw3aKp93GO1BqPcL064WkfY7uVjPBI+Nftt7kJreN945hg+YOeyRsAl0qX9KPZ96nx/
         YN2GyjM08yTvQERNYDEABNmZ5NGrOhDwYv/QUi1Mfb8x5HhE2P1PmFLkHXYnKHJCfbo0
         NKIIt/Xuwu12kQXr004FWWWlaEo5nUZ/6vuV3CRv1+0c2mPfWZEsIWGOo0YY1j2qfvgf
         GkUQ==
X-Gm-Message-State: APjAAAV3NRB2aGBp1ZpO20XvyPjvObqgndsw9MXeiTKZeAIsad/UtC7K
        27Jb6ADCBgTvKQr8TRUNJbCS3A==
X-Google-Smtp-Source: APXvYqwAlOXnehFzDFp3wzN+T4yIgoXkWfxdCiY2tzXjEn+oDINl1P+5kohtFLbam3x2NhNhdA4yJg==
X-Received: by 2002:a17:902:3281:: with SMTP id z1mr10331855plb.44.1557462872691;
        Thu, 09 May 2019 21:34:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm4785317pfm.149.2019.05.09.21.34.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:34:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] arm64: dts: qcom: qcs404: Define APPS IOMMU
Date:   Thu,  9 May 2019 21:34:20 -0700
Message-Id: <20190510043421.31393-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The APPS IOMMU provides contexts for FastRPC, MDP and WLAN, among other
things.  Define these. We use the qcom_iommu binding because the
firmware restrictions in incompatible with the arm-smmu.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 85 ++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b213f6acad76..fcde4f0334c2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -378,6 +378,91 @@
 			reg = <0x01937000 0x25000>;
 		};
 
+		apps_iommu: iommu@1e20000 {
+			compatible = "qcom,qcs404-iommu", "qcom,msm-iommu-v1";
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <17>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+
+			/* Define ranges such that the first bank is at 0x1000 */
+			ranges = <0 0x01e20000 0x40000>;
+
+			/* Bank 5: CDSP compute bank 1 */
+			iommu-ctx@5000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x5000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 6: CDSP compute bank 2 */
+			iommu-ctx@6000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x6000 0x1000>;
+				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 7: CDSP compute bank 3 */
+			iommu-ctx@7000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x7000 0x1000>;
+				interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 8: CDSP compute bank 4 */
+			iommu-ctx@8000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x8000 0x1000>;
+				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 9: CDSP compute bank 5 */
+			iommu-ctx@9000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x9000 0x1000>;
+				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 10: MDP */
+			iommu-ctx@a000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0xa000 0x1000>;
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 21: WLAN 0 */
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x15000 0x1000>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 23: ADSP compute bank 2 */
+			iommu-ctx@17000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x17000 0x1000>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 24: ADSP compute bank 3 */
+			iommu-ctx@18000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x18000 0x1000>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* Bank 25: ADSP compute bank 4 */
+			iommu-ctx@19000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x19000 0x1000>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x001000>,
-- 
2.18.0

