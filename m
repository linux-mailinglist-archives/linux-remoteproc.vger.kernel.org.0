Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA3D7E83C7
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 Nov 2023 21:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346028AbjKJUbe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 Nov 2023 15:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbjKJUba (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Nov 2023 15:31:30 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506272BE0B;
        Fri, 10 Nov 2023 01:20:16 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA7gTCc018016;
        Fri, 10 Nov 2023 09:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=WTE+qVUfTHI5VNl6dbyRtN/JhVRxKZcIKC4hsuTCdOs=;
 b=Bg2yebPe9zR9JTZqxI+AfKYtjIqJcRXaGyWRy4cfaR1GYqSvaK8I93YgQFHmym4ft8ja
 fyKkaWFP2gnV6z7u1MH6Z/yXgCGtPwZ/47U/OPTtf6bV98PvPBGa7Ga6B6Rd4R7sytob
 w632+9qwjYrMzy0CumxbOmChYdZaAc+bFT/z1MhMfBPRhgOCrCFsdVL8bv3IuHgkS8pX
 kya8BxHV7v68W1pHRj0RlcxyDYvbmB5oONQ8ZMT1Ftoat/lBf9vbuZxxFMirQLCHR9gr
 imOS6oAbfm22IIT3tKrtcTkbo4+GwSyutcuz/YfB1YF4Au7cFHrTP9NseF/Z8wEoaf5Z xQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8u2bu7yq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Nov 2023 09:20:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA9KAV3022817
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Nov 2023 09:20:11 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 01:20:03 -0800
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_eberman@quicinc.com>,
        <quic_gurus@quicinc.com>, <bartosz.golaszewski@linaro.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_varada@quicinc.com>
Subject: [PATCH v6 01/11] dt-bindings: remoteproc: qcom: Add support for multipd model
Date:   Fri, 10 Nov 2023 14:49:29 +0530
Message-ID: <20231110091939.3025413-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110091939.3025413-1-quic_mmanikan@quicinc.com>
References: <20231110091939.3025413-1-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c1qGLAmOzJTKgU5KCjeo6GGTe7P58cvG
X-Proofpoint-ORIG-GUID: c1qGLAmOzJTKgU5KCjeo6GGTe7P58cvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_05,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100075
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add new binding document for multipd model remoteproc.
IPQ5332, IPQ9574 follows multipd model.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v6:
	- No changes.

Changes in v5:
	- No changes.

Changes in v4:
	- No changes.

Changes in v3:
	- Pick up R-b tag

Changes in v2:
	- Fixed all comments and rebased on linux-next.
	- Changed to BSD-3-Clause
	- Added firmware-name.

 .../bindings/remoteproc/qcom,multipd-pil.yaml | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
new file mode 100644
index 000000000000..c52ac1640d7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,multipd-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Multipd Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  Multipd Peripheral Image Loader loads firmware and boots Q6 protection domain,
+  WCSS protection domain remoteproc's on the Qualcomm IPQ9574, IPQ5332 SoC.
+  Protection domain is similar to process in Linux. Here QDSP6 processor runs
+  each wifi radio functionality on a separate process. One process can't access
+  other process resources, so this is termed as PD i.e protection domain.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5332-q6-mpd
+      - qcom,ipq9574-q6-mpd
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Shutdown Q6
+      - description: Stop Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: shutdown
+      - const: stop
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+patternProperties:
+  "^pd-1|pd-2|pd-3":
+    type: object
+    description:
+      WCSS means 'wireless connectivity sub system', in simple words it's a
+      wifi radio block. In multipd model, Q6 root protection domain will
+      provide services to WCSS user protection domain. In other words WCSS
+      protection domains depends on Q6 protection domain i.e  Q6 should be up
+      before WCSS, similarly Q6 should shut down after all WCSS domains are
+      down. It can be achieved by building parent-child topology between Q6
+      and WCSS domain's i.e keeping wcss node as sub node of Q6 device node.
+
+    properties:
+      firmware-name:
+        maxItems: 1
+
+      interrupts:
+        items:
+          - description: Fatal interrupt
+          - description: Ready interrupt
+          - description: Spawn acknowledge interrupt
+          - description: Stop acknowledge interrupt
+
+      interrupt-names:
+        items:
+          - const: fatal
+          - const: ready
+          - const: spawn-ack
+          - const: stop-ack
+
+      qcom,smem-states:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: States used by the AP to signal the remote processor
+        items:
+          - description: Shutdown WCSS pd
+          - description: Stop WCSS pd
+          - description: Spawn WCSS pd
+
+      qcom,smem-state-names:
+        description:
+          Names of the states used by the AP to signal the remote processor
+        items:
+          - const: shutdown
+          - const: stop
+          - const: spawn
+
+    required:
+      - firmware-name
+      - interrupts
+      - interrupt-names
+      - qcom,smem-states
+      - qcom,smem-state-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - firmware-name
+  - reg
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    q6v5_wcss: remoteproc@d100000 {
+      compatible = "qcom,ipq5332-q6-mpd";
+      reg = <0xd100000 0x4040>;
+      firmware-name = "ath11k/IPQ5332/hw1.0/q6_fw0.mdt",
+                      "ath11k/IPQ5332/hw1.0/iu_fw.mdt";
+      interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+      interrupt-names = "wdog",
+                        "fatal",
+                        "ready",
+                        "handover",
+                        "stop-ack";
+
+      qcom,smem-states = <&wcss_smp2p_out 0>,
+                         <&wcss_smp2p_out 1>;
+      qcom,smem-state-names = "shutdown",
+                              "stop";
+
+      memory-region = <&q6_region>;
+
+      glink-edge {
+        interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+        label = "rtr";
+        qcom,remote-pid = <1>;
+        mboxes = <&apcs_glb 8>;
+      };
+
+      pd-1 {
+        firmware-name = "ath11k/IPQ5332/hw1.0/q6_fw1.mdt";
+        interrupts-extended = <&wcss_smp2p_in 8 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 9 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 12 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 11 IRQ_TYPE_NONE>;
+        interrupt-names = "fatal",
+                          "ready",
+                          "spawn-ack",
+                          "stop-ack";
+        qcom,smem-states = <&wcss_smp2p_out 8>,
+                           <&wcss_smp2p_out 9>,
+                           <&wcss_smp2p_out 10>;
+        qcom,smem-state-names = "shutdown",
+                                "stop",
+                                "spawn";
+      };
+    };
-- 
2.34.1

