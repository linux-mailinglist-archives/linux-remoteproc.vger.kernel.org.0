Return-Path: <linux-remoteproc+bounces-500-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2618855011
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Feb 2024 18:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B541C22531
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Feb 2024 17:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E92F85937;
	Wed, 14 Feb 2024 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrPXNqt5"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4A85934
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Feb 2024 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707931269; cv=none; b=p+OneDQArMBFR6wcXhXSY9n99A6WbbyUuj1aQA2CyWNel5/BvhdXhqZdKRi1Xsp/E97t+1YV+DS4GEvHwyRs6eKsatCKuPaAaD4BtEbJoIn0DKFz2KfWnqZ2Y3LVhKDCmPxzSckHp0S1FglCPtaCkA7ie/9qJblSGkJD9TyVX8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707931269; c=relaxed/simple;
	bh=S7N5Ad2Nqrbj49SUQEtcPGXzZDyRUyvs+feHRNMHcIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLjSg4dnjw5PvPHyjJ9GANV/uGwV1cIhDOefpxFydBdPWg3mDDrOd2mcluvqEhp3E7ILbmo3/SU3c7e/oScbWoqZxk9sZlO2C/bsQQQRlNrBduomEgaRjl9lYDKG/bxou7NY7zzQwczQtDDh8GGIKZAOnU18u7i0iwnvpJ2xsiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrPXNqt5; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-296c58a11d0so10034a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Feb 2024 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707931267; x=1708536067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+GLw4edkO69eFBIaZa2fDtYB7rYenDCtOXaRNz8hT8=;
        b=ZrPXNqt5fbS8GDyoR347+DxOOl7sD2H6+IyP8DF4KSDhnfIcPSO+0O3MBiG45YdMBS
         ZlGrk8uMU6t7K97Fi2lzZEsKHizkqUzd+GeSROZ8I37XIfliazCg1Qc+jiNSpeBW6s9f
         4XFPgdt4bfT8VbWy2Lzdge7o/wdKhpJkuAE85TSw4ugsigD3oCQrCtZZ05Z9cXqVuXfh
         tKvuZ4n6/CHAPKaZUBlutAAE1atGifBPg2+gjbI4a0W2E63tFvl669KjaEmULp286Cev
         tYYOBIukcVbyQHfGs8PZLWfgnsmMDeZDJLbmu1JaYB/XBJ/VwwQoR7x1f4rdTu3TM7nx
         /QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931267; x=1708536067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+GLw4edkO69eFBIaZa2fDtYB7rYenDCtOXaRNz8hT8=;
        b=qCUl1ZVOky+NLxjHjSNwg+SbJ0cZjToTCvgcBpHtSXV/aW7NkR+Z8KtPe/M5VKcCTM
         wZ4yPAYTaIelwAxWYQXkEwgEh0DEPi/O0m1BNOvG2+10Pxhzh6K77Bwdy5H4VGMt0Qhh
         VfPObk8X1n40CLLXtMia8hOEE0K4AVbsC8P4acx5NqdYdGtK5jSVXdPKiF5VP21o9lVK
         tuYfJlGZYZhmg10gmSr9uhgecR7Xr+HnbbbYAW6yVk1SqUq7+zFqPN4LGQrQH2GEYE5W
         2UzEvTgRGvPHfjj0N+AKWaV0fXjpb+iWRI6T9F74TQNeJfz1Be+wlIdifTct9KjVeGPx
         kCOw==
X-Forwarded-Encrypted: i=1; AJvYcCXJNYqeEXlK7k1AY6b5UTHa6Dn480FLbkMdQdSOt6A9QtgxJ2dKcR5XlJj6jB2Al43XW6NXjj6Ea9ku2KXGXHKSejX2F8L6R3bJr3rjmKQ4cg==
X-Gm-Message-State: AOJu0Yy9ga3WbSHOj1l5YmhPxNVJZE7HOb2NWUKtOcDCNqSUiYTZB85A
	zp36x+ylY2RzWU6q+dlsoD1xG7fxnBe6gjaCPPlCKDSzu3yXN/ip5iipUO3Dvm1dgMZnc0hDj+T
	V
