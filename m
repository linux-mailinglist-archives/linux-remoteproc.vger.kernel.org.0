Return-Path: <linux-remoteproc+bounces-843-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DADCB88665B
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 Mar 2024 06:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52BCC1F22973
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 Mar 2024 05:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367068F6E;
	Fri, 22 Mar 2024 05:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDTtaTL3"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5CD8C11
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Mar 2024 05:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711086272; cv=none; b=ep6FZ9m0gs8J3bVZHzvTtWlNE5Bl1y99DTvTkgcd2dZQYgAz1xLmrzqStsM6X8gaThbfyf71kwPZ30Aa6HGqMCTKlQTtLldYNsku6ziLHrqZPwtz+Fmkcd78zE2QjmTgfcmJBIfbQa0UYucPpWLRIOcLBD8StNyf+DHLk/NMT6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711086272; c=relaxed/simple;
	bh=uOq5p/Eb5ykqUHQZyziKCXEGEMNI+vTHrhDo5R41vFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IH5Z/Nj9GnxS1BJAf1IN6a6qyqeH2Y3QkJERrdp7RLboha8ZLwzCrrpli0KP6UFyjycJrh3bhdf47CWiGBjNOg/ArwMlHhOFD76NWr7FvEEmLBykE7RlJnNmujVR0yi0ZjgSrJc4OBh7rQY1SqpzUeOmWeiNkZnCw5y6pl2RSFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDTtaTL3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a466a27d30aso225315266b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Mar 2024 22:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711086268; x=1711691068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nm9xbL6fdbmkA2PfY/NtYXaykwPAjIVdTVbULwbVVtw=;
        b=SDTtaTL31u3UBWBfI8TyNu3x4qX2FQlcXlt6a6NM+pPVfMmYd8MQFjWqpZrTBBh3GO
         4lyngn2xIeWu3oLxwJi+qNpvHuV0r7ZxhsXIwX3WF8nDhPoaHl8ATHjogKgc9tFOY3/f
         r+HKDkpu8SxE2zty+C+SXlGlGVc4hsuoO4Q4kkTuMOzfMySOywI8LZD0+EsxSYdTmJn5
         bLJTbrrU8aNA6A+BWfs/4v9vRFb6ouO5Nm6kMLHTPuPLdLQkh3vB/ZKsRLDsovc0JT83
         vK/+iYjgnheV+3rJpC5geqqBT4PUtPN8486sBfYVZpFz/EDOBc7A8eyg1+sg/szPp4Tz
         mEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711086268; x=1711691068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm9xbL6fdbmkA2PfY/NtYXaykwPAjIVdTVbULwbVVtw=;
        b=voIXkoBidRSH2eeHneyue1MaQ/L+b7KcqGefPyojW9AKYOfqmMdd55LsOqLQmKnqrv
         qUR5p+HRCRNvmqr9a4odL/ZwIPWb1U3APNuYnGQYhoWTVhGxFFhbVvDIoCgPOTOkHxXx
         QvQYlP5Xlfnf7IX32Xw6CtOTJu7pGAIUkNjtus43hUTpTDIRbdDlyciQYzmBtqAnGxoQ
         n03ZT4Wi38yEW5pg9tAbcmtKaNFPvECy0UR0dVZA8/d7wZMvxSkvMSTkXRx28TQ48eLX
         90zSjLHWA204zCBhB1LiH5L0vxY06QpfnMl89i5k8m5j4x+pLsQ8bxCza9rrXsU9WsyD
         HhIg==
X-Gm-Message-State: AOJu0Yxlj+Nz2kvesZk/sAPU4Eb3BpZZCKzNqMAgRf6IQXvoPxlerQ/y
	p/+aGgDrfla5G5mLk5YzNW5ld7/wUS4NavR2bI/tUUghiPqH7Xc32H0HtzXnuwU=
