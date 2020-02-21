Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8103716899F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Feb 2020 22:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgBUV4I (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 21 Feb 2020 16:56:08 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46715 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgBUV4I (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Feb 2020 16:56:08 -0500
Received: by mail-pl1-f194.google.com with SMTP id y8so1417660pll.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2020 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4R75gLHGBZqI7rZdCrlVgn8bgkA+VU53aPQUf73iw7U=;
        b=I+k7ayqyClm2D7rCoFnih/D2ZbHNrdAKdYMiZsgvr3/8YQ/PswRNV+Ag8sRHA13Fl8
         5GG8QlXX8xyyeg5ZjML/PN3ZnZkcLGTfRc/qeTqLurZJVoPF9IvmFmBJjKScrnuS1Zmg
         Hu9BLmU8x4oXbNU9LW3fVSWW2PSr2sv8KWZRRwkrq0WsIuz8/eHaMACRA9dYAeoldwrV
         QbfLzPGYYw37ekbgDnKPEDSezIlGU0+4XzToj6Be+f0qtzwzMxZvnjLwVQS8sh9Osuoq
         eE7m4SGh5fiyElgoHNhVF1/uU3j79QFd6L0vzHwZjGLSRbvCdZz6xHq1invHhlCy+Nsj
         vpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4R75gLHGBZqI7rZdCrlVgn8bgkA+VU53aPQUf73iw7U=;
        b=oS/D6O+6eGQljv23kSWUzcqA+kfYEbMFrCHOZ1VBV1aZYrwuocxR202gHo+RSob5vU
         ca9mesoTtRV9bhOFa5tvAF67Y5eIZ3HXZlNgjLYPCrEsgupvUwnnOLNakL0DePk0gZOf
         T2cKHLFuBTRCipEXNcyf8D1SR1jC05xUbcGKEynvKwZ6juZP/YxO3PgRxjMEM/krGdi4
         9ok1zlu3EwZByljM/HIxHqU9TNrjwZLjtLSjadb3BM+XzVClX1kpJT64V7BK60qlcAIc
         nxqLGQiE+h0BsWfu+pnW4uC1Ha4taUXTk2V/X/btYMfNn7PlI33ypEMd8fTSFwbaRtLx
         2CRw==
X-Gm-Message-State: APjAAAVdVEGB53MsEAG6jgczb6W4LSxuRQKgblMx9hJq0os6X4I99Q7M
        JVrTU/3pB0ddheFb+bEdsOBsBA==
X-Google-Smtp-Source: APXvYqzBIUmw7IC4MYwzkgRvIoSRfaSA2ePp8ibxXugv7bCVL8F2ywUMJumZw5ngey7+HU21z3EjsA==
X-Received: by 2002:a17:902:8545:: with SMTP id d5mr36651230plo.116.1582322167908;
        Fri, 21 Feb 2020 13:56:07 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id h26sm3931993pfr.9.2020.02.21.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 13:56:07 -0800 (PST)
Date:   Fri, 21 Feb 2020 14:56:05 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] remoteproc: imx_rproc: parse early-booted property
Message-ID: <20200221215605.GC10368@xps15>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-6-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582097265-20170-6-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Feb 19, 2020 at 03:27:41PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> If early-property exists, there is no need to check syscon.
> Just mark early_boot as true.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b9fabe269fd2..e31ea1090cf3 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -483,7 +483,9 @@ static int imx_rproc_configure_mode(struct imx_rproc *priv)
>  	int ret;
>  	u32 val;
>  
> -	if (of_get_property(dev->of_node, "early-booted", NULL)) {
> +	if (dcfg->variants == IMX7ULP) {

Where does dcfg->variants comes from?  

This patch doesn't compile, nor does the one before it.  I will not review
another patchset like that. 

> +		priv->early_boot = true;
> +	} else if (of_get_property(dev->of_node, "early-booted", NULL)) {
>  		priv->early_boot = true;
>  	} else {
>  		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
> @@ -509,15 +511,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	struct rproc *rproc;
>  	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg;
> -	struct regmap *regmap;
> +	struct regmap *regmap = NULL;
>  	int ret;
>  
> -	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> -	if (IS_ERR(regmap)) {
> -		dev_err(dev, "failed to find syscon\n");
> -		return PTR_ERR(regmap);
> +	if (!of_get_property(np, "early-booted", NULL)) {
> +		regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> +		if (IS_ERR(regmap)) {
> +			dev_err(dev, "failed to find syscon\n");
> +			return PTR_ERR(regmap);
> +		}
> +		regmap_attach_dev(dev, regmap, &config);
>  	}
> -	regmap_attach_dev(dev, regmap, &config);
>  
>  	/* set some other name then imx */
>  	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> -- 
> 2.16.4
> 
