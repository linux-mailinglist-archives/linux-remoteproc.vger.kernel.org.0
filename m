Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6C4249052
	for <lists+linux-remoteproc@lfdr.de>; Tue, 18 Aug 2020 23:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgHRVny (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 18 Aug 2020 17:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRVny (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Aug 2020 17:43:54 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1173C061389
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2020 14:43:53 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f5so9818801plr.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2020 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ku6KRkFjfvYlI41FcPQR/35V9YSvyUi25iV14BtdfTo=;
        b=n2mYV4p9IDfmqgRCbcPjkKKpofadfqoeYOUODnu9wLy3BfSqePwJUViC/LWoyxN9kr
         mT05BiIcbp1/n4ERJw/glSMLMmofsfin9KK7EfX6eyNi5fkeuF/vF0uk3X4Ok76wOW2B
         EGQr7JL5zLQVgtRilrwXZ66vdZPS5pJdyqqp81X70Q/UaWva5XgoIHll37nSLopD5gC7
         sinZLqUerV84mEVE/Nk+10waDSu8uJSJUi1Brd4BrZskzzWRtee4mggIekT526wfJe27
         XrgghLiG3AQm60+mb13Qcl2h36JU32NSO4XZB+vonSWKiO8R9fN7StajWhAduSKXDqKv
         ke0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ku6KRkFjfvYlI41FcPQR/35V9YSvyUi25iV14BtdfTo=;
        b=TQcjFVpB0BTgUSAX+cyogzPM2zNtU/YgfaHYSpdmDRR1ww/+7OZMoRq3PjHWOvgNu4
         iCOI7RHIK2dGsQMaSlNdWi6Rd6k4LuJH2ODvaKSSjpE0JnJ9GOw2xf5OygVr9PL942mT
         3K6pKjnCuECmF8HIRb6MX8jW9MXAfbW/MUKoieDR8v3HG3ydWKlwzm4h8omUbKq3xcEE
         clW/rovxw1i8pDFHPfECXOPHcjDx387DIpCUexhINIiqbdv3VNf+Oiy2hU8ola5/65FM
         44kx1k1F4K6v+7+qomhY4cJPesA7DzyEQsgkPDCUSx8cXKNOPWFOWC24HAECEGXTpXLU
         49og==
X-Gm-Message-State: AOAM533FLoqh4iLAUDSUxDDFE0FPd6Qv4vyVa2zQorZPBEu+2NMScWgt
        a8Ct7NngDYKE171JrBx8KdfASQ==
X-Google-Smtp-Source: ABdhPJwmdpgyw9mEmAXbMYiRDQ8V3OY0KY5mMDjghqQUNBoJNX0dpUf6Nixy/ZLbKq8JofeU879cpQ==
X-Received: by 2002:a17:90a:b88c:: with SMTP id o12mr1458935pjr.187.1597787033141;
        Tue, 18 Aug 2020 14:43:53 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f3sm26170676pfj.206.2020.08.18.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:43:52 -0700 (PDT)
Date:   Tue, 18 Aug 2020 15:43:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 04/10] remoteproc: imx_rproc: make syscon optional
Message-ID: <20200818214350.GA3822080@xps15>
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

Hi Peng,

On Fri, Jul 24, 2020 at 04:08:07PM +0800, Peng Fan wrote:
> Make syscon optional, since i.MX8QM/QXP/7ULP not have SRC to control M4.
> But currently i.MX8QM/QXP/7ULP not added, so still check regmap
> when start/stop to avoid unhappy things.

On the i.MX8QM/QXP/7ULP processors, the remote processors are not handled by the
remoteproc cores, as implemented in this patch.  In such a scenario how does the
remoteproc core know the remote processor has crashed and how does it recover
from such a condition?

Thanks,
Mathieu

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
>  	}
> -	regmap_attach_dev(dev, regmap, &config);
>  
>  	/* set some other name then imx */
>  	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> -- 
> 2.16.4
> 
