Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D937242292
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Aug 2020 00:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgHKWkd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Aug 2020 18:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgHKWkd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 18:40:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DF0C061787
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 15:40:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p37so8611pgl.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 15:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oHyQTUvTUFNtPnfXB354eAFfqwmcdKEgh8qUciOM6ac=;
        b=Q+Mr4NjN6PyImpPTNKKWFG/Z5AoMhj9JWM8jtgqV/wwe3AMGAtvjfyZBX6qbvMR4gS
         jEE2gjM7SLo/oV7nYKYoE7s3SXRHNKUYSy71EhTAdC4vlNHYTXhjzxm8D16lKWy/9VP0
         6GxhrytItisbuM1vsjS+C6vACracgq2Lu0gS5ePRWJayQXP8eBWqh4JOwgm/HnHHIoZs
         adEqh/yuqxIdRaMkkMYVlk26ATTJQogmOkk3f2Jo0i+1j/1ewgf1n84x6ace81t5P2ks
         D1v20OwnPrvV+L/Yunwv3j/HGI1tXyUYeNGTmircrYjn6G3f0UI70CIc57DEjbCFxUHL
         YJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oHyQTUvTUFNtPnfXB354eAFfqwmcdKEgh8qUciOM6ac=;
        b=cadsbXG7NenCnzhT0I82tZEdvFwUD8jH2GQCjATv1futGgK0FHqmsKlz+pL0IB63VV
         ii0CLhFE7iSiJ9GIhEmt5+NOGTRGXwQiO2N/hN8CssoRvpo+YAcRTcnPeX14y/Wo+mA7
         QabxELOCUaF3J3FHUIpq1G0xNfvVXr4TjRu8d0qQKaSL4HrCr1G0bAscwiKdpun0yALF
         jrigpcH/56HGcEnU0u02ERm+0Qu9EJzipV4oqZu0afOgS1GhLzw/Ct9nQUDavFgEPm/R
         cfPg4A/9QjUc/isBNDBKjieLXG8Z35Pi3zIriMaKTbVDEV8LPTAMXtI6LOb8dw/tnQH4
         rzwQ==
X-Gm-Message-State: AOAM53289JkX7MhXDZjg93/f5v/GQXRhWSmpT47aXdd0GYwAtkhDOd/o
        3ll02mhtC77FyjS5AemmrGB3B8lBZps=
X-Google-Smtp-Source: ABdhPJxZbnhyHXEuAi6bn+/WtHF0uq2xziDKvJZWF/LkfqD8tkRi5PWfAoTWSGeKiZbvWFHQfirOrA==
X-Received: by 2002:a62:6186:: with SMTP id v128mr8416919pfb.211.1597185632526;
        Tue, 11 Aug 2020 15:40:32 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x136sm115500pfc.28.2020.08.11.15.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 15:40:31 -0700 (PDT)
Date:   Tue, 11 Aug 2020 16:40:29 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 04/10] remoteproc: imx_rproc: make syscon optional
Message-ID: <20200811224029.GE3370567@xps15>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-5-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724080813.24884-5-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 24, 2020 at 04:08:07PM +0800, Peng Fan wrote:
> Make syscon optional, since i.MX8QM/QXP/7ULP not have SRC to control M4.
> But currently i.MX8QM/QXP/7ULP not added, so still check regmap
> when start/stop to avoid unhappy things.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 82594a800a1b..4fad5c0b1c05 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -162,6 +162,9 @@ static int imx_rproc_start(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> +	if (!priv->regmap)
> +		return -EOPNOTSUPP;

Proceeding this way is hard to maintain.  I would perfer to add specific
operations based on the scenario or coprocessor we are working with.

> +
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_start);
>  	if (ret)
> @@ -177,6 +180,9 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> +	if (!priv->regmap)
> +		return -EOPNOTSUPP;
> +
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
> @@ -325,9 +331,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
>  	if (IS_ERR(regmap)) {
>  		dev_err(dev, "failed to find syscon\n");
> -		return PTR_ERR(regmap);
> +		regmap = NULL;
> +	} else {
> +		regmap_attach_dev(dev, regmap, &config);

Here you are altering how all the existing implemenation are currently working.
Add a new field to imx_rproc_dcfg and based on that, determine if a regmap is
mandatory or not.

>  	}
> -	regmap_attach_dev(dev, regmap, &config);
>  
>  	/* set some other name then imx */
>  	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> -- 
> 2.16.4
> 
