Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F8363A998
	for <lists+linux-remoteproc@lfdr.de>; Mon, 28 Nov 2022 14:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbiK1Ndg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 28 Nov 2022 08:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiK1Ndf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Nov 2022 08:33:35 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A0F25EF
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Nov 2022 05:33:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so17375241lfv.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Nov 2022 05:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56ogPMUR1TuGT7iPafmblLLXmnw16WGXmRsMdYjH/AI=;
        b=sxeQmJ4MzyycnrYkXro/egT+MycdHsyhTURibkQU+DgPmMiSMtnsB2/Fn95+0dCwSY
         8ZlHpR9FqSfvJ5PAVp1DWLHlFUmgEXI0XQh0e1lwQOeCR1kjUtZ89vCGsY8Rs2MrKjWJ
         mJcVu3Dm62FFcTYiSiytIsyOko39IyBBQw5CM8oy9x32UWBRj/85jjyKjpDeQlO3h5uz
         vIsz09m2j18bVN9fB33C4Z/LxlYFbYIPIK8wTtBUTskkTEjihKa+dJMMBckF2wMgV1Pz
         2AzHzHlaMyDbmrDZseki5mMe7toyE0e8K2n2lWwoKFWuhvNurC2+dK53sbPCKCToHKWb
         gEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56ogPMUR1TuGT7iPafmblLLXmnw16WGXmRsMdYjH/AI=;
        b=GA6uFqfK5lAbXrBToOk7s4jOR++/nJaWWExBz90FTHR084aKbdElqGidtkDECmvbBu
         YftKPvtq+2R+Y4mg1vB9hukAjULhds/VIrFNUkwpa0WF1QgnKBiSfydaZ0Jp1mp2wuDP
         ctBGejE2lMUoFoaQlulSquQiwJC5155xIshEDbZsPg+q3ZRrpYdEVcTClI3K47gHeEe1
         RJ2zlmmc31H2By0rCzTxKvoPhMHxADOzR8uCm46E7k3gGrUv+p0cULdArUoxR50GVvTZ
         RvzUxUksVA4iLvqfImz1bMYSalNiBfLFAurDDR6aBGbc8CybNTkWSOaFELTFE9rWM+OY
         JAbA==
X-Gm-Message-State: ANoB5pnynl1kJAxz6Wqrcx0jHOkgd+gKBiNNJ/Vet5UfsvWCHnv8v4ad
        Yv/P3E7pStuEfO0X6xr//mDYmw==
X-Google-Smtp-Source: AA0mqf7UVd0VxR0iQhbiAUqDGFAXEQYaJnvqgAE50OiPyVUZE7QLF4/2TFt9J+9kx8Pfw4bVMFidyg==
X-Received: by 2002:a05:6512:484:b0:4a2:33f8:2d0f with SMTP id v4-20020a056512048400b004a233f82d0fmr16609131lfq.140.1669642413334;
        Mon, 28 Nov 2022 05:33:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 13-20020ac2484d000000b004aac23e0dd6sm1734400lfy.29.2022.11.28.05.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 05:33:32 -0800 (PST)
Message-ID: <51555970-5287-0c8e-0169-9ecc1aa85f48@linaro.org>
Date:   Mon, 28 Nov 2022 14:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V4 1/3] rpmsg: core: Add signal API support
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sarannya S <quic_sarannya@quicinc.com>, bjorn.andersson@linaro.org,
        arnaud.pouliquen@foss.st.com, swboyd@chromium.org,
        quic_clew@quicinc.com, mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" 
        <linux-arm-kernel@lists.infradead.org>
References: <1669642093-20399-1-git-send-email-quic_sarannya@quicinc.com>
 <6b445991-0843-6a1e-1bd0-1980a78a0481@linaro.org>
In-Reply-To: <6b445991-0843-6a1e-1bd0-1980a78a0481@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 28/11/2022 14:32, Krzysztof Kozlowski wrote:
> On 28/11/2022 14:28, Sarannya S wrote:
>> Some transports like Glink support the state notifications between
>> clients using flow control signals similar to serial protocol signals.
>> Local glink client drivers can send and receive flow control status
>> to glink clients running on remote processors.
>>
>> Add APIs to support sending and receiving of flow control status by
>> rpmsg clients.
>>
>> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
>> ---

One more problem - SoB does not match From field, so DCO chain is broken
here.

Best regards,
Krzysztof

