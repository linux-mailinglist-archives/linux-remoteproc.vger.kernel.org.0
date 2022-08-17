Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADD1596FF8
	for <lists+linux-remoteproc@lfdr.de>; Wed, 17 Aug 2022 15:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239449AbiHQNhI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 Aug 2022 09:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234215AbiHQNhH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:37:07 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0912C5B7BF
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:37:06 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x25so13587178ljm.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7wB3WWnOJH5yuxAoHFYLtWoRmPg9G9xcBhK/2UoVZfI=;
        b=xXejSYFkVQQPaT21jQcaiaCEYyx8NLJIlNPkmEacpQZItRPOOuhAC7ymN0WR1vkz3P
         lRga27OItHaG3lyvIsO+lrU4eAMw0xoOYtusP5jECJjh5k1sX60F2fJvlsf/3IASU+a2
         R6OTNJTpyBN1adJiqxOz0KI21UMK7Sxbh34aLk62kiSwvruhGSoTseUrBWANqCAlLfPb
         Z96dxbYk/Mp/R6gcyaEWn/DrKWeokkZWJYI2HY7qs4iml4d5/TMqnzeose0WXZFOcwqU
         agX6FYRVdbeQnrt26S06ZCbVOlmxVhoNUv8iZ59L/kUxF7WjVV1zSRWXhHjU2BbGRARN
         B56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7wB3WWnOJH5yuxAoHFYLtWoRmPg9G9xcBhK/2UoVZfI=;
        b=7foUMPieIgzW1raoRW3Xl5Za/m7743VrUiohFLtiVm+LXZzoHnrUK/ns8K70SSecCv
         E/62181d/loOnpemoIByf/4K8KVQohYPQe5eEX93Zsk3Jn0SWmg6vh7cIZ0ZXBRkjUm4
         +2GBFWUPjdh1Hn/La6VaSxd4ZIqat4rGVNTpnX21GTziJM/LwKAmRWgLnLfAu6JFDPYs
         tViDLi5NqwXiRgNnqA6a0lHdZRkEZDxyYOjf4reTJVvyrz89cwjkysoLvdLUXjfjQV62
         BNGg2pr/1eIwl36oN5dlvfTmlaO+zgA5umrbVKvGpO8Fe4rI+9g5r8TjWtgnXv3VtqzJ
         xb/g==
X-Gm-Message-State: ACgBeo0pAtCoNRUb2eiwb0Q3+7Y6S6hxWb9nkcWpI7cXzrj1SYO+oH7l
        Ru0Nd+7ZUhyT7WKwvdU4Dmtzlw==
X-Google-Smtp-Source: AA6agR7Rhj0IHgbG6Qt6mM337jJUY3soy+LsdDxzQJ+Udmh/ha83Sbwdt7PpyntTLEzl1YRGEA87VA==
X-Received: by 2002:a2e:a28d:0:b0:25e:66ea:637b with SMTP id k13-20020a2ea28d000000b0025e66ea637bmr7561623lja.24.1660743424389;
        Wed, 17 Aug 2022 06:37:04 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b0048b0bf9f4bfsm1692055lfr.140.2022.08.17.06.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:37:03 -0700 (PDT)
Message-ID: <1069b35f-c6a2-47a7-f8fe-c4b720685844@linaro.org>
Date:   Wed, 17 Aug 2022 16:37:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFT PATCH 03/12] dt-bindings: mfd: qcom,tcsr: add MSM8974
Content-Language: en-US
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
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
 <20220817131415.714340-4-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817131415.714340-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 17/08/2022 16:14, Krzysztof Kozlowski wrote:
> Document new MSM8974 TCSR compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> index e1c4936a0352..e7383dcad83b 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,msm8974-tcsr

There is already qcom,tcsr-msm8974 so the patch can be dropped.

Best regards,
Krzysztof
