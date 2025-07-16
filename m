Return-Path: <linux-remoteproc+bounces-4191-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B9B07D3D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Jul 2025 20:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6A13585142
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Jul 2025 18:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758FE29C35F;
	Wed, 16 Jul 2025 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUSE3iX2"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47941293C7B
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Jul 2025 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752692241; cv=none; b=horWpeZLvPuYHkhGyttgj7tqa9jG2/CPNs9xzn7Ins4DBjy0c1LpwZ0cUjEuPc3ODuKfIyNBo2VrOFSi9C+/06/7jUPqWEcegkab7GjIvlV6hRC3Vp2aj720e9vbOKRnhVA4qkLuZ+xyvx318KAd5oj0k0Vo89SGTuLHr0RfzrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752692241; c=relaxed/simple;
	bh=cTuuVg1/aMuU3ILHXxP31OocPr0xkzrGZp0svRgx/9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E93QQLJit76fNZFmtGa6neDHLHrVUFrN0wgz1dNVTvsjwjQgJa+Omz49yTza0zfEYs/OkFZRy2RujE+n0aWl6x8XXHsafH414HOeoq3PLbf2gb09pD8DwaZgY+1P03hdpcyUulGsb/a8GmYR6bwmNOT8pddeT+yn2CmyCCepIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUSE3iX2; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7180bb37846so1010977b3.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Jul 2025 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752692237; x=1753297037; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5T3sOAWKCWrDJApaHZ5HeOfhtiegcEV08YGf9/b2PFE=;
        b=CUSE3iX2ZNEpecFXzBJZ6JWsdqdLiHwqXCOH5GyXDRkxEqbH0JZuLTuwxEwckOvxWG
         6mGtiIPB/jkUJFQLJSJY7JE/BTSHSXrOBgHx5VFQdMB9aBMLs/Yz6m7Q1IR9Lra5ulWS
         TaWPcTWZE5EYr5coh443ZCSmeTTZ+Uo+hDO83utK3O+n5mXMo2sN4V0YN+ZiBFDmJHZx
         T6IXhnHGfzCeW5hGs4oKlrwNfqmbn7GrONHejghwW+nIw87S4M6RaqfKF4W46ffhEkiP
         kn19mIaLIRTfc/tRWQ9/S3q6Gvi1aHgJylnDBlVyLib0hPGrQblKQ3GjDYDdwN5vIE4q
         FhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752692237; x=1753297037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T3sOAWKCWrDJApaHZ5HeOfhtiegcEV08YGf9/b2PFE=;
        b=SPGwpK15ZXiOpTDHCmdilUoQfcOIHbftkkua+EkKT4jdBzEnYArK3d55iEqfdlDMNc
         V32E/UZ1s9DVn7gqZQ+bpZGG2qKJC4t8WlZkNpvxV/BGLW7dYZv1zy3yuszXa9JTNwFC
         0TpJqehHPgMWyzw2ACW+9ycT0ZZC/QX7YIVsae/vVc+ooEmXK4pxaKUDLI0W5l31I1gl
         CiL8T9TqdDNIZmz7F6eGXDJQCM5UbjBbzmTJLrhnjeB0pjzYSiIsRHCR+ecjV4gjLl2H
         LdxdNJ6/mKzQHnVH2qCfm+B0PsfGJClyxplbljfbl85NlgehlJKh2TWEwa5l4CbXiTxk
         kGBA==
X-Forwarded-Encrypted: i=1; AJvYcCX985bb6sQkoCA+7k/d6/JkzO/8xLzhF37wf794IwtCvpXmArItRABAQDfB8oIfIfh+gh+1FfqZQuAS8D9EkA2K@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+NhCuESlB2levWhoA+zouhqNvis7Rv1I9cNpxG3zf+aqFL6V
	nJEn5CrR0UwZXZShYi9yw/gs2MaG1YkLh9EjkYJG0CtX4Nzyn3OarYhnWpW44M1kfliJ86b2rKJ
	9Adun+iW2rUDW07VjmvcnLzVlFJjItmEuFUfv+WbPEg==
X-Gm-Gg: ASbGncte+MfiUa5Ar8qnbG5c0K2hpfFjktkgy8kb6JUUJ/J3um6sB5kN3Mmgb0j23Wp
	NVr+DYkF9AbQo32zcxUrWNvYg/tkRacm1qtF5li9KM04r+p5PwaHd3C2/fm9yVNKHKZb/Pss/pS
	jWQ0XhudZRvun99WjI/KBCCTTvcEoasdpr2DqoeI0/6onaMsuIB+efnjdF917+BtSr2e0hxv7bY
	/gQHZAy+qeeHduGNuQ=
