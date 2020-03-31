Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74D6919A1B7
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 00:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731259AbgCaWOd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 18:14:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49190 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbgCaWOd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 18:14:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VMEKFX020714;
        Tue, 31 Mar 2020 17:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585692860;
        bh=0yh5Fa6Z2wzqz0Kmfo0xoNNWv0cednwA0IP8U4Z9Tt0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ha1ePf7kaR6ps0W803dlz05/ED6yiQ2N6er5cuxobBJxX/+Akfztrj95HQE61cK1E
         gpvGFyITeMvX90RijedhCEzQyFYyez33TXr+7d9DPJ9TlT5+OiG3sLK2EVzywok9Cc
         886ogD7gZ3/QrBIXPDTzzpGdEZ2Zwt9wNTs6uI+k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VMEKOT104140;
        Tue, 31 Mar 2020 17:14:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 17:14:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 17:14:19 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VMEJ29056723;
        Tue, 31 Mar 2020 17:14:19 -0500
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>
CC:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
 <20200330232139.GF31331@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
Date:   Tue, 31 Mar 2020 17:14:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200330232139.GF31331@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/30/20 6:21 PM, Mathieu Poirier wrote:
> On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
>>
>>> This patch prevents the firmware image from being displayed or changed
>>> when
>>> the remoteproc core is synchronising with an MCU. This is needed since
>>> there is no guarantee about the nature of the firmware image that is loaded
>>> by the external entity.
>>>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_sysfs.c | 25
>>> ++++++++++++++++++++++++-
>>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>>> b/drivers/remoteproc/remoteproc_sysfs.c
>>> index 7f8536b73295..4956577ad4b4 100644
>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>> @@ -13,9 +13,20 @@
>>>  static ssize_t firmware_show(struct device *dev, struct device_attribute
>>> *attr,
>>>  			  char *buf)
>>>  {
>>> +	ssize_t ret;
>>>  	struct rproc *rproc = to_rproc(dev);
>>>
>>> -	return sprintf(buf, "%s\n", rproc->firmware);
>>> +	/*
>>> +	 * In most instances there is no guarantee about the firmware
>>> +	 * that was loaded by the external entity.  As such simply don't
>>> +	 * print anything.
>>> +	 */
>>> +	if (rproc_sync_with_mcu(rproc))
>>> +		ret = sprintf(buf, "\n");
>> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
>>
> 
> Don't know... It is easy to find plenty of cases in sysfs where null values are
> represented with a "\n", and just as many where "unknown", "undefined" or "-1"
> are used. I know GKH prefers the least amount of information as possible, hence
> going with a "\n".
> 
> Again, no strong opinion...
> 
>> Regards,
>> Loic
>>> +	else
>>> +		ret = sprintf(buf, "%s\n", rproc->firmware);
>>> +
>>> +	return ret;
>>>  }
>>>
>>>  /* Change firmware name via sysfs */
>>> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
>>>  		return -EINVAL;
>>>  	}
>>>
>>> +	/*
>>> +	 * There is no point in trying to change the firmware if the MCU
>>> +	 * is currently running or if loading of the image is done by
>>> +	 * another entity.
>>> +	 */
>>> +	if (rproc_sync_with_mcu(rproc)) {
>>> +		dev_err(dev,
>>> +			"can't change firmware while synchronising with
>>> MCU\n");
>>> +		err = -EBUSY;
>>> +		goto out;
>>> +	}
>>> +

So, I have done a patch sometime back to deny sysfs operations [1] (the
primary usecase is for a rproc-client driver driven boot where auto-boot
is not set) which is still a need for me. Do you see that as orthogonal
to that, or can we leverage that here somehow. I cannot use the sync_
conditions for my cases since they are not already booted before.

Also, any reason why you want to do this check before the rproc->state
unlike the logic around the 'state' file in the next patch?

[1] https://patchwork.kernel.org/patch/10601325/

regards
Suman

>>>  	if (rproc->state != RPROC_OFFLINE) {
>>>  		dev_err(dev, "can't change firmware while running\n");
>>>  		err = -EBUSY;
>>> --
>>> 2.20.1
>>

