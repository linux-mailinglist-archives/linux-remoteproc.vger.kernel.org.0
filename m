Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22E6281F47
	for <lists+linux-remoteproc@lfdr.de>; Sat,  3 Oct 2020 01:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgJBXm7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 2 Oct 2020 19:42:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49224 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgJBXm7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Oct 2020 19:42:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 092NgrHa076761;
        Fri, 2 Oct 2020 18:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601682173;
        bh=c6+LIf36sRJY9MqMvcbjmbd+xZeFEQmNUoNlIPLbpq0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=F7/B9w9JmXruIdDGmMxdaBvwxBorKpwh2ayx5R+Q6sI2gPJ899L5w83CroJwbDZkN
         lxMQigdOdZYCwyqZTbHf0eshyjgKmoYF3CBERAw0gujWZKEi1Cfc7rgeE791lKOKAx
         gcKXEBw+yjmzAtqUwpNEZ6cjj59u6B8Yj61dfW5A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 092Ngr3V122455
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 2 Oct 2020 18:42:53 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 2 Oct
 2020 18:42:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 2 Oct 2020 18:42:52 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 092Ngqbw026782;
        Fri, 2 Oct 2020 18:42:52 -0500
Received: from localhost ([10.250.37.92])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 092NgqOe112933;
        Fri, 2 Oct 2020 18:42:52 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v5 1/4] dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs
Date:   Fri, 2 Oct 2020 18:42:31 -0500
Message-ID: <20201002234234.20704-2-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002234234.20704-1-s-anna@ti.com>
References: <20201002234234.20704-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The Texas Instruments K3 family of SoCs have one or more dual-core
Arm Cortex R5F processor subsystems/clusters (R5FSS). The clusters
can be split between multiple voltage domains as well. Add the device
tree bindings document for these R5F subsystem devices. These R5F
processors do not have an MMU, and so require fixed memory carveout
regions matching the firmware image addresses. The nodes require more
than one memory region, with the first memory region used for DMA
allocations at runtime. The remaining memory regions are reserved
and are used for the loading and running of the R5F remote processors.
The R5F processors can also optionally use any internal on-chip SRAM
memories either for executing code or using it as fast-access data.

The added example illustrates the DT nodes for the single R5FSS device
present on K3 AM65x family of SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v5: Updated compatible in example to fix warnings against linux-next
v4: https://patchwork.kernel.org/patch/11763805/ 
 - Fixed whitespace indentation (added one extra space) on required list
v3: https://patchwork.kernel.org/patch/11679331/
 - Replaced ti,k3-sci-proc.yaml references with the new ti,k3-sci-common.yaml
 - Updated required list to include the three ti,sci properties
v2: https://patchwork.kernel.org/patch/11632997/
v1: https://patchwork.kernel.org/patch/11456381/

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 281 ++++++++++++++++++
 1 file changed, 281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
