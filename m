Return-Path: <linux-remoteproc+bounces-1545-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE49027DC
	for <lists+linux-remoteproc@lfdr.de>; Mon, 10 Jun 2024 19:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0951F22E19
	for <lists+linux-remoteproc@lfdr.de>; Mon, 10 Jun 2024 17:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35FB14EC6B;
	Mon, 10 Jun 2024 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="McdIVopN"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16414D6FF;
	Mon, 10 Jun 2024 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718041000; cv=none; b=Uae6FUHeRTsoraA9uZN0PgAipnSTR99B6Juw6CbNi7ZphG8GfZKQC6SZmVfr/h087QrJdTYwuB8XK4b6qjdwKOFblPY+2cyoDXnsuMnM8s+B2jPbaPtBDfEgIApXK0PMArLmTfJhAVljKZzp07bFRESx+3Ea7TyiNfgjxqOgf6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718041000; c=relaxed/simple;
	bh=5peT9yE4nDGFeJtvaJ7NLGE1KQp2YckJYIwOYXJbbGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP9zAeeV7jiRw00+qLVrlo+KI/TsqyNjMxFLOvLWGrpGzKo5l5pd2jDdM35l7GJ3UwbEBEg4MXfbaZiKzJZI/u44J0qfgdRp4iDoPAqgzcPbql5QVkuMAmhtEVkysPugZHx2QZ9tq1gDSD6EYXHtAQqdixbe2K35BcI99fwuG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=McdIVopN; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fedor-21d0 (unknown [5.228.116.47])
	by mail.ispras.ru (Postfix) with ESMTPSA id DF359407853A;
	Mon, 10 Jun 2024 17:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru DF359407853A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1718040987;
	bh=3mx7J795/y8Yz1JHM3D8D7/9NeMSSgSBgbIlVoPD2Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McdIVopNHE9BRDrwTqPcWXIO+30y9qCb6noHwAH4dDKfyUbq9GDBLoR6aKWr8io2I
	 BT2j8PVErELdSAd8Q0EivkajK22MF3Znv3dvy255z1Ge/lhT4EBPLvC3z3qzikrNI4
	 pGMDUX6mSsXL8Nfjm3WqLyyI5oB0K/q8lOoZvA8c=
Date: Mon, 10 Jun 2024 20:36:19 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Aleksandr Mishin <amishin@t-argos.ru>, imx@lists.linux.dev, 
	lvc-project@linuxtesting.org, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [lvc-project] [PATCH] remoteproc: imx_rproc: Adjust phandle
 parsing issue while remapping optional addresses in imx_rproc_addr_init()
Message-ID: <20240610-4fb504648421659114538a50-pchelkin@ispras.ru>
References: <20240606075204.12354-1-amishin@t-argos.ru>
 <ZmcuFRfjKRQG9OXI@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZmcuFRfjKRQG9OXI@p14s>

On Mon, 10. Jun 10:47, Mathieu Poirier wrote:
> On Thu, Jun 06, 2024 at 10:52:04AM +0300, Aleksandr Mishin wrote:
> > In imx_rproc_addr_init() "nph = of_count_phandle_with_args()" just counts
> > number of phandles. But phandles may be empty. So of_parse_phandle() in
> > the parsing loop (0 < a < nph) may return NULL which is later dereferenced.
> > Adjust this issue by adding NULL-return check.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > 
> > Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> > Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 5a3fb902acc9..39eacd90af14 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -726,6 +726,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> >  		struct resource res;
> >  
> >  		node = of_parse_phandle(np, "memory-region", a);
> > +		if (!node)
> 
> You're missing an "of_node_put()" before continuing.
> 

The node is NULL in this case so of_node_put() is not needed..?

Btw, there is a "rsc-table" node->name check in the the end of the loop
body. It was added recently with commit 5e4c1243071d ("remoteproc:
imx_rproc: support remote cores booted before Linux Kernel"). Seems to me
it forgot that of_node_put() is called way before that.

Also commit 61afafe8b938 ("remoteproc: imx_rproc: Fix refcount leak in
imx_rproc_addr_init") was dealing with the last of_node_put() call here
but it's still not in the right place I'd say.

> > +			continue;
> >  		/* Not map vdevbuffer, vdevring region */
> >  		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
> >  			of_node_put(node);
> > -- 
> > 2.30.2
> > 
> > 

