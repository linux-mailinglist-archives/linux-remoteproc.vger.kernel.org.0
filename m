Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 376DE529A19
	for <lists+linux-remoteproc@lfdr.de>; Tue, 17 May 2022 09:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240707AbiEQHBc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 17 May 2022 03:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240559AbiEQHB3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2C83CFF4
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:24 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gh6so32914794ejb.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E5YORnDcbWOJgrpTz/qSCG6/YYMuC3Z8T9fT4bh9Wds=;
        b=RYlKaedw8XHDuSPIsAKH6WOjvMjDHWHUoi4CQtC+m/fNR53cM3SDI76mkQpItCoVY1
         CYzO9Ts1Qn/CfANZIYuarG2+pJ595hoigvvmvPKXlOl60ynbZmgx8UfonJLu9I3/gMlf
         pglWRR4sOVASjLDDylbx9YnHd7vNP8uOPa3zQa8ruxz9nKwnf97+Snh2aJdSC0a/vvLM
         TuP0m3Hn4OEbEQRJ0dxPsQ4/5lWgH/DI00PmuFY5BQ159Q5FJubWq/SKjQO7ENqXh8FA
         2xjBfDRFoABd/YWD7eNX+e0+KqPKaM1A8DHXzjYDuiHHfksoy8+MlJsBDyp9tZvEX5+4
         811Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E5YORnDcbWOJgrpTz/qSCG6/YYMuC3Z8T9fT4bh9Wds=;
        b=nDDxPxjYmHXufgE3+3KzTS+a0JkKCDSOWYt4qaycd4cVdY3Dl2OdN6P/FTQqK2IUn7
         9nkPk2pkgfa3eVdn6NBDIF9nogYec4RpPoLUU6EFRQ0byNAnXYOQ8UgscsOvz42fvIir
         5UUsPHTn8UC/fD7bn8INoansHqZAQhpOPZQEk2Nz50hfTzxcbA6R+1K05PCiF4BlGDoz
         YtIBKdJP4Tbg85KBGFSRVSvVcAeR90426urPeHSJgeQsh1i7E1PDfN4EtvjBzCDci7KZ
         HnNo1JKxIisNjHJT7CR1sfkNBj97llrPGHwyv257YzGKrTZJKigDmqYjRUPc0c6cyIJH
         uyGA==
X-Gm-Message-State: AOAM533VYXZ8+tDA2nV8cAWahDcJsDd+ypvYri4qYWNoLHyCoCAhhp/N
        6C2LVORD+7glFif/xUku44mqqA==
X-Google-Smtp-Source: ABdhPJxPFRNvEnpD/ErxMu/AzfcJ14qdJNWTxdny8unKsWuGXSxICUMN5cKLkMAJZaswSxnz6rW1Pw==
X-Received: by 2002:a17:906:5d11:b0:6f5:942e:bc60 with SMTP id g17-20020a1709065d1100b006f5942ebc60mr18109093ejt.254.1652770882573;
        Tue, 17 May 2022 00:01:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/12] dt-bindings: remoteproc: qcom,adsp: simplify interrupts
Date:   Tue, 17 May 2022 09:01:05 +0200
Message-Id: <20220517070113.18023-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Interrupts between variants differ only with presence of last optional
interrupt, so the constraints can be simplified.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 46 ++++++++-----------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 6e1fdfe91043..0b2db36e5d14 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -72,11 +72,23 @@ properties:
 
   interrupts:
     minItems: 5
-    maxItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
     minItems: 5
-    maxItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   resets:
     minItems: 1
@@ -317,19 +329,9 @@ allOf:
     then:
       properties:
         interrupts:
-          items:
-            - description: Watchdog interrupt
-            - description: Fatal interrupt
-            - description: Ready interrupt
-            - description: Handover interrupt
-            - description: Stop acknowledge interrupt
+          maxItems: 5
         interrupt-names:
-          items:
-            - const: wdog
-            - const: fatal
-            - const: ready
-            - const: handover
-            - const: stop-ack
+          maxItems: 5
 
   - if:
       properties:
@@ -347,21 +349,9 @@ allOf:
     then:
       properties:
         interrupts:
-          items:
-            - description: Watchdog interrupt
-            - description: Fatal interrupt
-            - description: Ready interrupt
-            - description: Handover interrupt
-            - description: Stop acknowledge interrupt
-            - description: Shutdown acknowledge interrupt
+          minItems: 6
         interrupt-names:
-          items:
-            - const: wdog
-            - const: fatal
-            - const: ready
-            - const: handover
-            - const: stop-ack
-            - const: shutdown-ack
+          minItems: 6
 
   - if:
       properties:
-- 
2.32.0

