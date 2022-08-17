Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8EC596F8F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 17 Aug 2022 15:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiHQNPC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 Aug 2022 09:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239816AbiHQNOt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:49 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8EC52097
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l10so13520888lje.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uXLJl3ZPkfkVvmcRHOHOBnFdkGCya/Ew5ljctJGYsvo=;
        b=LThxqa07rs/MPV48N0w8kXoiodIcyMBUsQNqxCs/gH3PFDrVGh4PWvL+NXQ+nCb57O
         wAz+p0MPwvBqAaSenCoapEcgKSxAK4WxYxuOY8y7fN5OQ/on66T8Pn0htKijnE8VlOGk
         t92RgTzAKkzFe9Mf7ynXFlzG8NlkoNhFLWb3mtkbw3jK4KQiqRiC2bbnWGiHNXGgZ1UV
         hy3cRXR3fILbUgxgXio6ZFXJz/lf3m6FYOqW9wHLkTA5PON0V19ZEyj1HIomI5hx0vpT
         7af9bPe3+VsZ6kxSFqSUmdDjv9Ive3oZ1ezAvw9PSQkJNqngxlD3PEvXXkMTgq5WGR7y
         Sd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uXLJl3ZPkfkVvmcRHOHOBnFdkGCya/Ew5ljctJGYsvo=;
        b=2zdqPx5vvjSmH3yDC+wIKMOqJC6GYDKMf/LdRbKt/7JIDMjzwdVTsH6wzyxb+thshP
         ePESI0PXkhkU/mraOWMoyPvZF3dpksmpqoIGcJ9v/RpYAfJQXMBr1eIIypc+X5I+zJ2p
         n8VofanNr9tDTDgFNfWVE97OYhXa/F64pB7Vdr5puTnhq7cVNQX+WY5V69EE+P6976Ra
         W7xOj/6O7og34uKyAbIsUCYg6ig3/Z7qus/O3o1xXiQiG+2P+ZgXwV2e+RGPZsOGf8+1
         UYmZOP7oZKKFlgnD6K+MIwYQKbcJbSZRW569Lc/cc7WE9UJ29X0tEn59UUZpOK2AqNSy
         YcVg==
X-Gm-Message-State: ACgBeo2YmtArkYmaQu5ChrleW8KZ3xIn6PHTpVeSs+cBFUhqDY59Lv2B
        apbtXuFpgpBYAh2QOmRq7nyG8A==
X-Google-Smtp-Source: AA6agR4jh/QK3ONB9rVZSBJuYOsHWZBBWf+scOCDnCRRh0UN+NM4NdTkZ2qEXGMavvmupaishF7GOw==
X-Received: by 2002:a05:651c:2212:b0:25e:cc38:a1dc with SMTP id y18-20020a05651c221200b0025ecc38a1dcmr8545043ljq.359.1660742077891;
        Wed, 17 Aug 2022 06:14:37 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 11/12] ARM: dts: qcom: apq8084: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:14 +0300
Message-Id: <20220817131415.714340-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom-apq8084-mtp.dtb: hwlock: 'reg' is a required property
  qcom-apq8084-mtp.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 72f9255855a1..5e07255fe5ea 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -383,14 +383,9 @@ gcc: clock-controller@fc400000 {
 			reg = <0xfc400000 0x4000>;
 		};
 
-		tcsr_mutex_regs: syscon@fd484000 {
-			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
-		};
-
-		tcsr_mutex: hwlock {
-			compatible = "qcom,tcsr-mutex";
-			syscon = <&tcsr_mutex_regs 0 0x80>;
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,apq8084-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0xfd484000 0x1000>;
 			#hwlock-cells = <1>;
 		};
 
-- 
2.34.1

