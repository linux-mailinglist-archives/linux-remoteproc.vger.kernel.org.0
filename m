Return-Path: <linux-remoteproc+bounces-2986-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15443A20EDE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Jan 2025 17:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E9E1678FB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Jan 2025 16:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3D21991C9;
	Tue, 28 Jan 2025 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="EvCKDVws"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32B2904;
	Tue, 28 Jan 2025 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738082773; cv=none; b=VsR4RdeCmq5RNXVzsbUnaXnfYGUgTcTeyhiTzBR/3L2eh0WWa3SC3ESyFaRl8PXaAtbH3XI3IwZ/bCFCnbuC1rf6GoU70BfLWLE7gpShxRuWxSxZhljJ5cRoAOxY9ZJ59Mlr29DbmbrPHFRQR8YjgRCukog7WLnXXIM0fmB++mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738082773; c=relaxed/simple;
	bh=8iqiBQ5n3/CNlhOEVwt898nMYFFRnFB3NHySPtLcSVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9HB6mFPYR5LfE0xUWXvriKe166SoJuYwx07Y5HBK0uRqk5cNUBfl7b2pscNMwEEVtc7jmoG9c0nNFk3vpWBzOo+vXYMelk/RyAbpQbXK+GI2mSfJ7xi1ngAiuoxvBI3J5L781H4cGDYscqAHK0IgnXJ0qtRDky/JNhTo32GCIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=EvCKDVws; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738082769; bh=8iqiBQ5n3/CNlhOEVwt898nMYFFRnFB3NHySPtLcSVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EvCKDVwsnJsi8d0LF6pL0zfXmSbk7O05YoDFvcZHqABkhaK+oHXBqwbz0ZtZTLl3x
	 annVc3NotUHQhd6QiHrrUcXjaZoywWQoGjW8nIjT7iS7KiDdkU27RLkguDvfCv7drm
	 i98X95/PA+Mj8nhyxmeHI4uLtj/6Exr8umRCe1Ts=
From: Luca Weiss <luca@lucaweiss.eu>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matti =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
Date: Tue, 28 Jan 2025 17:46:09 +0100
Message-ID: <12596489.O9o76ZdvQC@lucaweiss.eu>
In-Reply-To: <Z5iQQQRtuUzTDRVW@linaro.org>
References:
 <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
 <Z5iQQQRtuUzTDRVW@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On dinsdag 28 januari 2025 09:07:29 Midden-Europese standaardtijd Stephan 
Gerhold wrote:
> On Mon, Jan 27, 2025 at 11:45:43PM +0100, Luca Weiss wrote:
> > MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
> > needs to slightly change since the modem doesn't use the ext-bhs-reg and
> > needs mss-supply, therefore it gets a new compatible.
> > 
> > Since we already have two -common.dtsi files which are used on both
> > APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
> > the SoC include from those and requiring the device dts to pick the
> > correct one.
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  arch/arm/boot/dts/qcom/msm8926.dtsi                           | 11 ++++++
+++++
> >  arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts  |  1 +
> >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi     |  6 +++++-
> >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts     |  1 +
> >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts   |  1 +
> >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts  |  1 +
> >  .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    |  6 +++++-
> >  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts             |  2 +-
> >  .../arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts |  1 +
> >  arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts       |  1 +
> >  arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts    |  2 +-
> >  arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts    |  1 +
> >  12 files changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/msm8926.dtsi b/arch/arm/boot/dts/qcom/
msm8926.dtsi
> 
> I'm personally not a big fan of mixing the naming with and without qcom-
> prefix. But anyway:

Same, but already all PMICs were renamed to get rid of the pmXXXX- prefix, and 
there's even some new dts files that don't have the qcom- prefix anymore.

I can also send a patch to rename the .dtsi files to remove the prefix to be 
at least consistent with the PMICs, and the .dts files we'd need to keep with 
the original name to not cause any issues with the users of those - even 
though there have also been plenty of cases where we renamed those.

Regards
Luca




