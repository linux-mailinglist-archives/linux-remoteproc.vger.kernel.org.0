Return-Path: <linux-remoteproc+bounces-6440-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGHlIjjdjmlSFgEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6440-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Feb 2026 09:13:44 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E83DA133D99
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Feb 2026 09:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D9BE304C09B
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Feb 2026 08:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F5131A807;
	Fri, 13 Feb 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkZkpMJx"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19CF31A57C;
	Fri, 13 Feb 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970421; cv=none; b=IhsEpTYHD9N37nIRhEPF2KGsXcJTxF1uMutme9Yq4dFVptVP9jZKHISS+NmnjmQ3QhdMCeuaGNYu0hcJQBr9vTYmatfLjDU5LoDIOT+ma58MLRAKsQBMfyOJA/+WbV3D9cVGG0nCOKTFfj/6KNFyIwwbmt43NtHteW5StjmkbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970421; c=relaxed/simple;
	bh=efH6EuANqnS2TxiSVaLEk2gpxJHIem6ZkrjkpUI/mZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLxXgY/MZ4gH6dn0PGRm6KsV83u597doE2iPegqPdyYxPBn0WWosWsjaC+BHLyI4THg4jFyysxrNo2dmPjU7PqAOiQgHTPZdM1ouiEJOzXKqETq2er+Fk3lU3YU/+gnqACY4prJ5QIVoRmWxEjXklTLEe7ZXV0LMaXkFVdupal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkZkpMJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D04C116C6;
	Fri, 13 Feb 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970421;
	bh=efH6EuANqnS2TxiSVaLEk2gpxJHIem6ZkrjkpUI/mZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkZkpMJxDELSx0kyOcyzgRlBDuab8uiuaH+0QjEpnujwjpwC28sHsRqudyJxoqIrO
	 zSA9dqAV3AtuPvRhuNwfIQTFYYG+xhY0ft0S13tI+DlSLjUam8YiI1XGNJdYT6dGl6
	 mtynOORkRDeDs5pJh08Lv/6S2VjMqk2KMAsIHIkrXRjUfg2DG/2+If1CIr1/1rU6ef
	 6hf/G/kKKf5SPz1BZ3DjMUSpCKqfEvBKGssta1R7rt198fE02nw9dlIAxL07d8VkA8
	 xX0NhSHoWpNgCTK7KbMaP3XybkUALHrjaR973utl8/w4gbLqQGCdYdXPx1S4561yz/
	 N5+YdwJUWolCw==
Date: Fri, 13 Feb 2026 09:13:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hari Nagalla <hnagalla@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, s-anna@ti.com, 
	b-padhi@ti.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kristo@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: k3-dsp: Add C7xv dsp
 variant for J722S
Message-ID: <20260213-poised-archetypal-trout-fcb5d2@quoll>
References: <20260213001151.17370-1-hnagalla@ti.com>
 <20260213001151.17370-2-hnagalla@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213001151.17370-2-hnagalla@ti.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6440-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-remoteproc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E83DA133D99
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 06:11:48PM -0600, Hari Nagalla wrote:
> J722S uses the C7xv DSP based deep learning engine similar to AM62A,
> but the reset and module enable integration in the SoC is little
> different. It does not have local reset from power state controller.
> So, add a new compatible string to distinguish this difference.

This does not explain lack of compatibility. You ALWAYS add new
compatible string. ALWAYS. Drop the last sentence and fix the patch.

> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index b51bb863d759..c241d88f640b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -29,11 +29,13 @@ properties:
>    compatible:
>      enum:
>        - ti,am62a-c7xv-dsp
> +      - ti,j722s-c7xv-dsp

721 < 722

>        - ti,j721e-c66-dsp
>        - ti,j721e-c71-dsp
>        - ti,j721s2-c71-dsp
>      description:
>        Use "ti,am62a-c7xv-dsp" for AM62A Deep learning DSPs on K3 AM62A SoCs
> +      Use "ti,j722s-c7xv-dsp" for J722S Deep learning DSPs on K3 J722S SoCs

Same here

>        Use "ti,j721e-c66-dsp" for C66x DSPs on K3 J721E SoCs
>        Use "ti,j721e-c71-dsp" for C71x DSPs on K3 J721E SoCs
>        Use "ti,j721s2-c71-dsp" for C71x DSPs on K3 J721S2 SoCs
> @@ -127,6 +129,7 @@ allOf:
>          compatible:
>            enum:
>              - ti,am62a-c7xv-dsp
> +            - ti,j722s-c7xv-dsp
>      then:
>        properties:
>          reg:
> -- 
> 2.34.1
> 

