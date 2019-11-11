Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04394F835D
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 00:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfKKXWz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 11 Nov 2019 18:22:55 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44033 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKXWz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Nov 2019 18:22:55 -0500
Received: by mail-pg1-f194.google.com with SMTP id f19so10451711pgk.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 15:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TcPWLJRMLACj8x101eDJpAx+ekq3xMep7NPhZ1ywhqI=;
        b=DCmCfy7URo+AnXHvcaYhhRJ2dmRBE5Amg98rGe9o59+0ANA+9wvO6c1u+JbIOxHHVH
         o4Sqbxr5cYzs4FwQGmhDuswTLueZnUSCBqlMMUpO4VKMR454FFNX5wCID47wzljdgH1E
         N4ulOsm1XDhgFn7T7QI963T+DG6WsG3ZXe27lcCSvs3/DNom1WAtuzUp1DE92zli31oG
         EYaWLFGWfgKOV9cS4hh9L/VjSGcLogQMJqGZOEqT+q/fbomNjTYD6VSZrYZvqWP6CnpS
         LGUByZ5o4bQ3kZCKWR3Hvx6vSM2jkU1Jl9CY/LVQ7AtwjSubC6w+6HfkJMDF7TFSPSf6
         Wt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TcPWLJRMLACj8x101eDJpAx+ekq3xMep7NPhZ1ywhqI=;
        b=odNQHMX3T9fhiSzehzKmz3ILELzLtS+5jhXROK16xlQAM44LFG0tEin50zLQudqt9w
         CS19F4Jjv15dNX+Z68/3qAFWOfbxqV5YnIzDBPKbm4uOjs/9F6u+rELv43d2tqnbCqk/
         Uj6y42uTN4vErZuneyea0I96jleS9m4b6hX9z4svu7fJaCrfttWk17lAMelKbks91vsY
         CR+W2Z/5thNKmeg3na9Jb1QD12uQG8obTYvf6vDuXirpa8mYJZGHtNi736MhJQ47Jmn7
         rNaiEQZl++L3+WppbL5FxaLximvp1yZODfRGNygRJg1riEbbE2uc5swfZlhQ4qiRA79y
         +7zA==
X-Gm-Message-State: APjAAAXLI35zqAIAWeSkdk8nCiVsi1MDP+gBXdcF8Y8ql/pWsFCXFTxi
        puDn+rt0UKJ6sGA/GYUsSnxXoA==
X-Google-Smtp-Source: APXvYqzcPTauYRY2lULj0daCQNC8c+T2DIe/TTKA7uwYAWW/MbUINxhbzx9h7gdFzgUOMNNH/at/Mg==
X-Received: by 2002:a63:b44e:: with SMTP id n14mr6970009pgu.154.1573514574223;
        Mon, 11 Nov 2019 15:22:54 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h195sm115737pfe.88.2019.11.11.15.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:22:53 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:22:51 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 06/17] remoteproc/omap: Add the rproc ops .da_to_va()
 implementation
Message-ID: <20191111232251.GH3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-7-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-7-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

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
> ---
>  drivers/remoteproc/omap_remoteproc.c | 35 ++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index bbd6ff360e10..0524f7e0ffa4 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -230,10 +230,45 @@ static int omap_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> +/*
> + * Internal Memory translation helper

Please format this as kerneldoc.

> + *
> + * Custom function implementing the rproc .da_to_va ops to provide address
> + * translation (device address to kernel virtual address) for internal RAMs
> + * present in a DSP or IPU device). The translated addresses can be used
> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
> + */
> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> +{
> +	struct omap_rproc *oproc = rproc->priv;
> +	void *va = NULL;
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
> +		    oproc->mem[i].dev_addr +  oproc->mem[i].size) {
> +			offset = da -  oproc->mem[i].dev_addr;
> +			/* __force to make sparse happy with type conversion */
> +			va = (__force void *)(oproc->mem[i].cpu_addr + offset);

Replace va = and break; with just a return here.

> +			break;
> +		}
> +	}
> +
> +	return va;

return NULL here.

Regards,
Bjorn