X-Google-Smtp-Source: AGHT+IE9Pnjo6ou5luyV/r8s33nLYEdd+B7r13dw3T/QzHcEFLNf1/OVaVKnhjctOSPGTGrgO4qEYw==
X-Received: by 2002:a17:90a:9b8c:b0:298:c136:2ffc with SMTP id g12-20020a17090a9b8c00b00298c1362ffcmr2584760pjp.45.1707931266846;
        Wed, 14 Feb 2024 09:21:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWodR54OSPqGD9VrYyvs5GM3YIST40u2Cyby+MBVNL/KbwkBOEjGMst0gElgv3G0ZqBEpDHffJ6Hpf1DN4gmNnrmLLUCCDaD4+j7w9w7X5Kje/6b85htP6dil3TbA71I9c1YSh5Gzyk+CeHHC9ze5cQ7rD6mrpF2246hpzApVpZUv3YecIa7T1M1/1nsSrkCcV/6+YgFzSjx52coZzbD95XLCwXsrU3iaE0s1OSXf4cuiMxGu3JU4GG+8oKg/n2PWl+UOPDSOQu4rOaZ2NVvayNRMAumzkFWoxFxEmg1sdxm44ZQ50/lV3jB6bMIVdGAwtn/CZCqBr2qnQYynJ/ug8j+Pe2Flg6+iAJZNT8c3UPd+Jk9d7EXe2L0JTlfPLUqPIYa4KDPJoTw==
Received: from p14s ([2604:3d09:148c:c800:96ea:e45d:5361:78d0])
        by smtp.gmail.com with ESMTPSA id ev6-20020a17090aeac600b00298d203d359sm1696864pjb.24.2024.02.14.09.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:21:06 -0800 (PST)
Date: Wed, 14 Feb 2024 10:21:03 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] remoteproc: zynqmp: parse TCM from device tree
Message-ID: <Zcz2f3eZrXrRAX6F@p14s>
References: <20240213175450.3097308-1-tanmay.shah@amd.com>
 <20240213175450.3097308-5-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213175450.3097308-5-tanmay.shah@amd.com>

Good morning,

