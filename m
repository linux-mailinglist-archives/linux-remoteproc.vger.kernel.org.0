Return-Path: <linux-remoteproc+bounces-3310-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8522A7A26B
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Apr 2025 14:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B2B1891B92
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Apr 2025 12:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085BB24C67F;
	Thu,  3 Apr 2025 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp2kJ4GZ"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F524C692
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Apr 2025 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681821; cv=none; b=C6Z6t0V4l+fZnBBfl+aWASavGxaWxLUjMpCTBJDU7gTni9gxWBmRw9WNGIEO+mynXBmqZTmzsg94yEZI0aOTJA0iPbHIC+QAdtdlvKIhWehwvLaq5IKowMuWtlwVtlDiZHgTbrG5ILIzOEWD9EqB2OrF65ySHibFcUPGyrsjAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681821; c=relaxed/simple;
	bh=XwZi7SYJIYv+5H5DHSRbphfyWXnhLBZIgjdvfOw2XTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+mLnurj3Zgik7jnDI1zaL20QbtIHCW6YglXB5RLU4HrDrAt8+CRTtAHMSvSupoclTTdb4zHft9gqKx4Z79zXAD6En0//lWM3tybowoVhvlSmDDEkcKxcbCCmTAPwg7XPJ7X4Wu4qoQ5auLQszHlX41Mp6YrMHaMFWOhd/3pywY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp2kJ4GZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s0KL000645
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Apr 2025 12:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lk87R3h5+QU
	rraNSevkVcU9olZdNWSd6Up1jGf4VOTc=; b=Qp2kJ4GZgsIqCKGXqk8xtr1eKDa
	qpuqG8DfdxUj1h0z+ttlqXR1w7G3v0mQtNtnwccSKsT6zDUBOpoWPeanT+S++rZN
	EReG8qJU7BgzSJ+sAFkwEtCuU4DBZv0llCtbLEidUpTluy1JVO4pF7mv7NNiRXEQ
	XcMiF3KwNVpyzKf9/CmBwK4FgZXqNAiSg3hSTFRrAZtt/00O5a2HAurkL5oH9ecd
	QZOird0HD4V6f07E2z62THWkU+T2D9P9nj3grXmr8NtL/bc3peB7aRvrp3SCFA0b
	/zX8J2gQo8Kj8rWjTSwL2MGjQfuQWE1qUCajWJociY3B5bTKeRWIfIg5ScQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a3jnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 12:03:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso1176698a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 05:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681817; x=1744286617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lk87R3h5+QUrraNSevkVcU9olZdNWSd6Up1jGf4VOTc=;
        b=YaxS6IuO1S5eYH3az79Ox4U+pU1fc6I8cPoP3bb7atVAERWGclftjSbNoaxaW0j9Ay
         u7aY8bCQvZOpwCju3TGhWFQbtTBlGe4BHwAn/czBpFKAm7tomtpiB3TrLjKzdr1f0Czd
         QRZBgUCzu/tEg5mdrA7BEiSSXUKqrW0db1YlUbyJqGygPi58Opt2SsPuEV/ogirCIZM0
         TB2bRN0s3AX4whb9kF3Lb+rmdrq4KEl/cglwVTyKOj6Lt2XXtUDOv1G3aaIM8G0B38In
         PwR0PdPbEkJzeIv6i4hBNmDk1q3TB0vFWVGvQq15D3blXv908HhoWkP2auq3kOXE+Lw+
         r7eA==
X-Forwarded-Encrypted: i=1; AJvYcCWRirIRkqtSH0B3prMYtl8Yi/cP2Cg6fufH32OuTTKeUeuT0xI2RLx0rgN+2aXNEyQU8xDIEsv07xsngu+1HLK0@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJrAeZpUWx8yUo8Ut+dK+RpJ4KKBVUS6JwQkzLjyszcD9hQer
	OroGZwy3v02y3b38c0I3/PJ73UYEKPy4jyxZdE+2bv+hmjBPilPrANGhi7IBIV6CxL1J4daDkAG
	xlH2tGU2LVvt1HTZHcZEgeCc6dZ0I33Sm/OJVc4ph0IHDfZquWnagL9M+1zNEslvZUwXt
