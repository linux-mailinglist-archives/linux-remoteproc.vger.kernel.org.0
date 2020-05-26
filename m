Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F011AE145
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 17:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgDQPfy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 11:35:54 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47540 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgDQPfy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:35:54 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HFZq48090492;
        Fri, 17 Apr 2020 10:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587137752;
        bh=hJeyNDpmGRXVeIvbuGZyC5Hmururm2U2J7LTl5PaVDY=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Ltd7kDcszWTv7cdimoUV3xi/9vpHRt6ZIJT8OoIEDhAAiIL4+01zakWMZuiOdW0Pk
         zgQ78fyXxe4p27f8v6cPj+gs76KGPcJK1rjkVl3tRTsuEW2/sFhkRBbe6KjjVXmubA
         5t7dgA+ooJ8spbgjF7zhemgG6n0r3dfgxDkRb0vU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HFZqp6065739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Apr 2020 10:35:52 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 10:35:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 10:35:52 -0500
Received: from [10.250.48.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HFZpQm089838;
        Fri, 17 Apr 2020 10:35:51 -0500
Subject: Re: [PATCH v2 6/7] remoteproc: Split rproc_ops allocation from
 rproc_alloc()
From:   Suman Anna <s-anna@ti.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>, <ohad@wizery.com>
CC:     <elder@linaro.org>, <Markus.Elfring@web.de>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-7-mathieu.poirier@linaro.org>
 <61497230-40ec-ffc6-3cc0-e5cb754ac859@ti.com>
Message-ID: <58eaa90a-9777-4abe-fbf7-229cc68a37aa@ti.com>
Date:   Fri, 17 Apr 2020 10:35:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <61497230-40ec-ffc6-3cc0-e5cb754ac859@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4/17/20 8:49 AM, Suman Anna wrote:
> On 4/15/20 3:48 PM, Mathieu Poirier wrote:
>> Make the rproc_ops allocation a function on its own in an effort
>> to clean up function rproc_alloc().
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Reviewed-by: Alex Elder <elder@linaro.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 32 +++++++++++++++++-----------
>>   1 file changed, 20 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c 
>> b/drivers/remoteproc/remoteproc_core.c
>> index 0bfa6998705d..a5a0ceb86b3f 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2001,6 +2001,25 @@ static int rproc_alloc_firmware(struct rproc 
>> *rproc,
>>       return 0;
>>   }
>> +static int rproc_alloc_ops(struct rproc *rproc, const struct 
>> rproc_ops *ops)
>> +{
>> +    rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>> +    if (!rproc->ops)
>> +        return -ENOMEM;
>> +
>> +    /* Default to ELF loader if no load function is specified */
>> +    if (!rproc->ops->load) {
>> +        rproc->ops->load = rproc_elf_load_segments;
>> +        rproc->ops->parse_fw = rproc_elf_load_rsc_table;
>> +        rproc->ops->find_loaded_rsc_table =
>> +                        rproc_elf_find_loaded_rsc_table;
>> +        rproc->ops->sanity_check = rproc_elf_sanity_check;
> 
> So, the conditional check on sanity check is dropped and the callback 
> switched here without the changelog reflecting anything why. You should 
> just rebase this patch on top of Clement's patch [1] that removes the 
> conditional flag, and also usage from the remoteproc platform drivers.
> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/patch/11462013/

Sorry, gave the wrong link, that was v1. This is the latest,
https://patchwork.kernel.org/patch/11466955/

> 
> 
>> +        rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * rproc_alloc() - allocate a remote processor handle
>>    * @dev: the underlying device
>> @@ -2040,8 +2059,7 @@ struct rproc *rproc_alloc(struct device *dev, 
>> const char *name,
>>       if (rproc_alloc_firmware(rproc, name, firmware))
>>           goto free_rproc;
>> -    rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>> -    if (!rproc->ops)
>> +    if (rproc_alloc_ops(rproc, ops))
>>           goto free_firmware;
>>       rproc->name = name;
>> @@ -2068,16 +2086,6 @@ struct rproc *rproc_alloc(struct device *dev, 
>> const char *name,
>>       atomic_set(&rproc->power, 0);
>> -    /* Default to ELF loader if no load function is specified */
>> -    if (!rproc->ops->load) {
>> -        rproc->ops->load = rproc_elf_load_segments;
>> -        rproc->ops->parse_fw = rproc_elf_load_rsc_table;
>> -        rproc->ops->find_loaded_rsc_table = 
>> rproc_elf_find_loaded_rsc_table;
>> -        if (!rproc->ops->sanity_check)
>> -            rproc->ops->sanity_check = rproc_elf32_sanity_check;
>> -        rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>> -    }
>> -
>>       mutex_init(&rproc->lock);
>>       INIT_LIST_HEAD(&rproc->carveouts);
>>
> 

