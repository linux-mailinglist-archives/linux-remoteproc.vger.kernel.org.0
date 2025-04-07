Return-Path: <linux-remoteproc+bounces-3340-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6AFA7DFDA
	for <lists+linux-remoteproc@lfdr.de>; Mon,  7 Apr 2025 15:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FEFD1768BB
	for <lists+linux-remoteproc@lfdr.de>; Mon,  7 Apr 2025 13:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA10186E2E;
	Mon,  7 Apr 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pP1g8jHj"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26331940A2;
	Mon,  7 Apr 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033399; cv=none; b=S9n6/oT6upyZEoy2vPJIxFc+SdsIQsgp2Pr/a6bZHSP4P2utZgKgE2uI3g42/lZlk4cewMI8gSRTus4ENQDaE3kmeU4Trsg1lIBJtn5MU/ZeYURB993UMNAfUSbcIHDe7lckdkgn3fts++DZlVqfMj0bQP7mUwM0IipU0YA12Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033399; c=relaxed/simple;
	bh=X1ea2CJNe5g29eU7NaxN/Y1blw5H6lgzb0bZxLXWx0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZmAgn+yEIR3xzcqPG9sCi9xOhPiU3N+BUjiovfZs9uM/eJ3f5PE8HpWLQ65eOyHy7ZNBe/Ur2cyffW6Q2kYiwZCSjEh/vEi1hkF8VST1HWvpk3uVAQS2uY4Wu7+FRFLJlXRGbYod75nJDNiqt//wFxkRvUAc+0lpAMPz88DMf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pP1g8jHj; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Dh9R6875578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744033389;
	bh=dGBpYQ2u4Xg72qKcD8o7JaVtQ8ZvFq1mwxt4AEdFmf8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pP1g8jHjn4YkrYv9Bor31jj3olwp0KUAVLGkSLly6fYT4Nwa8tzD8Rr61c8aDHBkl
	 MCiBzqlHEVsmF5ihv5H6JOGVLi4BK0b4xuH8wZDgJr4D8a/ULGZ16WaPy+ZMSWUw2k
	 syTaYitdzI4Duo2RwXyV5tgQDqPSJ7FhcBwits2k=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537Dh9FL027727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:43:09 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:43:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:43:09 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Dh8uN071585;
	Mon, 7 Apr 2025 08:43:08 -0500
Message-ID: <0636d6a8-7de9-4887-82eb-3f5fd8a208d5@ti.com>
Date: Mon, 7 Apr 2025 08:43:08 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/26] remoteproc: k3-m4: Use k3_rproc_mem_data
 structure for memory info
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-6-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250317120622.1746415-6-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 3/17/25 7:06 AM, Beleswar Padhi wrote:
> The ti_k3_m4_remoteproc.c driver previously hardcoded device memory
> region addresses and names. Change this to use the k3_rproc_mem_data
> structure to store memory information. This aligns with DSP and R5
> drivers, and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_m4_remoteproc.c | 60 ++++++++++++++++++------
>   1 file changed, 45 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index d0ee7a8d460d..e83bef7cfddf 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -20,9 +20,6 @@
>   #include "remoteproc_internal.h"
>   #include "ti_sci_proc.h"
>   
> -#define K3_M4_IRAM_DEV_ADDR 0x00000
> -#define K3_M4_DRAM_DEV_ADDR 0x30000
> -

So two patches ago when you did this same thing for R5, you kept the
K3_R5_TCM_DEV_ADDR define. But here you remove the adress #defines.
I don't care if you leave them or keep them, but just do the same
either way for both M4 and R5.

Andrew

