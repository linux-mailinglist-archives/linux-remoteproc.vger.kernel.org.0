Return-Path: <linux-remoteproc+bounces-4336-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83756B15917
	for <lists+linux-remoteproc@lfdr.de>; Wed, 30 Jul 2025 08:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E6B18A5679
	for <lists+linux-remoteproc@lfdr.de>; Wed, 30 Jul 2025 06:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEE21F4C92;
	Wed, 30 Jul 2025 06:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAtXd+jv"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCD14F70;
	Wed, 30 Jul 2025 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858067; cv=none; b=nhDV7L0kyFLEYqgyyiLkgN/uh/MYGaftsbbmkzzFm6kN7m0gNtkHSBNBHLOQFd0E4adxdu+8Dbxxb3cezQ3CERVo7oCCJLLZAoVQvkOG0fSHjnSj/9YTZA3QGVitJuXK26EVIFd7upw/7KRGQJ3oLWMWiHEllzslkZktZBesZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858067; c=relaxed/simple;
	bh=DbdLiwFTUP0a9C15JjpoWlbE+bFP9Kd316peZHUGVj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8JLtbl55wE79iMSXWLCa2Afszv8iLR7xgZMbBHVggeCzehfG3vw/aXqpPh6uLc/0yx2xIb52sh6kxdcqkf6973P4KPQ7ctsPpEEPdjOMBTDa2eF2wHFYZrkcq+ywYM53IFXBVLd79R+3eQEkQFUF7kw3j7ehd1yHi5SnKd2ttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAtXd+jv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1CDC4CEE7;
	Wed, 30 Jul 2025 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858066;
	bh=DbdLiwFTUP0a9C15JjpoWlbE+bFP9Kd316peZHUGVj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gAtXd+jvIDICgCvhUoJ6Z4AgoPIaK5U2jufDV82bHsdi0ATDSdKBbGjAvhAFpQgE7
	 76xOV1hvNzupxRI931r3pO4VX49W8yw+tNbAK1RiXTqqjfY+M9Q0hGY1uFUct3Xfub
	 mqdcIboMUNhA7K+mUigH3igBmbM44kZPNRGXZVU4Q5w9hAV2zSpz+dvILaN9dSND33
	 F+YrB9z7QDaoCtHXNw2Z6QBEyGIxPN5tWnldu6UVXzriJ59MThC/MyYURlqu6sy2qd
	 //94Z4PjCadBy7Nwf+/0OesfW9HmDGZzAHARHhvx6qbpSKLxQJ0AaWPGB8Z1VqKIMw
	 AtRl/ljUAUYvA==
Message-ID: <4137240e-a5c4-427b-900c-ae062aa9a9c8@kernel.org>
Date: Wed, 30 Jul 2025 08:47:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <1856e9e7bfdcb6a8.1f73e6be0161d31f.3ad0845628cf3b62@Jude-Air.local>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1856e9e7bfdcb6a8.1f73e6be0161d31f.3ad0845628cf3b62@Jude-Air.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2025 05:31, Junhui Liu wrote:
> On 29/07/2025 08:27, Krzysztof Kozlowski wrote:
>> On 28/07/2025 19:13, Junhui Liu wrote:
>>>>
>>>>> +    description:
>>>>> +      This property is required only if the rpmsg/virtio functionality is used.
>>>>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>>>>> +    items:
>>>>> +      - description: mailbox channel to send data to C906L
>>>>> +      - description: mailbox channel to receive data from C906L
>>>>> +
>>>>> +  memory-region:
>>>>> +    description:
>>>>> +      List of phandles to reserved memory regions used by the remote processor.
>>>>> +      The first region is required and provides the firmware region for the
>>>>> +      remote processor. The following regions (vdev buffer, vrings) are optional
>>>>> +      and are only required if rpmsg/virtio functionality is used.
>>>>> +    minItems: 1
>>>>
>>>> Why isn't this constrained?
>>>
>>> Do you mean a maxItems should be added here?
>>>>>
>>>>> +    items:
>>>>> +      - description: firmware region
>>>>> +      - description: vdev buffer
>>>>> +      - description: vring0
>>>>> +      - description: vring1
>>>>> +    additionalItems: true
>>>>
>>>> No, drop. This needs to be constrained.
>>>
>>> My intention is that RPMsg/OpenAMP is not the only use case for
>>
>> We don't allow such syntax, that's not negotiable. Why 322 redundant
>> memory regions are fine now?
>>
>>> remoteproc. There are scenarios where the remoteproc is just used for
>>> booting the remote processor without any communication with Linux. In
>>> such case, only the firmware region is needed, and the other regions may
>>> not be necessary.
>>>
>>> Additionally, the remote processor might reserve extra memory for custom
>>> buffers or other firmware-specific purposes beyond virtio/rpmsg.
>>> Therefore, I think only the firmware region should be required and
>>> constrained, while allowing flexibility for additional/custom memory
>>> regions as needed.
>>
>> So how does this work exactly without the rest? Remote processor boots
>> and works fine? How do you communicate with it?
>>
>> Please describe exactly the usecase.
> 
> Thank you for your clarification.
> 
> The C906L remoteproc can run at two use cases:
> 1. Standalone mode: Only the firmware region is used. In this case, the
>    remoteproc driver loads the firmware into the firmware region and
>    boots the C906L. The C906L runs independently, without communication
>    with Linux, and the mailbox is not used.
> 2. OpenAMP/RPMsg mode: The firmware region, vdev buffer, and vrings are
>    used. In this scenario, the C906L runs firmware with OpenAMP support
>    and communicates with Linux via the virtio memory regions and mailbox.
> 
> To summarize:
> - Required: firmware region
> - Optional: vdev buffer, vrings, mailbox

How does your driver behave in (1)? Does it work?

Best regards,
Krzysztof

