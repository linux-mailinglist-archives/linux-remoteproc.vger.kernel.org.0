Return-Path: <linux-remoteproc+bounces-1642-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A84912317
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Jun 2024 13:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D441F2347F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Jun 2024 11:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB44316DEAD;
	Fri, 21 Jun 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J/EMqpsN"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BCE172BA5;
	Fri, 21 Jun 2024 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968507; cv=none; b=HamsL9+O/SqiWGjHOY9vyNmABvvECB1SsUAx/Rqji+axC6X7kZnMTdvPGTNkfFCWT/FnPpEspkaZnsUhtC/hAyjU7F+4MitQPrse/+9E5BFzxSdDhe1nUtRifD6TphGJd9Jl8ReJF7VAQjlPVCzUiwIWfgKtj7VKZsZrztoLEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968507; c=relaxed/simple;
	bh=01nS62HSk6gjLSy1DwcUDp9QaAYYf9boxCpBRZuhnmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AD9ZNeq/LPUB3HW54Dv5xdLzMAdrPwOUAw5sYnE77YRSUndyqkAd26awZ/VBmgmWwWwCVEmjp+6By9jELw9s8talRpSwF21fkg6rSe0TolZtZBI8bUyINt6sCR7HfbaRH6G4Z3BmBI+vW3z88qcyD4B+uozKjdPNNcaNq4lUh5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J/EMqpsN; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LBEwAu020025;
	Fri, 21 Jun 2024 06:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718968498;
	bh=HRRjFNHUHFJ+Y9g/6FN//DMylwrOkfjCSc2QNeiG10k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J/EMqpsNbmHg/qBeTL7xakmjwQG7HdYTj3qZ74HRd//IE5mZAuSdSDOCkiuK+7AgN
	 3IsNcbNQzlzZwENQqO8XfMKLTk8LwZ6OUrpzHkUcCfBp7f+ycWFrUxj/b+7krDcHwF
	 IaMXBZmqx5Bl4XmuuEB0fU5fADcS4FESvBhYvaGY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LBEw2Z037026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 06:14:58 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 06:14:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 06:14:57 -0500
Received: from [10.24.69.66] (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LBEtaR101126;
	Fri, 21 Jun 2024 06:14:55 -0500
Message-ID: <e073c465-c01c-449a-a29a-10fd88c935e5@ti.com>
Date: Fri, 21 Jun 2024 16:44:54 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] remoteproc: k3-r5: Acquire mailbox handle during
 probe
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240604051722.3608750-1-b-padhi@ti.com>
 <20240604051722.3608750-3-b-padhi@ti.com>
 <e7b98867-3493-4c76-863a-a04795333620@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <e7b98867-3493-4c76-863a-a04795333620@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andrew,

On 04/06/24 22:40, Andrew Davis wrote:
> On 6/4/24 12:17 AM, Beleswar Padhi wrote:
>> Acquire the mailbox handle during device probe and do not release handle
>> in stop/detach routine or error paths. This removes the redundant
>> requests for mbox handle later during rproc start/attach. This also
>> allows to defer remoteproc driver's probe if mailbox is not probed yet.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 74 +++++++++---------------
>>   1 file changed, 26 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 26362a509ae3c..7e02e3472ce25 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -194,6 +194,10 @@ static void k3_r5_rproc_mbox_callback(struct 
>> mbox_client *client, void *data)
>>       const char *name = kproc->rproc->name;
>>       u32 msg = omap_mbox_message(data);
>>   +    /* Do not forward message to a detached core */
>
> s/to/from
>
> This is the receive side from the core.
>
>> +    if (kproc->rproc->state == RPROC_DETACHED)
>> +        return;
>> +
>
> Do we need a similar check when sending messages to the core in
> k3_r5_rproc_kick()? No one should be sending anything as they
> all should have detached at this point, but something to double
> check on.
Will add this in the next revision.
>
>>       dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>>         switch (msg) {
>> @@ -399,12 +403,9 @@ static int k3_r5_rproc_request_mbox(struct rproc 
>> *rproc)
>>       client->knows_txdone = false;
>>         kproc->mbox = mbox_request_channel(client, 0);
>> -    if (IS_ERR(kproc->mbox)) {
>> -        ret = -EBUSY;
>> -        dev_err(dev, "mbox_request_channel failed: %ld\n",
>> -            PTR_ERR(kproc->mbox));
>> -        return ret;
>> -    }
>> +    if (IS_ERR(kproc->mbox))
>> +        return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>> +                     "mbox_request_channel failed\n");
>
> This is good cleanup, but maybe something for its own patch.
I think this cleanup is dependent to this patch itself. The current 
patch moves the mbox_handle_request to probe routine. And the cleanup 
returns an -EDEFER_PROBE ERR code. So, this cleanup is only valid if the 
current patch is applied. Else, if this err code is returned at any 
point after creation of child devices, it could lead to a infinite 
loop[0]. Please correct me if I am wrong..?

