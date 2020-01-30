Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4367414E352
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Jan 2020 20:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgA3TmZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Jan 2020 14:42:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43776 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgA3TmZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jan 2020 14:42:25 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00UJgN0Z112282;
        Thu, 30 Jan 2020 13:42:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580413344;
        bh=khQiwUxzw9t9BsPyN/juluBZCq+yrSeFBSrntRrXeoU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=I+QiVsqCdNNSGYh0a5n9WmH1kakAZTBDdieZS6DlHbCiCn1gs+StV7jZk1fGXINxv
         M48ULcPEKDVuqlIriLjlk7Yfv9AhwrdEuwT4IgnbDYbHbWm2Yzbw5z/N/cqXu/PwT+
         MJCMwZgXsnenyHP4Dp1HhIobNVas+ad4/9UFYPUA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00UJgNmZ121128
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Jan 2020 13:42:23 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 30
 Jan 2020 13:42:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 30 Jan 2020 13:42:23 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00UJgL7Z073877;
        Thu, 30 Jan 2020 13:42:21 -0600
Subject: Re: [PATCHv5 06/14] remoteproc/omap: Initialize and assign reserved
 memory node
To:     "Andrew F. Davis" <afd@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <linux-omap@vger.kernel.org>
References: <20200116135332.7819-1-t-kristo@ti.com>
 <20200116135332.7819-7-t-kristo@ti.com>
 <249c293c-6a23-165f-1df5-4859ee47658a@ti.com>
 <37db5d57-b1cd-1cec-2c9b-31c49e3bdc10@ti.com>
 <a0e85451-7c05-884c-4997-b4e8c5684c3e@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <2aaa4024-1e2c-5cab-c9f3-3be59c57e9ac@ti.com>
Date:   Thu, 30 Jan 2020 21:42:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a0e85451-7c05-884c-4997-b4e8c5684c3e@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 30/01/2020 21:20, Andrew F. Davis wrote:
> On 1/30/20 2:18 PM, Tero Kristo wrote:
>> On 30/01/2020 20:11, Andrew F. Davis wrote:
>>> On 1/16/20 8:53 AM, Tero Kristo wrote:
>>>> From: Suman Anna <s-anna@ti.com>
>>>>
>>>> The reserved memory nodes are not assigned to platform devices by
>>>> default in the driver core to avoid the lookup for every platform
>>>> device and incur a penalty as the real users are expected to be
>>>> only a few devices.
>>>>
>>>> OMAP remoteproc devices fall into the above category and the OMAP
>>>> remoteproc driver _requires_ specific CMA pools to be assigned
>>>> for each device at the moment to align on the location of the
>>>> vrings and vring buffers in the RTOS-side firmware images. So,
>>>
>>>
>>> Same comment as before, this is a firmware issue for only some firmwares
>>> that do not handle being assigned vring locations correctly and instead
>>> hard-code them.
>>
>> I believe we discussed this topic in length in previous version but
>> there was no conclusion on it.
>>
>> The commit desc might be a bit misleading, we are not actually forced to
>> use specific CMA buffers, as we use IOMMU to map these to device
>> addresses. For example IPU1/IPU2 use internally exact same memory
>> addresses, iommu is used to map these to specific CMA buffer.
>>
>> CMA buffers are mostly used so that we get aligned large chunk of memory
>> which can be mapped properly with the limited IOMMU OMAP family of chips
>> have. Not sure if there is any sane way to get this done in any other
>> manner.
>>
> 
> 
> Why not use the default CMA area?

I think using default CMA area getting the actual memory block is not 
guaranteed and might fail. There are other users for the memory, and it 
might get fragmented at the very late phase we are grabbing the memory 
(omap remoteproc driver probe time.) Some chunks we need are pretty large.

I believe I could experiment with this a bit though and see, or Suman 
could maybe provide feedback why this was designed initially like this 
and why this would not be a good idea.

-Tero

> 
> Andrew
> 
> 
>> -Tero
>>
>>>
>>> This is not a requirement of the remote processor itself and so it
>>> should not fail to probe if a specific memory carveout isn't given.
>>>
>>>
>>>> use the of_reserved_mem_device_init/release() API appropriately
>>>> to assign the corresponding reserved memory region to the OMAP
>>>> remoteproc device. Note that only one region per device is
>>>> allowed by the framework.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>> ---
>>>> v5: no changes
>>>>
>>>>    drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/omap_remoteproc.c
>>>> b/drivers/remoteproc/omap_remoteproc.c
>>>> index 0846839b2c97..194303b860b2 100644
>>>> --- a/drivers/remoteproc/omap_remoteproc.c
>>>> +++ b/drivers/remoteproc/omap_remoteproc.c
>>>> @@ -17,6 +17,7 @@
>>>>    #include <linux/module.h>
>>>>    #include <linux/err.h>
>>>>    #include <linux/of_device.h>
>>>> +#include <linux/of_reserved_mem.h>
>>>>    #include <linux/platform_device.h>
>>>>    #include <linux/dma-mapping.h>
>>>>    #include <linux/remoteproc.h>
>>>> @@ -480,14 +481,22 @@ static int omap_rproc_probe(struct
>>>> platform_device *pdev)
>>>>        if (ret)
>>>>            goto free_rproc;
>>>>    +    ret = of_reserved_mem_device_init(&pdev->dev);
>>>> +    if (ret) {
>>>> +        dev_err(&pdev->dev, "device does not have specific CMA
>>>> pool\n");
>>>> +        goto free_rproc;
>>>> +    }
>>>> +
>>>>        platform_set_drvdata(pdev, rproc);
>>>>          ret = rproc_add(rproc);
>>>>        if (ret)
>>>> -        goto free_rproc;
>>>> +        goto release_mem;
>>>>          return 0;
>>>>    +release_mem:
>>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>>    free_rproc:
>>>>        rproc_free(rproc);
>>>>        return ret;
>>>> @@ -499,6 +508,7 @@ static int omap_rproc_remove(struct
>>>> platform_device *pdev)
>>>>          rproc_del(rproc);
>>>>        rproc_free(rproc);
>>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>>          return 0;
>>>>    }
>>>>
>>
>> -- 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
