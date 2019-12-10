Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8CD118DC6
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Dec 2019 17:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfLJQkV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Dec 2019 11:40:21 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39804 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfLJQkV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Dec 2019 11:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575996019; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=nc5SrIdHpVnssk/U5799zzJ9fpS4ncnOzKcnZl0pRgI=;
        b=WYjlBA1ep008dqBzJo1+7SWKeyfOnEDf2AYce0NkCM6GUUkOGKOqh5WLK8kYXbh6RCmYT/
        KwwF6zezIBDpVAHQhqIjbUpRfl/Y+SCzxYJ32INAnLrsHx2b4ATOvoglKLJA8RlQoNODGv
        uX9mwcKs70+693X9SmZng3VnyI5QIRk=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     od@zcrc.me, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 1/5] dt-bindings: Document JZ47xx VPU auxiliary processor
Date:   Tue, 10 Dec 2019 17:40:10 +0100
Message-Id: <20191210164014.50739-1-paul@crapouillou.net>
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
---

Notes:
    v2: Update TCSM0 address in example
    v3: Change node name to 'video-decoder'
    v4: Convert to YAML. I didn't add Rob's Ack on v3 because of that (sorry Rob)

 .../bindings/remoteproc/ingenic,vpu.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
new file mode 100644
index 000000000000..9f876d16a5a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
@@ -0,0 +1,76 @@
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
+    vpu: video-decoder@132a0000 {
+      compatible = "ingenic,jz4770-vpu-rproc";
+
+      reg = <0x132a0000 0x20 /* AUX */
+           0x132b0000 0x4000 /* TCSM0 */
+           0x132c0000 0xc000 /* TCSM1 */
+           0x132f0000 0x7000 /* SRAM */
+      >;
+      reg-names = "aux", "tcsm0", "tcsm1", "sram";
+
+      clocks = <&cgu JZ4770_CLK_AUX>, <&cgu JZ4770_CLK_VPU>;
+      clock-names = "aux", "vpu";
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <3>;
+    };
-- 
2.24.0

