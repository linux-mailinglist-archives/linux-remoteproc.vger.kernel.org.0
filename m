Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2073B363B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 24 Jun 2021 20:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbhFXSzv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 24 Jun 2021 14:55:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49909 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbhFXSzu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Jun 2021 14:55:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624560811; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=oocWep8JCAxI44R0oX/F1DYB84NxDxX1JkoTJq0J/z0=; b=nDxY+iAOiZONALouUSyX6faSIP3RNYOyc2RnPSGHmhHbrhngq7knVImkmOKTd9POPz0vOlsk
 ttrIqpWpFEHNgrZA9LYdDObBEAZvbwn1ZhJb5ObzEXVCSaYFt18FxoCnCUVNz6rPOCACon0e
 uQk/7gSRNkQ6E6TZwXASFqg7g7s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60d4d4a819389419554afb99 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 18:53:28
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 83A1AC4360C; Thu, 24 Jun 2021 18:53:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BD62C4360C;
        Thu, 24 Jun 2021 18:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BD62C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 07/13] arm64: dts: qcom: sdm845: Use QMP binding to control load state
Date:   Fri, 25 Jun 2021 00:22:01 +0530
Message-Id: <1624560727-6870-8-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
state resources on SDM845 SoCs and drop deprecated power-domains exposed
by AOSS QMP node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1796ae8372be..8c3601810fb2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2984,6 +2984,8 @@
 			clock-names = "iface", "bus", "mem", "gpll0_mss",
 				      "snoc_axi", "mnoc_axi", "prng", "xo";
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -2993,11 +2995,10 @@
 
 			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
 
-			power-domains = <&aoss_qmp 2>,
-					<&rpmhpd SDM845_CX>,
+			power-domains = <&rpmhpd SDM845_CX>,
 					<&rpmhpd SDM845_MX>,
 					<&rpmhpd SDM845_MSS>;
-			power-domain-names = "load_state", "cx", "mx", "mss";
+			power-domain-names = "cx", "mx", "mss";
 
 			mba {
 				memory-region = <&mba_region>;
@@ -4582,7 +4583,6 @@
 			mboxes = <&apss_shared 0>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 
 			cx_cdev: cx {
 				#cooling-cells = <2>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

