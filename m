Return-Path: <linux-remoteproc+bounces-2148-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC43A96DF72
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Sep 2024 18:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7551F237E9
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Sep 2024 16:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBF61A00D6;
	Thu,  5 Sep 2024 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qpXuBYoN"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072A1A01C1
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Sep 2024 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553385; cv=none; b=dsGVET0sSsCmg+gUZ7LK54pvQC8dxm2JSR1BK8svgLh/wgANsxqmnJnHOig9iVdroXCMJRZkCl/EzsBfgSS1bHPifqCJJ/eM53GU3w2PPc6Xkxj4bSWwGVkIMfMaHIl8b6Gl5UBJKrgj/taZcbFGEJsWzpuQnvqEf7dBaoi54sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553385; c=relaxed/simple;
	bh=sW7uqszWU4sZLJOvGO07u1icXoKy1sNjZG27wJW95gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raQBNFzzIexhfQe4UXLHYLFS9z4jlDnxRcTG/yAuNnnKP+WA6kl6ux9nA/E8HPim+SCKOad3QwU3YcVnsiSwKTE2eb24f5cMdZc8nhAKuZ15u0hd8acwCyznxEPcOWDWkFv0wWYJy9OTM+bb1sOY/7UPhrVQiPhWBIR+FdtVGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qpXuBYoN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7178df70f28so859112b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Sep 2024 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725553383; x=1726158183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=;
        b=qpXuBYoNENnLkm19crEElbKUC+MnI2RWt0x3W67+0oOI+/l7j11MOwlvhJkTYMq3fU
         c5YBRQX0PE3as0cYSOVzLDc9cWppuSvCyLcqzLU+uJbBOSQmaNHKDmsgCyIBStUdevke
         ONAEKbfGSVVD1h3iJi97EZ7m4M+KgINaxV2ieVBTF4TCt093fiQGQh8bRVXBTJnzix4r
         Q5WT1NYgOR++vDyTArLNQvCrhsGEBvidfzI7eacndB4JTSw+v0kIy/FMz1bdYvEERK6n
         sG+AqqQYRtg9vSc596yeqPSvybxZP6uhi0cvfFnAhTmHMaINzwRE9TGodtj08vnpI84y
         z9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553383; x=1726158183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=;
        b=H2Iu62uP1dfOnCkS97rpEjX4j+IieqDpkM6qgJBpKtgbf/K1MWJpsgROfi1vSPcTpr
         AbFeTtSij6P3toDt0CXgtD+/NSqrCEQeYK/XpZo0Rn5Wg3e/KqMQ23SLiemy1qxeFM3O
         us6szBdUfyOC10D0HEkXahtDq3wObIYg9i/VeJQi52jamsT5N/DrTR6COij8WM3uflZ6
         RpWyzitYwgWGIQZIPZ3qhejd56VtljUxx5HgSA+/u3lnElAW0stTWeCrg25w+INJSv43
         WIOr3bxEp/dlB5UHKELyh+KY+bVqEstlGRE5o2bdPis46fezl62mfE+GMeI5vN0idvld
         8QXw==
X-Forwarded-Encrypted: i=1; AJvYcCVXHECRtyCStzXkRKqtmf0jpIKZEy4aUdXVaYgwpnXViNIupTemgEI7ss72PmLfmGc97f32o/C+rKA1r1Gez9AN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10sWYyN2AqGlKyq2dme/atVqaulnaSyz6ZfdbI7xB8hfta2bn
	RIkt/I5ATZvmvkJCp7LypVA8AGsoqv/gV0btL08BUHhwOm3QIszVmsnVYcR4zVY=
X-Google-Smtp-Source: AGHT+IEstKk+LEI8X3OaN9fTZu6CZPPKQppwGBYLvxBQ/FfkUBW23FDlSvzIk3BvLCy/OE4uzgavvQ==
X-Received: by 2002:a05:6a20:e196:b0:1cc:dfd1:2453 with SMTP id adf61e73a8af0-1cce1016eebmr24968329637.30.1725553383443;
        Thu, 05 Sep 2024 09:23:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3b5d:f081:c58f:f7e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859a369sm3510923b3a.148.2024.09.05.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:23:02 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:22:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: andersson@kernel.org, paul@crapouillou.net, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	patrice.chotard@foss.st.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc:remove redundant dev_err message
