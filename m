Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED727D9B1F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Oct 2023 16:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346147AbjJ0OUv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Oct 2023 10:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346130AbjJ0OUm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Oct 2023 10:20:42 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3A71B9
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Oct 2023 07:20:34 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d10972e63eso18950166b.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Oct 2023 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698416432; x=1699021232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiaNVgFsOF5Zw3tvRPpyTyeGAWwoR4UCi6KiKDhkf8E=;
        b=IDtCdoeTYD6+4cFN4ixcQhuklQU+d2epuKjqoTra/zJ/DQ7PjtGvqQrbEYx+7AHTCM
         zgM+TUH1bgnoqBoD2RI01YaGFyIF7XMsi6oYqHb62MVVwjcsUw3z9t3LJ0b/9qAZjKUl
         6rdAKnJ9rabhwP398raQiNC4OhkQAqwGSRO+nOPEiHpQkuE9G4B181tkSMLs17deCUXH
         iOEsDQeIIKpbWqUzhOrdsoTQD7tD9YHInlWkkYB08X4gwGihxgzhshqhSmrHVlAJhY5Z
         lZ2wDA3ZBhCECSKhTeSF/44F/RdVe+v4RC5AeEHui/+l7oS6BrNBuSQ24+CAWzRRm3eT
         Z/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416432; x=1699021232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiaNVgFsOF5Zw3tvRPpyTyeGAWwoR4UCi6KiKDhkf8E=;
        b=reyJHQDsvjuU5ojssM0+AFlZlG2VeoHSyyLm8iGK648Sy9RvaevPE7P1WOhGbUKCQB
         YmZMz4wj2yL16liX/ijSW+qS7U+LiOWaNdTUMNqvE4KtGvWvD3T0s7lCUIIDmWr7Xj9+
         Ayz6Zl9+P/oFA81OQzYEimdbDlFLHMEstU/26MyZd4fRjkkBI0FxtM/ml438V6p3wrts
         5BTQ7gjZ3j3rJ92/TpW49W0pqtzO/m2dBBcgPw24b0s03f3kyBk8r5ESyPyEE6VJyolk
         fh3YHXkpLGgclhYa2i28x5v+Wzfnx4SnKo4dOTTtxxuIl8tM82j3iFUvxvpym0BMAs9a
         5YDw==
X-Gm-Message-State: AOJu0YzdMZVaZ/Jxxgw5shh0Xlhf7OJTgOcH9EisAt1s05lmRyfYBZmP
        fZJqnfbccXzCt0cDA2jbKvsfjw==
X-Google-Smtp-Source: AGHT+IGDNnVpbkH0lLAk1NXDlXJGluBIjs/kgI9CNupXE5bgr2Nn0Mbfufl8wyky5i5tSdTjfENjiA==
X-Received: by 2002:a17:907:7285:b0:9b2:be5e:7545 with SMTP id dt5-20020a170907728500b009b2be5e7545mr2343795ejc.36.1698416432487;
        Fri, 27 Oct 2023 07:20:32 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906075700b0099cc36c4681sm1254076ejb.157.2023.10.27.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:20:32 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 27 Oct 2023 16:20:25 +0200
Subject: [PATCH 3/9] dt-bindings: remoteproc: qcom: sc7180-pas: Add SC7280
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-sc7280-remoteprocs-v1-3-05ce95d9315a@fairphone.com>
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
In-Reply-To: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the compatibles and constraints for the ADSP, CDSP and WPSS found on
the SC7280 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sc7180-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 6f0bd6fa5d26..c054b84fdcd5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -18,7 +18,10 @@ properties:
     enum:
       - qcom,sc7180-adsp-pas
       - qcom,sc7180-mpss-pas
+      - qcom,sc7280-adsp-pas
+      - qcom,sc7280-cdsp-pas
       - qcom,sc7280-mpss-pas
+      - qcom,sc7280-wpss-pas
 
   reg:
     maxItems: 1
@@ -75,6 +78,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7180-adsp-pas
+            - qcom,sc7280-adsp-pas
     then:
       properties:
         power-domains:
@@ -120,6 +124,23 @@ allOf:
             - const: cx
             - const: mss
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-cdsp-pas
+            - qcom,sc7280-wpss-pas
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
 unevaluatedProperties: false
 
 examples:

-- 
2.42.0

