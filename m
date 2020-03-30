Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7A81984C9
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Mar 2020 21:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgC3TsC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 15:48:02 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44360 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbgC3TsC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 15:48:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UJltTW129137;
        Mon, 30 Mar 2020 14:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585597675;
        bh=Tdf+cG/TrefdG82Nl5k4Az0PmfGPbeGNJDe4ksn8QoE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fvBq43Avn8EOpVzkiRoktXpcWIzuof28gh6HcujrnNxQfY804y5K9wPat5ZOtiiSX
         oamhJ1BdBlj1EY6gnpYWjk5g7nLNv8AA1G/Y2YnqslNY9M355NSD0FTehWIBGAADSE
         WRFBCbwyJPswVslNTTluS3msFV+XXTa3xfr3Hkx8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UJltu6118018
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 14:47:55 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 14:47:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 14:47:54 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UJlsJt080791;
        Mon, 30 Mar 2020 14:47:54 -0500
Subject: Re: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
 rproc_alloc()
To:     Loic PALLARDY <loic.pallardy@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-4-mathieu.poirier@linaro.org>
 <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <3cdc557f-61bf-fd0f-07b0-4ab5454f39f1@ti.com>
Date:   Mon, 30 Mar 2020 14:47:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/27/20 6:05 AM, Loic PALLARDY wrote:
> Hi Mathieu,
> 
>> -----Original Message-----
>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Sent: mardi 24 mars 2020 22:46
>> To: bjorn.andersson@linaro.org
>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
>> Subject: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
>> rproc_alloc()
>>
>> Make the firmware name allocation a function on its own in order to
>> introduce more flexibility to function rproc_alloc().

I see patches 3 through 5 are generic cleanups, can you post them
separately from this series? Bjorn has commented about using the
put_device() to free the code on one of the remoteproc core patches [1]
in my R5 patch series, and I can do my patch on top of yours. I plan to
split out those 2 core patches for my next version, and can do them on
top of these.

[1] https://patchwork.kernel.org/patch/11456385/#23248321

>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
>>  1 file changed, 39 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index 097f33e4f1f3..c0871f69929b 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1962,6 +1962,36 @@ static const struct device_type rproc_type = {
>>  	.release	= rproc_type_release,
>>  };
>>
>> +static int rproc_alloc_firmware(struct rproc *rproc,
>> +				const char *name, const char *firmware)
>> +{
>> +	char *p, *template = "rproc-%s-fw";
>> +	int name_len;
>> +
>> +	if (!rproc || !name)
>> +		return -EINVAL;

This is an internal function, and these are already checked in
rproc_alloc(), so you can drop this.

>> +
>> +	if (!firmware) {
>> +		/*
>> +		 * If the caller didn't pass in a firmware name then
>> +		 * construct a default name.
>> +		 */
>> +		name_len = strlen(name) + strlen(template) - 2 + 1;
>> +		p = kmalloc(name_len, GFP_KERNEL);
>> +		if (!p)
>> +			return -ENOMEM;
>> +		snprintf(p, name_len, template, name);
>> +	} else {
>> +		p = kstrdup(firmware, GFP_KERNEL);
>> +		if (!p)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	rproc->firmware = p;
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * rproc_alloc() - allocate a remote processor handle
>>   * @dev: the underlying device
>> @@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev,
>> const char *name,
>>  			  const char *firmware, int len)
>>  {
>>  	struct rproc *rproc;
>> -	char *p, *template = "rproc-%s-fw";
>> -	int name_len;
>>
>>  	if (!dev || !name || !ops)
>>  		return NULL;
>>
>> -	if (!firmware) {
>> -		/*
>> -		 * If the caller didn't pass in a firmware name then
>> -		 * construct a default name.
>> -		 */
>> -		name_len = strlen(name) + strlen(template) - 2 + 1;
>> -		p = kmalloc(name_len, GFP_KERNEL);
>> -		if (!p)
>> -			return NULL;
>> -		snprintf(p, name_len, template, name);
>> -	} else {
>> -		p = kstrdup(firmware, GFP_KERNEL);
>> -		if (!p)
>> -			return NULL;
>> -	}
>> -
>>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
>> -	if (!rproc) {
>> -		kfree(p);
>> +	if (!rproc)
>>  		return NULL;
>> -	}
>> +
>> +	if (rproc_alloc_firmware(rproc, name, firmware))
>> +		goto free_rproc;

Since you are already moving this after rproc_alloc() here in this
patch, you might as well fold the relevant patch 5 contents here?
Otherwise, retain the existing code as is, and do all the movement in
patch 5.

regards
Suman

>>
>>  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>>  	if (!rproc->ops) {
>> -		kfree(p);
>> +		kfree(rproc->firmware);
>>  		kfree(rproc);
> Small remark only for patch coherency, as it is modified in next patches.
> Use free_rproc label which is introduced just below here for error management.
> 
> Regards,
> Loic
>>  		return NULL;
>>  	}
>>
>> -	rproc->firmware = p;
>>  	rproc->name = name;
>>  	rproc->priv = &rproc[1];
>>  	rproc->auto_boot = true;
>> @@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, const
>> char *name,
>>  	rproc->state = RPROC_OFFLINE;
>>
>>  	return rproc;
>> +
>> +free_rproc:
>> +	kfree(rproc);
>> +	return NULL;
>>  }
>>  EXPORT_SYMBOL(rproc_alloc);
>>
>> --
>> 2.20.1
> 

