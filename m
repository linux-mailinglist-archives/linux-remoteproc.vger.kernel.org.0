Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8584A6CC788
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Mar 2023 18:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjC1QJE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 28 Mar 2023 12:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjC1QI6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Mar 2023 12:08:58 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844F4E187;
        Tue, 28 Mar 2023 09:08:48 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32SG8dQJ077852;
        Tue, 28 Mar 2023 11:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1680019719;
        bh=2VVefX+qtIG2/6m++0mwqFs5UXcjQLHh8rcU9bAgqPQ=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=iDgVk564h57MvTKhQ0UlO6gLAXRbECffcsufyKgG5RVpi9+fOM/iMwduw6LLzA/qd
         w31DHLam2s5czxjOlmjViKq4WMr9m0/IE85pz/sUmGFekpNtXkkQOtUxefLzVaeNZV
         rVdMoYIAbuvdn+ppYp+/ofcxEj0VbQwxvyy/RA00=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32SG8d0u089843
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Mar 2023 11:08:39 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 28
 Mar 2023 11:08:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 28 Mar 2023 11:08:39 -0500
Received: from [10.250.148.71] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32SG8VLi016153;
        Tue, 28 Mar 2023 11:08:32 -0500
Message-ID: <1a24f99a-99c1-bf00-e5e7-1085cfd8faf5@ti.com>
Date:   Tue, 28 Mar 2023 21:38:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/3] remoteproc: k3-r5: Use separate compatible string
 for TI AM62x SoC family
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <andersson@kernel.org>, <devicetree@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <linux-remoteproc@vger.kernel.org>,
        <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <s-anna@ti.com>,
        <hnagalla@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>
References: <20230310162544.3468365-1-devarsht@ti.com>
 <20230310162544.3468365-4-devarsht@ti.com> <20230317161757.GA2471094@p14s>
 <f08e550b-2f15-0f84-c0ca-05e0b803481a@kernel.org>
From:   Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <f08e550b-2f15-0f84-c0ca-05e0b803481a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Roger,

