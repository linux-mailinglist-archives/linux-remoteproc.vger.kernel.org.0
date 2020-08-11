Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE5C242286
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Aug 2020 00:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgHKWgK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Aug 2020 18:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgHKWgK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 18:36:10 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82088C061788
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 15:36:10 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f193so8374814pfa.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 15:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NkYRx4/ZG2Q0QWAEpLU2Ox3xJdzy2ahB40sNIbmmTHc=;
        b=uVa1fQYkZO9T9K/2sE4cHh8RUIwT1GD2ivEXRErDwZEzwC4vpUWLJ9YQ6LJXTTiVaN
         9FZaTkolnEWSWV06eMYCeW9xAZKSlb0K49JRqSlvlKLNy7olJpF/yCiUd0QBwmmxu3GQ
         DcHu0QGWOWaEHuvyCm/AYZCGfyjBXpG/N5sXis4RkaVHN4V3gX5p7FOJ23RHs4cMgSjT
         G3lgXpDL4EKdiTOiTwnrR4YbdjLo1Ir9OG26K5qqGrXZHFLFvDk/MARaTym/4+R7+z3g
         YRJ+JVoNHPq8fDbXAiZ58issriOmYUpHYh6fLGTpLDmpDXp5yFMhgilhsVNuwvgHC/iX
         7LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NkYRx4/ZG2Q0QWAEpLU2Ox3xJdzy2ahB40sNIbmmTHc=;
        b=e4tTGeNvrb5Z8jtcPlnCG8jHZ2rpojrH2tENtwLHbDShZuKfHCjrFUWj1ZUKWo5gfb
         1pVKscm2Z+j3xz8YrS55Ht4V3lmOPSkWxU3KSgVxCyPhSPV3IUCaJOiHr/YRYlGII4R+
         TCUDJU/uu/a2ATKR2DEhf3A1K+NwEGgbkYYh+c1FU28RVAFn17rlFv+Lc0ikYEro5snC
         TFKytUYK+A2ovGz4rBXsleLj1M+UEK8TuQpcNh1xkKPLD69GAs2VjAFfH5RVbsSyunlV
         Ax+PRMRUAT/+u0jerNgui53C24QMtSM9rgfrPT0+YPbNGW5jB4NOL2sbadJqaTD70vE6
         JSCQ==
X-Gm-Message-State: AOAM532shphg9ks5ZU4FV23+TLus7xbozglDsm6jupAf9V6/DqoD/mZ3
        kIjADYd2/CBekBPJDssmuLXtsw==
X-Google-Smtp-Source: ABdhPJx1R+JFmJ8axTcy313Lfge8vVvJXrGuoAYojlYq2QVj/OdQRi/f7Nczs8GvglrXaHMtI2Ox8w==
X-Received: by 2002:a63:4b5c:: with SMTP id k28mr2482194pgl.356.1597185369649;
        Tue, 11 Aug 2020 15:36:09 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 3sm30153pjo.40.2020.08.11.15.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 15:36:09 -0700 (PDT)
Date:   Tue, 11 Aug 2020 16:36:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 10/10] remoteproc: imx_rproc: support coproc booting
 before Linux
Message-ID: <20200811223606.GD3370567@xps15>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-11-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724080813.24884-11-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 24, 2020 at 04:08:13PM +0800, Peng Fan wrote:
> Detect Coproc booted or not and Parse resource table
> Set remoteproc state to RPROC_DETACHED when M4 is booted early
> Add attach hook
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 75 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a8ce97c04e1e..0863b3162777 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -91,6 +91,7 @@ struct imx_rproc {
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
> +	bool				early_boot;
>  	void				*rsc_va;
>  	struct mbox_client		cl;
>  	struct mbox_chan		*tx_ch;
> @@ -235,6 +236,8 @@ static int imx_rproc_stop(struct rproc *rproc)
>  				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
>  		dev_err(dev, "Failed to stop M4!\n");
> +	else
> +		priv->early_boot = false;
>  
>  	return ret;
>  }
> @@ -390,6 +393,32 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static int imx_rproc_get_loaded_rsc_table(struct device *dev,
> +					  struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device_node *np = dev->of_node;
> +	u32 da;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "rsc-da", &da);

As Rob pointed out I don't think there is a need to invent a new bindings for
this.  It could simply be a memory region that is looked up with a name.

> +	if (!ret)
> +		priv->rsc_va = rproc_da_to_va(rproc, (u64)da, SZ_1K);
> +	else
> +		return 0;
> +
> +	if (!priv->rsc_va) {
> +		dev_err(priv->dev, "no map for rsc-da: %x\n", da);
> +		return PTR_ERR(priv->rsc_va);
> +	}
> +
> +	rproc->table_ptr = (struct resource_table *)priv->rsc_va;
> +	rproc->table_sz = SZ_1K;
> +	rproc->cached_table = NULL;
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = &rproc->dev;
> @@ -472,9 +501,15 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  			__func__, vqid, err);
>  }
>  
> +static int imx_rproc_attach(struct rproc *rproc)
> +{
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
> +	.attach		= imx_rproc_attach,
>  	.kick		= imx_rproc_kick,
>  	.da_to_va       = imx_rproc_da_to_va,
>  	.load		= imx_rproc_elf_load_segments,
> @@ -609,6 +644,36 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
>  	return ret;
>  }
>  
> +static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);

Patch 04 made it possible for priv->regmap to be NULL and as far as I can see
there is no further check on the value of ->regmap before we get to this
function.

> +	if (ret) {
> +		dev_err(dev, "Failed to read src\n");
> +		return ret;
> +	}
> +
> +	priv->early_boot = !(val & dcfg->src_stop);

Please add a comment that describe the condition.  As much as I try guessing
the relation between ->src_stop and an already booted co-processor I come out
short. 

> +
> +	if (priv->early_boot) {

I don't see a need for ->early_boot, please re-arrange the code in
imx_rproc_probe() to avoid needing yet an extra variable. 

> +		priv->rproc->state = RPROC_DETACHED;
> +
> +		ret = imx_rproc_parse_memory_regions(priv->rproc);
> +		if (ret)
> +			return ret;
> +
> +		ret = imx_rproc_get_loaded_rsc_table(dev, priv->rproc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -661,6 +726,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_mbox;
>  	}
>  
> +	ret = imx_rproc_detect_mode(priv);
> +	if (ret)
> +		goto err_put_mbox;
> +
>  	priv->clk = devm_clk_get_optional(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
> @@ -689,7 +758,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_put_clk:
> -	clk_disable_unprepare(priv->clk);
> +	if (!priv->early_boot)
> +		clk_disable_unprepare(priv->clk);
>  err_put_mbox:
>  	if (!IS_ERR(priv->tx_ch))
>  		mbox_free_channel(priv->tx_ch);
> @@ -706,7 +776,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	clk_disable_unprepare(priv->clk);
> +	if (!priv->early_boot)
> +		clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	rproc_free(rproc);
>  
> -- 
> 2.16.4
> 
