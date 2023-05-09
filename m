Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6AA6FCB97
	for <lists+linux-remoteproc@lfdr.de>; Tue,  9 May 2023 18:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbjEIQq6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 May 2023 12:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbjEIQq5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 May 2023 12:46:57 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A891725;
        Tue,  9 May 2023 09:46:54 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349Gg8j3003653;
        Tue, 9 May 2023 16:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PmUvMkpmxb5wKT0GLDxWM+Pmnk5F3eR61Wx8LVrALXU=;
 b=gMo0L7RvUq1+/EdzbrW5kobBaFL5OSGf3OIc1tTu/NiJLlFdDCOGOqv3A19DonL1YW+3
 zlNxdpv5PiuqH5zFTYWRj6CTaaXYAk201OyidPlri4HxHuYnQtT3Otl98gX1Ig/3hUBI
 u/IJriXqmzFCTHfQqfLIUnqDIuRCT/A7KoP8BmRCcUF4ls7ItGKl5u/MDWRQmOlgZP0n
 xti5YYDj+0TlnDtm9GryyaBvVhAbs9dD91KOlIF3V5Yjtplrwq7R/GyQ8+1BKFTn4gEP
 ZFRqOO6dvu3vo0ZkIeFwzIHu/fyzHeI5l3Xqa+9U/4Ovk4fz0JxUmX5ha5wskpyXab7+ wg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77ktcna-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 16:46:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349GkmMu018137
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 May 2023 16:46:48 GMT
Received: from [10.216.5.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 9 May 2023
 09:46:39 -0700
Message-ID: <26c8bbe3-18e4-92f9-f559-340331c08562@quicinc.com>
Date:   Tue, 9 May 2023 22:16:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 01/11] dt-bindings: remoteproc: qcom: Add support for
 multipd model
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <jassisinghbrar@gmail.com>,
        <mathieu.poirier@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_gurus@quicinc.com>,
        <loic.poulain@linaro.org>, <quic_eberman@quicinc.com>,
        <robimarko@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_gokulsri@quicinc.com>,
        <quic_sjaganat@quicinc.com>, <quic_kathirav@quicinc.com>,
        <quic_arajkuma@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_poovendh@quicinc.com>
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-2-git-send-email-quic_mmanikan@quicinc.com>
 <38a5a268-7d8a-6e61-4272-8e9155df0034@linaro.org>
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <38a5a268-7d8a-6e61-4272-8e9155df0034@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DhUQcEPQ3EjIlYA8VFPlzZKhWLQ9RM7Q
X-Proofpoint-ORIG-GUID: DhUQcEPQ3EjIlYA8VFPlzZKhWLQ9RM7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090139
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/7/2023 8:47 PM, Krzysztof Kozlowski wrote:
> On 07/03/2023 05:41, Manikanta Mylavarapu wrote:
>> Add new binding document for multipd model remoteproc.
>> IPQ5018, IPQ9574 follows multipd model.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>   .../bindings/remoteproc/qcom,multipd-pil.yaml | 282 ++++++++++++++++++
>>   1 file changed, 282 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
>> new file mode 100644
>> index 000000000000..b788607f5abd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
>> @@ -0,0 +1,282 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,multipd-pil.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Multipd Secure Peripheral Image Loader
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Mathieu Poirier <mathieu.poirier@linaro.org>
>> +
>> +description:
>> +  Multipd Peripheral Image Loader loads firmware and boots Q6 pd, WCSS pd
>> +  remoteproc's on the Qualcomm IPQ5018, IPQ9574 SoC.
> 
> What is a "pd"?
> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq5018-q6-mpd
>> +      - qcom,ipq9574-q6-mpd
>> +
>> +  '#address-cells': true
>> +
>> +  '#size-cells': true
> 
> Why do you need both?
> 
> If really needed, these should be const.
> 
>> +
>> +  'ranges': true
>> +
> 
> Same question - why do you need it?
> 
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts-extended:
> 
> Instead interrupts
> 
>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +
>> +  clocks:
>> +    minItems: 25
>> +    maxItems: 25
> 
> Drop both and instead describe the items. Anyway minItems are not needed
> here.
> 
>> +
>> +  clock-names:
>> +    minItems: 25
>> +    maxItems: 25
> 
> Drop both and instead list the names.
> 
>> +
>> +  assigned-clocks:
>> +    minItems: 13
>> +    maxItems: 13
> 
> Drop, they do not have to be mentioned in the binding. If you think they
> need to, then why?
>  >> +
>> +  assigned-clock-rates:
>> +    minItems: 13
>> +    maxItems: 13
> 
> Ditto
> 
Clocks in multipd architecture will be handled by QDSP6 firmware.
So i am going to remove clock handling.
>> +
>> +  qcom,smem-states:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: States used by the AP to signal the remoteprocessor
>> +    items:
>> +      - description: Shutdown Q6
>> +      - description: Stop Q6
>> +
>> +  qcom,smem-state-names:
>> +    description:
>> +      Names of the states used by the AP to signal the remoteprocessor
>> +    items:
>> +      - const: shutdown
>> +      - const: stop
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Q6 pd reserved region
>> +
>> +  glink-edge:
>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> 
> unevaluatedProperties: false
> 
>> +    description:
>> +      Qualcomm G-Link subnode which represents communication edge, channels
>> +      and devices related to the Modem.
>> +
>> +patternProperties:
>> +  "^remoteproc_pd1|remoteproc_pd2|remoteproc_pd3":
> 
> No, underscores are not allowed. Also, what is pd?
> 
>> +    type: object
>> +    description:
>> +      In Multipd model, WCSS pd depends on Q6 pd i.e Q6 pd should be up before
>> +      WCSS. It can be achieved by keeping wcss pd node as subnode of Q6
>> +      device node.
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - "qcom,ipq5018-wcss-ahb-mpd"
>> +          - "qcom,ipq9574-wcss-ahb-mpd"
>> +          - "qcom,ipq5018-wcss-pcie-mpd"
> 
> Drop quotes
> 
>> +
>> +      interrupts-extended:
> 
> Same as before
> 
>> +        items:
>> +          - description: Fatal interrupt
>> +          - description: Ready interrupt
>> +          - description: Spawn acknowledge interrupt
>> +          - description: Stop acknowledge interrupt
>> +
>> +      interrupt-names:
>> +        items:
>> +          - const: fatal
>> +          - const: ready
>> +          - const: spawn-ack
>> +          - const: stop-ack
>> +
>> +      qcom,smem-states:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        description: States used by the AP to signal the remoteprocessor
>> +        items:
>> +          - description: Shutdown WCSS pd
>> +          - description: Stop WCSS pd
>> +          - description: Spawn WCSS pd
>> +
>> +      qcom,smem-state-names:
>> +        description:
>> +          Names of the states used by the AP to signal the remoteprocessor
> 
> remote processor
> 
>> +        items:
>> +          - const: shutdown
>> +          - const: stop
>> +          - const: spawn
> 
> This is confusing. Why your children have the same properties as parent?
> 
>> +
>> +    required:
>> +      - compatible
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts-extended
> 
> interrupts
> 
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>> +  - memory-region
>> +
>> +additionalProperties: false
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,ipq9574-q6-mpd
>> +    then:
>> +      properties:
>> +        assigned-clocks:
>> +          items:
>> +            - description: Phandle, clock specifier of GCC_ANOC_WCSS_AXI_M_CLK
>> +            - description: Phandle, clock specifier of GCC_WCSS_AHB_S_CLK
>> +            - description: Phandle, clock specifier of GCC_WCSS_ECAHB_CLK
>> +            - description: Phandle, clock specifier of GCC_WCSS_ACMT_CLK
>> +            - description: Phandle, clock specifier of GCC_WCSS_AXI_M_CLK
>> +            - description: Phandle, clock specifier of GCC_Q6_AXIM_CLK
>> +            - description: Phandle, clock specifier of GCC_Q6_AXIM2_CLK
>> +            - description: Phandle, clock specifier of GCC_Q6_AHB_CLK
>> +            - description: Phandle, clock specifier of GCC_Q6_AHB_S_CLK
>> +            - description: Phandle, clock specifier of GCC_Q6SS_BOOT_CLK
>> +            - description: Phandle, clock specifier of GCC_MEM_NOC_Q6_AXI_CLK
>> +            - description: Phandle, clock specifier of GCC_WCSS_Q6_TBU_CLK
>> +            - description: Phandle, clock specifier of GCC_SYS_NOC_WCSS_AHB_CLK
> 
> Eh, so here they are. But Why? Do you expect different clocks for
> others? If so, where are they?
> 
> Anyway, drop useless "Phandle, clock specifier of". Clocks cannot be
> anything else than phandle and a clock specifier. Instead of using some
> cryptic ACRONYM_OR_SOME_CLK, describe them. Just like we do for other
> bindings. You have plenty of good examples, so please start from them.
> 
> 
Clocks in multipd architecture will be handled by QDSP6 firmware.
So i am going to remove clock handling.
>> +        assigned-clock-rates:
>> +          items:
>> +            - description: Must be 266666667 HZ
>> +            - description: Must be 133333333 HZ
>> +            - description: Must be 133333333 HZ
>> +            - description: Must be 133333333 HZ
>> +            - description: Must be 266666667 HZ
>> +            - description: Must be 533000000 HZ
>> +            - description: Must be 342857143 HZ
>> +            - description: Must be 133333333 HZ
>> +            - description: Must be 133333333 HZ
>> +            - description: Must be 342857143 HZ
>> +            - description: Must be 533000000 HZ
>> +            - description: Must be 533000000 HZ
>> +            - description: Must be 133333333 HZ
> 
> ???
> 
> If these are fixed, why this is in DT? DT is for variable and
> non-discoverable pieces and you do not have here anything variable, but
> fixed.
> 
Clocks in multipd architecture will be handled by QDSP6 firmware.
So i am going to remove clock handling.

