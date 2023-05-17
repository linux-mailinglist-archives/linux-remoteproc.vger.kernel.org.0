Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FDB705EC4
	for <lists+linux-remoteproc@lfdr.de>; Wed, 17 May 2023 06:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjEQEfx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 May 2023 00:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbjEQEfq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 May 2023 00:35:46 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B72530F9;
        Tue, 16 May 2023 21:35:41 -0700 (PDT)
X-UUID: 43b728d2f46c11edb20a276fd37b9834-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mHZvfrM0o5UaIt01vL+X0Xi78aCQjddfdApBpcmPqT8=;
        b=CETtkgLavHcaOFquAMw6IyHbjOoefRHy+FnmC1/9ks2ZUl/hIDgnFprhwYwhGaTxIjeEGAYAcezBC53VuRaefx4VE/M1n5Vj4i4JStzwCBhSAu8Hr58JENlHGJgIIEvY7NexQaPTYJ89RQX2z/xVeuwg16MXfeImFtWyI83cdzw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:6f057aab-11c8-4e63-9d76-56f3611e8242,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:8b5c116c-2f20-4998-991c-3b78627e4938,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 43b728d2f46c11edb20a276fd37b9834-20230517
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1427809753; Wed, 17 May 2023 12:35:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 12:35:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 12:35:33 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 03/11] dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
Date:   Wed, 17 May 2023 12:34:41 +0800
Message-ID: <20230517043449.26352-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517043449.26352-1-tinghan.shen@mediatek.com>
References: <20230517043449.26352-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Extend the SCP binding to describe the MT8195 dual-core SCP.

Under different applications, the MT8195 SCP can be used as single-core
or dual-core. This change keeps the single-core definitions and
adds new definitions for the dual-core use case.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 145 +++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 271081df0e46..09102dda4942 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8188-scp
       - mediatek,mt8192-scp
       - mediatek,mt8195-scp
+      - mediatek,mt8195-scp-dual
 
   reg:
     description:
@@ -31,10 +32,7 @@ properties:
 
   reg-names:
     minItems: 2
-    items:
-      - const: sram
-      - const: cfg
-      - const: l1tcm
+    maxItems: 3
 
   clocks:
     description:
@@ -70,6 +68,81 @@ properties:
 
     unevaluatedProperties: false
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges:
+    description:
+      Standard ranges definition providing address translations for
+      local SCP SRAM address spaces to bus addresses.
+
+patternProperties:
+  "^scp@[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek SCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address space
+      for the processor.
+
+      Each SCP core has own cache memory. The SRAM and L1TCM are shared by
+      cores. The power of cache, SRAM and L1TCM power should be enabled
+      before booting SCP cores. The size of cache, SRAM, and L1TCM are varied
+      on differnt SoCs.
+
+      The SCP cores do not use an MMU, but has a set of registers to
+      control the translations between 32-bit CPU addresses into system bus
+      addresses. Cache and memory access settings are provided through a
+      Memory Protection Unit (MPU), programmable only from the SCP.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,scp-core
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      interrupts:
+        maxItems: 1
+
+      firmware-name:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          If present, name (or relative path) of the file within the
+          firmware search path containing the firmware image used when
+          initializing sub cores of multi-core SCP.
+
+      memory-region:
+        maxItems: 1
+
+      cros-ec-rpmsg:
+        $ref: /schemas/mfd/google,cros-ec.yaml
+        description:
+          This subnode represents the rpmsg device. The properties
+          of this node are defined by the individual bindings for
+          the rpmsg devices.
+
+        required:
+          - mediatek,rpmsg-name
+
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -99,7 +172,37 @@ allOf:
         reg:
           maxItems: 2
         reg-names:
+          items:
+            - const: sram
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8192-scp
+            - mediatek,mt8195-scp
+    then:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: sram
+            - const: cfg
+            - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8195-scp-dual
+    then:
+      properties:
+        reg:
           maxItems: 2
+        reg-names:
+          items:
+            - const: cfg
+            - const: l1tcm
 
 additionalProperties: false
 
@@ -121,3 +224,37 @@ examples:
             mediatek,rpmsg-name = "cros-ec-rpmsg";
         };
     };
+
+  - |
+    scp@10500000 {
+        compatible = "mediatek,mt8195-scp-dual";
+        reg = <0x10720000 0xe0000>,
+              <0x10700000 0x8000>;
+        reg-names = "cfg", "l1tcm";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x10500000 0x100000>;
+
+        scp@0 {
+            compatible = "mediatek,scp-core";
+            reg = <0x0 0xa0000>;
+            reg-names = "sram";
+
+            cros-ec-rpmsg {
+                compatible = "google,cros-ec-rpmsg";
+                mediatek,rpmsg-name = "cros-ec-rpmsg";
+            };
+        };
+
+        scp@a0000 {
+            compatible = "mediatek,scp-core";
+            reg = <0xa0000 0x20000>;
+            reg-names = "sram";
+
+            cros-ec-rpmsg {
+                compatible = "google,cros-ec-rpmsg";
+                mediatek,rpmsg-name = "cros-ec-rpmsg";
+            };
+        };
+    };
-- 
2.18.0

