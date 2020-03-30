Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05DF1987DB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgC3XLA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:11:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33050 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3XLA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:11:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UNAqns050077;
        Mon, 30 Mar 2020 18:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585609852;
        bh=u1wJqmmx3jLu6/+jt9v9jyCC1MtklYYdBkeW1vrnwPA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rp5460/BnrR8h3jQbejPya7MDDzU0/PxnW31AjFt1XQlyI8PLZFe7uyW07AR24lEV
         kjUacmohTQWnQCaKV2TVQAQPhWho0QsewWA8erJ3TRnVRE1y3mvREBYTdy2UbLI/70
         YZfbxbZZJtpXTgZu8T3x4kAgwvNEyVv/unO7kPag=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UNAq59032186
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 18:10:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 18:10:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 18:10:52 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UNApKD104004;
        Mon, 30 Mar 2020 18:10:51 -0500
Subject: Re: [PATCH v2 07/17] remoteproc: Introduce function
 rproc_alloc_state_machine()
To:     Loic PALLARDY <loic.pallardy@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-8-mathieu.poirier@linaro.org>
 <6c7225848da94bca8df85cbf6beb4255@SFHDAG7NODE2.st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <dc22cdaf-a70d-b27e-2971-5497188ba089@ti.com>
Date:   Mon, 30 Mar 2020 18:10:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6c7225848da94bca8df85cbf6beb4255@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,
> 
>> -----Original Message-----
>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Sent: mardi 24 mars 2020 22:46
>> To: bjorn.andersson@linaro.org
>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
>> Subject: [PATCH v2 07/17] remoteproc: Introduce function
>> rproc_alloc_state_machine()
>>
>> Introducing new function rproc_alloc_state_machine() to allocate
>> the MCU synchronisation operations and position it as the central
>> remoteproc core allocation function.
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 84
>> +++++++++++++++++++++++++---
>>  include/linux/remoteproc.h           |  5 ++
>>  2 files changed, 81 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index 9da245734db6..02dbb826aa29 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1954,6 +1954,7 @@ static void rproc_type_release(struct device *dev)
>>
>>  	kfree(rproc->firmware);
>>  	kfree(rproc->ops);
>> +	kfree(rproc->sync_ops);
>>  	kfree(rproc);
>>  }
>>
>> @@ -2018,12 +2019,34 @@ static int rproc_alloc_ops(struct rproc *rproc,
>> const struct rproc_ops *ops)
>>  	return 0;
>>  }
>>
>> +static int rproc_alloc_sync_ops(struct rproc *rproc,
>> +				const struct rproc_ops *sync_ops)
>> +{
>> +	/*
>> +	 * Given the unlimited amount of possibilities when
>> +	 * synchronising with an MCU, no constraints are imposed
>> +	 * on sync_ops.
>> +	 */
>> +	rproc->sync_ops = kmemdup(sync_ops,
>> +				  sizeof(*sync_ops), GFP_KERNEL);
>> +	if (!rproc->sync_ops)
>> +		return -ENOMEM;
> Should we check a minimal set of functions in sync_ops to be required?
> Or we should consider all pointers at NULL is ok ?
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>>  				 const struct rproc_ops *boot_ops,
>> +				 const struct rproc_ops *sync_ops,
>> +				 struct rproc_sync_states *sync_states,
> sync_states not used in this patch, should be introduced in patch 8

+1

> 
> Regards,
> Loic
> 
>>  				 const char *firmware, int len)
>>  {
>>  	int ret;
>>
>> +	/* We need at least a boot or a sync ops. */
>> +	if (!boot_ops && !sync_ops)
>> +		return -EINVAL;
>> +
>>  	/* We have a boot_ops so allocate firmware name and operations */
>>  	if (boot_ops) {
>>  		ret = rproc_alloc_firmware(rproc, name, firmware);
>> @@ -2035,14 +2058,23 @@ static int rproc_alloc_internals(struct rproc
>> *rproc, const char *name,
>>  			return ret;
>>  	}
>>
>> +	/* Allocate a sync_ops if need be */
>> +	if (sync_ops) {
>> +		ret = rproc_alloc_sync_ops(rproc, sync_ops);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>>  /**
>> - * rproc_alloc() - allocate a remote processor handle
>> + * rproc_alloc_state_machine() - allocate a remote processor handle
>>   * @dev: the underlying device
>>   * @name: name of this remote processor
>>   * @ops: platform-specific handlers (mainly start/stop)
>> + * @sync_ops: platform-specific handlers for synchronising with MCU
>> + * @sync_states: states in which @ops and @sync_ops are to be used
>>   * @firmware: name of firmware file to load, can be NULL
>>   * @len: length of private data needed by the rproc driver (in bytes)
>>   *
>> @@ -2061,13 +2093,15 @@ static int rproc_alloc_internals(struct rproc
>> *rproc, const char *name,
>>   * Note: _never_ directly deallocate @rproc, even if it was not registered
>>   * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
>>   */
>> -struct rproc *rproc_alloc(struct device *dev, const char *name,
>> -			  const struct rproc_ops *ops,
>> -			  const char *firmware, int len)
>> +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
>> *name,
>> +					const struct rproc_ops *ops,
>> +					const struct rproc_ops *sync_ops,
>> +					struct rproc_sync_states
>> *sync_states,
>> +					const char *firmware, int len)

Do you foresee the need for sync_ops to be present as long as the rproc
is registered? I am wondering if it is better to introduce an API where
you can set the ops at runtime rather than allocate it upfront, so that
once the initial handling is done, you can reset both the sync_states
and ops.


>>  {
>>  	struct rproc *rproc;
>>
>> -	if (!dev || !name || !ops)
>> +	if (!dev || !name)
>>  		return NULL;
>>
>>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
>> @@ -2084,8 +2118,8 @@ struct rproc *rproc_alloc(struct device *dev, const
>> char *name,
>>  	rproc->dev.class = &rproc_class;
>>  	rproc->dev.driver_data = rproc;
>>
>> -	if (rproc_alloc_internals(rproc, name, ops,
>> -				  firmware, len))
>> +	if (rproc_alloc_internals(rproc, name, ops, sync_ops,
>> +				  sync_states, firmware, len))
>>  		goto out;
>>
>>  	/* Assign a unique device index and name */
>> @@ -2119,7 +2153,41 @@ struct rproc *rproc_alloc(struct device *dev, const
>> char *name,
>>  	put_device(&rproc->dev);
>>  	return NULL;
>>  }
>> -EXPORT_SYMBOL(rproc_alloc);
>> +EXPORT_SYMBOL(rproc_alloc_state_machine);
>> +
>> +/**
>> + * rproc_alloc() - allocate a remote processor handle
>> + * @dev: the underlying device
>> + * @name: name of this remote processor
>> + * @ops: platform-specific handlers (mainly start/stop)
>> + * @firmware: name of firmware file to load, can be NULL
>> + * @len: length of private data needed by the rproc driver (in bytes)
>> + *
>> + * Allocates a new remote processor handle, but does not register
>> + * it yet. if @firmware is NULL, a default name is used.
>> + *
>> + * This function should be used by rproc implementations during
>> initialization
>> + * of the remote processor.
>> + *
>> + * After creating an rproc handle using this function, and when ready,
>> + * implementations should then call rproc_add() to complete
>> + * the registration of the remote processor.
>> + *
>> + * On success the new rproc is returned, and on failure, NULL.
>> + *
>> + * Note: _never_ directly deallocate @rproc, even if it was not registered
>> + * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
>> + */
>> +struct rproc *rproc_alloc(struct device *dev, const char *name,
>> +			  const struct rproc_ops *ops,
>> +			  const char *firmware, int len)
>> +{
>> +	if (!name && !firmware)

Retain the original checks on dev, name and ops from the previous
rproc_alloc(). A NULL firmware was perfectly valid before, and the name
is allocated using the default template.

>> +		return NULL;
>> +
>> +	return rproc_alloc_state_machine(dev, name, ops, NULL, NULL,
>> +					 firmware, len);
>> +}

Missing the EXPORT_SYMBOL on rproc_alloc() -> it is an API used by modules.

regards
Suman

>>
>>  /**
>>   * rproc_free() - unroll rproc_alloc()
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index d115e47d702d..d1214487daac 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -611,6 +611,11 @@ struct rproc *rproc_get_by_child(struct device
>> *dev);
>>  struct rproc *rproc_alloc(struct device *dev, const char *name,
>>  			  const struct rproc_ops *ops,
>>  			  const char *firmware, int len);
>> +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
>> *name,
>> +					const struct rproc_ops *ops,
>> +					const struct rproc_ops *sync_ops,
>> +					struct rproc_sync_states
>> *sync_states,
>> +					const char *firmware, int len);
>>  void rproc_put(struct rproc *rproc);
>>  int rproc_add(struct rproc *rproc);
>>  int rproc_del(struct rproc *rproc);
>> --
>> 2.20.1
> 

