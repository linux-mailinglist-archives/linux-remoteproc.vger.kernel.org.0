Return-Path: <linux-remoteproc+bounces-1480-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A9C8FC990
	for <lists+linux-remoteproc@lfdr.de>; Wed,  5 Jun 2024 12:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D6CB1C2276D
	for <lists+linux-remoteproc@lfdr.de>; Wed,  5 Jun 2024 10:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90D919149B;
	Wed,  5 Jun 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RE4T5Jlq"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC304191493;
	Wed,  5 Jun 2024 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585103; cv=none; b=FtA1TDd6eVFfyyT6L5mqXMHlSrzJ3P6oFsTqFwEvwRk0ny6G1GaO1TBa6TSeHvGD67+S4i8zihpDwcfmY818wZEJopq73gFmCLgAHCdcPF5J2hKLp/cctmn7ma9JiMKgx8JfIW/nGzatUsnM08HxqDPq+kzKXp18/dyEqg38Rzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585103; c=relaxed/simple;
	bh=ox3wEw/f2rNsuqN0e7BavLwvhpTTiimC7tZJoNdKMjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n6AmfX688OeuHTiJs+NYYhKN1K22rVfCwqDHOC+TsseI70Jv9uwOKuxmoSF0YqlOjZAocDE91UahEVBZAPAOTGuQBVgxnakG34m0ekH1BuyQSnfzUXYGo34GHCO4s+GZYlAS8EYW6+CBHCGFk3PLp7MkDnQ/g9QOR8FxIVpq5/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RE4T5Jlq; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 455Aw6VF093343;
	Wed, 5 Jun 2024 05:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717585086;
	bh=6r07e6M2i+ucsWEhACjGsYmi//u76IhnvIf/pfwIRCc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RE4T5JlqLdP/V8OZqTwrMwglRXS3UR9hye2MA0Hy2vM18b4JMbbMo3RQr+ZnER0lP
	 ifbAtCohiDuPZoqkX4hUsQE0mTiUPEkNzWOzj6a+LFdnpz1R7pTho6LiSz6ri9rpHB
	 ljMOZ0shi2KspRd6mwjC7rKapbUNHnbd9Aa3DsJQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 455Aw6DM129319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jun 2024 05:58:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 05:58:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 05:58:05 -0500
Received: from [10.24.69.66] (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 455Aw3ZN016955;
	Wed, 5 Jun 2024 05:58:03 -0500
Message-ID: <e44c3c5c-47a3-43c4-aa85-ccc5bc81245e@ti.com>
Date: Wed, 5 Jun 2024 16:28:02 +0530
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


Not sure if we can update rproc_validate() for this usecase. Ideally, it 
checks for an attach function if the core is detached, which should be 
correct, right?
Will address all other comments in the next revision!

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

