Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1545E2B2C36
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Nov 2020 09:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgKNIql (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 14 Nov 2020 03:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgKNIqj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 14 Nov 2020 03:46:39 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72393C0617A7
        for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2020 00:46:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j205so17687806lfj.6
        for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2020 00:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvnq03FM/3pEVJgF0bzCES36MpT5JZUKMzF3cy8uBe4=;
        b=HUvz7Sh0+WP+NOLJwbaC0Galjuf19dciwnl72U6/083K7u71ixeADurCVcoUMF4hil
         xVBX3GOxjxANjPivy5p9xVg9PGybsrxg9EJqXxZ3oIxwzf+TBYHKq3gl1BvBGCmhE0Ch
         XKvUhlYdIcsuKLjHiNNjVHVwptyDCIOC3JG1mQ/xUlORo9AjC+vwiE/z0CaRMjLQJymH
         3Yaqc+EfcGLrmZwjTcsbMLdAxrwyBNH//r3Hc8lqVLGTk4eLFRvpSIHmWcVHAu+mDbtM
         IUJXgD1Tuyhp3FZhO/mML4JW9cR+auCyjp7PBOSlrHAT3rFkR54noeat+ArqTThN8ZK8
         t8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvnq03FM/3pEVJgF0bzCES36MpT5JZUKMzF3cy8uBe4=;
        b=jDa5xhbfF85VfCuJ4boKOB/U9Zzava9gHl/HH0qD3Krd+UXqvI04EfC+41Q2PTOvw+
         4zO+xCpJOmlwficDO0TyR+HxathpAPAS0l33QXc1jsbMTp8Yb4LSJVeECszONdnWJW2X
         XUIOb0SgY9ZU4q4OLWhJp5Esdd1lZxeq/sCCZV2RSRv0PSfqIt+2vNzsX7psK4UDm1a7
         9FOuje2v0uUq7L6MEoNIKWIZU5smh1FnGLKjElXZklM77E1XVhBph7XB72Cp+U3d3FKw
         2T6C1cageemx4QqH+d9OW3QFW6Lf+Nxa6fNOeOahYEjZlk2wVJK4yj8CFgj/v3MYz6A+
         kSYQ==
X-Gm-Message-State: AOAM53377aOrrFjAiPkg6A3EhKmhWDbSNRLxPZz5brgRnjd0xZDPg0y3
        NrHng2vOsZPlmHGqsmsMLnHABg==
X-Google-Smtp-Source: ABdhPJxWr5ZJ1OBrHBDYqf1U0C/VlmSKyU6Xm+1DoCnNIjMKxjbunlyt4Z4H3jS34nXYA+HfEZ21Iw==
X-Received: by 2002:ac2:5dcb:: with SMTP id x11mr2241073lfq.44.1605343597642;
        Sat, 14 Nov 2020 00:46:37 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id f62sm1870081lfd.144.2020.11.14.00.46.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 00:46:37 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH 1/6] dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
