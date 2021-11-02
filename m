Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99D4442F3F
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Nov 2021 14:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhKBNrh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 2 Nov 2021 09:47:37 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35510 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbhKBNrg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:47:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635860701; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=NHCa7K/5OEJkx0LynwNHiz7qvEb4hkarTuDFmBhwxzo=; b=Rtic7ue93FQpkvs3Uu75sCc7skgG+xnxG7WWSEruwo2URT3PmajZfBK2TzaidJhLvC4kiwVn
 SxhhYUuUPqi8JEzTvZ2rT9sRaIiZrpOSEpgR5oqK8xau0Jbx5SL+fWxLgAxfsHgQL1qSTKPY
 /47k5+NhD3YGSQrtVo9NIZtYmOA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 618140d9f6a3eeacf999d105 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 13:44:56
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C159C43460; Tue,  2 Nov 2021 13:44:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FAE4C4338F;
        Tue,  2 Nov 2021 13:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6FAE4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v8 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Tue,  2 Nov 2021 19:14:32 +0530
Message-Id: <1635860673-12146-3-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635860673-12146-1-git-send-email-pillair@codeaurora.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add WPSS PIL loading support for SC7280 SoCs.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 217 +++++++++++++++++++++
 1 file changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
new file mode 100644
index 0000000..eaf7dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sc7280-wpss-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7280 WPSS Peripheral Image Loader
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This document defines the binding for a component that loads and boots firmware
+  on the Qualcomm Technology Inc. WPSS.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-wpss-pil
+
+  reg:
+    maxItems: 1
+    description:
+      The base address and size of the qdsp6ss register
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
+  clocks:
+    items:
+      - description: GCC WPSS AHB BDG Master clock
+      - description: GCC WPSS AHB clock
+      - description: GCC WPSS RSCP clock
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: ahb_bdg
+      - const: ahb
+      - const: rscp
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  resets:
+    items:
+      - description: AOSS restart
+      - description: PDC SYNC
+
+  reset-names:
+    items:
+      - const: restart
+      - const: pdc_sync
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the reserved-memory for the Hexagon core
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The name of the firmware which should be loaded for this remote
+      processor.
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle reference to a syscon representing TCSR followed by the
+      three offsets within syscon for q6, modem and nc halt registers.
+
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the modem
+
+  qcom,smem-state-names:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+  glink-edge:
+    type: object
+    description: |
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the ADSP.
+
+    properties:
+      interrupts:
+        items:
+          - description: IRQ from WPSS to GLINK
+
+      mboxes:
+        items:
+          - description: Mailbox for communication between APPS and WPSS
+
+      label:
+        description: The names of the state bits used for SMP2P output
+        items:
+          - const: wpss
+
+      qcom,remote-pid:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: ID of the shared memory used by GLINK for communication with WPSS
+        maxItems: 1
+
+    required:
+      - interrupts
+      - mboxes
+      - label
+      - qcom,remote-pid
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - qcom,halt-regs
+  - memory-region
+  - qcom,qmp
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - glink-edge
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/reset/qcom,sdm845-aoss.h>
+    #include <dt-bindings/reset/qcom,sdm845-pdc.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    remoteproc@8a00000 {
+        compatible = "qcom,sc7280-wpss-pil";
+        reg = <0x08a00000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
+                              <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover",
+                          "stop-ack", "shutdown-ack";
+
+        clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
+                 <&gcc GCC_WPSS_AHB_CLK>,
+                 <&gcc GCC_WPSS_RSCP_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "ahb_bdg", "ahb",
+                      "rscp", "xo";
+
+        power-domains = <&rpmhpd SC7280_CX>,
+                        <&rpmhpd SC7280_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&wpss_mem>;
+
+        qcom,qmp = <&aoss_qmp>;
+
+        qcom,smem-states = <&wpss_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
+                 <&pdc_reset PDC_WPSS_SYNC_RESET>;
+        reset-names = "restart", "pdc_sync";
+
+        qcom,halt-regs = <&tcsr_mutex 0x37000>;
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_WPSS
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "wpss";
+            qcom,remote-pid = <13>;
+        };
+    };
-- 
2.7.4

