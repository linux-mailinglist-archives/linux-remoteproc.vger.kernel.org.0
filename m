Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C575BE282
	for <lists+linux-remoteproc@lfdr.de>; Tue, 20 Sep 2022 11:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbiITJzr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 20 Sep 2022 05:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiITJzp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 05:55:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805C36B17B
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 02:55:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f14so2878473lfg.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 02:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=qIu94Mc96fRdbvqjZ/QKEJZBD5CrVsQ06uzWJvJ0OPQ=;
        b=j7nu7QivLD77JPhYWubjiiRWrgYUBDeuyepsW5I8LTCqgGc4IpaIyPyTySjrAc23EY
         XXEdTqQI2INBYxyBdNK3fsfLOwW+4w161r+3sLrlu1O32xoGvdwFwUW3/gI4zzvfLqKo
         zMtW1FOUJfkClYQH5k9XQbaBHVbhdW/dogcdyPpcxcMiyw+6RNH8GtAEd/b71/obHamw
         fp8d1tWNT8C0A/xaWpbzcouXMWtJ848R/sP4uXSJNvTmYKljxhbqwYOog49tTV1IwqHQ
         1vkdmUZ/6wXuhUPRWEDKFQqV57JG6n0o9zTkLaUaF8p6CjFrGwV1LK54Y95IQMQbUsmE
         G/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qIu94Mc96fRdbvqjZ/QKEJZBD5CrVsQ06uzWJvJ0OPQ=;
        b=fGlG4zz1T/bLz9tAh+RHySIFEZ2340Viq8qF8lU43+7f4HqbP6JfDqTftpp9zJWBmX
         /OnIrCqiZKXNja6G+Y023cUY2dM4BeHHkioyFooK6FcdFIU6v1Q3PDihqx9HChPbrKuM
         G1edRgtT2l3q5u66QGZODsqXaPUyWU+8zs+KY9mjivMxh9RiW3nK8uQuY/QBs6S1Yi55
         36uWoodkBRbfp1F+Celwv5JmrDwpcf1cPg9nAmXbPAwe/9bzeoFqJAetgbfWhwz0ZqRb
         ucmiq0sVqrJZkiVP6rIvEul603DnpjSjhA1gManPAopYD7zUvF10ugCd631a5ImRDhQw
         TaPQ==
X-Gm-Message-State: ACrzQf2u2EJu6fnEXkjwHheul9cTOmVHlw8EH1bXMi9RkEwYp8M17ef5
        yn5b6Z0nf483rX84J9QpybcNVg==
X-Google-Smtp-Source: AMsMyM5lJTtXCLlzqtDAEVlWPCQEqkZ4d3ebnfRv9U7YuQ6//LeXHNi88Y5DdcKkj2Kksj9xgi6SdA==
X-Received: by 2002:a05:6512:3b0a:b0:49a:7ce8:c450 with SMTP id f10-20020a0565123b0a00b0049a7ce8c450mr8624445lfv.231.1663667741896;
        Tue, 20 Sep 2022 02:55:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e6-20020a05651236c600b00499b19f23e8sm225525lfs.279.2022.09.20.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 02:55:41 -0700 (PDT)
Message-ID: <47d939e7-a0e1-84ea-e37a-b95ba7e6810b@linaro.org>
Date:   Tue, 20 Sep 2022 11:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 4/4] dt-bindings: remoteproc: qcom: wcnss: Add
 compatible for pronto v3
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     andersson@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
 <20220920030316.1619781-5-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920030316.1619781-5-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 20/09/2022 05:03, Sireesh Kodali wrote:
> The pronto v3 remoteproc is similar to pronto v2. It is found on the
> MSM8953 platform, which is used by SDM450, SDM625, SDM626, APQ8053 and
> other SoCs. Since the configuration is same on all SoCs, a single
> compatible is used.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

It's a v3. What are the changes?

Best regards,
Krzysztof