On 28/03/23 13:22, Roger Quadros wrote:
> Hi Devarsh,
> 
> On 17/03/2023 18:17, Mathieu Poirier wrote:
>> On Fri, Mar 10, 2023 at 09:55:44PM +0530, Devarsh Thakkar wrote:
>>> AM62 and AM62A SoCs use single core R5F which is a new scenario
>>> different than the one being used with CLUSTER_MODE_SINGLECPU which is
>>> for utilizing a single core from a set of cores available in R5F cluster
>>> present in the SoC.
>>>
>>> To support this single core scenario map it with newly defined
>>> CLUSTER_MODE_SINGLECORE and use it when compatible is set to
>>> ti,am62-r5fss.
>>>
>>> Also set PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE config for
>>> CLUSTER_MODE_SINGLECORE too as it is required by R5 core when it is
>>> being as general purpose core instead of device manager.
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>> V2:
>>> - Fix indentation and ordering issues as per review comments
>>> V3:
>>> - Change CLUSTER_MODE_NONE value to -1
>>> V4:
>>> - No change
>>> V5:
>>> - No change (fixing typo in email address)
>>> V6:
>>>     - Use CLUSTER_MODE_SINGLECORE for AM62x
>>>     - Set PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE for single core.
>>> V7:
>>>     - Simplify and rebase on top of base commit "[PATCH v7] remoteproc: k3-r5: Simplify cluster
>>>       mode setting"
>>> ---
>>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 59 +++++++++++++++++++-----
>>>   1 file changed, 48 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> index c2ec0f432921..df32f6bc4325 100644
>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> @@ -71,14 +71,16 @@ struct k3_r5_mem {
>>>   /*
>>>    * All cluster mode values are not applicable on all SoCs. The following
>>>    * are the modes supported on various SoCs:
>>> - *   Split mode      : AM65x, J721E, J7200 and AM64x SoCs
>>> - *   LockStep mode   : AM65x, J721E and J7200 SoCs
>>> - *   Single-CPU mode : AM64x SoCs only
>>> + *   Split mode       : AM65x, J721E, J7200 and AM64x SoCs
>>> + *   LockStep mode    : AM65x, J721E and J7200 SoCs
>>> + *   Single-CPU mode  : AM64x SoCs only
>>> + *   Single-Core mode : AM62x, AM62A SoCs
>>>    */
>>>   enum cluster_mode {
>>>   	CLUSTER_MODE_SPLIT = 0,
>>>   	CLUSTER_MODE_LOCKSTEP,
>>>   	CLUSTER_MODE_SINGLECPU,
>>> +	CLUSTER_MODE_SINGLECORE
> 
> What is the difference in device driver behaviour between
> SINGLECPU and SINGLECORE?
> 
Yeah there is quite a bit of common code flow between the two but the 
fundamental difference is that you use CLUSTER_MODE_SINGLECPU when
you have two R5F cores but you want to use only single R5F core albeit
with using TCM of both the cores whereas CLUSTER_MODE_SINGLECORE is
for the scenario where you have single core R5F's only.

Also the bindings for CLUSTER_MODE_SINGLECPU are already upstream so did
not want to break them either : 
https://gitlab.com/linux-kernel/linux-next/-/blob/next-20230328/Documentation/devicetree/bindings/remoteproc/ti%2Ck3-r5f-rproc.yaml#L20.

Regards
Devarsh

> If there is no difference then you should not introduce
> a new enum. >
>>>   };
>>>   
>>>   /**
>>> @@ -86,11 +88,13 @@ enum cluster_mode {
>>>    * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
>>>    * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
>>>    * @single_cpu_mode: flag to denote if SoC/IP supports Single-CPU mode
>>> + * @is_single_core: flag to denote if SoC/IP has only single core R5
>>>    */
>>>   struct k3_r5_soc_data {
>>>   	bool tcm_is_double;
>>>   	bool tcm_ecc_autoinit;
>>>   	bool single_cpu_mode;
>>> +	bool is_single_core;
>>>   };
>>>   
>>>   /**
>>> @@ -838,7 +842,8 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
>>>   
>>>   	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>>>   	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>>> -	    cluster->mode == CLUSTER_MODE_SINGLECPU) {
>>> +	    cluster->mode == CLUSTER_MODE_SINGLECPU ||
>>> +	    cluster->mode == CLUSTER_MODE_SINGLECORE) {
>>>   		core = core0;
>>>   	} else {
>>>   		core = kproc->core;
>>> @@ -877,7 +882,8 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
>>>   		 * with the bit configured, so program it only on
>>>   		 * permitted cores
>>>   		 */
>>> -		if (cluster->mode == CLUSTER_MODE_SINGLECPU) {
>>> +		if (cluster->mode == CLUSTER_MODE_SINGLECPU ||
>>> +		    cluster->mode == CLUSTER_MODE_SINGLECORE) {
>>>   			set_cfg = PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE;
>>>   		} else {
>>>   			/*
>>> @@ -1069,6 +1075,7 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
>>>   
>>>   	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>>>   	    cluster->mode == CLUSTER_MODE_SINGLECPU ||
>>> +	    cluster->mode == CLUSTER_MODE_SINGLECORE ||
>>>   	    !cluster->soc_data->tcm_is_double)
>>>   		return;
>>>   
>>> @@ -1145,6 +1152,8 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>>>   	if (cluster->soc_data->single_cpu_mode) {
>>>   		mode = cfg & PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE ?
>>>   				CLUSTER_MODE_SINGLECPU : CLUSTER_MODE_SPLIT;
>>> +	} else if (cluster->soc_data->is_single_core) {
>>> +		mode = CLUSTER_MODE_SINGLECORE;
>>
>> I have commented twice on this before - whether it is soc_data->single_cpu_mode or
>> soc_data->is_single_core, I don't want to see them used elsewhere than in a
>> single function.  Either in probe() or another function, use them once to set
>> cluster->mode and never again.
>>
>> I will silently drop any other patchset that doesn't address this.
>>
>>>   	} else {
>>>   		mode = cfg & PROC_BOOT_CFG_FLAG_R5_LOCKSTEP ?
>>>   				CLUSTER_MODE_LOCKSTEP : CLUSTER_MODE_SPLIT;
>>> @@ -1264,9 +1273,12 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>   			goto err_add;
>>>   		}
>>>   
>>> -		/* create only one rproc in lockstep mode or single-cpu mode */
>>> +		/* create only one rproc in lockstep, single-cpu or
>>> +		 * single core mode
>>> +		 */
>>>   		if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>>> -		    cluster->mode == CLUSTER_MODE_SINGLECPU)
>>> +		    cluster->mode == CLUSTER_MODE_SINGLECPU ||
>>> +		    cluster->mode == CLUSTER_MODE_SINGLECORE)
>>>   			break;
>>>   	}
>>>   
>>> @@ -1709,19 +1721,33 @@ static int k3_r5_probe(struct platform_device *pdev)
>>>   		/*
>>>   		 * default to most common efuse configurations - Split-mode on AM64x
>>>   		 * and LockStep-mode on all others
>>> +		 * default to most common efuse configurations -
>>> +		 * Split-mode on AM64x
>>> +		 * Single core on AM62x
>>> +		 * LockStep-mode on all others
>>>   		 */
>>> -		cluster->mode = data->single_cpu_mode ?
>>> +		if (!data->is_single_core)
>>> +			cluster->mode = data->single_cpu_mode ?
>>>   					CLUSTER_MODE_SPLIT : CLUSTER_MODE_LOCKSTEP;
>>> +		else
>>> +			cluster->mode = CLUSTER_MODE_SINGLECORE;
>>>   	}
>>>   
>>> -	if (cluster->mode == CLUSTER_MODE_SINGLECPU && !data->single_cpu_mode) {
>>> +	if  ((cluster->mode == CLUSTER_MODE_SINGLECPU && !data->single_cpu_mode) ||
>>> +	     (cluster->mode == CLUSTER_MODE_SINGLECORE && !data->is_single_core)) {
>>>   		dev_err(dev, "Cluster mode = %d is not supported on this SoC\n", cluster->mode);
>>>   		return -EINVAL;
>>>   	}
>>>   
>>>   	num_cores = of_get_available_child_count(np);
>>> -	if (num_cores != 2) {
>>> -		dev_err(dev, "MCU cluster requires both R5F cores to be enabled, num_cores = %d\n",
>>> +	if (num_cores != 2 && !data->is_single_core) {
>>> +		dev_err(dev, "MCU cluster requires both R5F cores to be enabled but num_cores is set to = %d\n",
>>> +			num_cores);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	if (num_cores != 1 && data->is_single_core) {
>>> +		dev_err(dev, "SoC supports only single core R5 but num_cores is set to %d\n",
>>>   			num_cores);
>>>   		return -ENODEV;
>>>   	}
>>> @@ -1763,18 +1789,28 @@ static const struct k3_r5_soc_data am65_j721e_soc_data = {
>>>   	.tcm_is_double = false,
>>>   	.tcm_ecc_autoinit = false,
>>>   	.single_cpu_mode = false,
>>> +	.is_single_core = false,
>>>   };
>>>   
>>>   static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
>>>   	.tcm_is_double = true,
>>>   	.tcm_ecc_autoinit = true,
>>>   	.single_cpu_mode = false,
>>> +	.is_single_core = false,
>>>   };
>>>   
>>>   static const struct k3_r5_soc_data am64_soc_data = {
>>>   	.tcm_is_double = true,
>>>   	.tcm_ecc_autoinit = true,
>>>   	.single_cpu_mode = true,
>>> +	.is_single_core = false,
>>> +};
>>> +
>>> +static const struct k3_r5_soc_data am62_soc_data = {
>>> +	.tcm_is_double = false,
>>> +	.tcm_ecc_autoinit = true,
>>> +	.single_cpu_mode = false,
>>> +	.is_single_core = true,
>>>   };
>>>   
>>>   static const struct of_device_id k3_r5_of_match[] = {
>>> @@ -1782,6 +1818,7 @@ static const struct of_device_id k3_r5_of_match[] = {
>>>   	{ .compatible = "ti,j721e-r5fss", .data = &am65_j721e_soc_data, },
>>>   	{ .compatible = "ti,j7200-r5fss", .data = &j7200_j721s2_soc_data, },
>>>   	{ .compatible = "ti,am64-r5fss",  .data = &am64_soc_data, },
>>> +	{ .compatible = "ti,am62-r5fss",  .data = &am62_soc_data, },
>>>   	{ .compatible = "ti,j721s2-r5fss",  .data = &j7200_j721s2_soc_data, },
>>>   	{ /* sentinel */ },
>>>   };
>>> -- 
>>> 2.34.1
>>>
> 
> cheers,
> -roger
