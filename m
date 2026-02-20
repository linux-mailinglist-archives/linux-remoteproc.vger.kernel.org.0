Return-Path: <linux-remoteproc+bounces-6503-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNR2IoMNmGlF/gIAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6503-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Feb 2026 08:30:11 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77316548A
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Feb 2026 08:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CDEA30210D3
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Feb 2026 07:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEEF2E6116;
	Fri, 20 Feb 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdX0A3DE"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952629DB86;
	Fri, 20 Feb 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572607; cv=none; b=KKTsIxRgL+5awKEli24yDc9lXYd6p41cD04cdCyEr6MaFHtALlBHuHppTOITKC3F6oxEWAnUbcCm1w5e+3ATfukR7lSlyT9QlntT/0tS5nGjFPQnqEHcDgWdHvp11+cpePHIy1B7vWVxn8AyyyXO8Lw6+Hvnjr3XZbLtgLBd5iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572607; c=relaxed/simple;
	bh=uJQW5gF+fFaKWb6wAwk2P/MP6Gl+g/OYOJPjpiQ1z4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnLJu+PwuUtVAQBOx7EiDCMajDnjhTnbAFphHyEHHdAX2HtlDNCnsDn4KFKgL3TYkm95Z2EXQ8S7PNq5dIPMIGGbA9S1KYMrwQciNIEuk/hfIko4d2AfOk2oqvulcgSJeF+JfwUH4ozdi4W8mM7Wud0kIVMwOfvTL6VAt0bklFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdX0A3DE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95481C116C6;
	Fri, 20 Feb 2026 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771572607;
	bh=uJQW5gF+fFaKWb6wAwk2P/MP6Gl+g/OYOJPjpiQ1z4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdX0A3DEBkR/3rc3bvrv7yAe83c63INWm3ULhlVJ4yZrzDYrBWSHyHsA62kbObtjA
	 7tNHgMr7Cy8AemCROQjmJGtOjr+cOHOgtBZlmyIJLuS80J+iakM8kLOV22ADi/ANUW
	 A6VtCNUYimym4VPMSaLyevIltpcINCSE9zswF86kXmJyNzIf7GCJr5P+b1K6Txhr0i
	 AxsQeUwIodkeWx2aJzcaOp0WojVbgQgrwh65BVS+9goJBPBuMVLIytomi2wCCJUVOi
	 8EDA8uzGv/gzYb2j0iT30CjzlLlVthO0dhlhbcYphxcv8RWPTY8MUOEh4KEiPUQlUk
	 AD+JF8w7nxTBg==
Date: Fri, 20 Feb 2026 08:30:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260220-agate-okapi-of-recreation-3cb930@quoll>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
 <20260219215702.63321-2-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219215702.63321-2-kamal.dasu@broadcom.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6503-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-remoteproc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F77316548A
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 04:57:00PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb hwspinlock bindings which allows hwlock driver
> to iomap 16 hardware semaphore registers that are part of all
> settop SoCs. The bindings use the common
> "brcm,brcmstb-sun-top-ctrl-semaphore" compatible string reflecting the
> actual hardware register block name.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> new file mode 100644
> index 000000000000..0a9a1bf19fe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

Incorrect filename. It must match compatible.

> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Settop Sundry Block Hardware Semaphore
> +
> +description:
> +  Broadcom settop SoCs contain 16 hardware semaphore registers
> +  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
> +  mutual exclusion between drivers running on the SoC.
> +
> +  The semaphore registers belong to the sundry hardware block. The
> +  node describes the semaphore register range carved out of the larger
> +  sundry block address space.
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-sun-top-ctrl-semaphore

That's still not SoC specific.

Best regards,
Krzysztof


