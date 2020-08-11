Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07385242226
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Aug 2020 23:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgHKV4a (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Aug 2020 17:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgHKV4a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 17:56:30 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9AFC06174A
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 14:56:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m34so7331481pgl.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 14:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KSa7Y7IFmVv3mPo6BtUixp64hBItc6LRmW/hEtkBP/8=;
        b=SZZwMK09c6YE5Th36KUSESm6urzpnMSjJjJf/Auw0TkpUO5rQYH0K8XSkYRhiFT7lY
         lPISzrK3iNb3gFkzwdeSxMiAK+S23rl53XWiOEBk+G8sUNcqdTmHf/kDM+8N2zTXfNq9
         RKlhu7LOX4psFqCzFZFSFQLlV8HrmhWa5WZd0KtFSgW89tSBXb5eqriSZuXY7DBkl97d
         lGfdxkkJMGPnOZACgA4dv6QRJpyfvTGZ2uwADXfmSdaTcVL3UfpkdmD4usppwBIcuIbq
         VkZrFWNeZ1flSFT1V4gXvEi1pFBIA/BpeuI1ouWOv1zl9OS3eUysNmq4C7bQ3F5SYRMy
         NdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSa7Y7IFmVv3mPo6BtUixp64hBItc6LRmW/hEtkBP/8=;
        b=bgGqF2EUpFhEwgCJN6T7rtNEL4jmUsdVdDgCko/4KokB6739ALKeTXJdiV5zWk8xQs
         Yfa84MyH42dp3n0QjeypKmhdFk8YAt1su0RWlkELFfAeaqvvA0zR/U4GQzafwFTWUJP0
         HgMKhTbk0n1io+xQnwqXlfGj+eCG3vRWXRaE4EdOMT6ze7eTC+K4i/y/3YRf9dnaN9bz
         r4EMJEXI4/HSngaBHigTW6Rsh+gq7KffXrAWwTNQOA8aoXsLCwkTneyE5KYaousotkSq
         K3XfSOsVfioDqHBPRcE99reD2K9329fEkJqqP8jYne79gTIL2aHVnAAACSjgeWHuBPm9
         tj4A==
X-Gm-Message-State: AOAM5336I+FTzCyCEaPODacBS3wJypCDYMir2zC3rDF+rKg8CK70eDrb
        Dz8xcuJdghTzAchkCVLKHvadQw==
X-Google-Smtp-Source: ABdhPJyvL8LIxyAqmktGwUDTb/A1q9zRIJh0/tD9FsMiEl83jMA8jHoq+HMPDX6TYyR0Ax3YuFMwMQ==
X-Received: by 2002:a63:db56:: with SMTP id x22mr2400831pgi.339.1597182988687;
        Tue, 11 Aug 2020 14:56:28 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t25sm56197pfe.76.2020.08.11.14.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:56:27 -0700 (PDT)
Date:   Tue, 11 Aug 2020 15:56:25 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 07/10] remoteproc: imx_rproc: add i.MX specific parse fw
 hook
Message-ID: <20200811215625.GC3370567@xps15>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-8-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724080813.24884-8-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 24, 2020 at 04:08:10PM +0800, Peng Fan wrote:
> The hook is used to parse memory-regions and load resource table
> from the address the remote processor published.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 99 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index c23726091228..43000a992455 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -11,6 +11,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -89,6 +90,7 @@ struct imx_rproc {
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
> +	void				*rsc_va;

Where is this used?

>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> @@ -251,6 +253,101 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  	return va;
>  }
>  
> +static int imx_rproc_mem_alloc(struct rproc *rproc,
> +			       struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va)) {
> +		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_mem_release(struct rproc *rproc,
> +				 struct rproc_mem_entry *mem)
> +{
> +	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_parse_memory_regions(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device_node *np = priv->dev->of_node;
> +	struct of_phandle_iterator it;
> +	struct rproc_mem_entry *mem;
> +	struct reserved_mem *rmem;
> +	int index = 0;
> +	u32 da;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while (of_phandle_iterator_next(&it) == 0) {
> +		rmem = of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			dev_err(priv->dev, "unable to acquire memory-region\n");
> +			return -EINVAL;
> +		}
> +
> +		/* No need to translate pa to da, i.MX use same map */
> +		da = rmem->base;
> +
> +		if (strcmp(it.node->name, "vdev0buffer")) {

Are you sure you will _always_ have a single vdev?  From the example you have
given to Oleksij it doesn't seem to be the case...

> +			/* Register memory region */
> +			mem = rproc_mem_entry_init(priv->dev, NULL,
> +						   (dma_addr_t)rmem->base,
> +						   rmem->size, da,
> +						   imx_rproc_mem_alloc,
> +						   imx_rproc_mem_release,
> +						   it.node->name);
> +
> +			if (mem)
> +				rproc_coredump_add_segment(rproc, da,
> +							   rmem->size);
> +		} else {
> +			/* Register reserved memory for vdev buffer alloc */
> +			mem = rproc_of_resm_mem_entry_init(priv->dev, index,
> +							   rmem->size,
> +							   rmem->base,
> +							   it.node->name);
> +		}
> +
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +		index++;
> +	}
> +
> +	return  0;
> +}
> +
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret = imx_rproc_parse_memory_regions(rproc);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = &rproc->dev;
> @@ -323,7 +420,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.stop		= imx_rproc_stop,
>  	.da_to_va       = imx_rproc_da_to_va,
>  	.load		= imx_rproc_elf_load_segments,
> -	.parse_fw	= rproc_elf_load_rsc_table,
> +	.parse_fw	= imx_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -- 
> 2.16.4
> 
