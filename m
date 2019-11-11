Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27CFF8354
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 00:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfKKXSd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 11 Nov 2019 18:18:33 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40871 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKXSc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Nov 2019 18:18:32 -0500
Received: by mail-pl1-f193.google.com with SMTP id e3so8479721plt.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Z+hwMJx/kLG9GFEqHDOgdoZ4oNrcZFm5sKYmGU9tQw=;
        b=fROusxRmSn1444VmGAEdWrQyvLI9TxbNAIlgC0NtKJt66Gz397Ujo20EawnqYFh6M7
         25yUogB+56l/NuP3b2O8cCpns73b7fMt+FgOLYbsqmGbbzJdEOZMlY2LuhqFG0WEfRgu
         3atjRyH+xLfwxSrzCvCgZXU4duOHmRpA+1IUB43MrPODB0FEo9WyBxQi+YybSupRRMVs
         v/nrSps28bcZ8j2tX2KBOItx/EwfGaSSXbLpUsk2wb1zCjYWoxi3TOhzVe6nf00MKCmr
         eTsW6ZekzCTHTdMHE93rKjGbUE2HW2Z8iRk0moYdROBMeXiMNu70F6qDVNuzDRJYFhhv
         TaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Z+hwMJx/kLG9GFEqHDOgdoZ4oNrcZFm5sKYmGU9tQw=;
        b=VehLUM3Puz364xWl8urICvD1MqHLAq6Bsnj6pG+aNxIxpCi+2MzBcXs9ifkDH9zMf2
         G+5IqCWKn/2w4yrgz9bAntntzSK/8tkSgxbIPeUBQr8OyUEFOZKcVUo8Dw7J3fVkUsuO
         nUaLWsXKGG/7M8yfUWpIeQsTQxql/rZ4jccboWmgVnCle0dsb89T9JjoiNagdLi6Ex4s
         7ELBdiqgTux0XypG9XTdX9+U27BOFsq2RiA5k08Sj4owV+r+lBUbAeA48Y17f7zZWSQx
         lqC5frUz4JiZ/xH0YDJ7lX/CTBu9yzzForjGcYquW8DvLX3hvrLFTk6R/WlE9C+PtjkP
         Taww==
X-Gm-Message-State: APjAAAU4NuD+XWfn5eAdjsbHDCLZ5QY6NUptOOXK6n3htj4DRfTpCmvs
        YU/U4Q86YZm2AzWX+QOAJR5DdhSUjI4=
X-Google-Smtp-Source: APXvYqzWxKxDKFvEBYysyZe8UUjgl1aaKUC+TH9W0FyjSm9dahFvr0IdZ0K2E9THGZCZSp6xs9QLmQ==
X-Received: by 2002:a17:902:9a8b:: with SMTP id w11mr28940863plp.9.1573514311830;
        Mon, 11 Nov 2019 15:18:31 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s3sm449953pjn.21.2019.11.11.15.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:18:31 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:18:29 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 04/17] remoteproc/omap: Add a sanity check for DSP boot
 address alignment
Message-ID: <20191111231829.GF3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-5-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-5-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The DSP remote processors on OMAP SoCs require a boot register to
> be programmed with a boot address, and this boot address needs to
> be on a 1KB boundary. The current code is simply masking the boot
> address appropriately without performing any sanity checks before
> releasing the resets. An unaligned boot address results in an
> undefined execution behavior and can result in various bus errors
> like MMU Faults or L3 NoC errors. Such errors are hard to debug and
> can be easily avoided by adding a sanity check for the alignment
> before booting a DSP remote processor.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/omap_remoteproc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index cd776189d20b..a10377547533 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -124,13 +124,22 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>   *
>   * Set boot address for a supported DSP remote processor.
>   */
> -static void omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
> +static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>  {
> +	struct device *dev = rproc->dev.parent;
>  	struct omap_rproc *oproc = rproc->priv;
>  	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>  	u32 offset = bdata->boot_reg;
>  
> +	if (rproc->bootaddr & (SZ_1K - 1)) {
> +		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
> +			rproc->bootaddr);
> +		return -EINVAL;
> +	}
> +
>  	regmap_write(bdata->syscon, offset, rproc->bootaddr);
> +
> +	return 0;
>  }
>  
>  /*
> @@ -147,8 +156,11 @@ static int omap_rproc_start(struct rproc *rproc)
>  	int ret;
>  	struct mbox_client *client = &oproc->client;
>  
> -	if (oproc->boot_data)
> -		omap_rproc_write_dsp_boot_addr(rproc);
> +	if (oproc->boot_data) {
> +		ret = omap_rproc_write_dsp_boot_addr(rproc);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	client->dev = dev;
>  	client->tx_done = NULL;
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
