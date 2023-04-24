Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBE96E2275
	for <lists+linux-remoteproc@lfdr.de>; Fri, 14 Apr 2023 13:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjDNLlG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 14 Apr 2023 07:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjDNLlE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 14 Apr 2023 07:41:04 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFD5AD04
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Apr 2023 04:41:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id jg21so44481056ejc.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Apr 2023 04:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681472461; x=1684064461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gz5zZ3oUVFEXfE6IMcNkXNuIn22zhWq6NeYREECFhxU=;
        b=Y5E7EL+qf9x9dzsqj1fcvbw45ekj6zo556nrDVxxxQ+vqo7PvtBOq6BNO/9NCFwl3j
         mePXs+kjF2fM8In0jZHECrkeH3cMED08cj/ue9s6BNZRvbg0RIHck7Md6BVdKAG8/s14
         KlZr18ouUJ85rPUBhxgSpaaYQrj/oUDz3eI8OuC3fFlrxLa5eS7FHpspjWkefsI74U34
         wJAkj+nfLsbn94026VLXZjaDzdCo30gjQ9w64OZ31bYnJ+PW1p/8YcSdhMgRDvmzr7KU
         NRe2RlSSlNL+hcOgI12zO/9z3Brvgac6NRe/2uTfor2hiLdSnz/QwAOQFuZl2j1E96Kr
         oTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681472461; x=1684064461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz5zZ3oUVFEXfE6IMcNkXNuIn22zhWq6NeYREECFhxU=;
        b=HWNfeFxSsahJwyE6b3wWAtvmi0782EVRK2NFoiUVehIMZ7HkYzd1T0ayOMNphRwAUl
         1YmUGdG9UwGBk+M/SifVqVYK4Rv6tNfg2vvJI25YwTzbhkzgmjONKqn65m0yO2d8GxdL
         oJ9923UEL6XXM4gpW7AhjtrMDWoQ4Q4HGAAuex/8XzyICwx83jDL8f04OjVRgjKvMU1D
         QYbxurfgLH/jA6hhZCrFG4SWR2dIRK2L8lVxpvUUGACV/v6P9RapUOmKf2LO7HS+EMFC
         zWMndgqL16durKlqrKUs2I/uXK0ltEPfNyf5aIBD9XI0asiNwMCQx/YqOj5bPcTvyEWi
         qkog==
X-Gm-Message-State: AAQBX9e3hu36+pPofORenQNQNddveceJs2SEsuQsJHlSye/iqhYja4z0
        k5Vb8k+Yln/5o+DyAQ2Q9ocp/A==
X-Google-Smtp-Source: AKy350aKpDrQpNa0fDef9HNzlcCWZNReLhEDR/YrYi5JGysKOFv70FxVIHiv0392k4KUgXCtGA5Zcw==
X-Received: by 2002:a17:906:5303:b0:94a:6f0d:389d with SMTP id h3-20020a170906530300b0094a6f0d389dmr5176697ejo.5.1681472460407;
        Fri, 14 Apr 2023 04:41:00 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p25-20020a17090635d900b0094e75d3ba1bsm2345699ejb.131.2023.04.14.04.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 04:40:59 -0700 (PDT)
Message-ID: <5a872001-dfcb-5c00-3b13-3c29e6be213b@linaro.org>
Date:   Fri, 14 Apr 2023 12:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 6/6] remoterproc: qcom: refactor to leverage exported
 minidump symbol
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1679491817-2498-1-git-send-email-quic_mojha@quicinc.com>
 <1679491817-2498-7-git-send-email-quic_mojha@quicinc.com>
 <6c01d2fc-3155-0dcd-f473-9cbd75dd69ec@linaro.org>
 <af23d650-3dec-9a51-566c-1eec2fa4b84b@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <af23d650-3dec-9a51-566c-1eec2fa4b84b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 14/04/2023 12:14, Mukesh Ojha wrote:
> 
> 
> On 4/14/2023 4:14 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 22/03/2023 13:30, Mukesh Ojha wrote:
>>> qcom_minidump driver provides qcom_minidump_subsystem_desc()
>>> exported API which other driver can use it query subsystem
>>> descriptor. Refactor qcom_minidump() to use this symbol.
>>>
>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>> ---
>>>   drivers/remoteproc/qcom_common.c | 13 ++-----------
>>>   1 file changed, 2 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_common.c 
>>> b/drivers/remoteproc/qcom_common.c
>>> index 88fc984..240e9f7 100644
>>> --- a/drivers/remoteproc/qcom_common.c
>>> +++ b/drivers/remoteproc/qcom_common.c
>>> @@ -94,19 +94,10 @@ void qcom_minidump(struct rproc *rproc, unsigned 
>>> int minidump_id,
>>>   {
>>>       int ret;
>>>       struct minidump_subsystem *subsystem;
>>> -    struct minidump_global_toc *toc;
>>> -    /* Get Global minidump ToC*/
>>> -    toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, 
>>> NULL);
>>> -
>>> -    /* check if global table pointer exists and init is set */
>>> -    if (IS_ERR(toc) || !toc->status) {
>>> -        dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
>>> +    subsystem = qcom_minidump_subsystem_desc(minidump_id);
>>> +    if (IS_ERR(subsystem))
>>>           return;
>>
>> Sorry If I am missing something but I got lost looking at the below 
>> code snippet in drivers/remoteproc/qcom_common.c
>>
>>
>> -------------------->cut<-----------------------------
>>      subsystem = qcom_minidump_subsystem_desc(minidump_id);
>>      if (IS_ERR(subsystem))
>>          return;
>>
>>      /**
>>       * Collect minidump if SS ToC is valid and segment table
>>       * is initialized in memory and encryption status is set.
>>       */
>>      if (subsystem->regions_baseptr == 0 ||
>>          le32_to_cpu(subsystem->status) != 1 ||
>>          le32_to_cpu(subsystem->enabled) != MINIDUMP_SS_ENABLED ||
>>          le32_to_cpu(subsystem->encryption_status) != 
>> MINIDUMP_SS_ENCR_DONE) {
>>          dev_err(&rproc->dev, "Minidump not ready, skipping\n");
>>          return;
>>      }
>> -------------------->cut<-----------------------------
>>
>> where does "subsystem->regions_baseptr" for this ADSP minidump 
>> descriptor get set?
> 
> Other co-processor such as adsp/cdsp/Mpss has their own way of 
> registering their region/segment (mostly they are static known
> regions) with minidump global infra and which could be happening
> from firmware side .
If its happening from firmware side, then that ram phys address range 
should be reserved from kernel usage I guess.

Do you have more details on where exactly is this reserved from within 
linux kernel?


--srini

> 
> 
> -Mukesh
> 
>>
>>
>> --srini
>>
>>> -    }
>>> -
>>> -    /* Get subsystem table of contents using the minidump id */
>>> -    subsystem = &toc->subsystems[minidump_id];
>>>       /**
>>>        * Collect minidump if SS ToC is valid and segment table
