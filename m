Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651C221D732
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Jul 2020 15:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgGMN3n (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Jul 2020 09:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729855AbgGMN3m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 09:29:42 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45860C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 06:29:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r12so16513030wrj.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ku9aM1vtf8T+FGw4lj5ZIPzjxBiChVO0/pPdJg2fBGw=;
        b=PrmHEa5FPW0LpbYElEyKRcYnhJi5XmlC36lx5TSUk0I4eKD5oBsz61WrgLwaHWBGIX
         Ut63kpeIUoPgm/Iugy6CdW2TIR25zGavB/guDK5USe1uzqHhQIzZmP4SybSuqPzcYscF
         EpwVxFYP4NgYDzzlW7/wtUOdb6KvFamYq/rsjAhy7Pv/QfGSzORPzVUZLWXXKh3oBHXM
         kmLBRJzeMfEs2EaHJlYuyMfD0K6LX8k2KCDF1nSPRFMgYE8kZN4eCxgtwF15LSmpbSGc
         lpjY8R1Mjpf7JpeZjWoq/AMQ4feht55IcICbLW8Zw9qNxbusSYWa6dd9BuiEWOSp9Q0t
         n3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ku9aM1vtf8T+FGw4lj5ZIPzjxBiChVO0/pPdJg2fBGw=;
        b=Lp5e3c63CspKbh4YJbxwe3hDwMA+4S0EYHSivfj/jpFQfC5FjRkMGywtjkX3ZAkhOe
         F7/Yf9ynrQ/oH457j8Kb5S4AC6wHjb88TxYSKxr11SG7HlozKrzEU7Q9T6tHLR4akeJZ
         I9JMVetGHoSRvP404OI+A7rz7nPLITDlCyZ0UXnf4iMHZ1p3a9QEYnsmaaqGVCv+ZbNN
         dmQjbDWJK0rBxmdDpI5ZtpdjHIMAIOj1e54McROmMsucs8k+4fBMXvwiXq5T4sR9/J3u
         qVe0qdeXPTHymE+Qo1lP7OlkP13qgnX9g+IO1mJV5Pj33LjBMtEKXW8NWOjUStDF9fNI
         0czg==
X-Gm-Message-State: AOAM5302vtJxiVD/sboD3xe8ejqul3GDUz+k6aAptq71PRK+r4+Qlkgc
        yeGr2K79TlXUiTSb3NGhYrHtmQ==
X-Google-Smtp-Source: ABdhPJw27IwpFadhq+5bRv4bzXdsWZ8YmL639ivQFIAbVn7c+uDln0qheLOT9j1ytM6vhX/7UJNMeg==
X-Received: by 2002:adf:de12:: with SMTP id b18mr85726204wrm.390.1594646980907;
        Mon, 13 Jul 2020 06:29:40 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:29:40 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 1/6] dt bindings: remoteproc: Add bindings for MT8183 APU
Date:   Mon, 13 Jul 2020 15:29:22 +0200
Message-Id: <20200713132927.24925-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This adds dt bindings for the APU present in the MT8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
new file mode 100644
index 000000000000..1d5fcc135617
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MT8183 Vision Processor Unit (VPU) devices
+
+description:
+  This document defines the binding for the APU, a co-processor that could
+  offload the CPU for machine learning and neural network.
+
+maintainers:
+  - Alexandre Bailon <abailon@bayLibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8183-apu
+
+  reg:
+    description:
+      Address ranges of the APU MMIO.
+    maxItems: 1
+
+  interrupts:
+    description:
+      The interrupt number used to receive the interrupts from the DSP.
+    maxItems: 1
+
+  clocks:
+    description:
+      "Clocks for co-processor (See: ../clock/clock-bindings.txt)
+      Three clocks are expected for AXI, IPU and JTAG.
+      The JTAG clock seems to be required to run the DSP,
+      even when JTAG is not in use."
+    maxItems: 3
+  clock-names:
+    description:
+      The name of clocks, must be ipu, axi and jtag
+    items:
+      - const: ipu
+      - const: axi
+      - const: jtag
+
+  iommu:
+    description: "IOMMU (See: ../iommu/iommu.txt)"
+    maxItems: 3
+
+  memory-region:
+    description: "Reserved memory (See: ../reserved-memory/reserved-memory.txt)"
+    maxItems: 1
+
+  power-domains:
+    description: "Power domain (see: ../power/power_domain.txt)"
+    maxItems: 1
+
+  pinctrl:
+    description: pinctrl handles, required to configure pins for JTAG.
+    maxItems: 2
+
+  pinctrl-names:
+    description:
+      pinctrl name, must be "default", "jtag".
+      "default" must configure the pins when JTAG is disabled.
+      "jtag" must configure the pins for JTAG operations.
+    items:
+      - const: default
+      - const: jtag
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommu
+  - memory-region
+  - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+    #include <dt-bindings/power/mt8183-power.h>
+
+    reserved-memory {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      vpu_ram: vpu_ram@0x60000000 {
+        compatible = "shared-dma-pool";
+        reg = <0 0x60000000 0 0x040000000>;
+        no-map;
+        linux,cma-default;
+      };
+    };
+
+    vpu0: vpu@0x19100000 {
+      compatible = "mediatek,mt8183-apu";
+      reg = <0 0x19180000 0 0x14000>;
+      reg-names = "mmio";
+      interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+      iommus = <&iommu M4U_PORT_IMG_IPUO>,
+         <&iommu M4U_PORT_IMG_IPU3O>,
+         <&iommu M4U_PORT_IMG_IPUI>;
+
+      clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+         <&ipu_core0 CLK_IPU_CORE0_IPU>,
+         <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+      clock-names = "axi", "ipu", "jtag";
+
+      power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+      memory-region = <&vpu_ram>;
+    };
+...
-- 
2.26.2

