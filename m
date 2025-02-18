Return-Path: <linux-remoteproc+bounces-3064-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE0A3A30E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 18 Feb 2025 17:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D58188C034
	for <lists+linux-remoteproc@lfdr.de>; Tue, 18 Feb 2025 16:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E7A26E650;
	Tue, 18 Feb 2025 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbNB6uye"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71869269B18;
	Tue, 18 Feb 2025 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739896943; cv=none; b=kxWneBzOBqQFh2jHgOg+IuFfJATzAnAOCXsfqvXMASH8fRI3QjpslOvSZGlsiEDXFxqmh7qXoZ0JzRA8cKJUwc/OfI9d1MxdwRSk+Y5t+lNyM4G8QVFe91fwByyfjUmWYdIEHhf+xcziiu1RGVxL6XlV43lSflYnpbxvnrChqFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739896943; c=relaxed/simple;
	bh=+yjjfKvfn9QbCvp5Fpi7pa975A/fsHsfBIVJXJFNYko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRdJzmcue6pvJ13M9hoCbLNNbl0HTDFUTcuXMOd7QoCTGYUr6oP1oEapksqNoWf6l/3I639fa8UeQ3k2YasmKYAZ4dAHLhDvozF7jG6OwfJokEHrhnHLyu/NbyV+v4s+4gr9jdjeTbmgu9t3AeFMoIhSD1eBY4X2Mcohdzc/Mo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbNB6uye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AACC4CEE2;
	Tue, 18 Feb 2025 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739896943;
	bh=+yjjfKvfn9QbCvp5Fpi7pa975A/fsHsfBIVJXJFNYko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kbNB6uyeNkBBV5TSJmZBmy///gLnnTX5ngHF41PYtZcQayWbx953IDAoCV2SxpSq0
	 1iT/h2bBGC6IKjBeqWDz3inuiPVEliNYWiE70BMyWhjIFVyNBPZs/QRuXfHlIr+t4U
	 6+YDbF2WV23OnZMVeXy1JO3mQ/+FnYmKKtscH1Qt9c8LPNMGVBKu1iT6pCCJe1CqWY
	 HocUUwpIJ6pC9XXBLesdTON0wcTYMLnbvIfzp1Qrlw0ALcjT3rQy2vBO85sJ6E78nx
	 ious/8IS2eWQ71L6mtuqQ5sQlE7+3mNbe8zhoFxq4NWUtUdGtDqHFOiT9lW0kCg2bv
	 znC56Et632ybA==
Message-ID: <8ab81ec1-4e94-4d0c-b961-a1f8b89cd834@kernel.org>
Date: Tue, 18 Feb 2025 17:42:17 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwlock: Convert to dtschema
To: Siddharth Menon <simeddon@gmail.com>, devicetree@vger.kernel.org,
 andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250218161352.269237-1-simeddon@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250218161352.269237-1-simeddon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/02/2025 17:09, Siddharth Menon wrote:
> From: BiscuitBobby <simeddon@gmail.com>
> 
> Convert the generic hwspinlock bindings to DT schema.

Thank you for your patch. There is something to discuss/improve.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also `scripts/checkpatch.pl --strict` and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Also you must use your full name, not nicknames.


> ---
>  This is my first time converting bindings to dt schema, please let me
>  know if I have overlooked anything.
>  .../devicetree/bindings/hwlock/hwlock.txt     | 59 -----------------
>  .../devicetree/bindings/hwlock/hwlock.yaml    | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/hwlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/hwlock.yaml
> 

You leave now incorrect paths in the kernel.

If you decide to convert the generic subsystem binding, you must take
extra care and change/fix/update/improve all bindings using it.


> diff --git a/Documentation/devicetree/bindings/hwlock/hwlock.yaml b/Documentation/devicetree/bindings/hwlock/hwlock.yaml
> new file mode 100644
> index 000000000000..2492fdad3c6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/hwlock.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/hwlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Hardware Lock (hwlock)
> +
> +description: |
> +  Generic bindings that are common to all the hwlock platform specific driver
> +  implementations.
> +  Please also look through the individual platform specific hwlock binding
> +  documentations for identifying any additional properties specific to that
> +  platform.
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Rob Herring <robh@kernel.org>
> +  - Krzysztof Kozlowski <krzk+dt@kernel.org>
> +  - Conor Dooley <conor+dt@kernel.org>

Subsystem maintainer only.

> +
> +properties:
> +  $nodename:
> +    pattern: "^hwlock(@.*)?"

Why .* in the pattern if you do not anchor it with $?

> +
> +  "#hwlock-cells":
> +    description: |
> +      Specifies the number of cells needed to represent a specific lock.
> +    minimum: 1
> +
> +  hwlocks:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      List of phandle to a hwlock provider node and an associated hwlock args
> +      specifier as indicated by #hwlock-cells. The list can have just a single
> +      hwlock or multiple hwlocks, with each hwlock represented by a phandle and
> +      a corresponding args specifier.

Missing type, here and  other places, unless this is already covered by
dtschema? But then why this binding is needed?

> +
> +  hwlock-names:
> +    description: |
> +      List of hwlock name strings defined in the same order as the hwlocks,
> +      with one name per hwlock. Consumers can use the hwlock-names to match
> +      and get a specific hwlock.

Hm? I don't think you understood the binding. The provider does not have
consumer properties. Read again original binding.

> +
> +patternProperties:
> +  "^hwlock@[0-9a-f]+$":
> +    type: object
> +    description: Hardware lock provider node

This makes no sense. hwlock within hwlock?

> +
> +required:
> +  - "#hwlock-cells"
> +
> +additionalProperties: true
> +
> +examples:
> +  # Example 1: A node using a single specific hwlock


Drop all examples, not really useful.

Best regards,
Krzysztof

