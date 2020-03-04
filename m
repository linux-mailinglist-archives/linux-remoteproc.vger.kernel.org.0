Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB041796D6
	for <lists+linux-remoteproc@lfdr.de>; Wed,  4 Mar 2020 18:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgCDRgO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 4 Mar 2020 12:36:14 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32940 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729962AbgCDRgO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Mar 2020 12:36:14 -0500
Received: by mail-pl1-f194.google.com with SMTP id ay11so1323203plb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2020 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QrJxdbOnNZQkUCbcHyqB8Pb9/DfQrvf2TdO8mKqjW4I=;
        b=ijo4XnWvpQaY54mRLbblHOY36CYeFGkOHJZtWRmV8zaBa9Iz6X4pPbjq96ZOJ17wGV
         lcrfMDqeX+Z/YvHBO9AXG600hmOIbcEB04RR7ANRk38lrSrVmtPg2dgSE6uYA1T/bXAg
         iBRNsVwPlAjFjxgYVk6wfqEqd3nDiJ48UV3O0oz2E2Z/8Nk65AdCAGTpRmR8R7NCpKwI
         FvYSjGVXZJ7WyhluHH0M9GbCdDRinP+EidIwkTn8qg9RnUuD6Qw66QE7R/BV7i6MD0bP
         LhD90lNNYi4xw1aa6CptGyXaPdD38CpaxGwG6L2fkXAW5qjqeoo2EYWYTuZ+8lodcOpa
         B7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QrJxdbOnNZQkUCbcHyqB8Pb9/DfQrvf2TdO8mKqjW4I=;
        b=mgduEmIMWs0hzj+EUWykArvVlYqA+MxiIGGuQwpBSOFxhNItEpkMF837+hO9bpbdc5
         cihyPgBfsmyMnvYoT8411Yol1vNl0OlK/NWqQWUmdtdpJy/1ZkvzD3rlXT4Ef3OZmDa2
         GWRes17IdXhNCFSR8AeKzED6H/Qxmj5a88fy/yTX4Lj+7MmiFwxzDs1XpJ/HZnZoqymH
         26dMf9mjbdUkmU4F93lxRvpgaAxsPSLzopYzVfR5H0kaq41ETVyMOvgdYCuNNcExdar2
         RRWE1qjS3XR/2b02jgNdDS4XEzivDcp0TuFcN608ugoRNZvpPHLlcccvfC5JSiLrXJ/N
         vkAQ==
X-Gm-Message-State: ANhLgQ1ebJ+YsiknSr9rxd2xtrh/OA9Dul9BL50lBD1SYpAzltIFz76X
        nhvj2H95j1MXxf3q/JwwOP15gA==
X-Google-Smtp-Source: ADFU+vvH+MCkVHYATZMbJIq3ReP5FwZr7d9jdDgS+R4WZY6ij4Cu0Jn7a6n1bTLFofJy56VxsXNmWg==
X-Received: by 2002:a17:902:bf08:: with SMTP id bi8mr3964580plb.305.1583343373255;
        Wed, 04 Mar 2020 09:36:13 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m20sm7061044pff.172.2020.03.04.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 09:36:12 -0800 (PST)
Date:   Wed, 4 Mar 2020 10:36:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 05/15] remoteproc/omap: Add the rproc ops .da_to_va()
 implementation
Message-ID: <20200304173610.GD8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-6-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-6-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:26PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> An implementation for the rproc ops .da_to_va() has been added
> that provides the address translation between device addresses
> to kernel virtual addresses for internal RAMs present on that
> particular remote processor device. The implementation provides
> the translations based on the addresses parsed and stored during
> the probe.
> 
> This ops gets invoked by the exported rproc_da_to_va() function
> and allows the remoteproc core's ELF loader to be able to load
> program data directly into the internal memories.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> v7:
>   - minor kerneldoc updates
> 
>  drivers/remoteproc/omap_remoteproc.c | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 4f92b069f5d0..89084dd919ba 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -247,10 +247,50 @@ static int omap_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> +/**
> + * omap_rproc_da_to_va() - internal memory translation helper
> + * @rproc: remote processor to apply the address translation for
> + * @da: device address to translate
> + * @len: length of the memory buffer
> + *
> + * Custom function implementing the rproc .da_to_va ops to provide address
> + * translation (device address to kernel virtual address) for internal RAMs
> + * present in a DSP or IPU device). The translated addresses can be used
> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
> + *
> + * Return: translated virtual address in kernel memory space on success,
> + *         or NULL on failure.
> + */
> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +{
> +	struct omap_rproc *oproc = rproc->priv;
> +	int i;
> +	u32 offset;
> +
> +	if (len <= 0)
> +		return NULL;
> +
> +	if (!oproc->num_mems)
> +		return NULL;
> +
> +	for (i = 0; i < oproc->num_mems; i++) {
> +		if (da >= oproc->mem[i].dev_addr && da + len <=
> +		    oproc->mem[i].dev_addr + oproc->mem[i].size) {
> +			offset = da - oproc->mem[i].dev_addr;
> +			/* __force to make sparse happy with type conversion */
> +			return (__force void *)(oproc->mem[i].cpu_addr +
> +						offset);
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static const struct rproc_ops omap_rproc_ops = {
>  	.start		= omap_rproc_start,
>  	.stop		= omap_rproc_stop,
>  	.kick		= omap_rproc_kick,
> +	.da_to_va	= omap_rproc_da_to_va,
>  };
>  
>  static const struct omap_rproc_mem_data ipu_mems[] = {
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
