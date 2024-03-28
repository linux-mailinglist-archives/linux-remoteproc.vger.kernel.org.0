Return-Path: <linux-remoteproc+bounces-749-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC78793CD
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Mar 2024 13:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729A01F22038
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Mar 2024 12:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6735779DC5;
	Tue, 12 Mar 2024 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqmk5Zt7"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44CC79B8C
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710245408; cv=none; b=K/3YISSWpaUplgLAO+TvJbiZKjHeh3dUgD+vMhPEqbwWc3pHRHCpO9DeTRlhTIqC+Rsy0/iLRhBgxvhYRbObRkwQwFUCcMitqwPiYIaYVmaaR8bH+7k3OhP51GRYPSCZJ3uGuUAowIurFSGTviEYflZOfO0lek8X9cSLS5tO7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710245408; c=relaxed/simple;
	bh=hDxEz2OH4QmQwW1yiJ//w+TME4XEXUrwQv6kDmcN8rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bT8dZS8awrLC+qRbl0dERH9oRtNT2ERfRrm6VQcU+XoLVzduMY/6bTV0ZeFy6TuRjnehIIuE++4EZodZM1UkcO+qkPmzRi8FIehZpsacTOYkdSUVTwXjwJEesLd3Vegn6u5ttAeGJDOBsYNutNcUonppt3OA2FzmR2DyKBhGykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqmk5Zt7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d23114b19dso72417201fa.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710245405; x=1710850205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ha8faRN/yVfn98uA+FQFvowllOk5X8uUBDqlexcK+hk=;
        b=aqmk5Zt7TZwDnxYJSGnreky7TDcYtvwL+LvxR4HdO4vbt4FpNtOV1Ca/d4Sai45ZLh
         quJk6aWTwYFDaQ059Ody9xL0WEx+SwDdmKNTT1pBx6EebE6EtBEjA5BTAQhmxXgoTLNN
         oxwa3F3vcahLbwERA+NT+aVr96lf8bWCkB4YvmetGcoZ0kejlaJreCfc5rUJjnp77f2I
         i4pNv0uAsrBeRxxgi82HKFbTUcNe2x3IpfjSLWgHgxmaQqc7tvPcV2QTIy1U2pkjdYEr
         qOZhQrTUsQaC6gCMMIbWH19/JkAfo7Bee0LRGbi67S56bUtMe0AAMrayTraNYOGou300
         QoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710245405; x=1710850205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha8faRN/yVfn98uA+FQFvowllOk5X8uUBDqlexcK+hk=;
        b=VCTfCvJoqObIRka8CABWWcD4tobJVNJiQwjlNlzdKj3fvBJcuWAoLWVIvswD0No6Kc
         dkDhEw3DyDMWFgyKuQSpuw098TPGe5961Zun0cDquHFIEoQVPznMN/nqNg7HV97JdAxn
         q8slr3dPt012U51WO2PF1LuL038P9pmYzlW9hYJ83fYfzNcLl7RaqIgF8/0LxHYCjqs6
         76gvSPzU5aSTq8eYmEmweNLsQCTVmuiwlkZ41FR71fWjHsXwf8Kh5RXWgw+f1csK5kNK
         Ya2J56DMDvhNr31hiNTQgO2Bedi9XjoWPYhxHdUrz4ktZwxltIPVY2OVq0G2Qchz+tal
         KUGA==
X-Gm-Message-State: AOJu0YzJOPhv1BHmBH3ZjKHph7hZoO7LyI0hMjb1uJp11WING9/vxCXK
	vxfNjnBs4qA4A41d12Wja46AFlvCTR8ikL4NOotbwteX8ijzLiDu4kEQ1sBahlE=
X-Google-Smtp-Source: AGHT+IGLRhqZ1cowdJemW7WbRaJP4k+LcuAmSZsTCZbbKBRPKJFEhrDt8+CgxA9tAl//7bMAyVthsw==
X-Received: by 2002:ac2:4c42:0:b0:513:3dc5:cd5f with SMTP id o2-20020ac24c42000000b005133dc5cd5fmr3441452lfk.40.1710245404889;
        Tue, 12 Mar 2024 05:10:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c138f00b00412706c3ddasm18794203wmf.18.2024.03.12.05.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:10:04 -0700 (PDT)
Message-ID: <18d34385-fd0b-401c-9ca4-ccf22106bd68@linaro.org>
Date: Tue, 12 Mar 2024 13:10:02 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] dt-bindings: remoteproc: add Tightly Coupled
 Memory (TCM) bindings
Content-Language: en-US
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20240301181638.814215-1-tanmay.shah@amd.com>
 <20240301181638.814215-3-tanmay.shah@amd.com>
 <fb78bdda-2ec7-4fcc-888e-233905a9386c@linaro.org>
 <2c45d7fb-06e4-468d-9415-0eaa48c5250b@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2c45d7fb-06e4-468d-9415-0eaa48c5250b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2024 17:27, Tanmay Shah wrote:
>>> +    then:
>>> +      patternProperties:
>>> +        "^r5f@[0-9a-f]+$":
>>> +          type: object
>>> +
>>> +          properties:
>>> +            reg:
>>> +              minItems: 1
>>> +              items:
>>> +                - description: ATCM internal memory
>>> +                - description: BTCM internal memory
>>> +                - description: extra ATCM memory in lockstep mode
>>> +                - description: extra BTCM memory in lockstep mode
>>> +
>>> +            reg-names:
>>> +              minItems: 1
>>> +              items:
>>> +                - const: atcm0
>>> +                - const: btcm0
>>> +                - const: atcm1
>>> +                - const: btcm1
>>
>> Why power domains are flexible?
> 
> User may not want to use all the TCMs. For example, if users want to turn-on only TCM-A and rest of them want to keep off, then
> 
> they can avoid having power-domains of other TCMs in the device-tree. This helps with less power-consumption when needed.
> 
> Hence flexible list of power-domains list.
> 

Isn't turning on/off driver's job? Sorry, but what is "user" here? DTS
describes bindings, not OS policy.

Also, please wrap your replies to match email style.

> I can certainly mention "items:" under power-domains property.
> 
> 
>>


Best regards,
Krzysztof


