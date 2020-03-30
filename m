Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEEC198813
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgC3XUt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:20:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53242 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729422AbgC3XUs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:20:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UNKcAk070435;
        Mon, 30 Mar 2020 18:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585610438;
        bh=63R8fAkybe2jm7xKPIcK9noVittmkv/af1xyAPgYMJ4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=R4OKPwD6jKa983yBA18YUX3xz6vMQFAI+8gIXMVcvft/W/UySyR+fKleW0t2BoK4/
         leNVV2UsgZtWIOXuEWNMiwPahC6tdwagfYJqVnS5DlvPl3JrKPonvXWVzNFNdtsX/h
         s2hSJnHytOX3ykZvRCJY2B8/qAz9jUm2e9xMvOUc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UNKcVC015550
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 18:20:38 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 18:20:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 18:20:37 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UNKbon050832;
        Mon, 30 Mar 2020 18:20:37 -0500
Subject: Re: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
 machine
To:     Loic PALLARDY <loic.pallardy@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-9-mathieu.poirier@linaro.org>
 <e89d9859f4324cf59b0ae6787775d8f5@SFHDAG7NODE2.st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <abbe9f2c-11db-3b53-fa21-115c18c40d8f@ti.com>
Date:   Mon, 30 Mar 2020 18:20:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e89d9859f4324cf59b0ae6787775d8f5@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/27/20 8:47 AM, Loic PALLARDY wrote:
> 
> 
>> -----Original Message-----
>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Sent: mardi 24 mars 2020 22:46
>> To: bjorn.andersson@linaro.org
>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
>> Subject: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
>> machine
>>
>> This patch allocates a synchronisation state machine, either provided or
>> not by users, in order to enact the proper behavior requested by the
>> platform or specific scenarios.
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 59
>> +++++++++++++++++++++++++++-
>>  1 file changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index 02dbb826aa29..1578a9c70422 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
>>  	kfree(rproc->firmware);
>>  	kfree(rproc->ops);
>>  	kfree(rproc->sync_ops);
>> +	kfree(rproc->sync_states);
>>  	kfree(rproc);
>>  }
>>
>> @@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rproc,
>>  	return 0;
>>  }
>>
>> +static int rproc_alloc_sync_states(struct rproc *rproc,
>> +				   const struct rproc_ops *boot_ops,
>> +				   const struct rproc_ops *sync_ops,
>> +				   struct rproc_sync_states *sync_states)
>> +{
>> +	struct rproc_sync_states *st;
>> +
>> +	/* At least one set of operation is needed */
>> +	if (!boot_ops && !sync_ops)
>> +		return -EINVAL;
>> +
>> +	/* We have a synchronisation state machine, no need to build one */
>> +	if (sync_states) {
>> +		st = kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
>> +		if (!st)
>> +			return -ENOMEM;
>> +
> 
> I think a check between sync_states and boot_ops/sync_ops may be needed here
> even if it is platform driver responsibility to provide coherent configuration
> As soon as one of the sync_states is set at true, sync_ops must be provided
> As soon as one of the sync_states is set at false, boot_ops must be provided
> 
> Regards,
> Loic
> 
>> +		/* Nothing else to do */
>> +		goto out;
>> +	}
>> +
>> +	/* Allocate synchronisation state machine */
>> +	st = kzalloc(sizeof(*st), GFP_KERNEL);

Hmm, do you really want to allocate these dynamically? You are
allocating/initializing these no matter what, and I see these as no
different from the likes of has_iommu or auto_boot. Why not just add the
struct as a regular member instead of a pointer?

>> +	if (!st)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * We have a boot_ops and no sync_ops - build a state machine that
>> +	 * does _not_ synchronise with an MCU.
>> +	 */
>> +	if (boot_ops && !sync_ops) {
>> +		st->on_init = st->after_stop = st->after_crash = false;
>> +		goto out;
>> +	}
>> +
>> +	/*
>> +	 * We have a sync_ops and an no boot_ops - build a state machine
>> that
>> +	 * _only_ synchronises with an MCU.
>> +	 */
>> +	if (sync_ops && !boot_ops) {
>> +		st->on_init = st->after_stop = st->after_crash = true;
>> +		goto out;
>> +	}
>> +
>> +out:
>> +	rproc->sync_with_mcu = st->on_init;

This is not needed because of the rproc_set_mcu_sync_state call below.

regards
Suman

>> +	/* And the synchronisation state machine to use */
>> +	rproc->sync_states = st;
>> +	/* Tell the core what to do when initialising */
>> +	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
>> +	return 0;
>> +}
>> +
>>  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>>  				 const struct rproc_ops *boot_ops,
>>  				 const struct rproc_ops *sync_ops,
>> @@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rproc,
>> const char *name,
>>  			return ret;
>>  	}
>>
>> -	return 0;
>> +	/* Finally allocate the synchronisation state machine */
>> +	ret = rproc_alloc_sync_states(rproc, boot_ops, sync_ops,
>> sync_states);
>> +
>> +	return ret;
>>  }
>>
>>  /**
>> --
>> 2.20.1
> 

