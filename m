Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022447E985F
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Nov 2023 09:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbjKMI4x (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Nov 2023 03:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbjKMI4l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Nov 2023 03:56:41 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1236D1700
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Nov 2023 00:56:33 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9e1021dbd28so631910266b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Nov 2023 00:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865791; x=1700470591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEjSvQsvdQFJ/4jtMEKfqAXOd5wQ7erlEtHlveUl/DY=;
        b=VD2p9lmMDR8JpG7JirHA6CrUhHqi4KUYCcJX8T0RbBQRmi9SWA36G/Cu3YJLLmxk7P
         kbFaU/rcXhNTeC/4uCE21xlGTMqkwZrA/VrCYaiwgR39FsTG7quD77mIcQHlvl3HkcCy
         iV/JzSEwwQZklYh962Hxe+kblD8aj+i334+9w0ybkxAIO9oADY8vRSaDH8l0hb1xZK6V
         a8FndzWmSjUt/1WtnaLlMg6+AlkgfNQ0mvIQzW5WRb1MEKcA4yxrb4JijTLMIsz6GKG8
         WVPJ2WX5nLnqLhQlh4XxFNIYpHAsAHF1fBRCXbyFTg8uAMmlHXF84jubQ9rCKxMkfaKu
         /paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865791; x=1700470591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEjSvQsvdQFJ/4jtMEKfqAXOd5wQ7erlEtHlveUl/DY=;
        b=U5/UU3hW+r/GX1XRsgeVN8k9zQfLHi2agnGQxGUBzinlYW69vrpE2x5EM1oWajA/Eg
         vDuozwu/0mcV1AOWvJRljY9hCDJCpHR/s0he1/d8FM26+7qIQ6AUS8BYiD/KY10rJnOZ
         kAzOXmAtJBWn9DtMVelRjyI5c1UqB2hsu1xeYgxcTb1oN1BCDHy7jPHB7PPULqeuXjOS
         rYoRVZHjB620PKnJHUtTQ/0f88BU3zmoVyya1+3G7kaK1fMebnaQ5DAyBT16WBh9Ho0n
         7IIYeRkOQM8ntMjv/yVrWogsLXtTL5BEPDpmRuRklnUZ1wq5QYGmrSPMxhv+0QlNLmJx
         L9yw==
X-Gm-Message-State: AOJu0YzedPyXYNY9nkm1hbO1dupDlR2ulE3AOdr8ooOlNv7HS5167gkr
        ZKCWu+5dZy2YjHdF1O74SJVZlQ==
X-Google-Smtp-Source: AGHT+IHp1pYbpBzwKe4auxgsDBaX/XljHH9NUdMbKM2dfVjMWoevjhcKa4nBNPalVvjHhio6zjqfQA==
X-Received: by 2002:a17:906:fa9b:b0:9dd:6664:1a3a with SMTP id lt27-20020a170906fa9b00b009dd66641a3amr4034381ejb.51.1699865791582;
        Mon, 13 Nov 2023 00:56:31 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:31 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 13 Nov 2023 09:56:20 +0100
Subject: [PATCH v2 09/11] arm64: dts: qcom: sc7280: Add CDSP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-9-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the node for the ADSP found on the SC7280 SoC, using standard
Qualcomm firmware.

Remove the reserved-memory node from sc7280-chrome-common since CDSP is
currently not used there.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   5 -
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   6 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 143 +++++++++++++++++++++
 3 files changed, 149 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 92be951fc0e4..77ba05b77d68 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -75,11 +75,6 @@ cont_splash_mem: cont-splash@e1000000 {
 			no-map;
 		};
 
-		cdsp_mem: cdsp@88f00000 {
-			reg = <0x0 0x88f00000 0x0 0x1e00000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 9cbe0fe64420..43f0a512c46c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -17,6 +17,7 @@
  * required by the setup for Chrome boards.
  */
 
+/delete-node/ &cdsp_mem;
 /delete-node/ &hyp_mem;
 /delete-node/ &xbl_mem;
 /delete-node/ &reserved_xbl_uefi_log;
@@ -84,6 +85,11 @@ spi_flash: flash@0 {
 	};
 };
 
+/* Currently not used */
+&remoteproc_cdsp {
+	/delete-property/ memory-region;
+};
+
 &remoteproc_wpss {
 	compatible = "qcom,sc7280-wpss-pil";
 	clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 2b11ccc9a6b8..8306a64875fd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -147,6 +147,11 @@ adsp_mem: adsp@86700000 {
 			no-map;
 		};
 
+		cdsp_mem: cdsp@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x1e00000>;
+			no-map;
+		};
+
 		video_mem: video@8b200000 {
 			reg = <0x0 0x8b200000 0x0 0x500000>;
 			no-map;
@@ -3830,6 +3835,144 @@ nsp_noc: interconnect@a0c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		remoteproc_cdsp: remoteproc@a300000 {
+			compatible = "qcom,sc7280-cdsp-pas";
+			reg = <0 0x0a300000 0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC7280_CX>,
+					<&rpmhpd SC7280_MX>;
+			power-domain-names = "cx", "mx";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x11a1 0x0420>,
+							 <&apps_smmu 0x1181 0x0420>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x11a2 0x0420>,
+							 <&apps_smmu 0x1182 0x0420>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x11a3 0x0420>,
+							 <&apps_smmu 0x1183 0x0420>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x11a4 0x0420>,
+							 <&apps_smmu 0x1184 0x0420>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x11a5 0x0420>,
+							 <&apps_smmu 0x1185 0x0420>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x11a6 0x0420>,
+							 <&apps_smmu 0x1186 0x0420>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x11a7 0x0420>,
+							 <&apps_smmu 0x1187 0x0420>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x11a8 0x0420>,
+							 <&apps_smmu 0x1188 0x0420>;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu 0x11ab 0x0420>,
+							 <&apps_smmu 0x118b 0x0420>;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x11ac 0x0420>,
+							 <&apps_smmu 0x118c 0x0420>;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x11ad 0x0420>,
+							 <&apps_smmu 0x118d 0x0420>;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x11ae 0x0420>,
+							 <&apps_smmu 0x118e 0x0420>;
+					};
+				};
+			};
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;

-- 
2.42.1

