Return-Path: <linux-remoteproc+bounces-3807-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37253ABC135
	for <lists+linux-remoteproc@lfdr.de>; Mon, 19 May 2025 16:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 518DE3B9BD1
	for <lists+linux-remoteproc@lfdr.de>; Mon, 19 May 2025 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4234B284B5F;
	Mon, 19 May 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzSHzBCm"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CDB284674
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 May 2025 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665908; cv=none; b=Lb8Lpe3DKM1COADFFfCbxePiLqpDFgwlW0FINeYqQddBkC+MMivbsouBhEYelejpEAzwAMKKe93tkrqyRT0+OhP81r6drpvK1PbPOMTKSrD4pAymPzOXD6/P5EQog4pSmeZEhkm7n+sFKkxO+ObuIf6Dqq+b58CDjRvK0UqC7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665908; c=relaxed/simple;
	bh=7txlZqDAV8K5i3phl6bNeE7/e+2UQXhvJqe7GPPm0ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rz9FT90IjuCEAGYu/9zpmg0fTS6TSGrLLHCEbdJb4sqjywUqQOmcvheWR/+C44ARzOzZTNXHq5dCq5z6Zfm98OxyEZ181j0zl6zZjgFPevE6Ta2qk/BcGc++mKT1lQiqDSgjGueiieIF9sKVwGAishX6X6LAzfKcScIqAYcJVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzSHzBCm; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e740a09eb00so3853441276.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 May 2025 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665905; x=1748270705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrNoKeX2Lj5/qNveVALcOn5Q7n0Yzi5c56UWgJ4BBhY=;
        b=TzSHzBCmqaThfKr3krpc1H1+CCuSNc+nTBHp6G0fvkCVnG3k2jDGOF7jQGZ/Cb0l83
         XaVA/qoL5qH1dREhL+lBgz2l0oRMh1H51X6wr/V9S0JuRWAg75p0tj8KZ81fB9DMRl+M
         w6A+6AP92xziBQyX+6Uvl7JllMQV2V19REIGLnnTgAnwal716y04kbVIBj3vMQcmAqEK
         ho7Wv15/nEHctngOZVZassYr+g5XrmYr7edtct3xGT+6U4TIs6oSXZiCgewvFGEtLoln
         bI9/87G2t3xvdLcWWkqcOQGn39/s0jp24kp5Vy5J+unRBhabXjadgvRCBBgv4ZwOZ2zY
         eEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665905; x=1748270705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrNoKeX2Lj5/qNveVALcOn5Q7n0Yzi5c56UWgJ4BBhY=;
        b=KwrbMGsGl50nc6stmt0Q5vJ6o0MxroNOaN2ZombjMyiawd72Y6la31LZXFUFAIR1L/
         XhZvTSBnKSu7E+yhkMZR+CtI5URY6/XqfHxImQQApzeT7njiWfNAvu8nmwOQADyuNuUC
         yHVVqdCr9TrJapVhx00Rbx4tZNpuGMRtUj9TeFDPwVjAGlPRwE5paZXZFL4my1ehIJwT
         DicGJ2pM0DJAJzlnN7TjlbLMzzWQIEYqdkZRFFekfgvglf9Uq7AytHgmZu2FqlidgmbP
         8yFu8pFUbOdTo9XfkG0VPgg1XAkb2WsGYlPEFohb/Rr/M2QxLGb/n5yqIGwg+gPjUEFn
         PtOg==
X-Forwarded-Encrypted: i=1; AJvYcCUthrU21jOU1IsYgsITBY4e47wtFm7alGqcmzpP2QkMfuFMTwpfGI/7pk+3D6LEXI/H8fb5u4CGOHFzgqjgtkPP@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJcE66kR4YRwJ8lKlrGGIg1yPrAGh8FqlLIVD/pyiV7TOP61A
	BaTmu9c3FE5P0hoP8iS4g14QS7/tJbtVivqzCo57577fZjSM5SIosaL1g0wqUFrdSB4AY6E4q7x
	FPIcYbFa5xNky+LMKljlcqK6OvCZVynwHve4nYvSDBQ==
X-Gm-Gg: ASbGncsQjN7hbND23HVAi+Qmx1clhukreMd5ZayjFBfK4n5XE2iHocAVAlDeHc33Fxg
	wlkW94ZHJamZ8GItsHlrfsi3oRGbYkp3lXkFyPka00GjNcDmiXRG9vV7BzJHUGh6FyMaQrW5yI3
	Or13/k5DgiWGrRXuRR97vPxt5N52BQtnYhxFn+DU3kUQsk
X-Google-Smtp-Source: AGHT+IF8/uwDdoGOrriHzNUlc7Tuwt8k1isUfkEw9K/S9llcMRcrkUJk2jiCJcYg88blueJKed7YKLdIpbr1Gbas65Y=
X-Received: by 2002:a05:6902:2504:b0:e7b:5e00:54a8 with SMTP id
 3f1490d57ef6-e7b6a41fc80mr17171222276.32.1747665905046; Mon, 19 May 2025
 07:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <20250512045613.GB31197@nxa18884-linux>
 <CAPDyKFqLMEOEnGDRE-1OUi8o8eVd4_oYPH4heu=WFQ8+4s+3-w@mail.gmail.com>
