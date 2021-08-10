Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE09F3DE2FB
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Aug 2021 01:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhHBXVz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 2 Aug 2021 19:21:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54452 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhHBXVy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Aug 2021 19:21:54 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 172NLcWS079290;
        Mon, 2 Aug 2021 18:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627946498;
        bh=lc5YJ8jr/E5ZmP2CWWKqbC9l2F6bbQuMBKIPXRsXrj0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ov8i+FhBad/ALU5fBbKNdscJmj8sNbP2fc6GWZZE48DTDSKzKNa+uS+k93eLujAUA
         n3G2kw46FpBlUkjnb+2FACzgqorI2IXjhFbmn/GEUXI/3OOmN4nyURPkQsyyfUODh/
         VzhrZzFpKoEJ3PR2sHu2tYvPD46zznsdq00ODPyY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 172NLc13081622
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Aug 2021 18:21:38 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 2 Aug
 2021 18:21:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 2 Aug 2021 18:21:38 -0500
Received: from [10.250.38.176] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 172NLclb033302;
        Mon, 2 Aug 2021 18:21:38 -0500
Subject: Re: [PATCH v2 1/5] remoteproc: Add support for detach-only during
 shutdown
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210723220248.6554-1-s-anna@ti.com>
 <20210723220248.6554-2-s-anna@ti.com> <20210802184431.GC3051951@p14s>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <cd399fef-6db7-72eb-933f-7454a043ed14@ti.com>
Date:   Mon, 2 Aug 2021 18:21:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802184431.GC3051951@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 8/2/21 1:44 PM, Mathieu Poirier wrote:
> On Fri, Jul 23, 2021 at 05:02:44PM -0500, Suman Anna wrote:
>> The remoteproc core has support for both stopping and detaching a
>> remote processor that was attached to previously, through both the
>> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
>> unconditionally only uses the stop functionality at present. This
>> may not be the default desired functionality for all the remoteproc
>> platform drivers.
>>
>> Enhance the remoteproc core logic to key off the presence of the
>> .stop() ops and allow the individual remoteproc drivers to continue
>> to use the standard rproc_add() and rproc_del() API. This allows
>> the remoteproc drivers to only do detach if supported when the driver
>> is uninstalled, and the remote processor continues to run undisturbed
>> even after the driver removal.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> v2: Addressed various review comments from v1
>>  - Reworked the logic to not use remoteproc detach_on_shutdown and
>>    rely only on rproc callback ops
>>  - Updated the last para of the patch description
>> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-3-s-anna@ti.com/
>>
>>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
>>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
>>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>>  3 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
>> index 4ad98b0b8caa..16c932beed88 100644
>> --- a/drivers/remoteproc/remoteproc_cdev.c
>> +++ b/drivers/remoteproc/remoteproc_cdev.c
>> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>>  		    rproc->state != RPROC_ATTACHED)
>>  			return -EINVAL;
>>  
>> +		if (rproc->state == RPROC_ATTACHED &&
> 
> This is already checked just above.
> 
>> +		    !rproc->ops->stop) {

Well, this is checking for both conditions, and not just the stop ops
independently. We expect to have .stop() defined normally for both regular
remoteproc mode and attached mode where you want to stop (and not detach), but
as you can see, I am supporting only detach and so will not have .stop() defined
 with RPROC_ATTACHED.

> 
> This is checked in rproc_stop() where -EINVAL is returned if ops::stop has not
> been provided.

rproc_shutdown() actually doesn't return any status, so all its internal
checking gets ignored and a success is returned today.

> 
>> +			dev_err(&rproc->dev,
>> +				"stop not supported for this rproc, use detach\n");
> 
> The standard error message from the shell should be enough here, the same way it
> is enough when the "start" and "stop" scenarios fail.

Thought this was a bit more informative, but sure this trace can be dropped.

> 
>> +			return -EINVAL;
>> +		}
>> +
>>  		rproc_shutdown(rproc);
>>  	} else if (!strncmp(cmd, "detach", len)) {
>>  		if (rproc->state != RPROC_ATTACHED)
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 7de5905d276a..ab9e52180b04 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2075,7 +2075,10 @@ void rproc_shutdown(struct rproc *rproc)
>>  	if (!atomic_dec_and_test(&rproc->power))
>>  		goto out;
>>  
>> -	ret = rproc_stop(rproc, false);
>> +	if (rproc->state == RPROC_ATTACHED && !rproc->ops->stop)
>> +		ret = __rproc_detach(rproc);
>> +	else
>> +		ret = rproc_stop(rproc, false);
> 
> As I indicated in my last review I think rproc_shutdown() and rproc_del() should
> be decoupled and the right call made in the platform drivers based on the state
> of the remote processor.  

We have various remoteproc API provided in pairs - rproc_alloc()/rproc_free(),
rproc_add()/rproc_del(), rproc_boot()/rproc_shutdown() and
rproc_attach()/rproc_detach(). The drivers are configuring conditions for
auto-boot and RPROC_DETACHED. The reason they are coupled is primarily because
of the auto-boot done during rproc_add(). And we handle the RPROC_DETACHED case
just as well in rproc_boot().

While what you have suggested works, but I am not quite convinced on this
asymmetric usage, and why this state-machine logic should be split between the
core and remoteproc drivers differently between attach and detach. To me,
calling rproc_detach() in remoteproc drivers would have made sense only if they
are also calling rproc_attach().


Conditions such as the above make the core code
> brittle, difficult to understand and tedious to maintain.

The logic I have added actually makes rproc_shutdown behavior to be on par with
the rproc_boot().

regards
Suman

> 
> Thanks,
> Mathieu
> 
>>  	if (ret) {
>>  		atomic_inc(&rproc->power);
>>  		goto out;
>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
>> index ea8b89f97d7b..133e766f38d4 100644
>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
>>  		    rproc->state != RPROC_ATTACHED)
>>  			return -EINVAL;
>>  
>> +		if (rproc->state == RPROC_ATTACHED &&
>> +		    !rproc->ops->stop) {
>> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
>> +			return -EINVAL;
>> +		}
>> +
>>  		rproc_shutdown(rproc);
>>  	} else if (sysfs_streq(buf, "detach")) {
>>  		if (rproc->state != RPROC_ATTACHED)
>> -- 
>> 2.32.0
>>

