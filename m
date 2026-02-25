Return-Path: <linux-remoteproc+bounces-6588-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDs+I6jLnmm0XQQAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6588-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 Feb 2026 11:15:04 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C3195995
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 Feb 2026 11:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49F63300690F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 Feb 2026 10:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2CF3921D9;
	Wed, 25 Feb 2026 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiYgKzsm"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBF3921C5;
	Wed, 25 Feb 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014494; cv=none; b=gLEGqdcR+HXzo6b7CGeVDBzmCn9xdtMCNXbEQJOHWkr+KpslH3JhYARcGoawE9bjJ25nANv8PSFmHARhT2RiIG9fTaHPNVQyLL5MzKjlW8pSdcFEaZLqUi+KBA2sva3pl/SDr1AcYI0En+sEzL05ul7Lr5r74UC/CWmXGsBdrOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014494; c=relaxed/simple;
	bh=1Ezybvb09OMMSafqRAumx+H3UoRIusDuBCGUgx389YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMhLik0BBDTb3+Dy22Cfu+Uqovq7TSTLGmGeGtEV2A7pisMSoZL0abydRKywK8/3cER43tjYmLsYrUNsOrr6D0WsfEkanzBUBiQ5CsFTkSAA1CQihk9w6IeiCL5rVF8pjh2/X5bG9UhGkwnDyoRCMue1lRKlisJ5oGb/ZYKbgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiYgKzsm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DFDC19422;
	Wed, 25 Feb 2026 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014494;
	bh=1Ezybvb09OMMSafqRAumx+H3UoRIusDuBCGUgx389YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiYgKzsm7m4PU0dl3fUp9v+0qOHH54sdDVevNNI4MTN8F7mg8jyfqvy21+ARQjC0b
	 RZz/GXiP5ix4rHmMrmt79i3HsHIDhR2gJmIiegSE7JH/NI3ucHG1FBm4b8oR7t/ena
	 lj2cxWwPoVcEWKNnPdNz4OKcNNIyaNhSDL8/rLnvZ4I/s/lhALu5+4KFP+2ovZ16Ba
	 VMgJ8fXtmIvudCjo1oQXtLct5gjixPIQ4T+MUKtfgx39O4zksV1VRikeFmVDpAavng
	 UdaB4exN0KrNgjdgM/gQViVNf8w+ec/QfvhDvtgeNecVOJTL4aHcOIHjo2mIHBFmh8
	 gJpBfITZU8beA==
Date: Wed, 25 Feb 2026 11:14:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260225-free-fractal-ladybug-f02feb@quoll>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
 <20260224220407.2351692-2-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224220407.2351692-2-kamal.dasu@broadcom.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6588-lists,linux-remoteproc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C13C3195995
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:04:05PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
> to iomap only the 16 hardware semaphore registers that are part of all
> settop SoCs. The semaphore registers are based on the BCM7038 SoC
> where they were first introduced in settop chips.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