Message-ID: <Ztna4xyKbOJTw5C1@p14s>
References: <20240904185417.14357-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904185417.14357-1-liujing@cmss.chinamobile.com>

On Thu, Sep 05, 2024 at 02:54:17AM +0800, Liu Jing wrote:
> devm_ioremap_resource already contains error message, so remove
> the redundant dev_err message
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 9041a0e07fb2..289d5ce9f7af 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -214,8 +214,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
>  						   mem_names[i]);
>  		drproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(drproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				mem_names[i]);
>  			return PTR_ERR(drproc->mem[i].cpu_addr);
>  		}
>  		drproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 9902cce28692..b3ee5c47001d 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -186,7 +186,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
>  	vpu->aux_base = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(vpu->aux_base)) {
> -		dev_err(dev, "Failed to ioremap\n");
>  		return PTR_ERR(vpu->aux_base);
>  	}
>  
> @@ -197,7 +196,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  		vpu->mem_info[i].base = devm_ioremap_resource(dev, mem);
>  		if (IS_ERR(vpu->mem_info[i].base)) {
>  			ret = PTR_ERR(vpu->mem_info[i].base);
> -			dev_err(dev, "Failed to ioremap\n");
>  			return ret;
>  		}
>  
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 7e57b90bcaf8..a31f94a290c9 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -312,8 +312,6 @@ static int keystone_rproc_of_get_memories(struct platform_device *pdev,
>  						   mem_names[i]);
>  		ksproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(ksproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				mem_names[i]);
>  			return PTR_ERR(ksproc->mem[i].cpu_addr);
>  		}
>  		ksproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..cb8ad16583c7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1126,7 +1126,6 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(scp->sram_base)) {
> -		dev_err(dev, "Failed to parse and map sram memory\n");
>  		return ERR_CAST(scp->sram_base);
>  	}

There is another instance in the Mediatek driver - please address.

Thanks,
Mathieu

>  
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 9ae2e831456d..07e707776cf9 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -1201,8 +1201,6 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>  		}
>  		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(oproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				data->mems[i].name);
>  			return PTR_ERR(oproc->mem[i].cpu_addr);
>  		}
>  		oproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 327f0c7ee3d6..85b95e025c17 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1047,8 +1047,6 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  						   mem_names[i]);
>  		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(pru->mem_regions[i].va)) {
> -			dev_err(dev, "failed to parse and map memory resource %d %s\n",
> -				i, mem_names[i]);
>  			ret = PTR_ERR(pru->mem_regions[i].va);
>  			return ret;
>  		}
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..fe65ffa9a93f 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -602,7 +602,6 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  	} else {
>  		adsp->lpass_efuse = devm_ioremap_resource(&pdev->dev, efuse_region);
>  		if (IS_ERR(adsp->lpass_efuse)) {
> -			dev_err(adsp->dev, "failed to map efuse registers\n");
>  			return PTR_ERR(adsp->lpass_efuse);
>  		}
>  	}
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index d17719384c16..a6e50f51c794 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -251,7 +251,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  
>  		slim_rproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(slim_rproc->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed\n");
>  			err = PTR_ERR(slim_rproc->mem[i].cpu_addr);
>  			goto err;
>  		}
> @@ -262,7 +261,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
>  	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->slimcore)) {
> -		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
>  		err = PTR_ERR(slim_rproc->slimcore);
>  		goto err;
>  	}
> @@ -270,7 +268,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
>  	slim_rproc->peri = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->peri)) {
> -		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
>  		err = PTR_ERR(slim_rproc->peri);
>  		goto err;
>  	}
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index 36a55f7ffa64..5648f450c018 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -186,8 +186,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
>  						   mem_names[i]);
>  		wkupm3->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(wkupm3->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed for resource %d\n",
> -				i);
>  			ret = PTR_ERR(wkupm3->mem[i].cpu_addr);
>  			goto err_put_rproc;
>  		}
> -- 
> 2.33.0
> 
> 
> 

