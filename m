Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FBB7519D7
	for <lists+linux-remoteproc@lfdr.de>; Thu, 13 Jul 2023 09:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbjGMHYV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 13 Jul 2023 03:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbjGMHYT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jul 2023 03:24:19 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EB12D4A
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:23:56 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fc03aa6e04so2912725e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689233030; x=1691825030;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8OEo6fkU/i3JzBNmiaB+dxX8Uf+Q34nzBHgV0wIfnHU=;
        b=E2UT07TExkP2asBLtmPaDoO7Z3DEqa8rQNXrQI/BcYx4w1aBRgh0ugPYU6EY/7VSY3
         l1+L8fbXb9WE3Y/MDWTLh6V23uaw7/zkh5h2LCQyLMykp4kzlkBDXjqZRyR3nBWerueA
         dhBmpO14ckbkA9Ts08BJtIvZMPKYKDQMu5nu01S39XPX8uIQOWFSWld7iVnRIF09c4cC
         lLubvm95OpL3k2sTSRn2N8ot97bZ3Aqk2fSDMI0inaikajCe1/Ziizxx7LNn2hc/qwhW
         qVNIVc0RASZJpvOPBZTrygsTG2jyWHrRgSc+A+Er1LyCmnS/41HpNN0PIhUmFKflliC1
         E6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689233030; x=1691825030;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OEo6fkU/i3JzBNmiaB+dxX8Uf+Q34nzBHgV0wIfnHU=;
        b=dc+H9oqreQXlbefDC3Ggvp6ZuLnZtWxIr6mZdGgRIzhgJQI8DN2N0EaiVjHMd3tAbf
         kX9NZAvkOn1hA79UZ3X2W4EOD76BSEVD/wxOOSLxryAnLzLa/z8Uql/yFSpILaLe8Xm4
         Jp9Nwv2NqbfgTT6aB62QHNBM8MfkICfhJ6Td6NFKnZF4p7nf27GHtHRKMJ1mjb+f9dyi
         tqwMSEPBan3L7RWoqTZfPadhEjv9qW2vTRzj5CSYxHRdfQhAioPR7pyXYNVsgoy0A1P7
         1fFu54ZpddBYRLsm0p2LP5JvB1W27GFDX0yvsKgCtg1kOAQS2ruM57Ot+8HkUVJvtaA/
         97/Q==
X-Gm-Message-State: ABy/qLZLMkfhb/mph02J5SYqd8of791t8ys3WCbjQVyRcmS3HeQzj5jc
        LQ66W+bS4sVaBf6H9/ZA4A8Zpw==
X-Google-Smtp-Source: APBJJlFwjpkNKPs8sNZBDYzF12cK2QOWsZHkzLEuQ4eSVVd4ErROtfQLH46/oLpyXrPQs9qOId4QEg==
X-Received: by 2002:a1c:f711:0:b0:3fb:ef86:e30 with SMTP id v17-20020a1cf711000000b003fbef860e30mr573822wmh.10.1689233029963;
        Thu, 13 Jul 2023 00:23:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b003fbb25da65bsm6972214wmq.30.2023.07.13.00.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 00:23:49 -0700 (PDT)
Message-ID: <00453cc8-e595-cbd3-ac23-63190c73795f@linaro.org>
Date:   Thu, 13 Jul 2023 09:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: adsp: document
 firmware-name property
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712235409.97213-1-david@ixit.cz>
 <29358bac-6c1b-1e6e-9f21-20ec62518cec@linaro.org>
In-Reply-To: <29358bac-6c1b-1e6e-9f21-20ec62518cec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/07/2023 08:38, Krzysztof Kozlowski wrote:
> On 13/07/2023 01:54, David Heidelberg wrote:
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> 
> You miss commit msg. Anyway, this was sent:
> 
> https://lore.kernel.org/all/20230309083548.47205-1-krzysztof.kozlowski@linaro.org/

I also now resent (again) my previous, old set:
https://lore.kernel.org/linux-arm-msm/20230713072242.11268-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

