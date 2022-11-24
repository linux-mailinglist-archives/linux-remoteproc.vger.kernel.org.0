Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5613637F1B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 24 Nov 2022 19:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiKXSn7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 24 Nov 2022 13:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiKXSnv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Nov 2022 13:43:51 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D61B113739
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:49 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f13so3688717lfa.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/vhQQuptZXZHh0zdNwc0t76Wroztku6hKJUXWw2b90=;
        b=F0ehGTnybTIURATNH1Et69zsXPiT7yvKob/MSkGUieowc+fK9mDM1kmqWE/f+jzlxY
         cKROonksYgRIxIyZnbChORTTYfoIpGXib4+9tB3xwit6tRuKYw+Jxl83TrRckG/Mlomm
         M5XgDuR+hdZc1x3j9V3xFR2PBk2FxUuMZEass9rYIFeHSaqjHs1/stQpj1jCS0QhFbPy
         ZR+cAc+4u0khnc163GvP8IPjvUxaFzTHuLvVPCjqWPMDlEy0yAVWQhPrgH9W8KX7+zdM
         EtYCaan/HtwHkUhLkJr2ic4dtYZ3O86drsIqKfBbio4S++u8ySKMh9T1gjTig9osa8AF
         MFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/vhQQuptZXZHh0zdNwc0t76Wroztku6hKJUXWw2b90=;
        b=leBhFKn3/7qIDcm0x9P/7t6593ktQXz4mJ2kA83b+h1kj1g0+7mJY/LfFaPsj7ek0h
         VuTj1B9NQjegHHBnOtVW4tPoXxz/X/RU2AVrfH+A/GENvNRbHP/s34g2EsaqXhCS2NIJ
         zu4WWBR2Ns00021wn9QKmjLXrvN3QjzqClytkw9sAjofPsRj3nVneAyD5SFdrlC4VctA
         aFY+UOj7IMUfWJltbPrlSfP3Cpu88n2tNo759vlV6wsrgvKPAZBrBTaB86r+An3qf1DQ
         lzyzYCKLCjatDhWTV4t/n8g5R36oDpUH35nAaCsQQWm5PWi1yljtWVNmPlG6GI2GID3S
         tH+A==
X-Gm-Message-State: ANoB5pn3aUFQ+cz9EHykEGlblzif6SMKU6SZEEy9H1iMaYzxSr6jUeUz
        1TztPJAWrmZdr8RXJye4vIWiVg==
X-Google-Smtp-Source: AA0mqf70NV4fY9MDkXnbT1QFnxFA72Ba+rk+aWviv+oWdptO30FXkMIiNfL4y1HOPjVaO3X2Oq84vg==
X-Received: by 2002:a19:5e01:0:b0:4a2:2b5d:b95d with SMTP id s1-20020a195e01000000b004a22b5db95dmr11129078lfb.589.1669315427894;
        Thu, 24 Nov 2022 10:43:47 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/15] arm64: dts: qcom: sc7280: align MPSS PAS node with bindings
Date:   Thu, 24 Nov 2022 19:43:22 +0100
Message-Id: <20221124184333.133911-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SC7180 MPSS/MSS remote processor can be brought to life using two
different bindings:
1. qcom,sc7280-mpss-pas - currently used in DTSI
2. qcom,sc7280-mss-pil

Move the properties related to qcom,sc7180-mss-pil (qcom,halt-regs,
qcom,ext-regs, qcom,qaccept-regs, resets and additional clocks) to
specific board using the PIL, to silence DT schema warnings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. New patch.
---
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi            | 16 ++--------------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index ad66e5e9db4e..bf522a64b172 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -22,11 +22,28 @@ mba_mem: memory@9c700000 {
 
 &remoteproc_mpss {
 	compatible = "qcom,sc7280-mss-pil";
+
+	clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+		 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
+		 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+		 <&rpmhcc RPMH_PKA_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "iface", "offline", "snoc_axi", "pka", "xo";
+
 	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
 	interconnects = <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
 	memory-region = <&mba_mem>, <&mpss_mem>;
 	firmware-name = "qcom/sc7280-herobrine/modem/mba.mbn",
 			"qcom/sc7280-herobrine/modem/qdsp6sw.mbn";
+
+	resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+		 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+	reset-names = "mss_restart", "pdc_reset";
+
+	qcom,halt-regs = <&tcsr_1 0x3000 0x5000 0x8000 0x13000>;
+	qcom,ext-regs = <&tcsr_2 0x10000 0x10004 &tcsr_1 0x6004 0x6008>;
+	qcom,qaccept-regs = <&tcsr_1 0x3030 0x3040 0x3020>;
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 448879d3d5cd..da3775677640 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2751,12 +2751,8 @@ remoteproc_mpss: remoteproc@4080000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
-				 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
-				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
-				 <&rpmhcc RPMH_PKA_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "iface", "offline", "snoc_axi", "pka", "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
 
 			power-domains = <&rpmhpd SC7280_CX>,
 					<&rpmhpd SC7280_MSS>;
@@ -2769,14 +2765,6 @@ remoteproc_mpss: remoteproc@4080000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
-				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
-			reset-names = "mss_restart", "pdc_reset";
-
-			qcom,halt-regs = <&tcsr_1 0x3000 0x5000 0x8000 0x13000>;
-			qcom,ext-regs = <&tcsr_2 0x10000 0x10004 &tcsr_1 0x6004 0x6008>;
-			qcom,qaccept-regs = <&tcsr_1 0x3030 0x3040 0x3020>;
-
 			status = "disabled";
 
 			glink-edge {
-- 
2.34.1

