Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209E417AD93
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Mar 2020 18:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgCERv6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Mar 2020 12:51:58 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41358 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgCERv5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Mar 2020 12:51:57 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025Hpukn118362;
        Thu, 5 Mar 2020 11:51:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583430716;
        bh=h/jCiFThhXWTHs5cC/yIPDMa3W+bdpIujdaXVjBkNj4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PHqLZhIN2599xvGouemLM7nKrLs9m7tYXjtPW0HoMI+tHUCMs0bIWuuZ35HCLD8Xr
         T92yc6R6iyN7XVFb8F2bQ5Pw9BweF2ska3yHkweBdN/lWHYHxTv/VdAywajLhnrJpi
         fXlMBi9XVqbkHUZo+kZ09Tj/1MedF+YG7ZnK2Nrg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025Hputj110439;
        Thu, 5 Mar 2020 11:51:56 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 11:51:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 11:51:56 -0600
Received: from [128.247.81.254] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025HpumD033850;
        Thu, 5 Mar 2020 11:51:56 -0600
Subject: Re: [PATCHv7 07/15] remoteproc/omap: Add support for DRA7xx remote
 processors
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-8-t-kristo@ti.com> <20200304174827.GF8197@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <28f4c2d3-a3e7-a355-264e-8a8707ccabbc@ti.com>
Date:   Thu, 5 Mar 2020 11:51:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200304174827.GF8197@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 3/4/20 11:48 AM, Mathieu Poirier wrote:
> On Fri, Feb 21, 2020 at 12:19:28PM +0200, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> DRA7xx/AM57xx SoCs have two IPU and up to two DSP processor subsystems
>> for offloading different computation algorithms. The IPU processor
>> subsystem contains dual-core ARM Cortex-M4 processors, and is very
>> similar to those on OMAP5. The DSP processor subsystem is based on
>> the TI's standard TMS320C66x DSP CorePac core.
>>
>> Support has been added to the OMAP remoteproc driver through new
>> DRA7xx specific compatibles for properly probing and booting all
>> the different processor subsystem instances on DRA7xx/AM57xx
>> SoCs - IPU1, IPU2, DSP1 & DSP2. A build dependency with SOC_DRA7XX
>> is added to enable the driver to be built in DRA7xx-only configuration.
>>
>> The DSP boot address programming needed enhancement for DRA7xx as the
>> boot register fields are different on DRA7 compared to OMAP4 and OMAP5
>> SoCs. The register on DRA7xx contains additional fields within the
>> register and the boot address bit-field is right-shifted by 10 bits.
>> The internal memory parsing logic has also been updated to compute
>> the device addresses for the L2 RAM for DSP devices using relative
>> addressing logic, and to parse two additional RAMs at L1 level - L1P
>> and L1D. This allows the remoteproc driver to support loading into
>> these regions for a small subset of firmware images requiring as
>> such. The most common usage would be to use the L1 programmable
>> RAMs as L1 Caches.
>>
>> The firmware lookup logic also has to be adjusted for DRA7xx as
>> there are (can be) more than one instance of both the IPU and DSP
>> remote processors for the first time in OMAP4+ SoCs.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo@ti.com: moved address translation quirks to pdata]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>  drivers/remoteproc/Kconfig           |  2 +-
>>  drivers/remoteproc/omap_remoteproc.c | 38 +++++++++++++++++++++++++++-
>>  2 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index de3862c15fcc..b52abc2268cc 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -35,7 +35,7 @@ config MTK_SCP
>>  
>>  config OMAP_REMOTEPROC
>>  	tristate "OMAP remoteproc support"
>> -	depends on ARCH_OMAP4 || SOC_OMAP5
>> +	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
>>  	depends on OMAP_IOMMU
>>  	select MAILBOX
>>  	select OMAP2PLUS_MBOX
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index 872cd0df342b..8c3dc0edae95 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -34,10 +34,13 @@
>>   * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
>>   * @syscon: regmap handle for the system control configuration module
>>   * @boot_reg: boot register offset within the @syscon regmap
>> + * @boot_reg_shift: bit-field shift required for the boot address value in
>> + *		    @boot_reg
>>   */
>>  struct omap_rproc_boot_data {
>>  	struct regmap *syscon;
>>  	unsigned int boot_reg;
>> +	unsigned int boot_reg_shift;
>>  };
>>  
>>  /**
>> @@ -161,6 +164,8 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>  	struct omap_rproc *oproc = rproc->priv;
>>  	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>>  	u32 offset = bdata->boot_reg;
>> +	u32 value;
>> +	u32 mask;
>>  
>>  	if (rproc->bootaddr & (SZ_1K - 1)) {
>>  		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
>> @@ -168,7 +173,10 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>  		return -EINVAL;
>>  	}
>>  
>> -	regmap_write(bdata->syscon, offset, rproc->bootaddr);
>> +	value = rproc->bootaddr >> bdata->boot_reg_shift;
>> +	mask = ~(SZ_1K - 1) >> bdata->boot_reg_shift;
>> +
>> +	regmap_update_bits(bdata->syscon, offset, mask, value);
> 
> Please handle the return value.  We can either do it now or in 3 months when
> someone with an automated tools sends a patch.  Besides, omap_rproc_start() is
> already expecting an error from omap_rproc_write_dsp_boot_addr() so it's even
> easier.

OK, we can take care of regmap return in Patch 3.

regards
Suman

> 
> With the above:
> 
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
>>  
>>  	return 0;
>>  }
>> @@ -299,6 +307,13 @@ static const struct omap_rproc_mem_data ipu_mems[] = {
>>  	{ },
>>  };
>>  
>> +static const struct omap_rproc_mem_data dra7_dsp_mems[] = {
>> +	{ .name = "l2ram", .dev_addr = 0x800000 },
>> +	{ .name = "l1pram", .dev_addr = 0xe00000 },
>> +	{ .name = "l1dram", .dev_addr = 0xf00000 },
>> +	{ },
>> +};
>> +
>>  static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>  	.device_name	= "dsp",
>>  };
>> @@ -317,6 +332,16 @@ static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>  	.mems		= ipu_mems,
>>  };
>>  
>> +static const struct omap_rproc_dev_data dra7_dsp_dev_data = {
>> +	.device_name	= "dsp",
>> +	.mems		= dra7_dsp_mems,
>> +};
>> +
>> +static const struct omap_rproc_dev_data dra7_ipu_dev_data = {
>> +	.device_name	= "ipu",
>> +	.mems		= ipu_mems,
>> +};
>> +
>>  static const struct of_device_id omap_rproc_of_match[] = {
>>  	{
>>  		.compatible     = "ti,omap4-dsp",
>> @@ -334,6 +359,14 @@ static const struct of_device_id omap_rproc_of_match[] = {
>>  		.compatible     = "ti,omap5-ipu",
>>  		.data           = &omap5_ipu_dev_data,
>>  	},
>> +	{
>> +		.compatible     = "ti,dra7-dsp",
>> +		.data           = &dra7_dsp_dev_data,
>> +	},
>> +	{
>> +		.compatible     = "ti,dra7-ipu",
>> +		.data           = &dra7_ipu_dev_data,
>> +	},
>>  	{
>>  		/* end */
>>  	},
>> @@ -386,6 +419,9 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>  		return -EINVAL;
>>  	}
>>  
>> +	of_property_read_u32_index(np, "ti,bootreg", 2,
>> +				   &oproc->boot_data->boot_reg_shift);
>> +
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.17.1
>>
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

