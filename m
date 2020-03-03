Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D8D178603
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Mar 2020 23:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgCCW4m (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 3 Mar 2020 17:56:42 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50751 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbgCCW4m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Mar 2020 17:56:42 -0500
Received: by mail-pj1-f68.google.com with SMTP id nm6so607pjb.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2020 14:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i6kpogp9bxrLw7A3jcVS9T1o1PQC08WdktCFke64Jzw=;
        b=qBx14dYtavLY/4KbnpXE3WBfas6G8ozp3z3JSwbIOEsfsRCLtaHp2RyY4DwcGYS32Y
         +ojmhvcLz4f70TrvCojtqwq6aswQiqryZqbi2jAbXHBzNWTWYaveDqEcrQ5IecaXT5UZ
         FbRuLLS0+uDci32R3QHQVDf8/9bTvVi0BoCaztH+1MDy2aok6Jpjn+p2wAzrM42bXH7j
         s7f3PLqk6xUg8YYOWhQ8KEeaTmBNwzOKkLduWkjeTFT6BQIjPixFuoGPG/1Q0JuVzJzv
         2w7JbYThZLaMJwMJd6IlSpp+eI0WA0flw9SYu6TkPiHaYnVZlSms9hFEGbL2T7ynbQJv
         kieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i6kpogp9bxrLw7A3jcVS9T1o1PQC08WdktCFke64Jzw=;
        b=SAHw0CxM5knasdLuV0C++8026/te70jksGx6ZcuN9eNJWUpg4EpExB/bm8Y+8pKz61
         8pJV3/57QKH5X1zmrU88hMuKaF80R1ogj2+RHcfZJTEbzvI1NFtVj75fJDaPiDgO01SV
         uhcMXX03hnyC46AeTSy2t/oabIKRC/7kKYkrVEOG5MXveVQBuXotmSG05TCFYJeqRhcI
         RXFCRWNtBf/Srt9/mMLti6cvMs4eFu3/jm6tpqHnPVOJxlGzEUTV8mPZzWqwZjJ4lT+v
         Nc7AyzT25DB3xffPgBx6EWvKFxI0N3W+6ZxsuryPxlCMxf+OsTMbVXe86NSkIvJvJbcv
         VMEg==
X-Gm-Message-State: ANhLgQ2Ol7hWyj/LmIxK8YKnGFFEEg64fSnzsSQsWW4gaO9rzUBkt1WV
        dvkvAW9Bjrvl52iDq0lKrv3oMw==
X-Google-Smtp-Source: ADFU+vtQmzqE7QX4VKsuZYUzxGTrlpmS1U6Y07/os795RX+gaORo/uPB5E9+2e24r6epyqEilswE7A==
X-Received: by 2002:a17:902:9a84:: with SMTP id w4mr176363plp.21.1583276201061;
        Tue, 03 Mar 2020 14:56:41 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d1sm17598719pfc.3.2020.03.03.14.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:56:40 -0800 (PST)
Date:   Tue, 3 Mar 2020 15:56:38 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 03/15] remoteproc/omap: Add a sanity check for DSP boot
 address alignment
Message-ID: <20200303225638.GB8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-4-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-4-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:24PM +0200, Tero Kristo wrote:
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
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> v7:
>   - minor kerneldoc update (added return value details for
>     omap_rproc_write_dsp_boot_addr)
> 
>  drivers/remoteproc/omap_remoteproc.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index d47d5ded651a..64b559caadff 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -121,14 +121,25 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>   * @rproc: handle of a remote processor
>   *
>   * Set boot address for a supported DSP remote processor.
> + *
> + * Return: 0 on success, or -EINVAL if boot address is not aligned properly
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
> @@ -145,8 +156,11 @@ static int omap_rproc_start(struct rproc *rproc)
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