In-Reply-To: <CAPDyKFqLMEOEnGDRE-1OUi8o8eVd4_oYPH4heu=WFQ8+4s+3-w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:44:28 +0200
X-Gm-Features: AX0GCFsoxBKbaWTA3FYRE0-ad2i-E4rboVBaxePNJn3SS4-9nGpIGtS4wBpf9Ns
Message-ID: <CAPDyKFrRLKc5FSng3P-8Hfe+R-3CYoPLwrYq1uMgXVNO4MA-xw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 16:39, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 05:46, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Fri, May 09, 2025 at 04:13:08PM -0300, Hiago De Franco wrote:
> > >On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > >> On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >> >
> > >> > Hello,
> > >> >
> > >> > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > >> > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >> > > >
> > >> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >> > > >
> > >> > > > When the remote core is started before Linux boots (e.g., by the
> > >> > > > bootloader), the driver currently is not able to attach because it only
> > >> > > > checks for cores running in different partitions. If the core was kicked
> > >> > > > by the bootloader, it is in the same partition as Linux and it is
> > >> > > > already up and running.
> > >> > > >
> > >> > > > This adds power mode verification through the SCU interface, enabling
> > >> > > > the driver to detect when the remote core is already running and
> > >> > > > properly attach to it.
> > >> > > >
> > >> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > >> > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > >> > > > ---
> > >> > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > >> > > > suggested.
> > >> > > > ---
> > >> > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > >> > > >  1 file changed, 13 insertions(+)
> > >> > > >
> > >> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > >> > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > >> > > > --- a/drivers/remoteproc/imx_rproc.c
> > >> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > >> > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > >> > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > >> > > >                                 return -EINVAL;
> > >> > > >
> > >> > > > +                       /*
> > >> > > > +                        * If remote core is already running (e.g. kicked by
> > >> > > > +                        * the bootloader), attach to it.
> > >> > > > +                        */
> > >> > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > >> > > > +                                                               priv->rsrc_id);
> > >> > > > +                       if (ret < 0)
> > >> > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > >> > > > +                                       priv->rsrc_id, ret);
> > >> > > > +
> > >> > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > >> > > > +                               priv->rproc->state = RPROC_DETACHED;
> > >> > > > +
> > >> > > >                         return imx_rproc_attach_pd(priv);
> > >> > >
> > >> > > Why is it important to potentially set "priv->rproc->state =
> > >> > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > >> > >
> > >> > > Would it be possible to do it the other way around? First calling
> > >> > > imx_rproc_attach_pd() then get the power-mode to know if
> > >> > > RPROC_DETACHED should be set or not?
> > >> > >
> > >> > > The main reason why I ask, is because of how we handle the single PM
> > >> > > domain case. In that case, the PM domain has already been attached
> > >> > > (and powered-on) before we reach this point.
> > >> >
> > >> > I am not sure if I understood correcly, let me know if I missed
> > >> > something. From my understanding in this case it does not matter, since
> > >> > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > >> > from rproc_validate(), when rproc_add() is called inside
> > >> > remoteproc_core.c.
> > >>
> > >> Okay, I see.
> > >>
> > >> To me, it sounds like we should introduce a new genpd helper function
> > >> instead. Something along the lines of this (drivers/pmdomain/core.c)
> > >>
> > >> bool dev_pm_genpd_is_on(struct device *dev)
> > >> {
> > >>         struct generic_pm_domain *genpd;
> > >>         bool is_on;
> > >>
> > >>         genpd = dev_to_genpd_safe(dev);
> > >>         if (!genpd)
> > >>                 return false;
> > >>
> > >>         genpd_lock(genpd);
> > >>         is_on = genpd_status_on(genpd);
> > >>         genpd_unlock(genpd);
> > >>
> > >>         return is_on;
> > >> }
> > >>
> > >> After imx_rproc_attach_pd() has run, we have the devices that
> > >> correspond to the genpd(s). Those can then be passed as in-parameters
> > >> to the above function to get the power-state of their PM domains
> > >> (genpds). Based on that, we can decide if priv->rproc->state should be
> > >> to RPROC_DETACHED or not. Right?
> > >
> > >Got your idea, I think it should work yes, I am not so sure how. From
> > >what I can see these power domains are managed by
> > >drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> > >see the power mode is correct when the remote core is powered on:
> > >
> > >[    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> > >
> > >and powered off:
> > >
> > >[    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> > >
> > >But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> > >proposed. For a quick check, I added this function and it always return
> > >NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> >
> > Ulf's new API dev_pm_genpd_is_on needs to run after power domain attached.
>
> Correct, but you need to provide the correct "dev" to it. See my other
> reply to Hiago.
>
> >
> > But if run after power domain attached, there is no API to know whether
> > M4 is kicked by bootloader or now.
>
> As long as you have multiple PM domains attached for a device, genpd
> will *not* power on the PM domain(s).
>
> Genpd does a power-on in the single PM domain case (for legacy
> reasons), but that should not be a problem here, right?
>
> So what am I missing?

Aha, PD_FLAG_DEV_LINK_ON is being used when you attach to the PM
domains. I would re-work things in the driver (if needed) so you can
avoid using this flag, then the PM domains should stay power-off until
there is a call to pm_runtime_get_sync().

[...]

Kind regards
Uffe

