Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA69D3CF793
	for <lists+linux-remoteproc@lfdr.de>; Tue, 20 Jul 2021 12:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhGTJew (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 20 Jul 2021 05:34:52 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63772 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236449AbhGTJdx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:33:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626776069; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=iaqWHZmgS8Lu3MlAqmI7Z55aQR1Dhk3as4p++438MG0=; b=G2m4ETOiHVC3OtL4GUAJehq8hTvRnd4ufo3o6+pi52Oi5sThEMhFCqIO0p7zvi8/XNo9hmJp
 Ec4EhRLct+vkRnoJ/R6UJz1eFMHrdFNFbZNAuyTSlibchUBnARIRpuPRslB2kI1UUahe/rAB
 dZKenxU1YV06gH/3zeGKXpW/49M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f6a2001d1afe585eee94c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 10:14:24
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BDFFC43460; Tue, 20 Jul 2021 10:14:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DBCEC4360C;
        Tue, 20 Jul 2021 10:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DBCEC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
Date:   Tue, 20 Jul 2021 15:43:00 +0530
Message-Id: <1626775980-28637-11-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update MSS node to support MSA based modem boot on SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 19 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 191e8a92d153..d66e3ca42ad5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -343,3 +343,10 @@
 		bias-pull-up;
 	};
 };
+
+&remoteproc_mpss {
+	status = "okay";
+	compatible = "qcom,sc7280-mss-pil";
+	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
+	memory-region = <&mba_mem &mpss_mem>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 56ea172f641f..6d3687744440 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -586,7 +586,8 @@
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sc7280-mpss-pas";
-			reg = <0 0x04080000 0 0x10000>;
+			reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
+			reg-names = "qdsp6", "rmb";
 
 			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -597,8 +598,11 @@
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "offline", "snoc_axi", "xo";
 
 			power-domains = <&rpmhpd SC7280_CX>,
 					<&rpmhpd SC7280_MSS>;
@@ -611,6 +615,15 @@
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+			reset-names = "mss_restart", "pdc_reset";
+
+			qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000 0x28000 0x33000>;
+			qcom,ext-regs = <&tcsr_regs 0x10000 0x10004
+					 &tcsr_mutex 0x26004 0x26008>;
+			qcom,qaccept-regs = <&tcsr_mutex 0x23030 0x23040 0x23020>;
+
 			status = "disabled";
 
 			glink-edge {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