X-Google-Smtp-Source: AGHT+IHz4eOI/1BdG4Cjom5CZIaMivnSB7vOCtXEwzNWSV9lnXnDQx4VJBWJSOgUsbGlUSSKC4zkWg==
X-Received: by 2002:a17:907:7e8e:b0:a46:5e1b:58a3 with SMTP id qb14-20020a1709077e8e00b00a465e1b58a3mr1110987ejc.35.1711086266344;
        Thu, 21 Mar 2024 22:44:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id h8-20020a1709060f4800b00a471b5b25b9sm633096ejj.127.2024.03.21.22.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 22:44:25 -0700 (PDT)
Message-ID: <b224cd7e-ebd0-41ef-b1e2-64f76d246307@linaro.org>
Date: Fri, 22 Mar 2024 06:44:23 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: add Versal-NET platform
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240315211533.1996543-1-tanmay.shah@amd.com>
 <20240315211533.1996543-3-tanmay.shah@amd.com>
 <3ca1c419-d185-4318-92ed-3c4e40dcf5bb@linaro.org>
 <14be0aa6-49b7-4342-9ca6-750c30c8e1e9@amd.com>
 <b1320ddf-bacb-41e3-9709-e90df18cc1e3@linaro.org>
 <d112481b-4331-4c0c-9775-407ac4a601fb@amd.com>
 <6f2ebe09-8ce5-4388-a01a-84ebc271472e@linaro.org>
 <72f3caa2-30ec-4191-9477-2d2a5e7f2f4b@amd.com>
 <5025fb10-3bcc-43b1-ae85-b556f1c0415f@linaro.org>
 <091c5ff9-dce9-4c63-a2ca-39d570e2f0a5@amd.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <091c5ff9-dce9-4c63-a2ca-39d570e2f0a5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2024 16:13, Tanmay Shah wrote:
