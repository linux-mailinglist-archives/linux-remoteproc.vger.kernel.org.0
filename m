Return-Path: <linux-remoteproc+bounces-1656-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB9912814
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Jun 2024 16:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998EF1F22242
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Jun 2024 14:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D81C374EA;
	Fri, 21 Jun 2024 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5ZwnT24O"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D477323769;
	Fri, 21 Jun 2024 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980770; cv=none; b=DFCUYMWWOvXIiR/2T75JumMaHSQZqLDR3qNjmWFjy/WkEGdm39PJybMGd8Rdq7pkhoMogAJSM4d9i4gDc4lj94GBXBICjLFJb9K4KedQcOmz2gXSOl+CWubr3xnM8NCx3+6X14fJuWFMxHMYtrytLWv7pc9X7Blg9KFhWUrc5Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980770; c=relaxed/simple;
	bh=RKYsAEvQRXWIAuP82l+zFeTBW2y8hvA6zPeWxu5FfUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IoWgRNNATzjeJ9oP0zbztAqRGsgsiGfaSj/Nqbeze1/FxVIfiC3o5uJ+j2CtPynxL+iyvRmt8JUQ9i97r5nhzMjeU8+OEyVzFp65bHI/LKzYdTxzHj5eNes+BznNgduwBHmzbr+kjJ3ZyBEBXVvQ4zifySesI7lJZJEfPUPoSGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=5ZwnT24O; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LBHFKu027583;
	Fri, 21 Jun 2024 16:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gaYYKQhdt5+WppBYnImCivL9U494+2hjcdM9oi2RwHw=; b=5ZwnT24OoRmmOatg
	5lyjcf9jwPHgAvKuuYPmpPaGZPZDbhcIbb1TBK1o7TxGG/45P/j5vG6GFTklztVV
	QQTBuDZ/XuTYkSgiXqwGlJSi7VCwzrWYpp3Z01VYiP2TOamg0fVaAzC3GB7Lzgr5
	98IhadHkuUlowP2E3/S4TvkFadJjqp16DPh84TBh1w2bH32ze2yLH915BIMYwSrC
	R6BeU5630t3505vt25svtM5CkhcEMhbhf4ss0/fNci8kO1wncZkPQKaHPrK5dd7V
	SonIG4tNDJfQo4rnsWqmZ5meGOfPFRuV9kHi8p/A0PiBJHxun9Zd2NBko4JwsOVh
	S/NqFQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkgv43k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:39:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01A8A40044;
	Fri, 21 Jun 2024 16:39:01 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E74C5220B76;
	Fri, 21 Jun 2024 16:38:12 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 16:38:12 +0200
Received: from localhost (10.252.31.218) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 16:38:12 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v8 3/5] dt-bindings: remoteproc: Add compatibility for TEE support
Date: Fri, 21 Jun 2024 16:37:57 +0200
Message-ID: <20240621143759.547793-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
References: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_06,2024-06-21_01,2024-05-17_01

The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
(TEE).

For instance, this compatible is used in both the Linux and OP-TEE device
trees:
- In OP-TEE, a node is defined in the device tree with the
  "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
  Based on DT properties, the OP-TEE remoteproc framework is initiated to
  expose a trusted application service to authenticate and load the remote
  processor firmware provided by the Linux remoteproc framework, as well
  as to start and stop the remote processor.
- In Linux, when the compatibility is set, the Cortex-M resets should not
  be declared in the device tree. In such a configuration, the reset is
  managed by the OP-TEE remoteproc driver and is no longer accessible from
  the Linux kernel.

Associated with this new compatible, add the "st,proc-id" property to
identify the remote processor. This ID is used to define a unique ID,
common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
This ID will be used in requests to the OP-TEE remoteproc Trusted
Application to specify the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 58 ++++++++++++++++---
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 370af61d8f28..409123cd4667 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -16,7 +16,12 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp1-m4
+    enum:
+      - st,stm32mp1-m4
+      - st,stm32mp1-m4-tee
+    description:
+      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
+      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
 
   reg:
     description:
@@ -43,6 +48,10 @@ properties:
           - description: The offset of the hold boot setting register
           - description: The field mask of the hold boot
 
+  st,proc-id:
+    description: remote processor identifier
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   st,syscfg-tz:
     deprecated: true
     description:
@@ -142,21 +151,43 @@ properties:
 required:
   - compatible
   - reg
-  - resets
 
 allOf:
   - if:
       properties:
-        reset-names:
-          not:
-            contains:
-              const: hold_boot
+        compatible:
+          contains:
+            const: st,stm32mp1-m4
     then:
+      if:
+        properties:
+          reset-names:
+            not:
+              contains:
+                const: hold_boot
+      then:
+        required:
+          - st,syscfg-holdboot
+      else:
+        properties:
+          st,syscfg-holdboot: false
+        required:
+          - reset-names
       required:
-        - st,syscfg-holdboot
-    else:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp1-m4-tee
+    then:
       properties:
         st,syscfg-holdboot: false
+        reset-names: false
+        resets: false
+      required:
+        - st,proc-id
 
 additionalProperties: false
 
@@ -188,5 +219,16 @@ examples:
       st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
       st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
+  - |
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    m4@10000000 {
+      compatible = "st,stm32mp1-m4-tee";
+      reg = <0x10000000 0x40000>,
+            <0x30000000 0x40000>,
+            <0x38000000 0x10000>;
+      st,proc-id = <0>;
+      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
+    };
 
 ...
-- 
2.25.1


