Return-Path: <linux-remoteproc+bounces-4-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A90EF7F4DF1
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Nov 2023 18:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7D0281314
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Nov 2023 17:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F856B60;
	Wed, 22 Nov 2023 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dT641Stq"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA8010E9
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Nov 2023 09:12:05 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ce95f96edcso35290545ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Nov 2023 09:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700673125; x=1701277925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrgrTR/D1yR9U8NlHxFGvyQFnLKsGuyKLEgnmYeRe9U=;
        b=dT641Stqu0dpN955BK49q3bNXfzTltMMOAk6yWs6QOZiBZi8hpdzxlUpf0vJ48ONjL
         d4L1JKtz+lmeEiT1o6eVZcbCwhItTJKeM4161n76igK8yVCpM3+pDxVw956wb0OCTkIb
         sZH50JJu7+cw9hyfqO/VPfFcNIMuFPg+MyNqbqyfIcG0hlCr1KUqj3w5vg99XtupIgSr
         v+y70Qo1fQMsLcXp+H7V6Gng14hD+hhLEX3jxclfwwExcGpihh3QMw9yQBbj9ih1uIdJ
         CDNFBrCtyQOfFrhyvRgZ+iK+z2Bu0T0+nxp+DQfK1zH+Vlhnk9Yz/eu+9RDsBZvauQiG
         6Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673125; x=1701277925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrgrTR/D1yR9U8NlHxFGvyQFnLKsGuyKLEgnmYeRe9U=;
        b=Le09Dk/m/gPc+twALr2T2IMb2ybqPjDhbXJhHhE23wf3wzxbjRO+OD3rsi3Yna3++b
         olDSBT8prpp8Gm8orR+q3N+VR71DS26UpFBviKVy21ilqCVUOoM4FLldMmZNJS5utqv4
         dnwmyzXUc3fHo+vnQ/2uF5D82t5pMi/O5+HOxUq4CG8W8h76Or7C4Dytj4J4+CPGVub3
         GzlnFUBYvoSHuZr/ykQv212eFtj7AIapRZwxQ6EC81RyosLUQC/aqxfG+Ne1tyK237Lp
         Sc23AcQlX22LtbpG9yjlzvMYXviH68OyN678lXidO2kKqz4wDo3Cpf00zcBXSddCEXN7
         RCcw==
X-Gm-Message-State: AOJu0YzkrANmdhD6C1jrWAOJP2e4QFJMr/Yo4LaDU0wVbFHkSaBzu4Ro
	4CjbPQK5x3gYvpMMQ1rqvKOzlA==
X-Google-Smtp-Source: AGHT+IH3E+whBf4ZizF1DR/hyS9d1i66JGlcrK0NOP37ZT4wvPcal18AfvlNOHTH7p5AVhBCZi0aQw==
X-Received: by 2002:a17:903:1212:b0:1cf:57b3:2665 with SMTP id l18-20020a170903121200b001cf57b32665mr2983708plh.11.1700673124728;
        Wed, 22 Nov 2023 09:12:04 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:178e:e668:ba84:1eed])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001cf68c80ee6sm4612900pli.141.2023.11.22.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 09:12:04 -0800 (PST)
Date: Wed, 22 Nov 2023 10:12:01 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] remoteproc: zynqmp: add pm domains support
Message-ID: <ZV42YaCU+nGjiY2R@p14s>
References: <20231117174238.1876655-1-tanmay.shah@amd.com>
 <20231117174238.1876655-4-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117174238.1876655-4-tanmay.shah@amd.com>