Thanks & Regards,
Manikanta.
>> +
>> +examples:
>> +  - |
>> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +        #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
>> +        #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> 
> Use 4 spaces for example indentation.
> 
>> +
>> +        q6v5_wcss: remoteproc@cd00000 {
>> +                compatible = "qcom,ipq5018-q6-mpd";
>> +                #address-cells = <1>;
>> +                #size-cells = <1>;
>> +                ranges;
>> +                reg = <0x0cd00000 0x4040>;
>> +                interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
>> +                                <&wcss_smp2p_in 0 0>,
> 
> Wrong alignment of indentation
> 
>> +                                <&wcss_smp2p_in 1 0>,
>> +                                <&wcss_smp2p_in 2 0>,
>> +                                <&wcss_smp2p_in 3 0>;
>> +                interrupt-names = "wdog",
>> +                                  "fatal",
>> +                                  "ready",
>> +                                  "handover",
>> +                                  "stop-ack";
>> +
>> +                qcom,smem-states = <&wcss_smp2p_out 0>,
>> +                                   <&wcss_smp2p_out 1>;
>> +                qcom,smem-state-names = "shutdown",
>> +                                        "stop";
>> +
>> +                memory-region = <&q6_region>;
>> +
>> +                glink-edge {
>> +                        interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
>> +                        label = "rtr";
>> +                        qcom,remote-pid = <1>;
>> +                        mboxes = <&apcs_glb 8>;
>> +                };
>> +
>> +                q6_wcss_pd1: remoteproc_pd1 {
>> +                        compatible = "qcom,ipq5018-wcss-ahb-mpd";
>> +                        interrupts-extended = <&wcss_smp2p_in 8 0>,
>> +                                        <&wcss_smp2p_in 9 0>,
>> +                                        <&wcss_smp2p_in 12 0>,
>> +                                        <&wcss_smp2p_in 11 0>;
>> +                        interrupt-names = "fatal",
>> +                                          "ready",
>> +                                          "spawn-ack",
>> +                                          "stop-ack";
>> +                        qcom,smem-states = <&wcss_smp2p_out 8>,
>> +                                           <&wcss_smp2p_out 9>,
>> +                                           <&wcss_smp2p_out 10>;
>> +                        qcom,smem-state-names = "shutdown",
>> +                                                "stop",
>> +                                                "spawn";
>> +                };
>> +
>> +                q6_wcss_pd2: remoteproc_pd2 {
>> +                        compatible = "qcom,ipq5018-wcss-pcie-mpd";
>> +                        interrupts-extended = <&wcss_smp2p_in 16 0>,
>> +                                        <&wcss_smp2p_in 17 0>,
>> +                                        <&wcss_smp2p_in 20 0>,
>> +                                        <&wcss_smp2p_in 19 0>;
>> +                        interrupt-names = "fatal",
>> +                                          "ready",
>> +                                          "spawn-ack",
>> +                                          "stop-ack";
>> +
>> +                        qcom,smem-states = <&wcss_smp2p_out 16>,
>> +                                           <&wcss_smp2p_out 17>,
>> +                                           <&wcss_smp2p_out 18>;
>> +                        qcom,smem-state-names = "shutdown",
>> +                                                "stop",
>> +                                                "spawn";
>> +                        status = "okay";
> 
> Drop statuses from the example.
> 
> 
> Best regards,
> Krzysztof
> 
