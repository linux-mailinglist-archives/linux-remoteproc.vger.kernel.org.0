Return-Path: <linux-remoteproc+bounces-2432-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E966499EDC0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Oct 2024 15:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5CBB22DE9
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Oct 2024 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD34814C588;
	Tue, 15 Oct 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mtlw3P1b"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820721FC7C9;
	Tue, 15 Oct 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999352; cv=none; b=rnFzFbEYZIQgke9LlNMKQ76eRyG/IooF06Nxm3fr/OKHg1tPcsftpW/w7YUb9xmo4q5m6kDfxKfuvwFlTtMFOi7zH747ix8pL6SyGJVHWhoE8W022EDkCTZhslFdKAyXGEvGq2R1DWdlHYbop6v0iAFeifsTxQwrjBMoArDF48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999352; c=relaxed/simple;
	bh=iWqukihIetnXFxIMSRJf6mjrnCnlfxnayzBqiz8bRnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IF7J5l2uGfLifNC1u5beGMUDj4dARVCoFY3ZsvEDXBJ/1mWomH3lQon0dyKNszAOY4GautTF+4uAj+V44/m6I5wG29OlsIxYweaVNwKjUMWA+mDUrJTEnphPz5Z+q0b77Xo3IiRA/z8ELI1xsTIGmEbxTV/JjHRezmg5mrm4rcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mtlw3P1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A65FC4CEC6;
	Tue, 15 Oct 2024 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728999352;
	bh=iWqukihIetnXFxIMSRJf6mjrnCnlfxnayzBqiz8bRnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mtlw3P1bWQYcQxdXci7wwOz8Hy1DkvnYOvYplfMHvTejdKnUeG+pS6hmL8bPYpNDN
	 GAyFx/ZYwZYi82WmEesfcrXljVPTuXcq597/C4Tucja62HoghI26C52oPaRC0F1XVS
	 IZ7BSGjzXuyIYLy9MeB9n6nSDDboWFD3jjYH0pxkREuZUnY2Gdb8HPfWlj3xqXdQfi
	 Sy/QScWmSgpezN2rlj7c4nzsMmgALGB1SXyHJCtouCPy8KyCuwwIvnXQHmxw7aK122
	 Y17hkhyrmE3Ia0zoQxIaPVnlJAcuAA7B/gcu3g7kLqAyTMIxIu18RRijpRedPnZYNd
	 SDuEzpSjXnTRA==
Message-ID: <f0da1029-c8df-40e7-8312-a41a87b7b940@kernel.org>
Date: Tue, 15 Oct 2024 15:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] dt-bindings: remoteproc: add binding for Microchip
 IPC remoteproc
To: Valentina.FernandezAlanis@microchip.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, peterlin@andestech.com,
 dminus@andestech.com, Conor.Dooley@microchip.com, conor+dt@kernel.org,
 ycliang@andestech.com, jassisinghbrar@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-5-valentina.fernandezalanis@microchip.com>
 <fc541e78-5304-42be-a844-70935d66f151@kernel.org>
 <82eae461-3cce-4e36-905c-34c147fabcb3@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <82eae461-3cce-4e36-905c-34c147fabcb3@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2024 14:09, Valentina.FernandezAlanis@microchip.com wrote:
> On 16/09/2024 21:14, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 12/09/2024 19:00, Valentina Fernandez wrote:
>>> Microchip family of RISC-V SoCs typically has or more clusters. These
>>> clusters can be configured to run in Asymmetric Multi Processing (AMP)
>>> mode
>>
>> A nit, subject: drop second/last, redundant "binding for". The
>> "dt-bindings" prefix is already stating that these are bindings.
>> See also:
>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>
>>>
>>> Add a dt-binding for the Microchip IPC Remoteproc platform driver.
>>>
>>
>> Binding is for hardware, not driver. Please rephrase it to describe
>> hardware.
>>
>>
>>> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
>>> ---
>>>   .../remoteproc/microchip,ipc-remoteproc.yaml  | 84 +++++++++++++++++++
>>>   1 file changed, 84 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
>>> new file mode 100644
>>> index 000000000000..1765c68d22cf
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
>>> @@ -0,0 +1,84 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-remoteproc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Microchip IPC Remote Processor
>>> +
>>> +description:
>>> +  Microchip family of RISC-V SoCs typically have one or more
>>> +  clusters. These clusters can be configured to run in an Asymmetric
>>> +  Multi Processing (AMP) mode where clusters are split in independent
>>> +  software contexts.
>>> +
>>> +  This document defines the binding for the remoteproc component that
>>> +  loads and boots firmwares on remote clusters.
>>
>> Don't say that binding is a binding for. Say what this hardware piece is.
>>
>>> +
>>> +  This SBI interface is compatible with the Mi-V Inter-hart
>>> +  Communication (IHC) IP.
>>> +
>>> +maintainers:
>>> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: microchip,ipc-remoteproc
>>
>> That's quite generic. Basically this says it will handle IPC of all
>> possible Microchip SoCs, not only RISC-V but also ARM and whatever you
>> come up with.
> IPC is the actual name of the hardware block described in this binding. 
> I'll update the description of the binding in v2 to mention this.
> 
> Additionally, I'll rename the compatible to microchip,ipc-sbi-remoteproc 
> to further clarify that this binding is intended for devices using the 
> Microchip IPC hardware block and for devices with an SBI interface (RISC-V).

Well, still generic. Explain why this deserves exception from specific
SoC compatibles.

Best regards,
Krzysztof


