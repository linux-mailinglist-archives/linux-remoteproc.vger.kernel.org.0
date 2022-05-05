Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE3051BE2F
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 May 2022 13:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357923AbiEELk7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 May 2022 07:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357822AbiEELkw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 May 2022 07:40:52 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D9C53E04;
        Thu,  5 May 2022 04:37:12 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458mitx001510;
        Thu, 5 May 2022 13:36:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Gbmbcgct1Jm9JW83im3dnwN0LJApetjGCItrRiQ0NAQ=;
 b=DrZPztefIEMJn64835cOx3zys4xlhvm1siVkaDy7frxYasu4meM1GrK11Lv3nUImHZyF
 ZwZuu2xr4fyrNLCJtM4hd2YvBWfyPLeqfsKte+QSfStJWZNt6IkZpJS7fvDWfnZ8d211
 M8Jv9KM0HzOUDHhT/oRMn3fnjqpstGy7nTJWshxqjzreKdbRO5iE1lB57XA/wAII7WbA
 4Nc7X0ycHne1q1WPwU0VGlxV7me6N+I4Xuhkz6tzFmELiAyAAKebdCjTyjOgW2wsGKU4
 Qr4JnMVBgXVgzPVvAaxEJMajhh8pcZ48lTlBE/sC/N4GLfzqnOr0YE/DAFb6bExz1HUC sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0gk8mr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 May 2022 13:36:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75F1010002A;
        Thu,  5 May 2022 13:36:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A7C721A23B;
        Thu,  5 May 2022 13:36:53 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 5 May 2022 13:36:52
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2] dt-bindings: remoteproc: st,stm32-rproc: Fix phandle-array parameters description
Date:   Thu, 5 May 2022 13:36:39 +0200
Message-ID: <20220505113639.1344281-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Replace the FIXME by appropriate description.

Fixes: 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index be3d9b0e876b..da50f0e99fe2 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -43,8 +43,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the trust zone setting register
+          - description: The field mask of the trust zone state
 
   interrupts:
     description: Should contain the WWDG1 watchdog reset interrupt
@@ -101,8 +101,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the power setting register
+          - description: The field mask of the PDDS selection
 
   st,syscfg-m4-state:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
@@ -111,8 +111,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block with the tamp register
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the tamp register
+          - description: The field mask of the Cortex-M4 state
 
   st,syscfg-rsc-tbl:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
@@ -122,8 +122,8 @@ properties:
     items:
       - items:
           - description: Phandle of syscon block with the tamp register
-          - description: FIXME
-          - description: FIXME
+          - description: The offset of the tamp register
+          - description: The field mask of the Cortex-M4 resource table address
 
   st,auto-boot:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.25.1

