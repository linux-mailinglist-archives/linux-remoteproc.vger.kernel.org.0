Return-Path: <linux-remoteproc+bounces-3309-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A9A7A26D
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Apr 2025 14:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8487E3B80F8
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Apr 2025 12:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EABB24E4AD;
	Thu,  3 Apr 2025 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cA05Tp6B"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD224C664
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Apr 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681818; cv=none; b=SIHWv7hTd8LbRp/M81Xl7ApHF3JAj/Zpw3iGh9lVm5x1nHVkXX8k50Kq/Zv0ub8ILRS0wcY1iqVoll7ODhVWQsacTeDHB4JMj4eIFqIn92WPVGL/6pQizfYEWVCDqACzRdYQr9p93gI2pcPcsp+7Mw56rxyvUddZrXAYMErTcrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681818; c=relaxed/simple;
	bh=GL7EeUsU4WMIp5QLj1a+MV//M+kg+7cZMA0v8yEg1ts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcCuX7bGeHQk40aDvO1wuiW4N6GVo5lut7oE867c+XapK1ByGFLwpsbwqCEm4nhuyZwBkmgKcCxFkkDirpSrPOs1Ty+hkvwNWifsuwhb0fahMlDd4jnRtjef2ETqCsJudfu7wxiyNWMfX3QgKfHwL8r/gR6htcb1mae1q+dZsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cA05Tp6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s0jQ026778
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Apr 2025 12:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5a6VfY7OYvQ
	0mCUlB+VfDZK73f4CkKDPhQjMlt/Zo7k=; b=cA05Tp6B4xqQ9adXi1MlN6f3A1U
	X2GjzUxayyCMGkKsANdMw94D76MPfUPrvCNX1U+eCBJJndHSBGxtwtznn1Ja1IaF
	GJBbFeBFcXRxRvKlHuHZLELDgUNJD11x/yAO0sKkqRPpO7+WPJZJm0WOCMA6HeJT
	TF3VQgNMC2eB/hFz19Rq07LZ+fpSUhYW/G9BYB843j43F6/g6B/qcfS3PNJH0mSC
	7Xh9ak5lnbD5ugmwO+XPY2+KVjxvIlgzBtakdeSaTlF1qqWLkJd0hUm5jqqX+q+g
	GWAjIATAmjEmrnAyPiru4hUACED9nJnqQWkr/n4Dr/6EjIlCRxIYmAy1s0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2yt058-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 12:03:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2264e5b2b7cso8208565ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 05:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681814; x=1744286614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a6VfY7OYvQ0mCUlB+VfDZK73f4CkKDPhQjMlt/Zo7k=;
        b=Yf/iHmj/vgyuc9tqTTKYTqhZUacrXgkZqLKPrpR3Lx3rLcUoa7HcO5a+EHer5fWVN8
         Hz+ASsvDahK+ishViRNOQIVx3RQfSYQuBwFQYRxXCK513CwBMj6yzVe1kPzHbnDjcHUS
         RojfhVHNBrd/6BCyI6kjjKnpAqk0ljPc5MjER4HJ3fWP/eylSczBcL7W24l9asP5UsTk
         Pnr92FoeMYIs5b+xMrM4sfFWDX7V54R+t2ZCodOJf2wPxeJO8W2SpHkO/INUUC493Nlq
         YqBnZXCjYNkJjuYKV+ASJ74zPcBadBHcOQC1lqMUqMy2C2ZJQxMJmYhTtl7ELUwUTT2K
         uxGg==
X-Forwarded-Encrypted: i=1; AJvYcCWMrOlmm9U+rVwwu1Q2gjntwzknr874F2P0xIEvLa/oEnQ5FEtbKrsWREWPihV7l5MBkj4WpJSMjSchuVCB6j6F@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+EjeBh+mJmIho9ENcZfZVOxg6iFbBPT9FRQ9XvVMWY9NTcrU
	UFbzptph3zmVS8d8Oe8tjh+a8zKzpwb7btmLjhs+bh/ye1NimsD1N6rry87cDWRvRC3aKRXscZL
	dvQbTn0xj3AbyTZVoKk6thXVnN0j4Rt8/vYhm8kCxP70SlvOuhw01PpWfcBzugRwkpN//
X-Gm-Gg: ASbGnct58dHiqkyrEKyK9byMzkNMBeeSsQ/NuvX+qcciaan624EO/p4nTPYc80hbh8C
	zBeBThEzLp6Cr+gvVm+S6tsQ7Px+s2o2SE3QEPxhI+MYhpEegauc5+c1zWPjMmjqixXwJOPqRMH
	gZALoCIC/oMTJ5LVwae82C4ehLbK1UYc80bOeDtv45wEsz/jx5Ug2gMMdH7CT0OML9N7ZUzPYe/
	kQAhxzDJM10a9EdULXsmYNfhlNOJ8c+GNkxt3iGejQwo9OMiBYdkJ5Ct/0JAAMJWK1/yQegmNhX
	aRAQYqFW1TBtvUv1YLgClDrPfjV5F0T6RvMa5jqDCTkHV2ESr+Sh6/5cPc0zjnwpGx87W/+PcQL
	ceyif8VmAdlCVLq/Gss99/KLzMifj6FTStxneXq0=
X-Received: by 2002:a17:902:d2cd:b0:224:1eab:97b5 with SMTP id d9443c01a7336-2292f94944emr287081745ad.1.1743681813721;
        Thu, 03 Apr 2025 05:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1dPGo60kLxifjgzaEpfslBOsmeHnjTVzT/vyKVQ5TIUBC9KhFNxlbD+IuHudFmQmUETqVhQ==
X-Received: by 2002:a17:902:d2cd:b0:224:1eab:97b5 with SMTP id d9443c01a7336-2292f94944emr287081265ad.1.1743681813305;
        Thu, 03 Apr 2025 05:03:33 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:33 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 6/8] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Date: Thu,  3 Apr 2025 17:33:02 +0530
Message-Id: <20250403120304.2345677-7-gokul.sriram.p@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67ee7917 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7PM57pxieELrpG8NSiQA:9 a=RVmHIydaz68A:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iP8cX1FhdIO2jxdW-4Pe4N68MZXGmpyv
X-Proofpoint-ORIG-GUID: iP8cX1FhdIO2jxdW-4Pe4N68MZXGmpyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=935 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 71 ++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 69dda757925d..af0de072abd2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,16 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+
+		q6_dtb_region: wcss-dtb@4d400000 {
+			reg = <0x0 0x4d400000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc@0 {
@@ -545,6 +555,41 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x4040>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn",
+					"ath12k/IPQ5332/hw1.0/qdsp6sw_dtb.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>, <&q6_dtb_region>;
+			qcom,q6-dtb-info = <&tcsr 0x1f004 0x1f008 0x1f00c>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
 	};
 
 	thermal-zones {
@@ -623,4 +668,28 @@ timer {
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
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


