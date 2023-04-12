Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DC56DF021
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Apr 2023 11:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjDLJT1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Apr 2023 05:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjDLJT0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Apr 2023 05:19:26 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADEF10F1;
        Wed, 12 Apr 2023 02:19:24 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33C9JDY8052195;
        Wed, 12 Apr 2023 04:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1681291153;
        bh=B5KBTLGR0HvDGhIJ+R+6qhJ89Y456NUm7iSUklZXQuk=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=YpC9wIbkV7gX3RMOG42yHGsFpwJhmXkJJjxsCANj47qJUtThmAUsGyzLxSoUkHGiO
         rZ4/4LI71W5Onqg0fGkmgtWuDvdH0yHRtTPLvxPxKmbx6oCC59erAwGZaC0ZZyG/94
         CN/NVxGsvmhbics+3GeAhlBD8NIuMOan1tvXxo0s=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33C9JDht048563
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Apr 2023 04:19:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 04:19:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 04:19:13 -0500
Received: from [10.24.69.114] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33C9J8u0015809;
        Wed, 12 Apr 2023 04:19:08 -0500
Message-ID: <bfe1681c-9515-5c3c-6f9a-276e60d3db52@ti.com>
Date:   Wed, 12 Apr 2023 14:49:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [EXTERNAL] Re: [PATCH v7 4/4] soc: ti: pruss: Add helper
 functions to set GPI mode, MII_RT_event and XFR
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        MD Danish Anwar <danishanwar@ti.com>
CC:     "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Nishanth Menon <nm@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <srk@ti.com>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20230404115336.599430-1-danishanwar@ti.com>
 <20230404115336.599430-5-danishanwar@ti.com> <20230411175707.GE38361@p14s>