On Fri, Nov 17, 2023 at 09:42:37AM -0800, Tanmay Shah wrote:
> Use TCM pm domains extracted from device-tree
> to power on/off TCM using general pm domain framework.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v7:
>   - %s/pm_dev1/pm_dev_core0/r
>   - %s/pm_dev_link1/pm_dev_core0_link/r
>   - %s/pm_dev2/pm_dev_core1/r
>   - %s/pm_dev_link2/pm_dev_core1_link/r
>   - remove pm_domain_id check to move next patch
>   - add comment about how 1st entry in pm domain list is used
>   - fix loop when jump to fail_add_pm_domains loop
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 215 +++++++++++++++++++++++-
>  1 file changed, 212 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 4395edea9a64..22bccc5075a0 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/pm_domain.h>
>  
>  #include "remoteproc_internal.h"
>  
> @@ -102,6 +103,12 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * @rproc: rproc handle
>   * @pm_domain_id: RPU CPU power domain id
>   * @ipi: pointer to mailbox information
> + * @num_pm_dev: number of tcm pm domain devices for this core
> + * @pm_dev_core0: pm domain virtual devices for power domain framework
> + * @pm_dev_core0_link: pm domain device links after registration
> + * @pm_dev_core1: used only in lockstep mode. second core's pm domain virtual devices
> + * @pm_dev_core1_link: used only in lockstep mode. second core's pm device links after
> + * registration
>   */
>  struct zynqmp_r5_core {
>  	struct device *dev;
> @@ -111,6 +118,11 @@ struct zynqmp_r5_core {
>  	struct rproc *rproc;
>  	u32 pm_domain_id;
>  	struct mbox_info *ipi;
> +	int num_pm_dev;
> +	struct device **pm_dev_core0;
> +	struct device_link **pm_dev_core0_link;
> +	struct device **pm_dev_core1;
> +	struct device_link **pm_dev_core1_link;
>  };
>  
>  /**
> @@ -651,7 +663,8 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>  					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>  		if (ret < 0) {
> -			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> +			dev_err(dev, "failed to turn on TCM 0x%x",
> +				pm_domain_id);
>  			goto release_tcm_lockstep;
>  		}
>  
> @@ -758,6 +771,189 @@ static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static void zynqmp_r5_remove_pm_domains(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct device *dev = r5_core->dev;
> +	struct zynqmp_r5_cluster *cluster;
> +	int i;
> +
> +	cluster = platform_get_drvdata(to_platform_device(dev->parent));
> +
> +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> +		device_link_del(r5_core->pm_dev_core0_link[i]);
> +		dev_pm_domain_detach(r5_core->pm_dev_core0[i], false);
> +	}
> +
> +	kfree(r5_core->pm_dev_core0);
> +	r5_core->pm_dev_core0 = NULL;
> +	kfree(r5_core->pm_dev_core0_link);
> +	r5_core->pm_dev_core0_link = NULL;
> +
> +	if (cluster->mode == SPLIT_MODE) {
> +		r5_core->num_pm_dev = 0;
> +		return;
> +	}
> +
> +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> +		device_link_del(r5_core->pm_dev_core1_link[i]);
> +		dev_pm_domain_detach(r5_core->pm_dev_core1[i], false);
> +	}
> +
> +	kfree(r5_core->pm_dev_core1);
> +	r5_core->pm_dev_core1 = NULL;
> +	kfree(r5_core->pm_dev_core1_link);
> +	r5_core->pm_dev_core1_link = NULL;
> +	r5_core->num_pm_dev = 0;
> +}
> +
> +static int zynqmp_r5_add_pm_domains(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct device *dev = r5_core->dev, *dev2;
> +	struct zynqmp_r5_cluster *cluster;
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	int i, j, num_pm_dev, ret;
> +
> +	cluster = dev_get_drvdata(dev->parent);
> +
> +	/* get number of power-domains */
> +	num_pm_dev = of_count_phandle_with_args(r5_core->np, "power-domains",
> +						"#power-domain-cells");
> +
> +	if (num_pm_dev <= 0)
> +		return -EINVAL;
> +
> +	r5_core->pm_dev_core0 = kcalloc(num_pm_dev,
> +					sizeof(struct device *),
> +					GFP_KERNEL);
> +	if (!r5_core->pm_dev_core0)
> +		ret = -ENOMEM;
> +
> +	r5_core->pm_dev_core0_link = kcalloc(num_pm_dev,
> +					     sizeof(struct device_link *),
> +					     GFP_KERNEL);
> +	if (!r5_core->pm_dev_core0_link) {
> +		kfree(r5_core->pm_dev_core0);
> +		r5_core->pm_dev_core0 = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	r5_core->num_pm_dev = num_pm_dev;
> +
> +	/*
> +	 * start from 2nd entry in power-domains property list as
> +	 * for zynqmp we only add TCM power domains and not core's power domain.
> +	 * 1st entry is used to configure r5 operation mode.
> +	 */
> +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> +		r5_core->pm_dev_core0[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR_OR_NULL(r5_core->pm_dev_core0[i])) {
> +			dev_dbg(dev, "failed to attach pm domain %d, ret=%ld\n", i,
> +				PTR_ERR(r5_core->pm_dev_core0[i]));
> +			ret = -EINVAL;
> +			goto fail_add_pm_domains;
> +		}
> +		r5_core->pm_dev_core0_link[i] = device_link_add(dev,
> +								r5_core->pm_dev_core0[i],
> +								DL_FLAG_STATELESS |
> +								DL_FLAG_RPM_ACTIVE |
> +								DL_FLAG_PM_RUNTIME);
> +		if (!r5_core->pm_dev_core0_link[i]) {
> +			dev_pm_domain_detach(r5_core->pm_dev_core0[i], true);
> +			r5_core->pm_dev_core0[i] = NULL;
> +			ret = -EINVAL;
> +			goto fail_add_pm_domains;
> +		}
> +	}
> +
> +	if (cluster->mode == SPLIT_MODE)
> +		return 0;
> +
> +	r5_core->pm_dev_core1 = kcalloc(num_pm_dev,
> +					sizeof(struct device *),
> +					GFP_KERNEL);
> +	if (!r5_core->pm_dev_core1) {
> +		ret = -ENOMEM;
> +		goto fail_add_pm_domains;
> +	}
> +
> +	r5_core->pm_dev_core1_link = kcalloc(num_pm_dev,
> +					     sizeof(struct device_link *),
> +					     GFP_KERNEL);
> +	if (!r5_core->pm_dev_core1_link) {
> +		kfree(r5_core->pm_dev_core1);
> +		r5_core->pm_dev_core1 = NULL;
> +		ret = -ENOMEM;
> +		goto fail_add_pm_domains;
> +	}
> +
> +	/* get second core's device to detach its power-domains */

Attach or detach?

> +	np = of_get_next_child(cluster->dev->of_node, of_node_get(dev->of_node));
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev) {
> +		dev_err(cluster->dev, "core1 platform device not available\n");
> +		kfree(r5_core->pm_dev_core1);
> +		kfree(r5_core->pm_dev_core1_link);
> +		r5_core->pm_dev_core1 = NULL;
> +		r5_core->pm_dev_core1_link = NULL;
> +		ret = -EINVAL;
> +		goto fail_add_pm_domains;
> +	}
> +
> +	dev2 = &pdev->dev;
> +
> +	/* for zynqmp we only add TCM power domains and not core's power domain */
> +	for (j = 1; j < r5_core->num_pm_dev; j++) {
> +		r5_core->pm_dev_core1[j] = dev_pm_domain_attach_by_id(dev2, j);
> +		if (!r5_core->pm_dev_core1[j]) {
> +			dev_dbg(dev, "can't attach to pm domain %d\n", j);
> +			ret = -EINVAL;
> +			goto fail_add_pm_domains_lockstep;
> +		} else if (IS_ERR(r5_core->pm_dev_core1[j])) {
> +			dev_dbg(dev, "can't attach to pm domain %d\n", j);
> +			ret = PTR_ERR(r5_core->pm_dev_core1[j]);
> +			goto fail_add_pm_domains_lockstep;
> +		}
> +
> +		r5_core->pm_dev_core1_link[j] = device_link_add(dev,
> +								r5_core->pm_dev_core1[j],
> +								DL_FLAG_STATELESS |
> +								DL_FLAG_RPM_ACTIVE |
> +								DL_FLAG_PM_RUNTIME);
> +		if (!r5_core->pm_dev_core1_link[j]) {
> +			dev_pm_domain_detach(r5_core->pm_dev_core1[j], true);
> +			r5_core->pm_dev_core1[j] = NULL;
> +			ret = -ENODEV;
> +			goto fail_add_pm_domains_lockstep;
> +		}
> +	}
> +
> +fail_add_pm_domains_lockstep:
> +	while (--j >= 0) {
> +		device_link_del(r5_core->pm_dev_core1_link[j]);
> +		dev_pm_domain_detach(r5_core->pm_dev_core1[j], true);
> +	}
> +	kfree(r5_core->pm_dev_core1);
> +	r5_core->pm_dev_core1 = NULL;
> +	kfree(r5_core->pm_dev_core1_link);
> +	r5_core->pm_dev_core1_link = NULL;
> +
> +fail_add_pm_domains:
> +	while (--i >= 0) {
> +		device_link_del(r5_core->pm_dev_core0_link[i]);
> +		dev_pm_domain_detach(r5_core->pm_dev_core0[i], true);
> +	}
> +	kfree(r5_core->pm_dev_core0);
> +	r5_core->pm_dev_core0 = NULL;
> +	kfree(r5_core->pm_dev_core0_link);
> +	r5_core->pm_dev_core0_link = NULL;
> +
> +	return ret;
> +}
> +
>  /**
>   * zynqmp_r5_rproc_prepare()
>   * adds carveouts for TCM bank and reserved memory regions
> @@ -770,19 +966,30 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>  {
>  	int ret;
>  
> +	ret = zynqmp_r5_add_pm_domains(rproc);
> +	if (ret) {
> +		dev_err(&rproc->dev, "failed to add pm domains\n");
> +		return ret;
> +	}
> +
>  	ret = add_tcm_banks(rproc);
>  	if (ret) {
>  		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> -		return ret;
> +		goto fail_prepare;
>  	}
>  
>  	ret = add_mem_regions_carveout(rproc);
>  	if (ret) {
>  		dev_err(&rproc->dev, "failed to get reserve mem regions %d\n", ret);
> -		return ret;
> +		goto fail_prepare;
>  	}
>  
>  	return 0;
> +
> +fail_prepare:
> +	zynqmp_r5_remove_pm_domains(rproc);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -801,6 +1008,8 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>  
>  	r5_core = rproc->priv;
>  
> +	zynqmp_r5_remove_pm_domains(rproc);
> +
>  	for (i = 0; i < r5_core->tcm_bank_count; i++) {
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>  		if (zynqmp_pm_release_node(pm_domain_id))
> -- 
> 2.25.1
> 

