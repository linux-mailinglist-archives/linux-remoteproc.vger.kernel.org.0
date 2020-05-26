Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4543A1D2630
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 May 2020 07:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgENFAt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 14 May 2020 01:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbgENFAr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 01:00:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26AFC061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:00:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p21so744147pgm.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gRtb+ye+6N2jERJtNafzHVxmDwBVGiZa6FElJAmpzAg=;
        b=iTlKFnvLfFYMiRs/m3eZENaimKbVUuQZVgPWtxNuem+VijamM+3tXGhIT/7RFiZ1yb
         9hr9CA61VbhbBo3+o5Epa9c+28DXOGdsLDBWAuaJ7gYcFqfR9/zqGs47lEqwrE/wSRBZ
         04NAF0Z75+b+Y73uIRcl7N+gkdIXKuaLQX8PQhWal3RUGW+Ir/um6wqe3NanwiAk9jWA
         Phosz3081FLvsRMMOsZFP1Ne/gQiHo1dwSrMPAHKRdEK3ZeUdbsx7bPzSa/DoiLASZRa
         mgm/T2uJijxPTULXV0s3P0weaUSJIbptAliKmiiicCGPxvfM+eqja2dH639Xr9a1N/E6
         Wq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gRtb+ye+6N2jERJtNafzHVxmDwBVGiZa6FElJAmpzAg=;
        b=tH1nRR9GH2y2iPLfvhxA2RFA+KmSJiJ08gWH9HdfOji4xTzPFW+WA5/i8qbtrqhhOY
         Cc5VdC7Ddsfd4kPHP4MCIDCZDazRAwjT7jMTdekwaMqSr3D7UJp09scaaDOfbjTha1sM
         TdkSaewJmSHMukc9c5DT4wDkg10Yp8/UAwrmazslry6jKClQBNhv78muNECQ1SFucAWC
         krrcaUjJFzNvRUTxH3bqnV3/1dAIhbg9GkKI6PiSz9gepWZ3C9iFk4D7uGcAGdMjQM97
         SvzC0lGudPyXkBMahlIdHkSmZ8Rh/5IYLqZZTr4o8PW6T+1RC4GYO6WLjzH7JCtCnoK8
         4lvA==
X-Gm-Message-State: AOAM532+eqg/PIa17fXYDcFiGrQmkXgtM0g7eFBeFCSrxNwXMUZtRoeT
        17CpwHmJ6a2LNsf3FL4mVgow9A==
X-Google-Smtp-Source: ABdhPJyrnJxz1I6U4kp3zNWz12oevEgN0OyqU9jHUbD2BpMkoM8FG83os68vLDY7dUIJhvaavhyMxA==
X-Received: by 2002:a65:6799:: with SMTP id e25mr2609901pgr.9.1589432445068;
        Wed, 13 May 2020 22:00:45 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a15sm16664612pju.3.2020.05.13.22.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:00:44 -0700 (PDT)
Date:   Wed, 13 May 2020 21:59:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/12] remoteproc: stm32: Decouple rproc from DT
 parsing
Message-ID: <20200514045914.GI16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-4-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Remove the remote processor from the process of parsing the device tree
> since (1) there is no correlation between them and (2) to use the
> information that was gathered to make a decision on whether to
> synchronise with the M4 or not.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 1ac90adba9b1..57a426ea620b 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
>  	return err;
>  }
>  
> -static int stm32_rproc_parse_dt(struct platform_device *pdev)
> +static int stm32_rproc_parse_dt(struct platform_device *pdev,
> +				struct stm32_rproc *ddata, bool *auto_boot)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct rproc *rproc = platform_get_drvdata(pdev);
> -	struct stm32_rproc *ddata = rproc->priv;
>  	struct stm32_syscon tz;
>  	unsigned int tzen;
>  	int err, irq;
> @@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  
>  	err = regmap_read(tz.map, tz.reg, &tzen);
>  	if (err) {
> -		dev_err(&rproc->dev, "failed to read tzen\n");
> +		dev_err(dev, "failed to read tzen\n");
>  		return err;
>  	}
>  	ddata->secured_soc = tzen & tz.mask;
> @@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  	if (err)
>  		dev_info(dev, "failed to get pdds\n");
>  
> -	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
> +	*auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
>  	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
> @@ -616,6 +615,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
>  	struct rproc *rproc;
> +	bool auto_boot = false;
>  	int ret;
>  
>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> @@ -626,9 +626,16 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (!rproc)
>  		return -ENOMEM;
>  
> +	ddata = rproc->priv;
> +
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
> +	if (ret)
> +		goto free_rproc;
> +
> +	rproc->auto_boot = auto_boot;
>  	rproc->has_iommu = false;
> -	ddata = rproc->priv;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
>  		dev_err(dev, "cannot create workqueue\n");
> @@ -638,13 +645,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rproc);
>  
> -	ret = stm32_rproc_parse_dt(pdev);
> -	if (ret)
> -		goto free_wkq;
> -
>  	ret = stm32_rproc_request_mbox(rproc);
>  	if (ret)
> -		goto free_rproc;
> +		goto free_wkq;
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -- 
> 2.20.1
> 
