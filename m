Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0190695CD4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Feb 2023 09:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbjBNIWx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Feb 2023 03:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbjBNIWu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 03:22:50 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8283212B1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:22:47 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso10900365wms.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xmA3b8HiSjRT79UCAMcXXDSaz4yP3Iu5XU3XjZNSgcs=;
        b=Mdeb7l/gO1iHi3Lg/0KG01jAPdpw5Ut9tILOshVGLfexbTu90ZJ9NNc4vHME7CekPG
         iTYEJwrhBlwlVGW8D4jwltemyyj8htlLc8ZvZnV8CzYJNSm0lBMMXNUm1EC6JY2lGF8r
         0XggqTv/74ITxEp60OfDYPzaNSM7lVPMfx5lPryRqhNTo/I1q4vbPOxyPvjF+HgXecL3
         BhS1Aa41+li8E2pShzNc9/DqMOzCET3kFYuzMPIL45bTYPilU0oi8fFJvTrgZ8eE3ID1
         gTGMDWpg/y06sXgVQbRA4HtB0OzkUUMxKPXO8y5qimaVtdYDzY7eeCprsbYXkGSeqeRs
         bffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmA3b8HiSjRT79UCAMcXXDSaz4yP3Iu5XU3XjZNSgcs=;
        b=heAWClJWbjq26TLczSfTbbLrFCHH0Fng7d5mo5+fS6bYOMxrwi+uy3YQ4TMQ1D8LA0
         ndJVfL5OGA/jn0pxL5vNMN/aJhztx9pi1vsgS7bkv8CM3EkD/U+HQsyi4qNeHgN3TmG2
         sXKGLaPUkrI2yMTpwJlPb6VGzy6hH6FwzWlJ/rKmh9GK/Tp9icFDr4fafny+dHEsOTzi
         EVVY+upNLlOnDpX4J50WxIgWaCkL4whnPeJv28ZhHM/BhcK/xd1pTZqmY1wtESou8zEo
         4xq8VCknXxhF/cRUFP9YyxhP8uIYW3m307jnUeHCqACa4T5Jb3u93V+CrAgBzaF+zWOW
         pg+A==
X-Gm-Message-State: AO0yUKXp7SikBqY4jDBvCIvXcjySJLGy0Cl/+h6xh9IFrY2D0xctLycj
        OOXvE4H6WJggdQAGLMc6mJrdkw==
X-Google-Smtp-Source: AK7set9uBs9rsC63W3YxzyQXGm5Zt2Q+4Cb9pPI1ebmeYqdk8QnV4nGCuTVW/UBCU+QcFV/lUlyIrA==
X-Received: by 2002:a7b:cc87:0:b0:3df:57aa:db52 with SMTP id p7-20020a7bcc87000000b003df57aadb52mr1322977wma.4.1676362966419;
        Tue, 14 Feb 2023 00:22:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c445200b003de77597f16sm17894323wmn.21.2023.02.14.00.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:22:46 -0800 (PST)
Message-ID: <fc506954-3dd2-6c1c-fccc-52de755eca6e@linaro.org>
Date:   Tue, 14 Feb 2023 09:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/9] dt-bindings: mailbox: qcom-ipcc: Add compatible for
 QDU1000/QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230213185218.166520-1-quic_molvera@quicinc.com>
 <20230213185218.166520-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213185218.166520-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/02/2023 19:52, Melody Olvera wrote:
> Document the compatible for the QDU1000 mailbox.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

