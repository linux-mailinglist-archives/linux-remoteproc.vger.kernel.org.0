Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB551A8581
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Apr 2020 18:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437779AbgDNQp0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 12:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437378AbgDNQpX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 12:45:23 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC062C061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 09:45:22 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id x26so122796pgc.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bIM8N8/LvpQrVw3Cq5IEnDXkTuqYiaSsOQsN3b3zp9w=;
        b=n3jABuwhvCUTwDvbdokhvvHmOWfvXvOaW9slpDLAgPOpeiUpANlh3tsDrH4SveCa5v
         R3o4dFVfsuL8WHXEOx3TKvspjlUoGvA7EQDJyDzYtJ7Qck47cH8LzKFD/TOe/AJtVfOD
         DO2E2uGB7nI0aLvtZIcNGvNZzo/ftOGWNdOf1e3OCzpNwsGdZiny73le4Rt0QMw+3ynR
         fVv2M66YbSGd7g7Y7HMR1NnVUQqyWVe8Fy/bp+/PG/J1mm00h4Gpo0wrL9OjaNoIsjFL
         jBVEtItzwuFI0aMi8QT2PtKR/ILNzB+ywKr100eMEJTEZqOzGuhHOVPMqgzily5ZAyVh
         6dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bIM8N8/LvpQrVw3Cq5IEnDXkTuqYiaSsOQsN3b3zp9w=;
        b=rzAQq34Bhoc0itAs6vYPOVXxeV7pR2+mhWfdcqJO0qaleTi9xg29bdGqdUkkbrvrtI
         QX7xquPoNxJbZNn+3FfsnT4QgbLnuSeuJr009ixzQmt/lVzj8u/sgrWIaD+JPAtgTbJv
         PUEDMCUTiD2pqKq7ETRRedu2qjJMORrNkKB6zASz6n3UVyOvcA+zCdg4FBz3eVch/bNr
         sag4enVXhmsnSTtIsyllx3LPi8QjdN8ACK65qV3ziCBS606G6PzfECdR6z1u7ADtnjZe
         Vu0zh3daCpdqaBid23beyPxQMz/rXrWhYMIf+Q6DC9MfnYf0dBBNQZV5ohebJlsH9FqF
         lJIQ==
X-Gm-Message-State: AGi0PuY/xkE14KouTHW7iNo0IfGvW4J8oT1qjfxkfXJjFXh4nsr8Jzef
        CPeLjQhX35UX0skgHYXLSoY6BA==
X-Google-Smtp-Source: APiQypJZ0HRJyudDZaLozPdnfUzCndzqy2Kxk5W5125ubT+th+3bvdCBfZ/HUivSNbNJ94/50agwUQ==
X-Received: by 2002:aa7:96b2:: with SMTP id g18mr24534864pfk.221.1586882722228;
        Tue, 14 Apr 2020 09:45:22 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j16sm9442623pgi.40.2020.04.14.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:45:21 -0700 (PDT)
Date:   Tue, 14 Apr 2020 10:45:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     nikita.shubin@maquefel.me
Cc:     Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: imx_rproc: set pc on start
Message-ID: <20200414164519.GA24061@xps15>
References: <20200304142628.8471-1-NShubin@topcon.com>
 <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-2-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406113310.3041-2-nikita.shubin@maquefel.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Nikita,

On Mon, Apr 06, 2020 at 02:33:08PM +0300, nikita.shubin@maquefel.me wrote:
> In case elf file interrupt vector is not supposed to be at OCRAM_S,
> it is needed to write elf entry point to OCRAM_S + 0x4, to boot M4
> firmware.
> 
> Otherwise firmware located anywhere besides OCRAM_S won't boot.
> 
> The firmware must set stack poiner as first instruction:
> 
> Reset_Handler:
>     ldr   sp, = __stack      /* set stack pointer */
> 
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>

The address in the SoB has to match what is found in the "From:" field of the
email header.  Checkpatch is complaining about that, something I would have
expected to be fixed before sending this set out.

> ---
>  drivers/remoteproc/imx_rproc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3e72b6f38d4b..bebc58d0f711 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -45,6 +45,8 @@
>  
>  #define IMX7D_RPROC_MEM_MAX		8
>  
> +#define IMX_BOOT_PC			0x4
> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -85,6 +87,7 @@ struct imx_rproc {
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
> +	void __iomem			*bootreg;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> @@ -162,11 +165,16 @@ static int imx_rproc_start(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> +	/* write entry point to program counter */
> +	writel(rproc->bootaddr, priv->bootreg);

What happens on all the other IMX systems where this fix is not needed?  Will
they continue to work properly?   

> +
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_start);
>  	if (ret)
>  		dev_err(dev, "Failed to enable M4!\n");
>  
> +	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> +
>  	return ret;
>  }
>  
> @@ -182,6 +190,9 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	if (ret)
>  		dev_err(dev, "Failed to stop M4!\n");
>  
> +	/* clear entry points */
> +	writel(0, priv->bootreg);
> +
>  	return ret;
>  }
>  
> @@ -243,7 +254,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
> -	.da_to_va       = imx_rproc_da_to_va,
> +	.da_to_va	= imx_rproc_da_to_va,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,

How is this useful?  Sure it will set rproc->bootaddr in rproc_fw_boot() but
what good does that do when it is invariably set again in imx_rproc_start() ? 

>  };
>  
>  static int imx_rproc_addr_init(struct imx_rproc *priv,
> @@ -360,6 +372,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_rproc;
>  	}
>  
> +	priv->bootreg = imx_rproc_da_to_va(rproc, IMX_BOOT_PC, sizeof(u32));
> +
>  	/*
>  	 * clk for M4 block including memory. Should be
>  	 * enabled before .start for FW transfer.
> -- 
> 2.25.1
> 
