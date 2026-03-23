Return-Path: <linux-remoteproc+bounces-7135-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP2MHLmYwWlNUAQAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7135-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Mon, 23 Mar 2026 20:47:05 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 156352FC92C
	for <lists+linux-remoteproc@lfdr.de>; Mon, 23 Mar 2026 20:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B08231373F8
	for <lists+linux-remoteproc@lfdr.de>; Mon, 23 Mar 2026 19:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9EA356A0A;
	Mon, 23 Mar 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAbsMxnG"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B683542E2;
	Mon, 23 Mar 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293375; cv=none; b=YlVqMJ6BMIg7QSIh2Scwh/FPb1cNUTK4EoMqJSsV2golE1Azal0Pz53b2JR87nyIYs4JPGeBd8BwGRtu9qsFEGaed/88AYg4nR62tdd3CHo5MjnYTz3P1zvY3H62hoLLcC4Tp3G5wG6sJ5Svngg424ZS8iQc1dMEmgvOax5Tif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293375; c=relaxed/simple;
	bh=1nF+saa90o7U+gCHf9BeJ9mw/K1YHlF0/VNjlIghgx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHwWexA/HzfsbYL4uFMuZ5IeiBUeIUHqOMvQTo/eOU/9sS6FJoJPXkfpVhSF+NCxuEVeezzloascIyTrrFbAJO02n8w7PzqWj/ohOCO2J4SDcK4r+eKKDzSFQ2L/JuN4S0DqxgJ3BoL7oATR1CDlVzSUBYfEAJP746uW6XeiFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAbsMxnG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF47C4CEF7;
	Mon, 23 Mar 2026 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774293375;
	bh=1nF+saa90o7U+gCHf9BeJ9mw/K1YHlF0/VNjlIghgx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAbsMxnGX6XhQ6Gt8uhiEP+Sqq+4tsZmBGMYHL7dgJVzURomVB0k5/0xkKvMuUe/W
	 JefAmj5rYWkqvjA+WKe0Y0xqqO2ZwpriXJIfBLrzkmLbDieSO6lPU4rokKsOzsNfqi
	 LPh2+X2eM3A1/D/7Pdcsa+uqogHfn3mvU3TjU5f+uaiTNoQGvHfqflJwxXawdCS/up
	 h4uwsPMaXY86j2wL21GVoQPnBzlm7ktQmYKvxnBHsooFLVKhaE2SwKKbV//p8xgkrA
	 VzNA+rcSOpUuip1FKyuOs+SCYfg6b9sN4aZtS5wFFTGpnjDzPsAY9/B/cwt5g1Iphm
	 4dFUDAnZY7e/g==
Date: Mon, 23 Mar 2026 14:16:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Message-ID: <177429337280.1109099.6895391728397977603.robh@kernel.org>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,gmail.com,pengutronix.de,vger.kernel.org,nxp.com,lists.linux.dev,linaro.org];
	TAGGED_FROM(0.00)[bounces-7135-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-remoteproc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 156352FC92C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 20:36:57 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for:
>  Cortex-M7 core[0,1] in i.MX94
>  Cortex-M33 Sync core in i.MX94
> 
> To i.MX94, Cortex-M7 core0 and core1 have different memory view from
> Cortex-A55 core, so different compatible string is used.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