Date:   Sat, 14 Nov 2020 09:46:08 +0100
Message-Id: <20201114084613.13503-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Programmable Real-Time Unit and Industrial Communication Subsystem
(PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
RISC cores (Programmable Real-Time Units, or PRUs) for program execution.

The K3 AM65x amd J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The ICSSG IP on AM65x SoCs has two PRU cores,
two auxiliary custom PRU cores called Real Time Units (RTUs). The K3
AM65x SR2.0 and J721E SoCs have a revised version of the ICSSG IP, and
include two additional custom auxiliary PRU cores called Transmit PRUs
(Tx_PRUs).

This patch adds the bindings for these PRU cores. The binding covers the
OMAP architecture SoCs - AM33xx, AM437x and AM57xx; Keystone 2 architecture
based 66AK2G SoC; and the K3 architecture based SoCs - AM65x and J721E. The
Davinci based OMAPL138 SoCs will be covered in a future patch.

Co-developed-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 ++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
new file mode 100644
index 000000000000..c5d5b3a5398f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,pru-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Programmable Realtime Unit (PRU) cores
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  Each Programmable Real-Time Unit and Industrial Communication Subsystem
+  (PRU-ICSS or PRUSS) has two 32-bit load/store RISC CPU cores called
+  Programmable Real-Time Units (PRUs), each represented by a node. Each PRU
+  core has a dedicated Instruction RAM, Control and Debug register sets, and
+  use the Data RAMs present within the PRU-ICSS for code execution.
+
+  The K3 SoCs containing ICSSG v1.0 (eg: AM65x SR1.0) also have two Auxiliary
+  PRU cores called RTUs with slightly different IP integration. The K3 SoCs
+  containing the revised ICSSG v1.1 (eg: J721E, AM65x SR2.0) have an extra two
+  auxiliary Transmit PRU cores called Tx_PRUs that augment the PRUs. Each RTU
+  or Tx_PRU core can also be used independently like a PRU, or alongside a
+  corresponding PRU core to provide/implement auxiliary functionality/support.
+
+  Each PRU, RTU or Tx_PRU core node should be defined as a child node of the
+  corresponding PRU-ICSS node. Each node can optionally be rendered inactive by
+  using the standard DT string property, "status".
+
+  Please see the overall PRU-ICSS bindings document for additional details
+  including a complete example,
+    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+
+properties:
+  compatible:
+    enum:
+     - ti,am3356-pru   # for AM335x SoC family (AM3356+ SoCs only)
+     - ti,am4376-pru   # for AM437x SoC family (AM4376+ SoCs only)
+     - ti,am5728-pru   # for AM57xx SoC family
+     - ti,k2g-pru      # for 66AK2G SoC family
+     - ti,am654-pru    # for PRUs in K3 AM65x SoC family
+     - ti,am654-rtu    # for RTUs in K3 AM65x SoC family
+     - ti,am654-tx-pru # for Tx_PRUs in K3 AM65x SR2.0 SoCs
+     - ti,j721e-pru    # for PRUs in K3 J721E SoC family
+     - ti,j721e-rtu    # for RTUs in K3 J721E SoC family
+     - ti,j721e-tx-pru # for Tx_PRUs in K3 J721E SoC family
+
+  reg:
+    items:
+      - description: Address and Size of the PRU Instruction RAM
+      - description: Address and Size of the PRU CTRL sub-module registers
+      - description: Address and Size of the PRU Debug sub-module registers
+
+  reg-names:
+    items:
+      - const: iram
+      - const: control
+      - const: debug
+
+  firmware-name:
+    description: |
+      Should contain the name of the default firmware image
+      file located on the firmware search path.
+
+if:
+  properties:
+    compatible:
+      enum:
+        - ti,am654-rtu
+        - ti,j721e-rtu
+then:
+  properties:
+    $nodename:
+      pattern: "^rtu@[0-9a-f]+$"
+else:
+  if:
+    properties:
+      compatible:
+        enum:
+          - ti,am654-tx-pru
+          - ti,j721e-tx-pru
+  then:
+    properties:
+      $nodename:
+        pattern: "^txpru@[0-9a-f]+"
+  else:
+    properties:
+      $nodename:
+        pattern: "^pru@[0-9a-f]+$"
+
+required:
+ - compatible
+ - reg
+ - reg-names
+ - firmware-name
+
+additionalProperties: false
+
+examples:
+  - |
+    /* AM33xx PRU-ICSS */
+    pruss_tm: target-module@300000 {  /* 0x4a300000, ap 9 04.0 */
+      compatible = "ti,sysc-pruss", "ti,sysc";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0x300000 0x80000>;
+
+      pruss: pruss@0 {
+        compatible = "ti,am3356-pruss";
+        reg = <0x0 0x80000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        pruss_mem: memories@0 {
+          reg = <0x0 0x2000>,
+                <0x2000 0x2000>,
+                <0x10000 0x3000>;
+          reg-names = "dram0", "dram1", "shrdram2";
+        };
+
+        pru0: pru@34000 {
+          compatible = "ti,am3356-pru";
+          reg = <0x34000 0x2000>,
+                <0x22000 0x400>,
+                <0x22400 0x100>;
+          reg-names = "iram", "control", "debug";
+          firmware-name = "am335x-pru0-fw";
+        };
+
+        pru1: pru@38000 {
+          compatible = "ti,am3356-pru";
+          reg = <0x38000 0x2000>,
+                <0x24000 0x400>,
+                <0x24400 0x100>;
+          reg-names = "iram", "control", "debug";
+          firmware-name = "am335x-pru1-fw";
+        };
+      };
+    };
+
+  - |
+    /* AM65x SR2.0 ICSSG */
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    icssg0: icssg@b000000 {
+      compatible = "ti,am654-icssg";
+      reg = <0xb000000 0x80000>;
+      power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0xb000000 0x80000>;
+
+      icssg0_mem: memories@0 {
+        reg = <0x0 0x2000>,
+              <0x2000 0x2000>,
+              <0x10000 0x10000>;
+        reg-names = "dram0", "dram1", "shrdram2";
+      };
+
+      pru0_0: pru@34000 {
+        compatible = "ti,am654-pru";
+        reg = <0x34000 0x4000>,
+              <0x22000 0x100>,
+              <0x22400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-pru0_0-fw";
+      };
+
+      rtu0_0: rtu@4000 {
+        compatible = "ti,am654-rtu";
+        reg = <0x4000 0x2000>,
+              <0x23000 0x100>,
+              <0x23400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-rtu0_0-fw";
+      };
+
+      tx_pru0_0: txpru@a000 {
+        compatible = "ti,am654-tx-pru";
+        reg = <0xa000 0x1800>,
+              <0x25000 0x100>,
+              <0x25400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-txpru0_0-fw";
+      };
+
+      pru0_1: pru@38000 {
+        compatible = "ti,am654-pru";
+        reg = <0x38000 0x4000>,
+              <0x24000 0x100>,
+              <0x24400 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-pru0_1-fw";
+      };
+
+      rtu0_1: rtu@6000 {
+        compatible = "ti,am654-rtu";
+        reg = <0x6000 0x2000>,
+              <0x23800 0x100>,
+              <0x23c00 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-rtu0_1-fw";
+      };
+
+      tx_pru0_1: txpru@c000 {
+        compatible = "ti,am654-tx-pru";
+        reg = <0xc000 0x1800>,
+              <0x25800 0x100>,
+              <0x25c00 0x100>;
+        reg-names = "iram", "control", "debug";
+        firmware-name = "am65x-txpru0_1-fw";
+      };
+    };
-- 
2.29.0