[0]: 
https://www.kernel.org/doc/html/v6.5-rc3/driver-api/driver-model/driver.html#callbacks
>
>>         /*
>>        * Ping the remote processor, this is only for sanity-sake for 
>> now;
>> @@ -552,10 +553,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>       u32 boot_addr;
>>       int ret;
>>   -    ret = k3_r5_rproc_request_mbox(rproc);
>> -    if (ret)
>> -        return ret;
>> -
>>       boot_addr = rproc->bootaddr;
>>       /* TODO: add boot_addr sanity checking */
>>       dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", 
>> boot_addr);
>> @@ -564,7 +561,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>       core = kproc->core;
>>       ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
>>       if (ret)
>> -        goto put_mbox;
>> +        return ret;
>>         /* unhalt/run all applicable cores */
>>       if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>> @@ -580,13 +577,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>           if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
>>               dev_err(dev, "%s: can not start core 1 before core 0\n",
>>                   __func__);
>> -            ret = -EPERM;
>> -            goto put_mbox;
>> +            return -EPERM;
>>           }
>>             ret = k3_r5_core_run(core);
>>           if (ret)
>> -            goto put_mbox;
>> +            return ret;
>>       }
>>         return 0;
>> @@ -596,8 +592,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>           if (k3_r5_core_halt(core))
>>               dev_warn(core->dev, "core halt back failed\n");
>>       }
>> -put_mbox:
>> -    mbox_free_channel(kproc->mbox);
>>       return ret;
>>   }
>>   @@ -658,8 +652,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>               goto out;
>>       }
>>   -    mbox_free_channel(kproc->mbox);
>> -
>>       return 0;
>>     unroll_core_halt:
>> @@ -674,42 +666,22 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   /*
>>    * Attach to a running R5F remote processor (IPC-only mode)
>>    *
>> - * The R5F attach callback only needs to request the mailbox, the 
>> remote
>> - * processor is already booted, so there is no need to issue any TI-SCI
>> - * commands to boot the R5F cores in IPC-only mode. This callback is 
>> invoked
>> - * only in IPC-only mode.
>> + * The R5F attach callback is a NOP. The remote processor is already 
>> booted, and
>> + * all required resources have been acquired during probe routine, 
>> so there is
>> + * no need to issue any TI-SCI commands to boot the R5F cores in 
>> IPC-only mode.
>> + * This callback is invoked only in IPC-only mode and exists because
>> + * rproc_validate() checks for its existence.
>>    */
>> -static int k3_r5_rproc_attach(struct rproc *rproc)
>> -{
>> -    struct k3_r5_rproc *kproc = rproc->priv;
>> -    struct device *dev = kproc->dev;
>> -    int ret;
>> -
>> -    ret = k3_r5_rproc_request_mbox(rproc);
>> -    if (ret)
>> -        return ret;
>> -
>> -    dev_info(dev, "R5F core initialized in IPC-only mode\n");
>> -    return 0;
>> -}
>> +static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
>
> I wonder if rproc_validate() should be updated to allow not
> having an attach/detach for cases like this. Then we could drop
> this function completely.
>
> Andrew
>
>>     /*
>>    * Detach from a running R5F remote processor (IPC-only mode)
>>    *
>> - * The R5F detach callback performs the opposite operation to attach 
>> callback
>> - * and only needs to release the mailbox, the R5F cores are not 
>> stopped and
>> - * will be left in booted state in IPC-only mode. This callback is 
>> invoked
>> - * only in IPC-only mode.
>> + * The R5F detach callback is a NOP. The R5F cores are not stopped 
>> and will be
>> + * left in booted state in IPC-only mode. This callback is invoked 
>> only in
>> + * IPC-only mode and exists for sanity sake.
>>    */
>> -static int k3_r5_rproc_detach(struct rproc *rproc)
>> -{
>> -    struct k3_r5_rproc *kproc = rproc->priv;
>> -    struct device *dev = kproc->dev;
>> -
>> -    mbox_free_channel(kproc->mbox);
>> -    dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
>> -    return 0;
>> -}
>> +static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
>>     /*
>>    * This function implements the .get_loaded_rsc_table() callback 
>> and is used
>> @@ -1277,6 +1249,10 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>           kproc->rproc = rproc;
>>           core->rproc = rproc;
>>   +        ret = k3_r5_rproc_request_mbox(rproc);
>> +        if (ret)
>> +            return ret;
>> +
>>           ret = k3_r5_rproc_configure_mode(kproc);
>>           if (ret < 0)
>>               goto err_config;
>> @@ -1393,6 +1369,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
>>               }
>>           }
>>   +        mbox_free_channel(kproc->mbox);
>> +
>>           rproc_del(rproc);
>>             k3_r5_reserved_mem_exit(kproc);