> 
> 
> On 3/21/24 2:39 AM, Krzysztof Kozlowski wrote:
>> On 20/03/2024 16:14, Tanmay Shah wrote:
>>>
>>>
>>> On 3/20/24 2:40 AM, Krzysztof Kozlowski wrote:
>>>> On 19/03/2024 15:42, Tanmay Shah wrote:
>>>>>
>>>>>
>>>>> On 3/19/24 12:30 AM, Krzysztof Kozlowski wrote:
>>>>>> On 19/03/2024 01:51, Tanmay Shah wrote:
>>>>>>> Hello Krzysztof,
>>>>>>>
>>>>>>> Thanks for reviews. Please find my comments below.
>>>>>>>
>>>>>>> On 3/17/24 1:53 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 15/03/2024 22:15, Tanmay Shah wrote:
>>>>>>>>> AMD-Xilinx Versal-NET platform is successor of Versal platform. It
>>>>>>>>> contains multiple clusters of cortex-R52 real-time processing units.
>>>>>>>>> Each cluster contains two cores of cortex-R52 processors. Each cluster
>>>>>>>>> can be configured in lockstep mode or split mode.
>>>>>>>>>
>>>>>>>>> Each R52 core is assigned 128KB of TCM memory. ATCM memory is 64KB, BTCM
>>>>>>>>> and CTCM memoreis are 32KB each. Each TCM memory has its own dedicated
>>>>>>>>> power-domain that needs to be requested before using it.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>>>> ---
>>>>>>>>>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         | 220 +++++++++++++++---
>>>>>>>>>  1 file changed, 184 insertions(+), 36 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>>>>>>> index 711da0272250..55654ee02eef 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>>>>>>> @@ -18,7 +18,9 @@ description: |
>>>>>>>>>  
>>>>>>>>>  properties:
>>>>>>>>>    compatible:
>>>>>>>>> -    const: xlnx,zynqmp-r5fss
>>>>>>>>> +    enum:
>>>>>>>>> +      - xlnx,zynqmp-r5fss
>>>>>>>>> +      - xlnx,versal-net-r52fss
>>>>>>>>>  
>>>>>>>>>    "#address-cells":
>>>>>>>>>      const: 2
>>>>>>>>> @@ -64,7 +66,9 @@ patternProperties:
>>>>>>>>>  
>>>>>>>>>      properties:
>>>>>>>>>        compatible:
>>>>>>>>> -        const: xlnx,zynqmp-r5f
>>>>>>>>> +        enum:
>>>>>>>>> +          - xlnx,zynqmp-r5f
>>>>>>>>> +          - xlnx,versal-net-r52f
>>>>>>>>>  
>>>>>>>>>        reg:
>>>>>>>>>          minItems: 1
>>>>>>>>> @@ -135,9 +139,11 @@ required:
>>>>>>>>>  allOf:
>>>>>>>>>    - if:
>>>>>>>>>        properties:
>>>>>>>>> -        xlnx,cluster-mode:
>>>>>>>>> -          enum:
>>>>>>>>> -            - 1
>>>>>>>>> +        compatible:
>>>>>>>>> +          contains:
>>>>>>>>> +            enum:
>>>>>>>>> +              - xlnx,versal-net-r52fss
>>>>>>>>
>>>>>>>> Why do you touch these lines?
>>>>>>>>
>>>>>>>>> +
>>>>>>>>>      then:
>>>>>>>>>        patternProperties:
>>>>>>>>>          "^r5f@[0-9a-f]+$":
>>>>>>>>> @@ -149,16 +155,14 @@ allOf:
>>>>>>>>>                items:
>>>>>>>>>                  - description: ATCM internal memory
>>>>>>>>>                  - description: BTCM internal memory
>>>>>>>>> -                - description: extra ATCM memory in lockstep mode
>>>>>>>>> -                - description: extra BTCM memory in lockstep mode
>>>>>>>>> +                - description: CTCM internal memory
>>>>>>>>>  
>>>>>>>>>              reg-names:
>>>>>>>>>                minItems: 1
>>>>>>>>>                items:
>>>>>>>>> -                - const: atcm0
>>>>>>>>> -                - const: btcm0
>>>>>>>>> -                - const: atcm1
>>>>>>>>> -                - const: btcm1
>>>>>>>>> +                - const: atcm
>>>>>>>>> +                - const: btcm
>>>>>>>>> +                - const: ctcm
>>>>>>>>>  
>>>>>>>>>              power-domains:
>>>>>>>>>                minItems: 2
>>>>>>>>> @@ -166,33 +170,70 @@ allOf:
>>>>>>>>>                  - description: RPU core power domain
>>>>>>>>>                  - description: ATCM power domain
>>>>>>>>>                  - description: BTCM power domain
>>>>>>>>> -                - description: second ATCM power domain
>>>>>>>>> -                - description: second BTCM power domain
>>>>>>>>> +                - description: CTCM power domain
>>>>>>>>>  
>>>>>>>>>      else:
>>>>>>>>> -      patternProperties:
>>>>>>>>> -        "^r5f@[0-9a-f]+$":
>>>>>>>>> -          type: object
>>>>>>>>> -
>>>>>>>>> -          properties:
>>>>>>>>> -            reg:
>>>>>>>>> -              minItems: 1
>>>>>>>>> -              items:
>>>>>>>>> -                - description: ATCM internal memory
>>>>>>>>> -                - description: BTCM internal memory
>>>>>>>>> -
>>>>>>>>> -            reg-names:
>>>>>>>>> -              minItems: 1
>>>>>>>>> -              items:
>>>>>>>>> -                - const: atcm0
>>>>>>>>> -                - const: btcm0
>>>>>>>>> -
>>>>>>>>> -            power-domains:
>>>>>>>>> -              minItems: 2
>>>>>>>>> -              items:
>>>>>>>>> -                - description: RPU core power domain
>>>>>>>>> -                - description: ATCM power domain
>>>>>>>>> -                - description: BTCM power domain
>>>>>>>>> +      allOf:
>>>>>>>>> +        - if:
>>>>>>>>> +            properties:
>>>>>>>>> +              xlnx,cluster-mode:
>>>>>>>>> +                enum:
>>>>>>>>> +                  - 1
>>>>>>>>
>>>>>>>> Whatever you did here, is not really readable. You have now multiple
>>>>>>>> if:then:if:then embedded.
>>>>>>>
>>>>>>> For ZynqMP platform, TCM can be configured differently in lockstep mode
>>>>>>> and split mode.
>>>>>>>
>>>>>>> For Versal-NET no such configuration is available, but new CTCM memory
>>>>>>> is added.
>>>>>>>
>>>>>>> So, I am trying to achieve following representation of TCM for both:
>>>>>>>
>>>>>>> if: versal-net compatible
>>>>>>> then:
>>>>>>>   ATCM - 64KB
>>>>>>>   BTCM - 32KB
>>>>>>>   CTCM - 32KB
>>>>>>>
>>>>>>> else: (ZynqMP compatible)
>>>>>>>   if:
>>>>>>>     xlnx,cluster-mode (lockstep mode)
>>>>>>>   then:
>>>>>>>     ATCM0 - 64KB
>>>>>>>     BTCM0 - 64KB
>>>>>>>     ATCM1 - 64KB
>>>>>>>     BTCM1 - 64KB
>>>>>>>   else: (split mode)
>>>>>>>     ATCM0 - 64KB
>>>>>>>     BTCM0 - 64KB
>>>>>>>
>>>>>>>
>>>>>>> If bindings are getting complicated, does it make sense to introduce
>>>>>>> new file for Versal-NET bindings? Let me know how you would like me
>>>>>>> to proceed.
>>>>>>
>>>>>> All this is broken in your previous patchset, but now we nicely see.
>>>>>>
>>>>>> No, this does not work like this. You do not have entirely different
>>>>>> programming models in one device, don't you?
>>>>>>
>>>>>
>>>>> I don't understand what do you mean? Programming model is same. Only number
>>>>> of TCMs are changing based on configuration and platform. I can certainly
>>>>> list different compatible for different platforms as requested. But other than
>>>>> that not sure what needs to be fixed.
>>>>
>>>> You cannot have same programming model with different memory mappings.
>>>> Anyway, please follow writing bindings rules: all of your different
>>>> devices must have dedicated compatible. I really though we talked about
>>>> two IPs on same SoC...
>>>
>>> I agree that Versal compatible should be added, I will do that in next revision.
>>>
>>> For ZynqMP case, it is two IPs on same SOC. In lockstep mode and split mode,
>>> same SOC is configuring TCM differently.
>>>
>>> How this should be resolved for Versal-NET ? Driver avoids such TCM configuration
>>> for Versal-NET.
>>
>> Binding should describe the hardware, not what driver is doing
>> currently, so the question is: does your device have such properties or
>> not? Anyway, you need compatible per each variant and each SoC
>> implementation.
> 
> Thanks for reviews.
> 
> Okay in that case I believe I should add one more property to current bindings for TCM
> configuration.
> 

I am not sure if you understand how IRC works... You sent me message on
IRC about this topic and shortly after you quit. So how am I supposed to
send reply? IRC does not work like that...

> From our discussion I conclude to following next steps:
> 
> 1) I will send Versal and Versal-NET support as part of previous series (v14) so we get
> bigger picture in the first place.
> 
> 2) Add separate compatible for versal platform.
> Use device compatible string to maintain
> backward compatibility and not machine (root node) compatible string.
> 
> 3) Add tcm,mode property in bindings and each device must configure TCM based on that
> property only and not based on compatible string.
> 
> 4) Versal-NET will disallow tcm,mode property in bindings as no such configuration is
> possible for that platform.

I really don't know your SoCs. What about Zynq? You keep using here
names all over the place, but I am not Xilinx maintainer.


Best regards,
Krzysztof


