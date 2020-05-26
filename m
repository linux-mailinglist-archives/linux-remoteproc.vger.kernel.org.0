Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D901A4B27
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 Apr 2020 22:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDJUaK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 Apr 2020 16:30:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40590 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJUaK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Apr 2020 16:30:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so1002729plk.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2020 13:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wm2I/9l0ZSUtMU6eFNvpKjwD13hR3fJP0erslNTJ0Rg=;
        b=BJOWgcJrTwuu4yNHFjFMhQ5w2wbQTBX7TzJS6iJpWfMTmQNbTDG0bi0tcJ1aX1qIp8
         ILfrFF8WrCxWwSiiOSquAOwGijGqfrgSiwZmu2mb7K5It0Pf8ENWd6UHYjqAbQXb+aDl
         lyVguT9UGyfrsTxyvySlBfwwOTxE7Xp8wi+fCc/DOxfduwXyY2jbpVcx18WklFPiUFT9
         dnaXzRj/kb9CneXKVz62cNHYGfuG5fnNMA8oU5m96Q6zU24DC5Td7pdm/S/x8JAlDrIF
         VyUp+ZljwzyoJC5QS62DDju6HX1USH7RBD6VlWi4KnET+xfQ4iaHguoX/6YOJ5z52oAk
         Qukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wm2I/9l0ZSUtMU6eFNvpKjwD13hR3fJP0erslNTJ0Rg=;
        b=Byo1nMRLge6A2wgN4T84G4MHGTt+H4u/tZIAcN/aZPVSRDFZMADEQGd6BSkj28y/cU
         52zAtvf+pdlaBHFlZjcWBeRjjmzTS4lWK2/0Bjfzx1DHe63EtsKSOtGSfJ65i7Ug8i9L
         RmIyoRUywG/DuvAXE/bwIiADQxC+cenC0fYQYmXsY7rdmn7cGcftyKjRDRhzAmTiZbzc
         4P2BbSVYFsXpw4rQk6vBfbaXnTlVNUknLwpXWK8iupKIjOhXjkxZF3rlJo2VZRz4wVKo
         mLd9wPpmHf+NncAfSV+HFogxGlF4k6bvZDcZ8tbkX2O37GOsXUsrp3aXtMB5hGrpyFRJ
         TR6A==
X-Gm-Message-State: AGi0PubaqkIsMiW97FGPzlu0LeHP2H9eA6INr+LfMgl2mWc5sXbxwaWu
        7EpoMwrnyvKN8IvHCkP8pb4qqg==
X-Google-Smtp-Source: APiQypK69YgPl3Ql4HrQ0ELNvGRN1zb1pV0YmESscULM4GxocFCj0uNA8hsUMMwivEMYpP4RG6Bphw==
X-Received: by 2002:a17:90b:1b05:: with SMTP id nu5mr7416590pjb.110.1586550609349;
        Fri, 10 Apr 2020 13:30:09 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i14sm2267175pgh.47.2020.04.10.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:30:08 -0700 (PDT)
Date:   Fri, 10 Apr 2020 14:30:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] remoteproc/k3-r5: Add loading support for on-chip
 SRAM regions
Message-ID: <20200410203006.GA9146@xps15>
References: <20200324201819.23095-1-s-anna@ti.com>
 <20200324201819.23095-8-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324201819.23095-8-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 24, 2020 at 03:18:19PM -0500, Suman Anna wrote:
