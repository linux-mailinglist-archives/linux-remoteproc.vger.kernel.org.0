Return-Path: <linux-remoteproc+bounces-3001-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F5A2151D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Jan 2025 00:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6162166493
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Jan 2025 23:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550F6192D76;
	Tue, 28 Jan 2025 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZPvUYgFO"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB91F5602;
	Tue, 28 Jan 2025 23:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107392; cv=none; b=dnERoTx22+TR03CE7l8437T+NedEcv1oWwG0fHAxjSCRylamN6YA8nF+RG+8GDDjFrXzHEqB6DUmZ0dNSCLyoUHt3R/iFkSGovdpu8GAyhktj/ug9CD3zbuhG/3PNoTA92p6VShblvEZPxxUFjtk1iaTYHJdSO/Im803rFZZ360=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107392; c=relaxed/simple;
	bh=6O44VzCK6ZQX9n11tItDrPeEP6WQi0aIao3attwQ2Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU53bL10ZHLTVtgnarhaSEU7Psx/AGhvoo96F4J3vXM6IxRDDMK2jU15cMG1QgjKbUAm6RhHtl8wzyfTItUhOFu3oUkQFRidKFK3PZ4YXUnjwDwp70n1JKS8EmVOCuPnykJWIlvvOYKMcxfmZq17LT8lTmC2qAal0qfJt8cELCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ZPvUYgFO; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107380; bh=6O44VzCK6ZQX9n11tItDrPeEP6WQi0aIao3attwQ2Rs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZPvUYgFOFEvS63J7tyQAVnNEh+m1Gk01q+LqLmtDONgEILIr4bhIayBYjGD6WPXpE
	 7NYu04GRn/1tet7gr3CiagUBY+84sl21xzIyg66DuRTzI0C+kmL6vSAdNZG0rqEZVz
	 Ca5y7mp+V5SHKNwkMkSxHnpKRmWr5tFJAqIFNw3s=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:42 +0100
Subject: [PATCH v4 10/13] ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP
 device
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-msm8226-modem-v4-10-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=6O44VzCK6ZQX9n11tItDrPeEP6WQi0aIao3attwQ2Rs=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnu5726lphn6REZ6ksf2EqJaq8B2AmA7jauc
 Io1UzqTkQKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp7gAKCRBy2EO4nU3X
 VmWrEACW5mtcMPq8d80YLa4Ri95fhmFRhDmcUp5TktE3JyNE9uAzYXOS6V7Wz35K08gJMrHYs7V
 gVWdS7vWmDHJdINm5aVkjgCz3E3+VlTnyWPp6112cu+kdFiIX9khLYvCz9Ud6W5trfqKDdtdt7H
 VEIx50yFF8cDFDqKBDF6PyLS6qUuaCfFhGR8h0Db+Y2GmZpw2+nxYVEbkEmzZVAgBaONhylLBxS
 SqzX7wavT5zeqyJZdQni9GdGoAKaeVpXDAYyoPaX2EgJHPZIESCsWnlBpxcn1vBxr8MKT840MWd
 brOewuI6kWDFmuUFh9CmM85qyf9vQN1arsg27nFrsLSAiDRFAvbGHvWaIPaoPG1uHmb52kEsDZ0
 Vnx0osu47fp4+veQMBwbN48W64OnXxLRR5xP58bDnBa5b67qdMgXKZev5laKu99iAPLE4ixR0V0
 tcmlU9mKr+MJwpUaP3FgebJBbRPpi3h1aKUM8CV3Jskbw0XuSjPweONbPBYgdHZuF5oKTGYodja
 9wkSStlm9qiqxh1OtZdzhi+/dBo7W6Lz4zP5vL9Run3dCJ5wOy66OLvarNriV7IB3Xl5RRulOWV
 HgcIwmELXRIuGrtmhLKjngcxnEIoZYu4ipar8DzKJUKrVsWM6oDZycS0O9Z2z/tcj5aHhSz1Det
 6t7TLLaJ6EHT1Sg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

BAM DMUX is used as the network interface to the modem.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 55bb070dcf489064f5b14902da1acd2762232ef9..1091eb13576c1cce1821a9200d4c344387851583 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -916,6 +916,18 @@ spmi_bus: spmi@fc4cf000 {
 			#interrupt-cells = <4>;
 		};
 
+		bam_dmux_dma: dma-controller@fc834000 {
+			compatible = "qcom,bam-v1.4.0";
+			reg = <0xfc834000 0x7000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		modem: remoteproc@fc880000 {
 			compatible = "qcom,msm8226-mss-pil";
 			reg = <0xfc880000 0x100>,
@@ -951,6 +963,20 @@ modem: remoteproc@fc880000 {
 
 			status = "disabled";
 
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+
+				interrupt-parent = <&modem_smsm>;
+				interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc", "pc-ack";
+
+				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+				qcom,smem-state-names = "pc", "pc-ack";
+
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+			};
+
 			smd-edge {
 				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
 

-- 
2.48.1