new file mode 100644
index 000000000000..4069f0f5e8fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -0,0 +1,281 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI K3 R5F processor subsystems
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  The TI K3 family of SoCs usually have one or more dual-core Arm Cortex R5F
+  processor subsystems/clusters (R5FSS). The dual core cluster can be used
+  either in a LockStep mode providing safety/fault tolerance features or in a
+  Split mode providing two individual compute cores for doubling the compute
+  capacity. These are used together with other processors present on the SoC
+  to achieve various system level goals.
+
+  Each Dual-Core R5F sub-system is represented as a single DTS node
+  representing the cluster, with a pair of child DT nodes representing
+  the individual R5F cores. Each node has a number of required or optional
+  properties that enable the OS running on the host processor to perform
+  the device management of the remote processor and to communicate with the
+  remote processor.
+
+properties:
+  $nodename:
+    pattern: "^r5fss(@.*)?"
+
+  compatible:
+    enum:
+      - ti,am654-r5fss
+      - ti,j721e-r5fss
+
+  power-domains:
+    description: |
+      Should contain a phandle to a PM domain provider node and an args
+      specifier containing the R5FSS device id value.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    description: |
+      Standard ranges definition providing address translations for
+      local R5F TCM address spaces to bus addresses.
+
+# Optional properties:
+# --------------------
+
+  ti,cluster-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      Configuration Mode for the Dual R5F cores within the R5F cluster.
+      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
+      default is LockStep mode if omitted.
+
+# R5F Processor Child Nodes:
+# ==========================
+
+patternProperties:
+  "^r5f@[a-f0-9]+$":
+    type: object
+    description: |
+      The R5F Sub-System device node should define two R5F child nodes, each
+      node representing a TI instantiation of the Arm Cortex R5F core. There
+      are some specific integration differences for the IP like the usage of
+      a Region Address Translator (RAT) for translating the larger SoC bus
+      addresses into a 32-bit address space for the processor.
+
+      Each R5F core has an associated 64 KB of Tightly-Coupled Memory (TCM)
+      internal memories split between two banks - TCMA and TCMB (further
+      interleaved into two banks TCMB0 and TCMB1). These memories (also called
+      ATCM and BTCM) provide read/write performance on par with the core's L1
+      caches. Each of the TCMs can be enabled or disabled independently and
+      either of them can be configured to appear at that R5F's address 0x0.
+
+      The cores do not use an MMU, but has a Region Address Translater
+      (RAT) module that is accessible only from the R5Fs for providing
+      translations between 32-bit CPU addresses into larger system bus
+      addresses. Cache and memory access settings are provided through a
+      Memory Protection Unit (MPU), programmable only from the R5Fs.
+
+    allOf:
+      - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+
+    properties:
+      compatible:
+        enum:
+          - ti,am654-r5f
+          - ti,j721e-r5f
+
+      reg:
+        items:
+          - description: Address and Size of the ATCM internal memory region
+          - description: Address and Size of the BTCM internal memory region
+
+      reg-names:
+        items:
+          - const: atcm
+          - const: btcm
+
+      resets:
+        description: |
+          Should contain the phandle to the reset controller node managing the
+          local resets for this device, and a reset specifier.
+        maxItems: 1
+
+      firmware-name:
+        description: |
+          Should contain the name of the default firmware image
+          file located on the firmware search path
+
+# The following properties are mandatory for R5F Core0 in both LockStep and Split
+# modes, and are mandatory for R5F Core1 _only_ in Split mode. They are unused for
+# R5F Core1 in LockStep mode:
+
+      mboxes:
+        description: |
+          OMAP Mailbox specifier denoting the sub-mailbox, to be used for
+          communication with the remote processor. This property should match
+          with the sub-mailbox node used in the firmware image.
+        maxItems: 1
+
+      memory-region:
+        description: |
+          phandle to the reserved memory nodes to be associated with the
+          remoteproc device. There should be at least two reserved memory nodes
+          defined. The reserved memory nodes should be carveout nodes, and
+          should be defined with a "no-map" property as per the bindings in
+          Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+        minItems: 2
+        maxItems: 8
+        items:
+          - description: region used for dynamic DMA allocations like vrings and
+                         vring buffers
+          - description: region reserved for firmware image sections
+        additionalItems: true
+
+
+# Optional properties:
+# --------------------
+# The following properties are optional properties for each of the R5F cores:
+
+      ti,atcm-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          R5F core configuration mode dictating if ATCM should be enabled. The
+          R5F address of ATCM is dictated by ti,loczrama property. Should be
+          either a value of 1 (enabled) or 0 (disabled), default is disabled
+          if omitted. Recommended to enable it for maximizing TCMs.
+
+      ti,btcm-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          R5F core configuration mode dictating if BTCM should be enabled. The
+          R5F address of BTCM is dictated by ti,loczrama property. Should be
+          either a value of 1 (enabled) or 0 (disabled), default is enabled if
+          omitted.
+
+      ti,loczrama:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          R5F core configuration mode dictating which TCM should appear at
+          address 0 (from core's view). Should be either a value of 1 (ATCM
+          at 0x0) or 0 (BTCM at 0x0), default value is 1 if omitted.
+
+      sram:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        minItems: 1
+        maxItems: 4
+        description: |
+          phandles to one or more reserved on-chip SRAM regions. The regions
+          should be defined as child nodes of the respective SRAM node, and
+          should be defined as per the generic bindings in,
+          Documentation/devicetree/bindings/sram/sram.yaml
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - ti,sci
+      - ti,sci-dev-id
+      - ti,sci-proc-ids
+      - resets
+      - firmware-name
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        model = "Texas Instruments K3 AM654 SoC";
+        compatible = "ti,am654-evm", "ti,am654";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        bus@100000 {
+            compatible = "simple-bus";
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
+                     <0x00 0x41000000 0x00 0x41000000 0x00 0x00020000>,
+                     <0x00 0x41400000 0x00 0x41400000 0x00 0x00020000>,
+                     <0x00 0x41c00000 0x00 0x41c00000 0x00 0x00080000>;
+
+            bus@28380000 {
+                compatible = "simple-bus";
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges = <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>, /* MCU NAVSS */
+                         <0x00 0x41000000 0x00 0x41000000 0x00 0x00020000>, /* MCU R5F Core0 */
+                         <0x00 0x41400000 0x00 0x41400000 0x00 0x00020000>, /* MCU R5F Core1 */
+                         <0x00 0x41c00000 0x00 0x41c00000 0x00 0x00080000>; /* MCU SRAM */
+
+                /* AM65x MCU R5FSS node */
+                mcu_r5fss0: r5fss@41000000 {
+                    compatible = "ti,am654-r5fss";
+                    power-domains = <&k3_pds 129>;
+                    ti,cluster-mode = <1>;
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+                    ranges = <0x41000000 0x00 0x41000000 0x20000>,
+                             <0x41400000 0x00 0x41400000 0x20000>;
+
+                    mcu_r5f0: r5f@41000000 {
+                        compatible = "ti,am654-r5f";
+                        reg = <0x41000000 0x00008000>,
+                              <0x41010000 0x00008000>;
+                        reg-names = "atcm", "btcm";
+                        ti,sci = <&dmsc>;
+                        ti,sci-dev-id = <159>;
+                        ti,sci-proc-ids = <0x01 0xFF>;
+                        resets = <&k3_reset 159 1>;
+                        firmware-name = "am65x-mcu-r5f0_0-fw";
+                        ti,atcm-enable = <1>;
+                        ti,btcm-enable = <1>;
+                        ti,loczrama = <1>;
+                        mboxes = <&mailbox0 &mbox_mcu_r5fss0_core0>;
+                        memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+                                        <&mcu_r5fss0_core0_memory_region>;
+                        sram = <&mcu_r5fss0_core0_sram>;
+                    };
+
+                    mcu_r5f1: r5f@41400000 {
+                        compatible = "ti,am654-r5f";
+                        reg = <0x41400000 0x00008000>,
+                              <0x41410000 0x00008000>;
+                        reg-names = "atcm", "btcm";
+                        ti,sci = <&dmsc>;
+                        ti,sci-dev-id = <245>;
+                        ti,sci-proc-ids = <0x02 0xFF>;
+                        resets = <&k3_reset 245 1>;
+                        firmware-name = "am65x-mcu-r5f0_1-fw";
+                        ti,atcm-enable = <1>;
+                        ti,btcm-enable = <1>;
+                        ti,loczrama = <1>;
+                        mboxes = <&mailbox1 &mbox_mcu_r5fss0_core1>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.28.0