>   /**
>    * struct k3_m4_rproc_mem - internal memory structure
>    * @cpu_addr: MPU virtual address of the memory region
> @@ -38,15 +35,29 @@ struct k3_m4_rproc_mem {
>   };
>   
>   /**
> - * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
> + * struct k3_m4_mem_data - memory definitions for a remote processor
>    * @name: name for this memory entry
>    * @dev_addr: device address for the memory entry
>    */
> -struct k3_m4_rproc_mem_data {
> +struct k3_m4_mem_data {
>   	const char *name;
>   	const u32 dev_addr;
>   };
>   
> +/**
> + * struct k3_m4_dev_data - device data structure for a M4 core
> + * @mems: pointer to memory definitions for a M4 core
> + * @num_mems: number of memory regions in @mems
> + * @boot_align_addr: boot vector address alignment granularity
> + * @uses_lreset: flag to denote the need for local reset management
> + */
> +struct k3_m4_dev_data {
> +	const struct k3_m4_mem_data *mems;
> +	u32 num_mems;
> +	u32 boot_align_addr;
> +	bool uses_lreset;
> +};
> +
>   /**
>    * struct k3_m4_rproc - k3 remote processor driver structure
>    * @dev: cached device pointer
> @@ -56,6 +67,7 @@ struct k3_m4_rproc_mem_data {
>    * @rmem: reserved memory regions data
>    * @num_rmems: number of reserved memory regions
>    * @reset: reset control handle
> + * @data: pointer to M4-specific device data
>    * @tsp: TI-SCI processor control handle
>    * @ti_sci: TI-SCI handle
>    * @ti_sci_id: TI-SCI device identifier
> @@ -71,6 +83,7 @@ struct k3_m4_rproc {
>   	struct k3_m4_rproc_mem *rmem;
>   	int num_rmems;
>   	struct reset_control *reset;
> +	const struct k3_m4_dev_data *data;
>   	struct ti_sci_proc *tsp;
>   	const struct ti_sci_handle *ti_sci;
>   	u32 ti_sci_id;
> @@ -336,14 +349,13 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
>   static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>   				       struct k3_m4_rproc *kproc)
>   {
> -	static const char * const mem_names[] = { "iram", "dram" };
> -	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
> +	const struct k3_m4_dev_data *data = kproc->data;
>   	struct device *dev = &pdev->dev;
>   	struct resource *res;
>   	int num_mems;
>   	int i;
>   
> -	num_mems = ARRAY_SIZE(mem_names);
> +	num_mems = kproc->data->num_mems;
>   	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
>   				  sizeof(*kproc->mem), GFP_KERNEL);
>   	if (!kproc->mem)
> @@ -351,17 +363,17 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>   
>   	for (i = 0; i < num_mems; i++) {
>   		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   mem_names[i]);
> +						   data->mems[i].name);
>   		if (!res) {
>   			dev_err(dev, "found no memory resource for %s\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>   			return -EINVAL;
>   		}
>   		if (!devm_request_mem_region(dev, res->start,
>   					     resource_size(res),
>   					     dev_name(dev))) {
>   			dev_err(dev, "could not request %s region for resource\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>   			return -EBUSY;
>   		}
>   
> @@ -369,15 +381,15 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>   							 resource_size(res));
>   		if (!kproc->mem[i].cpu_addr) {
>   			dev_err(dev, "failed to map %s memory\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>   			return -ENOMEM;
>   		}
>   		kproc->mem[i].bus_addr = res->start;
> -		kproc->mem[i].dev_addr = mem_addrs[i];
> +		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
>   		kproc->mem[i].size = resource_size(res);
>   
>   		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> -			mem_names[i], &kproc->mem[i].bus_addr,
> +			data->mems[i].name, &kproc->mem[i].bus_addr,
>   			kproc->mem[i].size, kproc->mem[i].cpu_addr,
>   			kproc->mem[i].dev_addr);
>   	}
> @@ -563,12 +575,17 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct k3_m4_rproc *kproc;
> +	const struct k3_m4_dev_data *data;
>   	struct rproc *rproc;
>   	const char *fw_name;
>   	bool r_state = false;
>   	bool p_state = false;
>   	int ret;
>   
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
>   	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
> @@ -583,6 +600,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   	kproc = rproc->priv;
>   	kproc->dev = dev;
>   	kproc->rproc = rproc;
> +	kproc->data = data;
>   	platform_set_drvdata(pdev, rproc);
>   
>   	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
> @@ -650,8 +668,20 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct k3_m4_mem_data am64_m4_mems[] = {
> +	{ .name = "iram", .dev_addr = 0x0 },
> +	{ .name = "dram", .dev_addr = 0x30000 },
> +};
> +
> +static const struct k3_m4_dev_data am64_m4_data = {
> +	.mems = am64_m4_mems,
> +	.num_mems = ARRAY_SIZE(am64_m4_mems),
> +	.boot_align_addr = SZ_1K,
> +	.uses_lreset = true,
> +};
> +
>   static const struct of_device_id k3_m4_of_match[] = {
> -	{ .compatible = "ti,am64-m4fss", },
> +	{ .compatible = "ti,am64-m4fss", .data = &am64_m4_data, },
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, k3_m4_of_match);

