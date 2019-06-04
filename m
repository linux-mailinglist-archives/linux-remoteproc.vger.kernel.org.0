Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F0033DCA
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Jun 2019 06:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfFDETu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Jun 2019 00:19:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59753 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFDETt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:19:49 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1hY0vK-0000ER-Mp; Tue, 04 Jun 2019 06:19:46 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1hY0vK-0008F5-4n; Tue, 04 Jun 2019 06:19:46 +0200
Date:   Tue, 4 Jun 2019 06:19:46 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: imx: Fix typo in "failed"
Message-ID: <20190604041946.hvmhcpwybpwn2hdk@pengutronix.de>
References: <20190603234628.10924-1-festevam@gmail.com>
 <20190603234628.10924-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603234628.10924-2-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:19:05 up 17 days, 10:37, 32 users,  load average: 0.00, 0.00,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 03, 2019 at 08:46:28PM -0300, Fabio Estevam wrote:
> There are several places where "failed" is spelled incorrectly.
> 
> Fix them all.

Thank you!

Reviewed-by:  Oleksij Rempel <o.rempel@pengutronix.de>

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 54c07fd3f204..7e0804c72677 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -168,7 +168,7 @@ static int imx_rproc_start(struct rproc *rproc)
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_start);
>  	if (ret)
> -		dev_err(dev, "Filed to enable M4!\n");
> +		dev_err(dev, "Failed to enable M4!\n");
>  
>  	return ret;
>  }
> @@ -183,7 +183,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
> -		dev_err(dev, "Filed to stop M4!\n");
> +		dev_err(dev, "Failed to stop M4!\n");
>  
>  	return ret;
>  }
> @@ -206,7 +206,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  		}
>  	}
>  
> -	dev_warn(priv->dev, "Translation filed: da = 0x%llx len = 0x%x\n",
> +	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
>  		 da, len);
>  	return -ENOENT;
>  }
> @@ -352,7 +352,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	ret = imx_rproc_addr_init(priv, pdev);
>  	if (ret) {
> -		dev_err(dev, "filed on imx_rproc_addr_init\n");
> +		dev_err(dev, "failed on imx_rproc_addr_init\n");
>  		goto err_put_rproc;
>  	}
>  
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
