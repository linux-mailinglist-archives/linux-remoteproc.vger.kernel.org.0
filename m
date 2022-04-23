Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E1350CBF4
	for <lists+linux-remoteproc@lfdr.de>; Sat, 23 Apr 2022 17:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236115AbiDWPyg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 23 Apr 2022 11:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233748AbiDWPye (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Apr 2022 11:54:34 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C51D64C3;
        Sat, 23 Apr 2022 08:51:36 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3E165CAE5B;
        Sat, 23 Apr 2022 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1650729095; bh=Pv8SOge4wX45Hpi29ExyVTuAkh3jcltOvD+t2ezoUEQ=;
        h=From:To:Cc:Subject:Date;
        b=djoiGXYM+jQLxx3Tu89EH4wzvKevDNK/X+X84GBLjY8YiOP/EjoyHYlVgR4Kx1SR+
         8XvzpPveYIIPeqjsRBXmsn/JlCowliOsBBzfG+daUdgaF6R6iebsqbkC04vi95aCEx
         l16kezGumToX0L+sDK99D0BOhGQSi3J8m/onfAWc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: remoteproc: qcom: pas: Add MSM8226 adsp
Date:   Sat, 23 Apr 2022 17:50:55 +0200
Message-Id: <20220423155059.660387-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the compatible for the adsp found in MSM8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a4409c398193..925e4015d59b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,msm8226-adsp-pil
       - qcom,msm8974-adsp-pil
       - qcom,msm8996-adsp-pil
       - qcom,msm8996-slpi-pil
@@ -159,6 +160,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-adsp-pil
               - qcom,msm8974-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8996-slpi-pil
@@ -274,6 +276,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-adsp-pil
               - qcom,msm8974-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8996-slpi-pil
@@ -364,6 +367,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
     then:
@@ -546,6 +550,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-adsp-pil
               - qcom,msm8974-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8996-slpi-pil
-- 
2.36.0

