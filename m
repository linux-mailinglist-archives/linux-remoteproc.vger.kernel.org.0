Return-Path: <linux-remoteproc+bounces-180-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9E823124
	for <lists+linux-remoteproc@lfdr.de>; Wed,  3 Jan 2024 17:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0734B1C239E5
	for <lists+linux-remoteproc@lfdr.de>; Wed,  3 Jan 2024 16:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FAB1B29F;
	Wed,  3 Jan 2024 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/kL4X0T"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F51B299
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jan 2024 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so7395255f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jan 2024 08:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704298759; x=1704903559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=selIPiTBkoS5l1OMM3i9w0HzBJej2N34COzM6/N+NXw=;
        b=R/kL4X0TuZViqbCth7s4OVAa3mr2h0jHTHDMHYgWkquq6pbl3f1nU5D3JQ450UxFLf
         xhfNez88fb2TgyA0Yr6PKPQF+t81IuNuHYT107+2pD3PLNAFHqJeS0SnMgY0ed79yExL
         lNVBT++TDjCYA3WOUlqfFcc2s7GP94jzpEV0xOJNvjGbP0a8eqYSUJQtet57oVgeNdJC
         KJ0OXHfPkFVGzn06aoPzutMMt66xGNuEY2zrehR+RgQ0xMRK9fzMSaRuYE+J1rS/QLff
         7927CNvu11Ses4Pa1/G9XVQBPBqNRT0A8yIchldWXGPxEC2cMMAUKJstUuKdtdoZXcWO
         8wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704298759; x=1704903559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=selIPiTBkoS5l1OMM3i9w0HzBJej2N34COzM6/N+NXw=;
        b=vKdZer1nEP250rRuKUTnECGlUZrx5EHOir1NhACEchgg0lE854ouk8CpdACGbmqZeJ
         n74nOK4DvhoXtQsTECvGhB/+6gE/qk5sSEo+0Yem4Usl+A99RXpxFWYjVDFdve9iPyps
         r1M9POSe0HY1TSKcGSGgGbRhoQbZ6YxB6lUHHa8bHQVLxoxW924kmiYWqCyePaI/IZHm
         syqmPltE9YyVWRVv9RbYk8kOMVLV9IzB9BAku5lBm60FLbSc+7unBBRCNlMV1BibziH/
         daAak87uJPN4oZRVneor6kv7O5JrM5APPt2ImIEkIDS34S5PVO3DLSm5grPWSEVdzcgh
         tZlg==
X-Gm-Message-State: AOJu0YxxErTM8OX4ozv/BL4epo5gcNxwnXFABUjUCxdsl90lHrPMRuGA
	0zXpg9XG8XZWuHXrNhWlCxz3sqFxWBkc64Ya2kR3spKdR7nLlg==
X-Google-Smtp-Source: AGHT+IHxc6RmbUDk8qZRRP/wXwKJQLoJEMFsPKWaRD1qnAIxQ7oGRHhKlBd9L738dgpFKgfPEWiB2CKPi4ihoQcZq9g=
X-Received: by 2002:a5d:4cc8:0:b0:336:95d2:c64a with SMTP id
 c8-20020a5d4cc8000000b0033695d2c64amr9871256wrt.130.1704298759433; Wed, 03
 Jan 2024 08:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228114157.104822-1-ulf.hansson@linaro.org>
 <20231228114157.104822-4-ulf.hansson@linaro.org> <ZZRY4rMjjkIsG3Ef@p14s> <CAPDyKFqgw_my76dicP9wuQAmF=kF=v5wGwxEF05wTQHdSvfuCA@mail.gmail.com>
In-Reply-To: <CAPDyKFqgw_my76dicP9wuQAmF=kF=v5wGwxEF05wTQHdSvfuCA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Jan 2024 09:19:08 -0700
Message-ID: <CANLsYkzAG4EdYgQ9hNgMB3icGY_yrNwXesBnYxnBtzakrGv7zg@mail.gmail.com>
Subject: Re: [PATCH 3/5] remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Stephan Gerhold <stephan@gerhold.net>, Ben Horgan <Ben.Horgan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jan 2024 at 03:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 2 Jan 2024 at 19:41, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > Hi Ulf,
> >
> > I'm in agreement with the modifications done to imx_rproc.c and imx_dsp_rproc.c.
> > There is one thing I am ambivalent on, please see below.
> >
> > On Thu, Dec 28, 2023 at 12:41:55PM +0100, Ulf Hansson wrote:
> > > Let's avoid the boilerplate code to manage the multiple PM domain case, by
> > > converting into using dev_pm_domain_attach|detach_list().
> > >
> > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: <linux-remoteproc@vger.kernel.org>
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 73 +++++-----------------------------
> > >  1 file changed, 9 insertions(+), 64 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 8bb293b9f327..3161f14442bc 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -92,7 +92,6 @@ struct imx_rproc_mem {
> > >
> > >  static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
> > >  static void imx_rproc_free_mbox(struct rproc *rproc);
> > > -static int imx_rproc_detach_pd(struct rproc *rproc);
> > >
> > >  struct imx_rproc {
> > >       struct device                   *dev;
> > > @@ -113,10 +112,8 @@ struct imx_rproc {
> > >       u32                             rproc_pt;       /* partition id */
> > >       u32                             rsrc_id;        /* resource id */
> > >       u32                             entry;          /* cpu start address */
> > > -     int                             num_pd;
> > >       u32                             core_index;
> > > -     struct device                   **pd_dev;
> > > -     struct device_link              **pd_dev_link;
> > > +     struct dev_pm_domain_list       *pd_list;
> > >  };
> > >
> > >  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> > > @@ -853,7 +850,7 @@ static void imx_rproc_put_scu(struct rproc *rproc)
> > >               return;
> > >
> > >       if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
> > > -             imx_rproc_detach_pd(rproc);
> > > +             dev_pm_domain_detach_list(priv->pd_list);
> > >               return;
> > >       }
> > >
> > > @@ -880,72 +877,20 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  {
> > >       struct device *dev = priv->dev;
> > > -     int ret, i;
> > > -
> > > -     /*
> > > -      * If there is only one power-domain entry, the platform driver framework
> > > -      * will handle it, no need handle it in this driver.
> > > -      */
> > > -     priv->num_pd = of_count_phandle_with_args(dev->of_node, "power-domains",
> > > -                                               "#power-domain-cells");
> > > -     if (priv->num_pd <= 1)
> > > -             return 0;
> >
> > In function dev_pm_domain_attach_list(), this condition is "<= 0" rather than
> > "<= 1".  As such the association between the device and power domain will be
> > done twice when there is a single power domain, i.e once by the core and once in
> > dev_pm_domain_attach_list().
> >
> > I am assuming the runtime PM subsystem is smart enough to deal with this kind of
> > situation but would like a confirmation.
>
> Thanks for reviewing!
>
> To cover the the single PM domain case, imx_rproc_attach_pd() is
> returning 0 when dev->pm_domain has been assigned. Moreover,
> dev_pm_domain_attach_list() doesn't allow attaching in the single PM
> domain case, as it returns -EEXIST if "dev->pm_domain" is already
> assigned.
>
> Did that make sense to you?
>

Ah yes!  The correlation between dev->pm_domain and the magic done by
the core framework was lost on me.

Once you respin to address Nikunj's comment I will ask the NXP team in
Romania to test this set.  With the holiday season still floating in
the air it may take a little while for them to get to it.

> [...]
>
> Kind regards
> Uffe

