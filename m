Return-Path: <linux-remoteproc+bounces-4189-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BA6B07B87
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Jul 2025 18:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21AEF1887A7F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Jul 2025 16:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911F92F4A1E;
	Wed, 16 Jul 2025 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D6lpSti7"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DEB2F49F9
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Jul 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752684614; cv=none; b=mNdkkDnuSj/Op4Yc1X/dOgZrato9VdVXWRTSt3wDW8w3fSjBvvNG1sL4mefk20Qsoue6CsnNIPtGXnAfD7K6s3YqZr4s6OxwdZR7GGiP45SI148uw2qxRenP0v3q1mbFim8lEnfesYFUEdpCXgRf99Y3U5RWjmzaaLHe6lMfWtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752684614; c=relaxed/simple;
	bh=bqS7hFH5tsT2er6NRnRAC0Ui8sc1c5bUnigerUTye24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeJixttn6uOImH/p5V3WWBi9T+q8JraHH26bVZgrWf4ydu/WQamewHpJ2FXGIadJ8MMun2LEai93WDGRXhuUAvUx++ZjjOV3pvN6UCTDa6jpC/R1FPq8Paj5UilxrxMfyCNAdpAuoAkC/b9LLt04TE3Svo6wMZNsDaQPGdkdmhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D6lpSti7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748feca4a61so99564b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Jul 2025 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752684612; x=1753289412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjzsf2levIjNEqe5bEQKkMoPkf+yNNdouDikD7reK/E=;
        b=D6lpSti7hgIS/SyQTNvPlKQBZwXGvDKwXk+ZAx/qe0qFN/+T0AuTkvhZ9DAQeHV20q
         mHox0SUcP2Vd0Ec6jrnQgK7kE+43nCS4TL97nz/PnbVUF/igz9tu+3hWrZz4fYzKKs1J
         Zi8Cdb8EEUNPeN+B5xeZhMZZVZVAcDBQu6pZ1OVkfLAdQCb2BH//A/ZDzBfgI7aM2k2A
         dISPYT9sUhj2dn/KgoEQzmhtRLxIHUo0uGTFLtAfz7VdOgPg3sRwK1ZKbvb6dtUGlS9o
         jOC/yxVoamA3T1OfRvl7elm0gIOG1yfAvSjZZXN8uWDvLliN5AT07u6qz2Kl7oGGfTIb
         XOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752684612; x=1753289412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjzsf2levIjNEqe5bEQKkMoPkf+yNNdouDikD7reK/E=;
        b=VDrGFDuDUsXVnv6e4P15ft576eFoCRKNDywHpQ9jx6O/6Xy6F6RoFpEhvrl8gzXzF8
         bgcEe81IGFbIOjfQYLDGJyFjOWldjZXsWV9oeqEUkMLYSExmTUMxE1Iq6bYRYFnhUc5/
         7sb0KI10IAXwHr8HoDAz2v1uesw1N9FJPWvw92cwM6Nx1HCsfyd+0c0k8OaeKj1PYSgA
         yhXOrksaCxkYTxRWG6kY0GH7Wg1o04UO4SIUfvzCxV7F+4tLhfXhEbrQH44hGmvhOVzN
         9Joc+ngo1b1ZqHJCq27ep8s8mrJ8k6Sau4nJTR2MgRTfB+GEH3T1CEa3kJyvIZ2fLEWE
         lXHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQE2EvlD8y4QoclXh7O7+ZhddahvDmtnFc6RxofKMiUnrbdklsaF3kw1ieixRXV6xgzfSmg4ObXdDiMdtQ+3bq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3Gg8qph/35bobe8sHG/bIiJWioXKwy8XN/ysmyRg+KOSWZbW
	eKCsfgzdrIgxmtlIrD36g7dhLdBHF9wBtAkjHGnKHgzNAA+SyAl3aNxhOvFUwevFOXm5ufZSFqO
	msyQ7Ty0=
X-Gm-Gg: ASbGncsXLS1/2quMu/MzwZql+gMupdG9gTUjZPZr09P+elkn/Vv6orFwuKKksqJW1Ph
	e8r/3XSZL3OSkeidepgpmbRyIYMXFeM8to+0c4hHn9L7iyRPZzMCf+poQV/h1T/69nfRC0ooJuo
	SnskXFjBibmidhBHHrJIpSx6ICPX5/XXai7MOiCTVLfGqO9qBMyvo8GAYh/08ax//DBEC/5+8WR
	5eMK+TQdYhopsak2+SI7d4U2ifYN3M7mkpCFL/rjOeBp4AWTDdG0q4x4gC0k+a8Y6KFWUuwnskV
	bW59o0A16qbBL3DiafAwvtpt9n2k0akNJU7hDPHKfOQvsO7EVTkRzhLGl+ho2nezldnYXE/NknV
	Y0MgBCVyQFRaILWs7kaaMwM5KCQ==