From:   Md Danish Anwar <a0501179@ti.com>
Organization: Texas Instruments
In-Reply-To: <20230411175707.GE38361@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 11/04/23 23:27, Mathieu Poirier wrote:
> On Tue, Apr 04, 2023 at 05:23:36PM +0530, MD Danish Anwar wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> The PRUSS CFG module is represented as a syscon node and is currently
>> managed by the PRUSS platform driver. Add easy accessor functions to set
>> GPI mode, MII_RT event enable/disable and XFR (XIN XOUT) enable/disable
>> to enable the PRUSS Ethernet usecase. These functions reuse the generic
>> pruss_cfg_update() API function.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
>> Reviewed-by: Roger Quadros <rogerq@kernel.org>
>> Reviewed-by: Tony Lindgren <tony@atomide.com>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  drivers/remoteproc/pru_rproc.c   | 15 -------
>>  drivers/soc/ti/pruss.c           | 74 ++++++++++++++++++++++++++++++++
>>  include/linux/remoteproc/pruss.h | 51 ++++++++++++++++++++++
>>  3 files changed, 125 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
>> index 4ddd5854d56e..a88861737dec 100644
>> --- a/drivers/remoteproc/pru_rproc.c
>> +++ b/drivers/remoteproc/pru_rproc.c
>> @@ -81,21 +81,6 @@ enum pru_iomem {
>>  	PRU_IOMEM_MAX,
>>  };
>>  
>> -/**
>> - * enum pru_type - PRU core type identifier
>> - *
>> - * @PRU_TYPE_PRU: Programmable Real-time Unit
>> - * @PRU_TYPE_RTU: Auxiliary Programmable Real-Time Unit
>> - * @PRU_TYPE_TX_PRU: Transmit Programmable Real-Time Unit
>> - * @PRU_TYPE_MAX: just keep this one at the end
>> - */
>> -enum pru_type {
>> -	PRU_TYPE_PRU = 0,
>> -	PRU_TYPE_RTU,
>> -	PRU_TYPE_TX_PRU,
>> -	PRU_TYPE_MAX,
>> -};
>> -
>>  /**
>>   * struct pru_private_data - device data for a PRU core
>>   * @type: type of the PRU core (PRU, RTU, Tx_PRU)
>> diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
>> index 0e37fe142615..64a1880ba4ee 100644
>> --- a/drivers/soc/ti/pruss.c
>> +++ b/drivers/soc/ti/pruss.c
>> @@ -213,6 +213,80 @@ int pruss_cfg_set_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 mux)
>>  }
>>  EXPORT_SYMBOL_GPL(pruss_cfg_set_gpmux);
>>  
>> +/**
>> + * pruss_cfg_gpimode() - set the GPI mode of the PRU
>> + * @pruss: the pruss instance handle
>> + * @pru_id: id of the PRU core within the PRUSS
>> + * @mode: GPI mode to set
>> + *
>> + * Sets the GPI mode for a given PRU by programming the
>> + * corresponding PRUSS_CFG_GPCFGx register
>> + *
>> + * Return: 0 on success, or an error code otherwise
>> + */
>> +int pruss_cfg_gpimode(struct pruss *pruss, enum pruss_pru_id pru_id,
>> +		      enum pruss_gpi_mode mode)
>> +{
>> +	if (pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
>> +		return -EINVAL;
>> +
>> +	if (mode < 0 || mode > PRUSS_GPI_MODE_MAX)
>> +		return -EINVAL;
>> +
>> +	return pruss_cfg_update(pruss, PRUSS_CFG_GPCFG(pru_id),
>> +				PRUSS_GPCFG_PRU_GPI_MODE_MASK,
>> +				mode << PRUSS_GPCFG_PRU_GPI_MODE_SHIFT);
>> +}
>> +EXPORT_SYMBOL_GPL(pruss_cfg_gpimode);
>> +
>> +/**
>> + * pruss_cfg_miirt_enable() - Enable/disable MII RT Events
>> + * @pruss: the pruss instance
>> + * @enable: enable/disable
>> + *
>> + * Enable/disable the MII RT Events for the PRUSS.
>> + *
>> + * Return: 0 on success, or an error code otherwise
>> + */
>> +int pruss_cfg_miirt_enable(struct pruss *pruss, bool enable)
>> +{
>> +	u32 set = enable ? PRUSS_MII_RT_EVENT_EN : 0;
>> +
>> +	return pruss_cfg_update(pruss, PRUSS_CFG_MII_RT,
>> +				PRUSS_MII_RT_EVENT_EN, set);
>> +}
>> +EXPORT_SYMBOL_GPL(pruss_cfg_miirt_enable);
>> +
>> +/**
>> + * pruss_cfg_xfr_enable() - Enable/disable XIN XOUT shift functionality
>> + * @pruss: the pruss instance
>> + * @pru_type: PRU core type identifier
>> + * @enable: enable/disable
>> + *
>> + * Return: 0 on success, or an error code otherwise
>> + */
>> +int pruss_cfg_xfr_enable(struct pruss *pruss, enum pru_type pru_type,
>> +			 bool enable)
>> +{
>> +	u32 mask, set;
>> +
>> +	switch (pru_type) {
>> +	case PRU_TYPE_PRU:
>> +		mask = PRUSS_SPP_XFER_SHIFT_EN;
>> +		break;
>> +	case PRU_TYPE_RTU:
>> +		mask = PRUSS_SPP_RTU_XFR_SHIFT_EN;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	set = enable ? mask : 0;
>> +
>> +	return pruss_cfg_update(pruss, PRUSS_CFG_SPP, mask, set);
>> +}
>> +EXPORT_SYMBOL_GPL(pruss_cfg_xfr_enable);
>> +
>>  static void pruss_of_free_clk_provider(void *data)
>>  {
>>  	struct device_node *clk_mux_np = data;
>> diff --git a/include/linux/remoteproc/pruss.h b/include/linux/remoteproc/pruss.h
>> index 5641153459a7..b68ab8735247 100644
>> --- a/include/linux/remoteproc/pruss.h
>> +++ b/include/linux/remoteproc/pruss.h
>> @@ -34,6 +34,33 @@ enum pruss_gp_mux_sel {
>>  	PRUSS_GP_MUX_SEL_MAX,
>>  };
>>  
>> +/*
>> + * enum pruss_gpi_mode - PRUSS GPI configuration modes, used
>> + *			 to program the PRUSS_GPCFG0/1 registers
>> + */
>> +enum pruss_gpi_mode {
>> +	PRUSS_GPI_MODE_DIRECT = 0,
>> +	PRUSS_GPI_MODE_PARALLEL,
>> +	PRUSS_GPI_MODE_28BIT_SHIFT,
>> +	PRUSS_GPI_MODE_MII,
>> +	PRUSS_GPI_MODE_MAX,
>> +};
>> +
>> +/**
>> + * enum pru_type - PRU core type identifier
>> + *
>> + * @PRU_TYPE_PRU: Programmable Real-time Unit
>> + * @PRU_TYPE_RTU: Auxiliary Programmable Real-Time Unit
>> + * @PRU_TYPE_TX_PRU: Transmit Programmable Real-Time Unit
>> + * @PRU_TYPE_MAX: just keep this one at the end
>> + */
>> +enum pru_type {
>> +	PRU_TYPE_PRU = 0,
>> +	PRU_TYPE_RTU,
>> +	PRU_TYPE_TX_PRU,
>> +	PRU_TYPE_MAX,
>> +};
>> +
> 
> These go in pruss_driver.h
> 
>>  /**
>>   * enum pruss_pru_id - PRU core identifiers
>>   * @PRUSS_PRU0: PRU Core 0.
>> @@ -98,6 +125,11 @@ int pruss_release_mem_region(struct pruss *pruss,
>>  			     struct pruss_mem_region *region);
>>  int pruss_cfg_get_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 *mux);
>>  int pruss_cfg_set_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 mux);
>> +int pruss_cfg_gpimode(struct pruss *pruss, enum pruss_pru_id pru_id,
>> +		      enum pruss_gpi_mode mode);
>> +int pruss_cfg_miirt_enable(struct pruss *pruss, bool enable);
>> +int pruss_cfg_xfr_enable(struct pruss *pruss, enum pru_type pru_type,
>> +			 bool enable);
>>  
>>  #else
>>  
>> @@ -133,6 +165,25 @@ static inline int pruss_cfg_set_gpmux(struct pruss *pruss,
>>  	return ERR_PTR(-EOPNOTSUPP);
>>  }
>>  
>> +static inline int pruss_cfg_gpimode(struct pruss *pruss,
>> +				    enum pruss_pru_id pru_id,
>> +				    enum pruss_gpi_mode mode)
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +
>> +static inline int pruss_cfg_miirt_enable(struct pruss *pruss, bool enable)
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +
>> +static inline int pruss_cfg_xfr_enable(struct pruss *pruss,
>> +				       enum pru_type pru_type,
>> +				       bool enable);
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +
> 
> So do these.
> 
> Thanks,
> Mathieu
> 

Sure, Mathieu. I'll move all these definitions and enums to
linux/pruss_driver.h from linux/remoteproc/pruss.h accordingly and send next
revision.

>>  #endif /* CONFIG_TI_PRUSS */
>>  
>>  #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
>> -- 
>> 2.25.1
>>

-- 
Thanks and Regards,
Danish.
