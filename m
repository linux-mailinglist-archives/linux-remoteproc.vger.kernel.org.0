Return-Path: <linux-remoteproc+bounces-7098-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDfLHKD9u2mzqwIAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7098-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2026 14:44:00 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B462CC1F5
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2026 14:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61B913007AFC
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2026 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E04B3D47A9;
	Thu, 19 Mar 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCFGMDx5"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF254364EAA
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927834; cv=none; b=Z6qROXsBgwwFRU31qbfTYxiEhG+YtIsTKJ+VeW8s07c1kMMMZmyvyj5P/cT8UG0Q70rIcHtvSP3tjf1c444Bavzc3G/6scPiehTCXvL6ooTBlKAX1PlKb1OV7vhyZj4oOJ5V/JmSZ3j7EEheZGqUw9gVa1BEBylZ6BGNgAt5SpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927834; c=relaxed/simple;
	bh=Fa/Fief1P4zROqR9fX2RoLklMZ0ySyoencTReVNdA6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqAo7FTW/oQH0EMWe0bKEFdwPX+qAjxBNTXqDtfUrDBplMUkADaW9p/WZLXXx0/X2+a9N2lH8vZDlRWlsom2wvOxrH6xAdcFkOvEOPkqTrx3/xLsPvvwF3klMV5/dxRdiuHag7wfgY2uvnvJuvNlMTjsij2K86h0MBn//ktKbs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCFGMDx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD437C4AF09
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927834;
	bh=Fa/Fief1P4zROqR9fX2RoLklMZ0ySyoencTReVNdA6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cCFGMDx5K1bOQ7BdL9sehx8J+7gNGA1mui4U4C7+CnTeP7hPgFnJRB6VluFLH7aLn
	 W88iizUGBm5wR0MorSTWodICnOzQ69vW19M+4O90puv0h7NgZCdrDfstj2uvBfEhWE
	 mDktqNATNrhvwJSke4wCyic5Ke37hziIOoL+HlpDlh3uvly8DdjxccxCr6kqZVGeDv
	 1Vd+icQ3KEnBzMNhvSSMLBfNWQ/BBP0ifWubXfPcL3g1xUt39zL2mXgUAbjry9jI/b
	 MqT/Zw3VaQnk/LnIjgj9yqZS6siTR+Udqm1iGzU6EvNZ7qXRLj0H/lcU5KvhA2b0+u
	 9lZIhK6Onzniw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7947cf097c1so9903747b3.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 06:43:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqQuO/xLZuVDit0GDNJFIRY4CGpEmAu5p0OPkSGIWMfqsVWlcuf2QJqCxM3+GTO+KmtU5n8Sx8zRaco0/FmGsK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2TdRplp8+dqoc2Fnud8GTs365GA7Xe/S95Be9etPpd66ICbhN
	OBZ4BA3GyNxaLO9oeMrRcQI5qDzogs96Z62N9dUV3/65Vxz3Lljisr29H0BBEZxuNwUTJ3Uo3V4
	qZBNAL0IgdSKu04jja5b4w3Xzzi6RR6I=
X-Received: by 2002:a05:690c:e694:20b0:79a:6d65:c351 with SMTP id
 00721157ae682-79a71be5f7dmr53076387b3.36.1773927833922; Thu, 19 Mar 2026
 06:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com> <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
In-Reply-To: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:43:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLnEGs57dRt0cv8cn6wPBQysUd55xXp2OKNv9pi=KJcYEA@mail.gmail.com>
X-Gm-Features: AaiRm51dQcDdZfF40DU8z4L0gvrWVXoJ8rq31Zd9UCtsSTES701kVKPMjzXNSzk
Message-ID: <CAD++jLnEGs57dRt0cv8cn6wPBQysUd55xXp2OKNv9pi=KJcYEA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7098-lists,linux-remoteproc=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,nxp.com,kernel.org,lwn.net,pengutronix.de,foss.st.com,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.797];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,i.mx:url]
X-Rspamd-Queue-Id: 69B462CC1F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 5:01=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> [Adding Andrew Lunn]
>
> On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
> >
> > Hi Shenwei,
> >
> > On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.=
com> wrote:
> >
> > > Support the remote devices on the remote processor via the RPMSG bus =
on
> > > i.MX platform.
> >
> > I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> > series I think it's ripe for merge.
>
> Please wait until Andrew and I have provided our RBs before merging.

Fair enough, I think either you will all agree or none of you anyway.

Yours,
Linus Walleij