X-Google-Smtp-Source: AGHT+IG0arZ0Y/HD/4QZM2Mtf9Bhh1MrJkEkPzLO727PMtNgzATpZ/biRDg0ZgLsatdiFJTVZd4WDA==
X-Received: by 2002:a05:6a20:2590:b0:220:2da8:325c with SMTP id adf61e73a8af0-2380e08ee88mr4831146637.0.1752684611666;
        Wed, 16 Jul 2025 09:50:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d5f3:b898:53e4:52db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe57c48asm14184484a12.25.2025.07.16.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:50:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:50:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aHfYQFvkJcdfq9K_@p14s>
References: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716132552.bra37ucw4fcjwril@hiagonb>

On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> Hi Mathieu, Ulf,
> 
> On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > When the Cortex-M remote core is started and already running before
> > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > bootaux), the current driver is unable to attach to it. This is because
> > > the driver only checks for remote cores running in different SCFW
> > > partitions. However in this case, the M-core is in the same partition as
> > > Linux and is already powered up and running by the bootloader.
> > > 
> > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > M-core's power domains are already on. If all power domain devices are
> > > on, the driver assumes the M-core is running and proceed to attach to
> > > it.
> > > 
> > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > consumer of the power domain provider without changing its current
> > > state.
> > > 
> > > During probe, also enable and sync the device runtime PM to make sure
> > > the power domains are correctly managed when the core is controlled by
> > > the kernel.
> > > 
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v6 -> v7:
> > >  - Added Peng reviewed-by.
> > > v5 -> v6:
> > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > >    by. Comment on imx-rproc.c improved.
> > > v4 -> v5:
> > >  - pm_runtime_get_sync() removed in favor of
> > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > >    this function.
> > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > >    function.
> > > v3 -> v4:
> > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > >    suggested by Ulf. This will now get the power status of the two
> > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > >    not. In order to do that, pm_runtime_enable() and
> > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > v2 -> v3:
> > >  - Unchanged.
> > > v1 -> v2:
> > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > >    suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..24597b60c5b0 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/reboot.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/remoteproc.h>
> > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  {
> > >  	struct device *dev = priv->dev;
> > > -	int ret;
> > > -	struct dev_pm_domain_attach_data pd_data = {
> > > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > > -	};
> > > +	int ret, i;
> > > +	bool detached = true;
> > >  
> > >  	/*
> > >  	 * If there is only one power-domain entry, the platform driver framework
> > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  	if (dev->pm_domain)
> > >  		return 0;
> > >  
> > > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > +	/*
> > > +	 * If all the power domain devices are already turned on, the remote
> > > +	 * core is already powered up and running when the kernel booted (e.g.,
> > > +	 * started by U-Boot's bootaux command). In this case attach to it.
> > > +	 */
> > > +	for (i = 0; i < ret; i++) {
> > > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > +			detached = false;
> > > +			break;
> > > +		}
> > > +	}
> > 
> > I was doing one final review of this work when I noticed the return code for
> > dev_pm_domain_attach_list() is never checked for error.
> 
> As Ulf pointed out, the 'return' a few lines below will return the
> negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> 
> Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> rproc->state will still be set as RPROC_DETACHED because we are starting
> 'detached' as true, but I am not seeing this as an issue because as
> mentioned above the probe will fail anyway. Please let me know if you
> see this as an issue.

Two things to consider here: 

(1) It is only a matter of time before someone with a cleaver coccinelle script
sends me a patch that adds the missing error check.

(2) I think that @rproc->state being changed on error conditions is a bug
waiting to happen.  This kind of implicit error handling is difficult to
maintain and even more difficult for people to make enhancements to the driver.

Adding a simple error check will make sure neither of the above will happen.  It
is a simple change and we are at rc6 - this work can still go in the merge
window.

