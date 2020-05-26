Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43111DF144
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 May 2020 23:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731116AbgEVVds (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 22 May 2020 17:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731051AbgEVVdr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 May 2020 17:33:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A495DC05BD43
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2020 14:33:47 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d10so5608554pgn.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2020 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vnJaM9mjGMcjKTst6k/o3Ihj9HZ6TC5CC7vbAyogCSY=;
        b=gS/ExEIiDtjoGGjCcG3305CaMh103RezZNkXU3aHVPnKd5+eLcok+/XnrJQVP8k8D/
         ASTGzGL4j6yxCBU0nzdQdrguYJ8pig73rSLb6pyQpvenkK09745zNJhKQ+c2zky94tCv
         v8oBt7gfzWkaurS59FibnG96QTBV6ZaiAmPLxA5Qv9EDCTLvXJZf5JYZOj4Y5LPjQiuh
         /RvnYrrKfetInoJY+CKVDX3zxwkZsz6aPYfWUqAqcuNi0vCZvB01UQtUPX84t9YMT7eQ
         oCLbVvHwOmQxAxnpLO8qq/ve0pTCJdrnw2WubtmE8G5mL3wfU+lcSk+oS1fRsTlObZij
         wswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vnJaM9mjGMcjKTst6k/o3Ihj9HZ6TC5CC7vbAyogCSY=;
        b=tRVsG2Z2fDypekQ8MxWDeWzyOreBcZsnsB7MM4PkvOZSP7nKwOciasgf+BdWyPULHJ
         s5aLTyUtJbcgZBN8ON3RQRfsvHxACYy0easaTRUdyIybj/bTjagf+gEK/1We+oHSrc1b
         Mw0j+LY/9Ue0K0i9PK0+IA7zKMGK3oNEd9amH6T9dVawmLk+PdQrRqpHsQw+FEBN5WTw
         rqYBWY/vA/rvmAV+awMjhkqn2emuuOsyeBoAnI+Ftsqk5/tF74LC3RQVjtJATUTlWqJx
         4Nx1wbtdzOnzKTTApFCAYVEa8sngb9dUal3E4cYhKSoj3RNpJ4HBFGzWDvhrqvW2zA5r
         WeEg==
X-Gm-Message-State: AOAM5305r6ikwy2ekFye/2U1JE/2NEBp60wq5mH61cmXSmlStgXcLoNW
        Cxp4Pa8vGRLlJCuujVUaFUF2knDWWCo=
X-Google-Smtp-Source: ABdhPJxb3WVhC7sqMLz9svrvmKcYbNBtNNyJGOtl2G6PBnpJ+ZPuVc4zaUnWC6bhyU3Y+7wji+YEzQ==
X-Received: by 2002:a62:5214:: with SMTP id g20mr6053245pfb.132.1590183227091;
        Fri, 22 May 2020 14:33:47 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m12sm7542813pjs.41.2020.05.22.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 14:33:46 -0700 (PDT)
Date:   Fri, 22 May 2020 15:33:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc/k3-dsp: Add support for C71x DSPs
Message-ID: <20200522213344.GA19117@xps15>
References: <20200521151636.28260-1-s-anna@ti.com>
 <20200521151636.28260-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521151636.28260-3-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 21, 2020 at 10:16:36AM -0500, Suman Anna wrote:
> The Texas Instrument's K3 J721E SoCs have a newer next-generation
> C71x DSP Subsystem in the MAIN voltage domain in addition to the
> previous generation C66x DSP subsystems. The C71x DSP subsystem is
> based on the TMS320C71x DSP CorePac module. The C71x CPU is a true
> 64-bit machine including 64-bit memory addressing and single-cycle
> 64-bit base arithmetic operations and supports vector signal processing
> providing a significant lift in DSP processing power over C66x DSPs.
> J721E SoCs use a C711 (a one-core 512-bit vector width CPU core) DSP
> that is cache coherent with the A72 Arm cores.
> 
> Each subsystem has one or more Fixed/Floating-Point DSP CPUs, with 32 KB
> of L1P Cache, 48 KB of L1D SRAM that can be configured and partitioned as
> either RAM and/or Cache, and 512 KB of L2 SRAM configurable as either RAM
> and/or Cache. The CorePac also includes a Matrix Multiplication Accelerator
> (MMA), a Stream Engine (SE) and a C71x Memory Management Unit (CMMU), an
> Interrupt Controller (INTC) and a Powerdown Management Unit (PMU) modules.
> 
> Update the existing K3 DSP remoteproc driver to add support for this C71x
> DSP subsystem. The firmware loading support is provided by using the newly
> added 64-bit ELF loader support, and is limited to images using only
> external DDR memory at the moment. The L1D and L2 SRAMs are used as scratch
> memory when using as RAMs, and cannot be used for loadable segments. The
> CMMU is also not supported to begin with, and the driver is designed to
> treat the MMU as if it is in bypass mode.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: 
>  - k3_dsp_rproc_prepare/unprepare plugged in dynamically based on local reset,
>    C71x doesn't use local resets
>  - Dropped the sanity_check ops override, not needed on latest codebase
> v1: https://patchwork.kernel.org/patch/11458595/
> 
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 610fbbf85ee6..2dbed316b6ac 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -406,8 +406,6 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  }
>  
>  static const struct rproc_ops k3_dsp_rproc_ops = {
> -	.prepare	= k3_dsp_rproc_prepare,
> -	.unprepare	= k3_dsp_rproc_unprepare,
>  	.start		= k3_dsp_rproc_start,
>  	.stop		= k3_dsp_rproc_stop,
>  	.kick		= k3_dsp_rproc_kick,
> @@ -617,6 +615,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  
>  	rproc->has_iommu = false;
>  	rproc->recovery_disabled = true;
> +	if (data->uses_lreset) {
> +		rproc->ops->prepare = k3_dsp_rproc_prepare;
> +		rproc->ops->unprepare = k3_dsp_rproc_unprepare;
> +	}

Yes

>  	kproc = rproc->priv;
>  	kproc->rproc = rproc;
>  	kproc->dev = dev;
> @@ -744,6 +746,12 @@ static const struct k3_dsp_mem_data c66_mems[] = {
>  	{ .name = "l1dram", .dev_addr = 0xf00000 },
>  };
>  
> +/* C71x cores only have a L1P Cache, there are no L1P SRAMs */
> +static const struct k3_dsp_mem_data c71_mems[] = {
> +	{ .name = "l2sram", .dev_addr = 0x800000 },
> +	{ .name = "l1dram", .dev_addr = 0xe00000 },
> +};
> +
>  static const struct k3_dsp_dev_data c66_data = {
>  	.mems = c66_mems,
>  	.num_mems = ARRAY_SIZE(c66_mems),
> @@ -751,8 +759,16 @@ static const struct k3_dsp_dev_data c66_data = {
>  	.uses_lreset = true,
>  };
>  
> +static const struct k3_dsp_dev_data c71_data = {
> +	.mems = c71_mems,
> +	.num_mems = ARRAY_SIZE(c71_mems),
> +	.boot_align_addr = SZ_2M,
> +	.uses_lreset = false,

Right

> +};
> +
>  static const struct of_device_id k3_dsp_of_match[] = {
>  	{ .compatible = "ti,j721e-c66-dsp", .data = &c66_data, },
> +	{ .compatible = "ti,j721e-c71-dsp", .data = &c71_data, },
>  	{ /* sentinel */ },
>  };

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
> -- 
> 2.26.0
> 
