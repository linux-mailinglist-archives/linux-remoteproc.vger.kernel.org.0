Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA26247226E
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Dec 2021 09:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbhLMIX6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Dec 2021 03:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbhLMIX5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Dec 2021 03:23:57 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F200C06173F
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Dec 2021 00:23:57 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v1so49768928edx.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Dec 2021 00:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=prdIKNnTakLOgVKu5DwjlMlxlY+xXSOXQoSYxRJLrP4=;
        b=omQsxrb+Hxg41SF9UDWEMcgy6P46VVzeouGujn1lDMF8O+GeOW3PgJh2U+Kdrq+uTu
         6agorY7fL8XCzr+MzyZKQclJ1So8D6Eo3ZIaK3drrcVw3chGMRVlO5WZGT8JsQ4RyD4G
         pWVMby9jENNOskqdPb5LKRMH7Bf1QiwDG9aa11CGCK5+iwXbH9rjws5t7w7cTxRi6LPh
         CoN/dFPng9qTB5kBMwNfO/KHbpDkf9s3bx7wlR3fruTQ38tOAqJOfuz9jISDkeryo/L6
         Q3MPMqmV1jHZ+miaETOOSLJ00rJs/utX5DcSzpJZOIOf1+S7+YBILyBRdQIz/e65zwnd
         VUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prdIKNnTakLOgVKu5DwjlMlxlY+xXSOXQoSYxRJLrP4=;
        b=naXDqxMmXssaLjBbHaF3GBcDyWkjYEZk+1I81qsAAjmhiTla2nnUlWahTpNUcJ5Iqk
         TL/j2dFIT8Ber9PAJH6gelKuBUPxujA4xld78rfZhPHyQqK9qMpICPK9B3mT1M+vysv3
         elKJTULWHfszV9fhdOeYNQqbjN3bWdf/optIyAUFIr/Suvqih28U4Xvn9ajXNs1ItfnJ
         2fkYgcm0zLcZMd5ltfWqKRTClXmL677eRA/TzKJLwBNw6EewO6i5SHe3PFRb4bbcFK7D
         YcueLKlo5q4fzHLHY8tRI66I5jyX0bIieAaH7tTYlMxecjGZn1SssTxM8uRaAO3c4B3n
         UmSA==
X-Gm-Message-State: AOAM532o/MBAITR6gcVwg1M+EHT1iorpnoKBoY8lkpqQ9jblf5BqwOyD
        G06C7WFw8UUwsfAXM5GD/Rb+7w==
X-Google-Smtp-Source: ABdhPJwiRLHKvdYVxS22gwZ8U7nNlkzXgH1/4EzTGwRcfsJd31TNLz8JwyPZS3Fi5kMN3gVhwklzJg==
X-Received: by 2002:a05:6402:2547:: with SMTP id l7mr62557623edb.301.1639383836134;
        Mon, 13 Dec 2021 00:23:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id nb17sm5535561ejc.7.2021.12.13.00.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:23:55 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: remoteproc: qcom: pas: Add SM6350 adsp, cdsp & mpss
Date:   Mon, 13 Dec 2021 09:22:01 +0100
Message-Id: <20211213082208.21492-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082208.21492-1-luca.weiss@fairphone.com>
References: <20211213082208.21492-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add compatibles for the remoteprocs found in SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 63e06d93bca3..c635c181d2c2 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -33,6 +33,9 @@ properties:
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdx55-mpss-pas
+      - qcom,sm6350-adsp-pas
+      - qcom,sm6350-cdsp-pas
+      - qcom,sm6350-mpss-pas
       - qcom,sm8150-adsp-pas
       - qcom,sm8150-cdsp-pas
       - qcom,sm8150-mpss-pas
@@ -158,6 +161,9 @@ allOf:
               - qcom,sc8180x-mpss-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
+              - qcom,sm6350-adsp-pas
+              - qcom,sm6350-cdsp-pas
+              - qcom,sm6350-mpss-pas
               - qcom,sm8150-adsp-pas
               - qcom,sm8150-cdsp-pas
               - qcom,sm8150-mpss-pas
@@ -266,6 +272,8 @@ allOf:
               - qcom,sc8180x-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
+              - qcom,sm6350-adsp-pas
+              - qcom,sm6350-cdsp-pas
               - qcom,sm8150-adsp-pas
               - qcom,sm8150-cdsp-pas
               - qcom,sm8150-slpi-pas
@@ -301,6 +309,7 @@ allOf:
               - qcom,sc7280-mpss-pas
               - qcom,sc8180x-mpss-pas
               - qcom,sdx55-mpss-pas
+              - qcom,sm6350-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
     then:
@@ -385,6 +394,23 @@ allOf:
             - const: mx
             - const: mss
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6350-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
   - if:
       properties:
         compatible:
@@ -405,6 +431,7 @@ allOf:
             enum:
               - qcom,sc7280-mpss-pas
               - qcom,sdx55-mpss-pas
+              - qcom,sm6350-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
     then:
@@ -425,6 +452,7 @@ allOf:
             enum:
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
+              - qcom,sm6350-adsp-pas
               - qcom,sm8150-slpi-pas
               - qcom,sm8250-adsp-pas
               - qcom,sm8250-slpi-pas
-- 
2.34.1