> 
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > +	if (detached)
> > > +		priv->rproc->state = RPROC_DETACHED;
> > > +
> > >  	return ret < 0 ? ret : 0;
> > >  }
> > >  
> > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > >  		}
> > >  	}
> > >  
> > > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > > +		pm_runtime_enable(dev);
> > > +		ret = pm_runtime_resume_and_get(dev);
> > > +		if (ret) {
> > > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > +			goto err_put_clk;
> > > +		}
> > > +	}
> > > +
> > >  	ret = rproc_add(rproc);
> > >  	if (ret) {
> > >  		dev_err(dev, "rproc_add failed\n");
> > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > >  	struct rproc *rproc = platform_get_drvdata(pdev);
> > >  	struct imx_rproc *priv = rproc->priv;
> > >  
> > > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > +		pm_runtime_disable(priv->dev);
> > > +		pm_runtime_put(priv->dev);
> > > +	}
> > >  	clk_disable_unprepare(priv->clk);
> > >  	rproc_del(rproc);
> > >  	imx_rproc_put_scu(rproc);
> > > -- 
> > > 2.39.5
> > > 
> 
> On Tue, Jul 15, 2025 at 06:03:44PM +0200, Ulf Hansson wrote:
> > On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > When the Cortex-M remote core is started and already running before
> > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > bootaux), the current driver is unable to attach to it. This is because
> > > > the driver only checks for remote cores running in different SCFW
> > > > partitions. However in this case, the M-core is in the same partition as
> > > > Linux and is already powered up and running by the bootloader.
> > > >
> > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > M-core's power domains are already on. If all power domain devices are
> > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > it.
> > > >
> > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > consumer of the power domain provider without changing its current
> > > > state.
> > > >
> > > > During probe, also enable and sync the device runtime PM to make sure
> > > > the power domains are correctly managed when the core is controlled by
> > > > the kernel.
> > > >
> > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > v6 -> v7:
> > > >  - Added Peng reviewed-by.
> > > > v5 -> v6:
> > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > >    by. Comment on imx-rproc.c improved.
> > > > v4 -> v5:
> > > >  - pm_runtime_get_sync() removed in favor of
> > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > >    this function.
> > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > >    function.
> > > > v3 -> v4:
> > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > >    suggested by Ulf. This will now get the power status of the two
> > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > >    not. In order to do that, pm_runtime_enable() and
> > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > v2 -> v3:
> > > >  - Unchanged.
> > > > v1 -> v2:
> > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > >    suggested.
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 627e57a88db2..24597b60c5b0 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -18,6 +18,7 @@
> > > >  #include <linux/of_reserved_mem.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_domain.h>
> > > > +#include <linux/pm_runtime.h>
> > > >  #include <linux/reboot.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/remoteproc.h>
> > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >  {
> > > >       struct device *dev = priv->dev;
> > > > -     int ret;
> > > > -     struct dev_pm_domain_attach_data pd_data = {
> > > > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > -     };
> > > > +     int ret, i;
> > > > +     bool detached = true;
> > > >
> > > >       /*
> > > >        * If there is only one power-domain entry, the platform driver framework
> > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >       if (dev->pm_domain)
> > > >               return 0;
> > > >
> > > > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > +     /*
> > > > +      * If all the power domain devices are already turned on, the remote
> > > > +      * core is already powered up and running when the kernel booted (e.g.,
> > > > +      * started by U-Boot's bootaux command). In this case attach to it.
> > > > +      */
> > > > +     for (i = 0; i < ret; i++) {
> > > > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > +                     detached = false;
> > > > +                     break;
> > > > +             }
> > > > +     }
> > >
> > > I was doing one final review of this work when I noticed the return code for
> > > dev_pm_domain_attach_list() is never checked for error.
> > 
> > The for loop covers the error condition correctly, I think. It's only
> > when ret >=1 when the loop should be started - and ret is propagated
> > to the caller a few lines below.
> > 
> > >
> > > Thanks,
> > > Mathieu
> > >
> > 
> > Kind regards
> > Uffe
> > 
> > > > +
> > > > +     if (detached)
> > > > +             priv->rproc->state = RPROC_DETACHED;
> > > > +
> > > >       return ret < 0 ? ret : 0;
> > > >  }
> > > >
> > > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > > >               }
> > > >       }
> > > >
> > > > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > > > +             pm_runtime_enable(dev);
> > > > +             ret = pm_runtime_resume_and_get(dev);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > > +                     goto err_put_clk;
> > > > +             }
> > > > +     }
> > > > +
> > > >       ret = rproc_add(rproc);
> > > >       if (ret) {
> > > >               dev_err(dev, "rproc_add failed\n");
> > > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > > >       struct rproc *rproc = platform_get_drvdata(pdev);
> > > >       struct imx_rproc *priv = rproc->priv;
> > > >
> > > > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > > +             pm_runtime_disable(priv->dev);
> > > > +             pm_runtime_put(priv->dev);
> > > > +     }
> > > >       clk_disable_unprepare(priv->clk);
> > > >       rproc_del(rproc);
> > > >       imx_rproc_put_scu(rproc);
> > > > --
> > > > 2.39.5
> > > >
> 
> Best Regards,
> 
> Hiago.