> The K3 SoCs has various internal on-chip SRAM memories like the SRAM
> within the MCU domain or the shared MSMC RAM within NavSS that can be
> used for multiple purposes. One such purpose is to have the R5F cores
> use a portion of such on-chip SRAM for fast-access data or to directly
> execute code.
> 
> Add support to the K3 R5 remoteproc driver to parse and support
> loading into such memories. The SRAM regions need to be mapped as
> normal non-cacheable memory to avoid kernel crashes when the remoteproc
> loader code uses the Arm64 memset library function (the "DC ZVA"
> instruction throws a alignment fault on device type memory).
> 
> These SRAM regions are completely optional as not all firmware images
> require these memories, and any such memory has to be reserved as such
> in the DTS files.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 106 ++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 8c9b7ae5d8b7..0ae0b66ec9eb 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -85,7 +85,9 @@ struct k3_r5_cluster {
>   * @dev: cached device pointer
>   * @rproc: rproc handle representing this core
>   * @mem: internal memory regions data
> + * @sram: on-chip SRAM memory regions data
>   * @num_mems: number of internal memory regions
> + * @num_sram: number of on-chip SRAM memory regions
>   * @reset: reset control handle
>   * @tsp: TI-SCI processor control handle
>   * @ti_sci: TI-SCI handle
> @@ -99,7 +101,9 @@ struct k3_r5_core {
>  	struct device *dev;
>  	struct rproc *rproc;
>  	struct k3_r5_mem *mem;
> +	struct k3_r5_mem *sram;
>  	int num_mems;
> +	int num_sram;
>  	struct reset_control *reset;
>  	struct ti_sci_proc *tsp;
>  	const struct ti_sci_handle *ti_sci;
> @@ -585,6 +589,18 @@ static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  		}
>  	}
>  
> +	/* handle any SRAM regions using SoC-view addresses */
> +	for (i = 0; i < core->num_sram; i++) {
> +		dev_addr = core->sram[i].dev_addr;
> +		size = core->sram[i].size;
> +
> +		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
> +			offset = da - dev_addr;
> +			va = core->sram[i].cpu_addr + offset;
> +			return (__force void *)va;
> +		}
> +	}
> +
>  	/* handle static DDR reserved memory regions */
>  	for (i = 0; i < kproc->num_rmems; i++) {
>  		dev_addr = kproc->rmem[i].dev_addr;
> @@ -1017,6 +1033,77 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>  	return ret;
>  }
>  
> +static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
> +					   struct k3_r5_core *core)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *sram_np;
> +	struct resource res;
> +	int num_sram;
> +	int i, ret;
> +
> +	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
> +	if (num_sram <= 0) {
> +		dev_dbg(dev, "device does not use reserved on-chip memories, num_sram = %d\n",
> +			num_sram);
> +		return 0;
> +	}
> +
> +	core->sram = kcalloc(num_sram, sizeof(*core->sram), GFP_KERNEL);
> +	if (!core->sram)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_sram; i++) {
> +		sram_np = of_parse_phandle(np, "sram", i);
> +		if (!sram_np) {
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +
> +		if (!of_device_is_available(sram_np)) {
> +			of_node_put(sram_np);
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +
> +		ret = of_address_to_resource(sram_np, 0, &res);
> +		of_node_put(sram_np);
> +		if (ret) {
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +		core->sram[i].bus_addr = res.start;
> +		core->sram[i].dev_addr = res.start;
> +		core->sram[i].size = resource_size(&res);
> +		core->sram[i].cpu_addr = ioremap_wc(res.start,
> +						    resource_size(&res));
> +		if (!core->sram[i].cpu_addr) {
> +			dev_err(dev, "failed to parse and map sram%d memory at %pad\n",
> +				i, &res.start);
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +
> +		dev_dbg(dev, "memory    sram%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",

s/"memory    sram%d:..."/"memory sram%d:..."

With the above:
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

I am done reviewing this set.  Despite the significant amount of material to
process and the comments here and there, I haven't found anything to really
complain about.

Thanks,
Mathieu

> +			i, &core->sram[i].bus_addr,
> +			core->sram[i].size, core->sram[i].cpu_addr,
> +			core->sram[i].dev_addr);
> +	}
> +	core->num_sram = num_sram;
> +
> +	return 0;
> +
> +fail:
> +	for (i--; i >= 0; i--) {
> +		if (core->sram[i].cpu_addr)
> +			iounmap(core->sram[i].cpu_addr);
> +	}
> +	kfree(core->sram);
> +
> +	return ret;
> +}
> +
>  static
>  struct ti_sci_proc *k3_r5_core_of_get_tsp(struct device *dev,
>  					  const struct ti_sci_handle *sci)
> @@ -1048,7 +1135,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct k3_r5_core *core;
> -	int ret, ret1;
> +	int ret, ret1, i;
>  
>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
> @@ -1125,10 +1212,23 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>  		goto err_intmem;
>  	}
>  
> +	ret = k3_r5_core_of_get_sram_memories(pdev, core);
> +	if (ret) {
> +		dev_err(dev, "failed to get sram memories, ret = %d\n", ret);
> +		goto err_sram;
> +	}
> +
>  	platform_set_drvdata(pdev, core);
>  
>  	return 0;
>  
> +err_sram:
> +	for (i = 0; i < core->num_mems; i++) {
> +		devm_iounmap(dev, core->mem[i].cpu_addr);
> +		devm_release_mem_region(dev, core->mem[i].bus_addr,
> +					core->mem[i].size);
> +	}
> +	devm_kfree(dev, core->mem);
>  err_intmem:
>  	ret1 = ti_sci_proc_release(core->tsp);
>  	if (ret1)
> @@ -1156,6 +1256,10 @@ static int k3_r5_core_of_exit(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int i, ret;
>  
> +	for (i = 0; i < core->num_sram; i++)
> +		iounmap(core->sram[i].cpu_addr);
> +	kfree(core->sram);
> +
>  	for (i = 0; i < core->num_mems; i++) {
>  		devm_release_mem_region(dev, core->mem[i].bus_addr,
>  					core->mem[i].size);
> -- 
> 2.23.0
> 