On Tue, Feb 13, 2024 at 09:54:50AM -0800, Tanmay Shah wrote:
> ZynqMP TCM information was fixed in driver. Now ZynqMP TCM information
> is available in device-tree. Parse TCM information in driver
> as per new bindings.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v10:
>   - Remove redundant changes to handle TCM in lockstep mode
> 
> Changes in v9:
>   - Introduce new API to request and release core1 TCM power-domains in
>     lockstep mode. This will be used during prepare -> add_tcm_banks
>     callback to enable TCM in lockstep mode.
>   - Parse TCM from device-tree in lockstep mode and split mode in
>     uniform way.
>   - Fix TCM representation in device-tree in lockstep mode.
> 
> Changes in v8:
>   - Remove pm_domains framework
>   - Remove checking of pm_domain_id validation to power on/off tcm
>   - Remove spurious change
>   - parse power-domains property from device-tree and use EEMI calls
>     to power on/off TCM instead of using pm domains framework
> 
> Changes in v7:
>   - move checking of pm_domain_id from previous patch
>   - fix mem_bank_data memory allocation
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 112 ++++++++++++++++++++++--
>  1 file changed, 107 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 42b0384d34f2..49e8eaf83fce 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -74,8 +74,8 @@ struct mbox_info {
>  };
>  
>  /*
> - * Hardcoded TCM bank values. This will be removed once TCM bindings are
> - * accepted for system-dt specifications and upstreamed in linux kernel
> + * Hardcoded TCM bank values. This will stay in driver to maintain backward
> + * compatibility with device-tree that does not have TCM information.
>   */
>  static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
>  	{0xffe00000UL, 0x0, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
> @@ -757,6 +757,103 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	return ERR_PTR(ret);
>  }
>  
> +static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
> +{
> +	int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
> +	struct of_phandle_args out_args = {0};

Is this really needed?  As far as I can tell it isn't.  

Otherwise and if it wasn't for the modification on the DT side, I would apply
this patch.

Thanks,
Mathieu

> +	struct zynqmp_r5_core *r5_core;
> +	struct platform_device *cpdev;
> +	struct mem_bank_data *tcm;
> +	struct device_node *np;
> +	struct resource *res;
> +	u64 abs_addr, size;
> +	struct device *dev;
> +
> +	for (i = 0; i < cluster->core_count; i++) {
> +		r5_core = cluster->r5_cores[i];
> +		dev = r5_core->dev;
> +		np = r5_core->np;
> +
> +		pd_count = of_count_phandle_with_args(np, "power-domains",
> +						      "#power-domain-cells");
> +
> +		if (pd_count <= 0) {
> +			dev_err(dev, "invalid power-domains property, %d\n", pd_count);
> +			return -EINVAL;
> +		}
> +
> +		/* First entry in power-domains list is for r5 core, rest for TCM. */
> +		tcm_bank_count = pd_count - 1;
> +
> +		if (tcm_bank_count <= 0) {
> +			dev_err(dev, "invalid TCM count %d\n", tcm_bank_count);
> +			return -EINVAL;
> +		}
> +
> +		r5_core->tcm_banks = devm_kcalloc(dev, tcm_bank_count,
> +						  sizeof(struct mem_bank_data *),
> +						  GFP_KERNEL);
> +		if (!r5_core->tcm_banks)
> +			ret = -ENOMEM;
> +
> +		r5_core->tcm_bank_count = tcm_bank_count;
> +		for (j = 0, tcm_pd_idx = 1; j < tcm_bank_count; j++, tcm_pd_idx++) {
> +			tcm = devm_kzalloc(dev, sizeof(struct mem_bank_data),
> +					   GFP_KERNEL);
> +			if (!tcm)
> +				return -ENOMEM;
> +
> +			r5_core->tcm_banks[j] = tcm;
> +
> +			/* Get power-domains id of TCM. */
> +			ret = of_parse_phandle_with_args(np, "power-domains",
> +							 "#power-domain-cells",
> +							 tcm_pd_idx, &out_args);
> +			if (ret) {
> +				dev_err(r5_core->dev,
> +					"failed to get tcm %d pm domain, ret %d\n",
> +					tcm_pd_idx, ret);
> +				return ret;
> +			}
> +			tcm->pm_domain_id = out_args.args[0];
> +			of_node_put(out_args.np);
> +
> +			/* Get TCM address without translation. */
> +			ret = of_property_read_reg(np, j, &abs_addr, &size);
> +			if (ret) {
> +				dev_err(dev, "failed to get reg property\n");
> +				return ret;
> +			}
> +
> +			/*
> +			 * Remote processor can address only 32 bits
> +			 * so convert 64-bits into 32-bits. This will discard
> +			 * any unwanted upper 32-bits.
> +			 */
> +			tcm->da = (u32)abs_addr;
> +			tcm->size = (u32)size;
> +
> +			cpdev = to_platform_device(dev);
> +			res = platform_get_resource(cpdev, IORESOURCE_MEM, j);
> +			if (!res) {
> +				dev_err(dev, "failed to get tcm resource\n");
> +				return -EINVAL;
> +			}
> +
> +			tcm->addr = (u32)res->start;
> +			tcm->bank_name = (char *)res->name;
> +			res = devm_request_mem_region(dev, tcm->addr, tcm->size,
> +						      tcm->bank_name);
> +			if (!res) {
> +				dev_err(dev, "failed to request tcm resource\n");
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * zynqmp_r5_get_tcm_node()
>   * Ideally this function should parse tcm node and store information
> @@ -835,9 +932,14 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  	struct zynqmp_r5_core *r5_core;
>  	int ret, i;
>  
> -	ret = zynqmp_r5_get_tcm_node(cluster);
> -	if (ret < 0) {
> -		dev_err(dev, "can't get tcm node, err %d\n", ret);
> +	r5_core = cluster->r5_cores[0];
> +	if (of_find_property(r5_core->np, "reg", NULL))
> +		ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
> +	else
> +		ret = zynqmp_r5_get_tcm_node(cluster);
> +
> +	if (ret) {
> +		dev_err(dev, "can't get tcm, err %d\n", ret);
>  		return ret;
>  	}
>  
> -- 
> 2.25.1
> 

