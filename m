Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADF052CCC3
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 May 2022 09:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbiESHXM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 19 May 2022 03:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbiESHXK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 03:23:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEEF7E1CA
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:23:09 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e4so4625586ljb.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=RDS+R7kv4kqSF00p+RWbaotyXSwPC07y+iylpR+DVkQ=;
        b=kWsk9Mw07o61WnL2Ul9s50tphJqRp26k/7J3Cy2LfngowlbcqT7Lq+DIBaAO9PRQ3z
         W67bNrRsVBFOS4ZDFYZZqdocOfnTvpEz7llVlUj+ojySoWa8S7rY+PtPrKLYGIUwe63J
         4FLrUvPJMt4e1EFzLEO1crPWdOpojJVtmD+6bGc7XeX6MH6YPzQC/Bp5JD4QL8XkkWI6
         ry+CkITz9C9FF6KYKyVT6m7VufsnhUR+2yI9SmOgwgDVO0RHwXTJ0n2y4eJJyd7oOzix
         Q9+BMzQN7wazuF4jWldj6xCl3vzUaGYX8ltKUuCXaiaqlzszUtDp6d+2byxsdsdnQNGb
         rm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RDS+R7kv4kqSF00p+RWbaotyXSwPC07y+iylpR+DVkQ=;
        b=Gs5EUIs/j0WGHxvxSGkV/g+iTdx22LlvOJ5nSF02CCoRx6Q7Mr9h9qHIQpzq5YgIbU
         yg7/zNRG+WXpiAflY0uG7Xnxm9q4wtyNB4a5Xs5YDPhKuZzTKIigeJV/1+jNZdEsYMfR
         O1m4ELjSNs+h6dn4AsDoVwqbqFhb2wHITlw2y9HmSbaisYI40AAvfKE1CfNAfmUz0yhq
         13idYIJSzgkQXRxvTpEb3W7wHAZJsaCyH7MCTtya9gGitRBvNUxK3kEAzdy4/oBOmkP3
         P+OBj5cQOuzcvfZmRBy40Vgh6AUtvNhYJbd8kGqb/JjMk+6mIuc1OveAyAIRaEbxx2PY
         zz3A==
X-Gm-Message-State: AOAM533CDZt+hAJOMtbPnDGme39IBeDJYKaNRlU7BBdvn7IMNsVxRRpF
        IutWKrZ5PIquJadVFjDqgr2y4w==
X-Google-Smtp-Source: ABdhPJznxBDWCH+ijcOPUlprywGhnlV0Z0a3QRSs1g97Y+aVVkWE/Eq/f88xbY8kvpLtw+uaGo6PbA==
X-Received: by 2002:a05:651c:887:b0:247:f630:d069 with SMTP id d7-20020a05651c088700b00247f630d069mr1900295ljq.514.1652944987565;
        Thu, 19 May 2022 00:23:07 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e20-20020a2ea554000000b0024f3d1daed2sm157674ljn.90.2022.05.19.00.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 00:23:07 -0700 (PDT)
Message-ID: <07c8cac0-ab85-19a7-de2c-14f6dc1c496a@linaro.org>
Date:   Thu, 19 May 2022 09:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
 <2f73874b-430a-48d2-4739-b06eebed1ea8@linaro.org>
 <20220519001438.E534DC385A9@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519001438.E534DC385A9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 19/05/2022 02:14, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-05-17 09:46:49)
>> On 01/05/2022 12:35, Krzysztof Kozlowski wrote:
>>> Correct kerneldoc warning:
>>>
>>>   drivers/clk/qcom/clk-alpha-pll.c:1450:
>>>     warning: expecting prototype for clk_lucid_pll_configure(). Prototype was for clk_trion_pll_configure() instead
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Any comments on entire set?
> 
> Please send a cover letter next time. Also they're simply "qcom" related
> but otherwise I'm not sure why they aren't sent to individual subsystem
> lists. They don't depend on each other to build, right?

Indeed, they can go via separate subsystems. I'll split the series in v2.

Best regards,
Krzysztof