X-Gm-Gg: ASbGnctvipxhx7oXFZmmJs2r1SajTH8AQK6nYPJnNb6UuXNPJYy3pofclYkfaqWXau9
	Ju7SiZCRq0VaskfNNXYZK/jZNwxTk9/glRkkE6XC0otsv0fq4CTGfhpzp5Ur3Dmbs08RrSpap3w
	yzkwoMuV+eUXhrCskLcJYl+haNVXlC2OMoC15+PRCukSRKZEss/qwIaQ47F+r7djSX6NONO9xTI
	XSHw40M7rLnxW1D1E5gR3gYGzLIGPc9RmLirEJ/ni7G5NLV96NdqqWf/JwpRBjC9G6TIMdp+Y6l
	zY0lyszXPIVMQErViGTE24V4xQg2sW5BnwhJ8E6Owz2J7FHLEjaJZCvmj3tEx+EI4Zxo0Onqb5V
	NBhQO2fpwgCQAtqHlmiskJRIu2u72EKqPH7jqvvY=
X-Received: by 2002:a17:90b:1f91:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-305321705f1mr34406108a91.33.1743681817378;
        Thu, 03 Apr 2025 05:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK9xeWNHarlA36QHY1+b0NkGZhOIFrZcHxPmeU579TwcdNGMz+Lr8i4rUwtboStx7zHjXIbg==
X-Received: by 2002:a17:90b:1f91:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-305321705f1mr34406062a91.33.1743681817012;
        Thu, 03 Apr 2025 05:03:37 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:36 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 7/8] arm64: dts: qcom: ipq5424: add nodes to bring up q6
Date: Thu,  3 Apr 2025 17:33:03 +0530
Message-Id: <20250403120304.2345677-8-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee791b cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Chduei3-CDLOMEben-gA:9 a=RVmHIydaz68A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: If9Dy8uoGkmI9F7XFYxzsfmmJBPQQ9xJ
X-Proofpoint-GUID: If9Dy8uoGkmI9F7XFYxzsfmmJBPQQ9xJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=814 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 87 ++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1b..26c297ffb602 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -3,7 +3,7 @@
  * IPQ5424 device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -149,6 +149,16 @@ smem@8a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@8a900000 {
+			reg = <0x0 0x8a900000 0x0 0x2800000>;
+			no-map;
+		};
+
+		q6_dtb_region: wcss-dtb@8d100000 {
+			reg = <0x0 0x8d100000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc@0 {
@@ -541,6 +551,57 @@ dwc_0: usb@8a00000 {
 			};
 		};
 
+		apcs_glb: mailbox@f400004 {
+			compatible = "qcom,ipq5424-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
+			reg = <0 0xf400004 0 0x6000>;
+			#clock-cells = <1>;
+			#mbox-cells = <1>;
+		};
+
+		tmel_qmp: qmp@32090000 {
+			compatible = "qcom,ipq5424-tmel";
+			reg = <0 0x32090000 0 0x2000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apcs_glb 20>;
+			#mbox-cells = <1>;
+		};
+
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5424-wcss-sec-pil";
+			reg = <0 0x0d100000 0 0x4040>;
+			firmware-name = "ath12k/IPQ5424/hw1.0/q6_fw0.mbn",
+					"ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn";
+			interrupts-extended = <&intc GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 0>,
+					      <&smp2p_wcss_in 1 0>,
+					      <&smp2p_wcss_in 2 0>,
+					      <&smp2p_wcss_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			mboxes = <&tmel_qmp 0>;
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>, <&q6_dtb_region>;
+			qcom,q6-dtb-info = <&tcsr 0x1f004 0x1f008 0x1f00c>;
+
+			status = "okay";
+
+			glink-edge {
+				interrupts = <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
@@ -724,4 +785,28 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.34.1