X-Google-Smtp-Source: AGHT+IFboyjGqtZEq5f82RSPNSJDrHYTW3q6drCPtrarFDu2PZ57yVAHJp5U1uDDb/JP+QL0UnyG2hOvxRBeY7szQew=
X-Received: by 2002:a05:690c:6aca:b0:712:e333:d3a6 with SMTP id
 00721157ae682-7183733e627mr44145087b3.19.1752692237085; Wed, 16 Jul 2025
 11:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aHZ0nK4ZZShAr6Xz@p14s> <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb> <aHfYQFvkJcdfq9K_@p14s> <20250716172308.lzh3aak24d6mt4cs@hiagonb>
In-Reply-To: <20250716172308.lzh3aak24d6mt4cs@hiagonb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jul 2025 20:56:37 +0200
X-Gm-Features: Ac12FXyGrszMr34Yekpq1kAdjmt5gaU__KNEwdTbqqWzif98sMQ9MbYF1-XPcj4
Message-ID: <CAPDyKFr8eYiyj5s7wGsru8GJ+CS6h-o+a+BOV-nvCdSzWM0bSw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 19:23, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Wed, Jul 16, 2025 at 10:50:08AM -0600, Mathieu Poirier wrote:
> > On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> > > Hi Mathieu, Ulf,
> > >
> > > On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the Cortex-M remote core is started and already running before
> > > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > > bootaux), the current driver is unable to attach to it. This is because
> > > > > the driver only checks for remote cores running in different SCFW
> > > > > partitions. However in this case, the M-core is in the same partition as
> > > > > Linux and is already powered up and running by the bootloader.
> > > > >
> > > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > > M-core's power domains are already on. If all power domain devices are
> > > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > > it.
> > > > >
> > > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > > consumer of the power domain provider without changing its current
> > > > > state.
> > > > >
> > > > > During probe, also enable and sync the device runtime PM to make sure
> > > > > the power domains are correctly managed when the core is controlled by
> > > > > the kernel.
> > > > >
> > > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > ---
> > > > > v6 -> v7:
> > > > >  - Added Peng reviewed-by.
> > > > > v5 -> v6:
> > > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > > >    by. Comment on imx-rproc.c improved.
> > > > > v4 -> v5:
> > > > >  - pm_runtime_get_sync() removed in favor of
> > > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > > >    this function.
> > > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > > >    function.
> > > > > v3 -> v4:
> > > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > > >    suggested by Ulf. This will now get the power status of the two
> > > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > > >    not. In order to do that, pm_runtime_enable() and
> > > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > > v2 -> v3:
> > > > >  - Unchanged.
> > > > > v1 -> v2:
> > > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > >    suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..24597b60c5b0 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include <linux/of_reserved_mem.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/pm_domain.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > >  #include <linux/reboot.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/remoteproc.h>
> > > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >  {
> > > > >         struct device *dev = priv->dev;
> > > > > -       int ret;
> > > > > -       struct dev_pm_domain_attach_data pd_data = {
> > > > > -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > > -       };
> > > > > +       int ret, i;
> > > > > +       bool detached = true;
> > > > >
> > > > >         /*
> > > > >          * If there is only one power-domain entry, the platform driver framework
> > > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >         if (dev->pm_domain)
> > > > >                 return 0;
> > > > >
> > > > > -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > > +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > > +       /*
> > > > > +        * If all the power domain devices are already turned on, the remote
> > > > > +        * core is already powered up and running when the kernel booted (e.g.,
> > > > > +        * started by U-Boot's bootaux command). In this case attach to it.
> > > > > +        */
> > > > > +       for (i = 0; i < ret; i++) {
> > > > > +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > > +                       detached = false;
> > > > > +                       break;
> > > > > +               }
> > > > > +       }
> > > >
> > > > I was doing one final review of this work when I noticed the return code for
> > > > dev_pm_domain_attach_list() is never checked for error.
> > >
> > > As Ulf pointed out, the 'return' a few lines below will return the
> > > negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> > > will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> > >
> > > Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> > > rproc->state will still be set as RPROC_DETACHED because we are starting
> > > 'detached' as true, but I am not seeing this as an issue because as
> > > mentioned above the probe will fail anyway. Please let me know if you
> > > see this as an issue.
> >
> > Two things to consider here:
> >
> > (1) It is only a matter of time before someone with a cleaver coccinelle script
> > sends me a patch that adds the missing error check.
> >
> > (2) I think that @rproc->state being changed on error conditions is a bug
> > waiting to happen.  This kind of implicit error handling is difficult to
> > maintain and even more difficult for people to make enhancements to the driver.
> >
> > Adding a simple error check will make sure neither of the above will happen.  It
> > is a simple change and we are at rc6 - this work can still go in the merge
> > window.
>
> Sure, I can submit a new revision with this error check. Sorry I did not
> see this before, I only had a close look at this '->state' now that you
> asked on the previous email.

Alright. To avoid having you to resend patch1 and patch2 I have
applied them on my next branch and added Mathieu's ack for patch2.

Note that my vacation is around the corner, so if you want patch3 for
v6.17 you better be quick. :-)

[...]

Thanks and kind regards
Uffe

