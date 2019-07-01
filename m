Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC6271C4E8
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 May 2019 10:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfENI2W (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 May 2019 04:28:22 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:19238 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726678AbfENI1c (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 May 2019 04:27:32 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4E8Q8xq029562;
        Tue, 14 May 2019 10:27:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ug1rZBb4tp1QfVGX2K2LUauv8v7kBPMYnK+aqeqOCBA=;
 b=1eEmFBvmFp2Kt7iCklqkRaGZECElRyWYDZQKUavC/hkOrkWqInyOfUJ4V3EfoGkQunUO
 mzyEcMfs6zP80CO1aLv0H90K/en9L/uuuEbjsmMCDX1IGEKBwWmPz4a/tD6kCSlw/BlO
 /JChmB/bESSdhZXKh1u18gMzat0TS6ArSsMrP33vT/8t+oBWMM4uztUwrDRXqObDxZ+/
 Y5HuDFYCxKUi8080cfGbKPJ5T7JK555Yx5341xPf0+LX09oxsts7jga1BnZPYcq87IW2
 PAkYqbM16UoKoHYLlUbGt9cWXCUCHTLNg+k759GiW7pDH57hU2ZqD40/X/L2FWw4eru+ gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sdkuyqnmr-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 14 May 2019 10:27:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC3643F;
        Tue, 14 May 2019 08:27:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9666A1550;
        Tue, 14 May 2019 08:27:08 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 10:27:08 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 10:27:07
 +0200
From:   Fabien Dessenne <fabien.dessenne@st.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        "Ludovic Barre" <ludovic.barre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v4 1/8] dt-bindings: stm32: add bindings for ML-AHB interconnect
Date:   Tue, 14 May 2019 10:26:56 +0200
Message-ID: <1557822423-22658-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-14_05:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Document the ML-AHB interconnect for stm32 SoCs.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 .../devicetree/bindings/arm/stm32/mlahb.txt        | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
new file mode 100644
index 0000000..25307aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
@@ -0,0 +1,37 @@
+ML-AHB interconnect bindings
+
+These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
+a Cortex-M subsystem with dedicated memories.
+The MCU SRAM and RETRAM memory parts can be accessed through different addresses
+(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
+Cortex-M firmware accesses among those ports allows to tune the system
+performance.
+
+[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
+[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
+
+Required properties:
+- compatible: should be "simple-bus"
+- dma-ranges: describes memory addresses translation between the local CPU and
+	   the remote Cortex-M processor. Each memory region, is declared with
+	   3 parameters:
+		 - param 1: device base address (Cortex-M processor address)
+		 - param 2: physical base address (local CPU address)
+		 - param 3: size of the memory region.
+
+The Cortex-M remote processor accessed via the mlahb interconnect is described
+by a child node.
+
+Example:
+mlahb {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	dma-ranges = <0x00000000 0x38000000 0x10000>,
+		     <0x10000000 0x10000000 0x60000>,
+		     <0x30000000 0x30000000 0x60000>;
+
+	m4_rproc: m4@10000000 {
+		...
+	};
+};
-- 
2.7.4

