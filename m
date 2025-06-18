Return-Path: <linux-remoteproc+bounces-4000-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A456CADEB94
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Jun 2025 14:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD2D3A52AD
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Jun 2025 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3019A2DE1E2;
	Wed, 18 Jun 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PS7QpX9j"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF6A296153
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Jun 2025 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248794; cv=none; b=TMA4TJ++K6RhxKXyt/N9ClgNCM5ZShcM4tUPjJNfpgQWlIVF2ZUQERebwYAKlEB8MbzKcfARFCO0UtJDVtfxDhTxQqKl13IlFExxMBp+nSQMFpMOCKYY3uW8mh92Uvv9TOTa4nBqHg17j3kM6Lfq8HRX9Hrjvx2KvMUrBZgf+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248794; c=relaxed/simple;
	bh=S+Z1yIM9Z7AMg6puDBieh0UvRmQ1svKpeSk5WrhTYRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZO5TjyRcsDhY0WWKCdeT2De8pJztf2BpT85ckZbUW7OE0xqB0H0MOquPnOGvndU+0XqX2NELU0pbp9wRIzhpm2Wu7OqctBlUUeich163FFcewNFLbFK/+ILicqneZR8q/8Um2ci9zfz+mKBn8PuWzO7MX3g1ztQUtF5DS17kwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PS7QpX9j; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad891bb0957so1242529766b.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Jun 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248789; x=1750853589; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bKGxDPrsrGFp0Bze86vZksL2+DNrY5eWcc4p55uZfLg=;
        b=PS7QpX9jMPQvzX6sjDOFk1szG0lEk5c7rjgLVAuJwXtzlY6vEyyRUzXguADzoyQ4SB
         m6/bF3TJYKJoOmWygsQxIvHxXdUfS5B6tmZXK2V6Us5YU+fVDUXsgmOPFVoYgGhfOP0M
         n3QJTx0Y0LiGBjXOpcJTfM4ISpnPspoPeBqm1YCzPP8Vk7FHqrNir2jbzQsN9GiijjqC
         j4h3tnLRGeJFnL74BniE57h4mB4Z1CoN9t0YcCu8y7MGxXqRGmQQVcltuPiaXXaWo6vY
         d0+y44N0lUfMCItGFvsbkGYezUAkQdbNCBZ9qGliEUmk/pFoiFXkwz+d6+knE8pFXj50
         B2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248789; x=1750853589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKGxDPrsrGFp0Bze86vZksL2+DNrY5eWcc4p55uZfLg=;
        b=Y6zwVHdbH2xgxBEOR+RRU/CUFxIPLp+tCRkrnLW4D/BJ6XhlZPreqx1+9FK9bNyTih
         N1/h7EZ+v5y4yOOFMqJmKNExLAjzpl3xSKYrdCrIHBKuM/GbEZH7wHJblnax0FAtaPG2
         DiuJloHRf+kLaICJ0XTfTT6hH08yyntG/FQb5Ar9VGenwagABxvOz26MTj1FuWoMhcCV
         hCHvU6Sqy8GDN3QmgI4Q3zDDga89mZKMC2lxNDmwhzisRaVgwM9YF58R2zCGSDF9kfuD
         5ZIPlroS50r9PlX2QuWdZaKz2P9Rx5WLvUg+lEOnbaSAM5eaqlJmwMrBkqgTa4ADi+zS
         XhOA==
X-Forwarded-Encrypted: i=1; AJvYcCW5uH2N8Z9fDvQTBLPL9DK3YgVwE5h1Zfe8TwG6xfC+mPKxRkDDCsfmRdGx0GIXxAy2bnJQxzP27fd/hlS0oggw@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAQppcsJn4fAAthQw8S2/ei/Q1brzV1xbh3+Sd0rMc+Baj4BX
	xUWVGXV3YlN8w7p/nAca0bYCT/xgUrjK+5lcYPsPw0yQLkwzWMDgeZ7DXMPZCWPGFqX6egX4FWI
	m1hToytE4ZCohzxZCP8ea5XrWVtUg93t6FR9l7max2w==
X-Gm-Gg: ASbGnctqcpW48XBTTUZGG+ZLLklr3RKvU0L8L+YHOznqXnn69+jx1mN6mpDklNkcuAV
	Xn73Nd3s8QGd3hKrW00ANGI45SfbXAhIMDhyUNCKVvU4s38YwN3teF0nRnl1N5Mq2pesZEd3Gdr
	rU4ckjUVDOct1KWTpM6qnhnz8H+qUt4iJUW79lrv0wLCs=
X-Google-Smtp-Source: AGHT+IGTSzjogHCi/geFRfkS1k64vxCFzHGvVMOvmRTwVeChVfJIOBt9QznhX1/YRhdAVy4BHCTh3ig3roxkOz/SlaA=
X-Received: by 2002:a17:907:fd18:b0:add:fa4e:8a7e with SMTP id
 a640c23a62f3a-adfad4104cemr1503686066b.32.1750248789286; Wed, 18 Jun 2025
 05:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617193450.183889-1-hiagofranco@gmail.com> <20250617193450.183889-4-hiagofranco@gmail.com>
In-Reply-To: <20250617193450.183889-4-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:12:31 +0200
X-Gm-Features: AX0GCFv-WhPn_WVjSMi4ptgdlE0BOC7_hZaPLP8zfqr856nDVAxKNS58yS5OlAM
Message-ID: <CAPDyKFq0EswFPF2nabJfQQ52D3Usy8AOUEH1WJWKsEhvOhO60w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 21:36, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> When the remote core is started before Linux boots (e.g., by the
> bootloader), the driver currently is not able to attach because it only
> checks for cores running in different partitions. If the core was kicked
> by the bootloader, it is in the same partition as Linux and it is
> already up and running.
>
> This adds power mode verification through dev_pm_genpd_is_on(), enabling
> the driver to detect when the remote core is already running and
> properly attach to it if all the power domain devices are on.
>
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), letting the platform device become a
> consumer of the power domain provider. With that the current power state
> of the genpds will not change, allowing the detection of the remote core
> power state.
>
> We enable and sync the device runtime PM during probe to make sure the
> power domains are correctly managed when the core is controlled by the
> kernel.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..b53083f2553e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>         struct device *dev = priv->dev;
> -       int ret;
> -       struct dev_pm_domain_attach_data pd_data = {
> -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> -       };
> +       int ret, i;
> +       bool detached = true;
>
>         /*
>          * If there is only one power-domain entry, the platform driver framework
> @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>         if (dev->pm_domain)
>                 return 0;
>
> -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +       /*
> +        * If all the power domain devices are already turned on, the remote
> +        * core is already up when the kernel booted (e.g. kicked by the
> +        * bootloader). In this case attach to it.
> +        */
> +       for (i = 0; i < ret; i++) {
> +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +                       detached = false;
> +                       break;
> +               }
> +       }
> +
> +       if (detached)
> +               priv->rproc->state = RPROC_DETACHED;
> +
>         return ret < 0 ? ret : 0;
>  }
>
> @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_enable(dev);
> +               ret = pm_runtime_resume_and_get(dev);
> +               if (ret) {
> +                       dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +                       goto err_put_clk;
> +               }
> +       }
> +
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>         struct rproc *rproc = platform_get_drvdata(pdev);
>         struct imx_rproc *priv = rproc->priv;
>
> +       if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(priv->dev);
> +               pm_runtime_put(priv->dev);
> +       }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>         imx_rproc_put_scu(rproc);
> --
> 2.39.5
>

