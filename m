Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D531AE2FE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 19:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgDQRAs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 13:00:48 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52336 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgDQRAs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 13:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587142844; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=+XWufbHqaEuHElib8WJXZRAu9ivj8NXY3GeJi59oju4=;
        b=mFEFRl2qydI1LhD1MuSaJOZXM50VX8V4NqaJxCSQGiYYZwd0M4unVdAA3ooclsouZEAJyN
        s8DBMHiJ/5QjIn1y7r7tKEhuIs8zDJrNmd9C9tKZ46u/peVx88h7MstMA7x5Iq/nXkiOP8
        y4R4SR5/SWVSFwWFAohQf/Iq2sEh3OI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     od@zcrc.me, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/5] dt-bindings: Document JZ47xx VPU auxiliary processor
Date:   Fri, 17 Apr 2020 19:00:36 +0200
Message-Id: <20200417170040.174319-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
Ingenic is a second Xburst MIPS CPU very similar to the main core.
This document describes the devicetree bindings for this auxiliary
processor.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2: Update TCSM0 address in example
    v3: Change node name to 'video-decoder'
    v4: Convert to YAML. I didn't add Rob's Ack on v3 because of that (sorry Rob)
    v5: - Fix 'reg' not in <addr, len> pairs
    	- Add missing include to devicetree example
    v6: No change

 .../bindings/remoteproc/ingenic,vpu.yaml      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
new file mode 100644
index 000000000000..c019f9fbe916
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Ingenic Video Processing Unit bindings
+
+description:
+  Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
+  Ingenic is a second Xburst MIPS CPU very similar to the main core.
+  This document describes the devicetree bindings for this auxiliary
+  processor.
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  compatible:
+    const: ingenic,jz4770-vpu-rproc
+
+  reg:
+    items:
+      - description: aux registers
+      - description: tcsm0 registers
+      - description: tcsm1 registers
+      - description: sram registers
+
+  reg-names:
+    items:
+      - const: aux
+      - const: tcsm0
+      - const: tcsm1
+      - const: sram
+
+  clocks:
+    items:
+      - description: aux clock
+      - description: vpu clock
+
+  clock-names:
+    items:
+      - const: aux
+      - const: vpu
+
+  interrupts:
+    description: VPU hardware interrupt
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4770-cgu.h>
+
+    vpu: video-decoder@132a0000 {
+      compatible = "ingenic,jz4770-vpu-rproc";
+
+      reg = <0x132a0000 0x20>, /* AUX */
+            <0x132b0000 0x4000>, /* TCSM0 */
+            <0x132c0000 0xc000>, /* TCSM1 */
+            <0x132f0000 0x7000>; /* SRAM */
+      reg-names = "aux", "tcsm0", "tcsm1", "sram";
+
+      clocks = <&cgu JZ4770_CLK_AUX>, <&cgu JZ4770_CLK_VPU>;
+      clock-names = "aux", "vpu";
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <3>;
+    };
-- 
2.25.1

