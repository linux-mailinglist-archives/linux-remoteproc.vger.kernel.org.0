Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7664219A1FC
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 00:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgCaWgF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 18:36:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35874 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgCaWgF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 18:36:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VMZxWP002419;
        Tue, 31 Mar 2020 17:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585694159;
        bh=ex2dgCLlmpeeYoezR+P9qQifTiQYYqxpoUpAoMSVbQY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rllbzaR0C1hnnEfcozvZUDxbtbd2crmHA606zrm7Y73eOccy11vRytKuBChwtKddk
         iOhhtZoVAxZDH9CoUlHC/5ppbLRKxX0CaPndvvxfhRGpUn2ierTtUNuUOSN77h9w6v
         T27SDbEDH4p9itZJuS/I6QWn4I312d6x68xgZj+U=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VMZwOY071840
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 17:35:58 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 17:35:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 17:35:58 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VMZwgv071775;
        Tue, 31 Mar 2020 17:35:58 -0500
Subject: Re: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
 synchronisation when changing state
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>
CC:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-17-mathieu.poirier@linaro.org>
 <c9fb2f50e93b4f8dad43392bf61f736a@SFHDAG7NODE2.st.com>
 <20200330234934.GH31331@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <5223cca7-5409-a113-8a7f-9f6923231353@ti.com>
Date:   Tue, 31 Mar 2020 17:35:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200330234934.GH31331@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/30/20 6:49 PM, Mathieu Poirier wrote:
> On Fri, Mar 27, 2020 at 02:04:36PM +0000, Loic PALLARDY wrote:
>>
>>
>>> -----Original Message-----
>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Sent: mardi 24 mars 2020 22:46
>>> To: bjorn.andersson@linaro.org
>>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
>>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
>>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
>>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
>>> Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
>>> synchronisation when changing state
>>>
>>> This patch deals with state changes when synchronising with an MCU. More
>>> specifically it prevents the MCU from being started if it already has been
>>> started by another entity.  Similarly it prevents the AP from stopping the
>>> MCU if it hasn't been given the capability by platform firmware.
>>>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_sysfs.c | 32
>>> ++++++++++++++++++++++++++-
>>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>>> b/drivers/remoteproc/remoteproc_sysfs.c
>>> index 4956577ad4b4..741a3c152b82 100644
>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>> @@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct
>>> device_attribute *attr,
>>>  	return sprintf(buf, "%s\n", rproc_state_string[state]);
>>>  }
>>>
>>> +static int rproc_can_shutdown(struct rproc *rproc)
>>> +{
>>> +	/* The MCU is not running, obviously an invalid operation. */
>>> +	if (rproc->state != RPROC_RUNNING)
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * The MCU is not running (see above) and the remoteproc core is
>>> the
>>> +	 * lifecycle manager, no problem calling for a shutdown.
>>> +	 */
>>> +	if (!rproc_sync_with_mcu(rproc))
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * The MCU has been loaded by another entity (see above) and the
>>> +	 * platform code has _not_ given us the capability of stopping it.
>>> +	 */
>>> +	if (!rproc->sync_ops->stop)
>>> +		return false;
>>
>> Test could be simplified
>> if (rproc_sync_with_mcu(rproc)) && !rproc->sync_ops->stop)
>> 	return false;
> 
> I laid out the test individually on purpose.  That way there is no coupling
> between conditions, it is plane to see what is going on and remains maintainable
> as we add new tests.
> 
>>
>>> +
>>> +	return true;
>>> +}
>>> +
>>>  /* Change remote processor state via sysfs */
>>>  static ssize_t state_store(struct device *dev,
>>>  			      struct device_attribute *attr,
>>> @@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
>>>  		if (rproc->state == RPROC_RUNNING)
>>>  			return -EBUSY;
>>>
>>> +		/*
>>> +		 * In synchronisation mode, booting the MCU is the
>>> +		 * responsibility of an external entity.
>>> +		 */
>>> +		if (rproc_sync_with_mcu(rproc))
>>> +			return -EINVAL;
>>> +
>> I don't understand this restriction, simply because it is preventing to resynchronize with a
>> coprocessor after a "stop".

There's actually one more scenario even without "stop". If auto_boot is
set to false, then rproc_actuate will never get called.

>> In the following configuration which can be configuration for coprocessor with romed/flashed
>> firmware (no reload needed):
>> on_init = true
>> after_stop = true
>> after_crash = true
>> Once you stop it via sysfs interface, you can't anymore restart/resync to it.
> 
> Very true.  The MCU will get restarted by another entity but the AP won't
> synchronise with it.  I need more time to think about the best way to deal with
> this and may have to get back to you for further discussions.
> 
>>
>> I think it will be better to modify rproc_boot() to take into account rproc_sync_with_mcu()
>> as below:
>>
>> int rproc_boot(struct rproc *rproc)
>>  {
>> -	const struct firmware *firmware_p;
>> +	const struct firmware *firmware_p = NULL;
>>  	struct device *dev = &rproc->dev;
>>  	int ret;
>>  
>>  	if (!rproc) {
>>  		pr_err("invalid rproc handle\n");
>>  		return -EINVAL;
>>  	}
>>  
>>  	/* load firmware */
>> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>> -	if (ret < 0) {
>> -		dev_err(dev, "request_firmware failed: %d\n", ret);
>> -		return ret;
>> +	if (!rproc_sync_with_mcu(rproc)) {

I guess this is what the original skip_fw_load was doing. And with the
current series, the userspace loading support usecase I have cannot be
achieved. If this is added back, I can try if that works for my usecases.

>> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>> +		if (ret < 0) {
>> +			dev_err(dev, "request_firmware failed: %d\n", ret);
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	ret = rproc_actuate(rproc, firmware_p);
>>  
>> -	release_firmware(firmware_p);
>> +	if (firmware_p)
>> +		release_firmware(firmware_p);
>>  
>>  	return ret;
>>  }
>>  
>> Thanks to these modifications, I'm able to resync after a stop with coprocessor without reloading firmware.
>>
>>>  		ret = rproc_boot(rproc);
>>>  		if (ret)
>>>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>>>  	} else if (sysfs_streq(buf, "stop")) {
>>> -		if (rproc->state != RPROC_RUNNING)
>>> +		if (!rproc_can_shutdown(rproc))
>>>  			return -EINVAL;
>>>
>>>  		rproc_shutdown(rproc);
>> As rproc shutdown is also accessible as kernel API, I propose to move
>> rproc_can_shutdown() check inside rproc_shutdown() and to test
>> returned error
> 
> Ah yes, it is public...  As you point out, I think we'll need to move
> rproc_can_shutdown() in rproc_shutdown().

I am assuming only the new conditions, right?

regards
Suman

> 
> Thank you for taking the time to review this set,
> Mathieu
> 
