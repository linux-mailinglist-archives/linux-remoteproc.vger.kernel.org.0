Return-Path: <linux-remoteproc+bounces-635-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC786C636
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Feb 2024 10:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F7B1F22FB3
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Feb 2024 09:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96006281F;
	Thu, 29 Feb 2024 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lovisSP+"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B776281A
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709200755; cv=none; b=S64+IcHyczVelnZOt1LwiMVbT6w4EVjz2CrMdxvLbPFkFyGJ5ypAL4t5KG8SyhU5hBz9wtJnusMD2N8dRkN+UcFNASLsOqZh3GITFoqooEkNxcTsArQ1tyz062ReAgs+j5e9JQZlf78N8QLycBTogSJlIp9t0wR7PU+XrW24YQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709200755; c=relaxed/simple;
	bh=EXyigYu2qHPBR8N0d6JtjV2BU7B0Q8/tBmXUda1uEJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPC4FrPnHCb6ihowT0qgxnht0J59HHTZ7RTJCcazQ3gShmsCCOl5nE9zXqPqgg6TYOKAv3i6ETbbtYuTELv556XAQRox1mWrt0JHLNR2b5mMcBO9J/z6S7o72II7fjmVny9pMRqP9ANguVWntykobhbaIdSqvmTLWEcJZKYb7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lovisSP+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56648955ac5so954806a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 01:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709200752; x=1709805552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prmkhleEk23voX2t1rx1ktFFT5cDY4ivILd1loVNPJ0=;
        b=lovisSP+gbt6+3C5Rq62j8MxpL4frkzS+up4VHXNxxQ2/VIQzCbnjWUDxuo7PfcjRN
         0NzPKuqLSRr91Ev8bjyFbYe5oUdDvlq/xXNTAswCMa6Nn0MaBql+s8HhAvI9p8nnFmq3
         nRIVf1UeU9N4tzv2WEGVKJ7eJBL0co38NVoak0jBFaP24Rz0x1+5hFCdKUt/sn5dtUwL
         534xBTlyrEsgfkY8GKWLr5+CYMJdU567utJhpgDhr5mFzAdzGUWba6OMLGzfttNsnAV/
         oF3RHWXe1IWWFv+u7d1DPxuBqe6Rky6CnWDjbm9YEWFjaBGGIulusiwSkdUdMaCfceYX
         4WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200752; x=1709805552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prmkhleEk23voX2t1rx1ktFFT5cDY4ivILd1loVNPJ0=;
        b=EF0QsnMNqHTeq+ATaUJGp7dkplTYBg3AMgpkL/kYXGRJwA0Qrwkr+w1pFtOPCAQEYp
         R118rDPpuQNS+BgOrH6TzaZ/sjHIpeWup9Ye6HyofKqBwKN7pj+jFrF7ZGp4dFqXUXjd
         hRikX0LbCnffR+MsGZt1tiSIHFKbw7KLWWQ4PuP2159fPJ8/dJedgZ0I5CQx49ka8+Z2
         XKrQRzP0MWAkyL3Dt/a8bp/Cd0fB/A76XMyvDRGgo8aS+ddApvVX3P0Y64I3SiG9PZ80
         BV9amakzu8VEppTo4xi2CewQx+KYQwGv6dYqObZnZsHeIWE/qIYexrbhebLQgFD1UR9Z
         5Hkg==
X-Gm-Message-State: AOJu0Yza5aXuHjGqyMoY7oQU6hGlMch0cWjAWWaUxuNnmjv7CXvnOeSr
	dfJv69LGTWrB5JiLPZzzUAbU35d5gNQeRo4wWNiGwTcLr25BGYUXwbk4iXau4So=
X-Google-Smtp-Source: AGHT+IHmJKPZ2jYWDBN7jR0AVssytOPy6VqsTPa8qUQvDUmGx6r6JpBCdbeA6NdUSG0R79BMbWpYGg==
X-Received: by 2002:a50:cc46:0:b0:565:3aa7:565f with SMTP id n6-20020a50cc46000000b005653aa7565fmr1040268edi.8.1709200751960;
        Thu, 29 Feb 2024 01:59:11 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id i16-20020aa7c710000000b005662e63cbfesm454057edq.55.2024.02.29.01.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 01:59:11 -0800 (PST)
Message-ID: <d0963aeb-1165-469b-b9c7-410a61b117f4@linaro.org>
Date: Thu, 29 Feb 2024 10:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] dt-bindings: remoteproc: add Tightly Coupled
 Memory (TCM) bindings
Content-Language: en-US
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 michal.simek@amd.com, ben.levinsky@amd.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20240219174437.3722620-1-tanmay.shah@amd.com>
 <20240219174437.3722620-3-tanmay.shah@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240219174437.3722620-3-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2024 18:44, Tanmay Shah wrote:
> From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> 
> Introduce bindings for TCM memory address space on AMD-xilinx Zynq
> UltraScale+ platform. It will help in defining TCM in device-tree
> and make it's access platform agnostic and data-driven.
> 
> Tightly-coupled memories(TCMs) are low-latency memory that provides
> predictable instruction execution and predictable data load/store
> timing. Each Cortex-R5F processor contains two 64-bit wide 64 KB memory
> banks on the ATCM and BTCM ports, for a total of 128 KB of memory.
> 
> The TCM resources(reg, reg-names and power-domain) are documented for
> each TCM in the R5 node. The reg and reg-names are made as required
> properties as we don't want to hardcode TCM addresses for future
> platforms and for zu+ legacy implementation will ensure that the
> old dts w/o reg/reg-names works and stable ABI is maintained.
> 
> It also extends the examples for TCM split and lockstep modes.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v11:
>   - Fix yamllint warning and reduce indentation as needed
> 
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         | 192 ++++++++++++++++--
>  1 file changed, 170 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> index 78aac69f1060..77030edf41fa 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -20,9 +20,21 @@ properties:
>    compatible:
>      const: xlnx,zynqmp-r5fss
>  
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges:
> +    description: |
> +      Standard ranges definition providing address translations for
> +      local R5F TCM address spaces to bus addresses.
> +
>    xlnx,cluster-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1, 2]
> +    default: 1
>      description: |
>        The RPU MPCore can operate in split mode (Dual-processor performance), Safety
>        lock-step mode(Both RPU cores execute the same code in lock-step,
> @@ -37,7 +49,7 @@ properties:
>        2: single cpu mode
>  
>  patternProperties:
> -  "^r5f-[a-f0-9]+$":
> +  "^r5f@[0-9a-f]+$":
>      type: object
>      description: |
>        The RPU is located in the Low Power Domain of the Processor Subsystem.
> @@ -54,9 +66,6 @@ patternProperties:
>        compatible:
>          const: xlnx,zynqmp-r5f
>  
> -      power-domains:
> -        maxItems: 1

Why power-domains are being dropped? This should have widest constraints
if you later customize it.

> -
>        mboxes:
>          minItems: 1
>          items:
> @@ -101,35 +110,174 @@ patternProperties:
>  
>      required:
>        - compatible
> -      - power-domains

Don't drop power domains.


>  
> -    unevaluatedProperties: false
> +allOf:

allOf block goes after required:

> +  - if:
> +      properties:
> +        xlnx,cluster-mode:
> +          enum:
> +            - 1
> +    then:
> +      patternProperties:
> +        "^r5f@[0-9a-f]+$":
> +          type: object
> +
> +          properties:
> +            reg:

reg is missing in your patternProperties earlier.



Best regards,
Krzysztof


