Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F93419857E
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Mar 2020 22:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgC3UiW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 16:38:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49730 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728165AbgC3UiW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 16:38:22 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UKcFlK011086;
        Mon, 30 Mar 2020 15:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585600695;
        bh=iGdc3fT96w851tr/BDNvx8lA4Emi7eyia0uG0EX9G9E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Qk0Nf9ld0HCulQ0NGDanALLFrcAOosNtQNLI+3y7vzJ7YY7wAH3vw55JExuE4oWXU
         dTOYsqTXXy3ebWlwsny5sI/p11DVP5CDNkDAAiG8GfCud63k4PpDCzgxURCwcVDmpi
         LuhmWdvaNdM2b4tTtUvDbGo9/EWHlTSSU0KqGERA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UKcF77079357
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 15:38:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 15:38:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 15:38:14 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UKcELg036797;
        Mon, 30 Mar 2020 15:38:14 -0500
Subject: Re: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
To:     Loic PALLARDY <loic.pallardy@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
 <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <88f56a4e-dccb-0d50-4656-82380a2e57aa@ti.com>
Date:   Mon, 30 Mar 2020 15:38:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/27/20 6:10 AM, Loic PALLARDY wrote:
> Hi Mathieu,
> 
>>
>> In preparation to allocate the synchronisation operation and state
>> machine, spin off a new function in order to keep rproc_alloc() as
>> clean as possible.
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
>> -
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index ee277bc5556c..9da245734db6 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
>> const struct rproc_ops *ops)
>>  	return 0;
>>  }
>>
>> +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>> +				 const struct rproc_ops *boot_ops,
>> +				 const char *firmware, int len)
> 
> len argument is not used in the patch nor in the following, maybe removed from my pov.

Indeed.

> 
> Regards,
> Loic

>> +{
>> +	int ret;
>> +
>> +	/* We have a boot_ops so allocate firmware name and operations */
>> +	if (boot_ops) {
>> +		ret = rproc_alloc_firmware(rproc, name, firmware);
>> +		if (ret)
>> +			return ret;

So, can you explain why firmware allocation now becomes conditional on
this boot_ops?

Perhaps, continue to call this as ops following the field name in struct
rproc.

regards
Suman

>> +
>> +		ret = rproc_alloc_ops(rproc, boot_ops);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * rproc_alloc() - allocate a remote processor handle
>>   * @dev: the underlying device
>> @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const
>> char *name,
>>  	rproc->dev.class = &rproc_class;
>>  	rproc->dev.driver_data = rproc;
>>
>> -	if (rproc_alloc_firmware(rproc, name, firmware))
>> -		goto out;
>> -
>> -	if (rproc_alloc_ops(rproc, ops))
>> +	if (rproc_alloc_internals(rproc, name, ops,
>> +				  firmware, len))
>>  		goto out;
>>
>>  	/* Assign a unique device index and name */
>> --
>> 2.20.1
> 

