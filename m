Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA541A2C5E
	for <lists+linux-remoteproc@lfdr.de>; Thu,  9 Apr 2020 01:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgDHXgU (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 8 Apr 2020 19:36:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54772 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgDHXgU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Apr 2020 19:36:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 038NaGgA095789;
        Wed, 8 Apr 2020 18:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586388976;
        bh=HCcvRvf1Sx1YwPM5iNbwebSyUvCQB5Zw36cY+FQbdGI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=H7PEc7wnZxEkTQ4vwVZ7lULtm4bITbiutT+xDtryNudT6qpFMi9xbK3nwFfmnIe7r
         FP9uMI2M8W1VhPnw4Znrq4ZR+yoJNOYkk5CM02DC9K0p/ZUkGYdOmeB577IXR2KFiJ
         no2SjTDOPrg4XasTwODd6JhBFDAKmwakLxcmU0V4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 038NaG61080597
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Apr 2020 18:36:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Apr
 2020 18:36:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Apr 2020 18:36:16 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 038NaFU6091211;
        Wed, 8 Apr 2020 18:36:15 -0500
Subject: Re: [PATCH v2 1/2] remoteproc: fall back to using parent memory pool
 if no dedicated available
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Pallardy <loic.pallardy@st.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200319162321.20632-1-s-anna@ti.com>
 <20200319162321.20632-2-s-anna@ti.com> <20200325203812.GA9384@xps15>
 <207036a8-b34e-6311-5ad6-3289eb9f7a06@ti.com>
 <CANLsYkzU79LDVWO=wtoOY-=iW0a4EUf5sruwWicyj+2EAFZ4rg@mail.gmail.com>
 <592f2ed1-7833-d4f1-2894-d2300b9cc9dc@st.com>
 <6287a462-6261-8b79-ae30-762c30487bb5@ti.com>
 <b8d0b19f-b5d9-e614-f5a7-56337144ed3e@st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <00ed98b4-6f1d-b2cf-16d1-3bbbe82b9e55@ti.com>
Date:   Wed, 8 Apr 2020 18:36:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b8d0b19f-b5d9-e614-f5a7-56337144ed3e@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

>>
>> On 3/30/20 7:29 AM, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 3/27/20 10:09 PM, Mathieu Poirier wrote:
>>>> On Wed, 25 Mar 2020 at 17:39, Suman Anna <s-anna@ti.com> wrote:
>>>>>
>>>>> Hi Mathieu,
>>>>>
>>>>> On 3/25/20 3:38 PM, Mathieu Poirier wrote:
>>>>>> On Thu, Mar 19, 2020 at 11:23:20AM -0500, Suman Anna wrote:
>>>>>>> From: Tero Kristo <t-kristo@ti.com>
>>>>>>>
>>>>>>> In some cases, like with OMAP remoteproc, we are not creating dedicated
>>>>>>> memory pool for the virtio device. Instead, we use the same memory pool
>>>>>>> for all shared memories. The current virtio memory pool handling forces
>>>>>>> a split between these two, as a separate device is created for it,
>>>>>>> causing memory to be allocated from bad location if the dedicated pool
>>>>>>> is not available. Fix this by falling back to using the parent device
>>>>>>> memory pool if dedicated is not available.
>>>>>>>
>>>>>>> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
>>>>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>>>> ---
>>>>>>> v2:
>>>>>>>  - Address Arnaud's concerns about hard-coded memory-region index 0
>>>>>>>  - Update the comment around the new code addition
>>>>>>> v1: https://patchwork.kernel.org/patch/11422721/
>>>>>>>
>>>>>>>  drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
>>>>>>>  include/linux/remoteproc.h             |  2 ++
>>>>>>>  2 files changed, 17 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>>>>>> index eb817132bc5f..b687715cdf4b 100644
>>>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>>>>>> @@ -369,6 +369,21 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>>>>>>>                              goto out;
>>>>>>>                      }
>>>>>>>              }
>>>>>>> +    } else {
>>>>>>> +            struct device_node *np = rproc->dev.parent->of_node;
>>>>>>> +
>>>>>>> +            /*
>>>>>>> +             * If we don't have dedicated buffer, just attempt to re-assign
>>>>>>> +             * the reserved memory from our parent. A default memory-region
>>>>>>> +             * at index 0 from the parent's memory-regions is assigned for
>>>>>>> +             * the rvdev dev to allocate from, and this can be customized
>>>>>>> +             * by updating the vdevbuf_mem_id in platform drivers if
>>>>>>> +             * desired. Failure is non-critical and the allocations will
>>>>>>> +             * fall back to global pools, so don't check return value
>>>>>>> +             * either.
>>>>>>
>>>>>> I'm perplex...  In the changelog it is indicated that if a memory pool is
>>>>>> not dedicated allocation happens from a bad location but here failure of
>>>>>> getting a hold of a dedicated memory pool is not critical.
>>>>>
>>>>> So, the comment here is a generic one while the bad location part in the
>>>>> commit description is actually from OMAP remoteproc usage perspective
>>>>> (if you remember the dev_warn messages we added to the memory-region
>>>>> parse logic in the driver).
>>>>
>>>> I can't tell... Are you referring to the comment lines after
>>>> of_reserved_mem_device_init() in omap_rproc_probe()?
>>>>
>>>>>
>>>>> Before the fixed-memory carveout support, all the DMA allocations in
>>>>> remoteproc core were made from the rproc platform device's DMA pool (
>>>>> which can be NULL). That is lost after the fixed-memory support, and
>>>>> they were always allocated from global DMA pools if no dedicated pools
>>>>> are used. After this patch, that continues to be case for drivers that
>>>>> still do not use any dedicated pools, while it does restore the usage of
>>>>> the platform device's DMA pool if a driver uses one (OMAP remoteproc
>>>>> falls into the latter).
>>>>>
>>>>>>
>>>>>>> +             */
>>>>>>> +            of_reserved_mem_device_init_by_idx(dev, np,
>>>>>>> +                                               rproc->vdevbuf_mem_id);
>>>>>>
>>>>>> I wonder if using an index setup by platform code is really the best way
>>>>>> forward when we already have the carveout mechanic available to us.  I see the
>>>>>> platform code adding a carveout that would have the same name as rproc->name.
>>>>>> From there in rproc_add_virtio_dev() we could have something like:
>>>>>>
>>>>>>         mem = rproc_find_carveout_by_name(rproc, "%s", rproc->name);
>>>>>>
>>>>>>
>>>>>> That would be very flexible, the location of the reserved memory withing the
>>>>>> memory-region could change without fear of breaking things and no need to add to
>>>>>> struct rproc.
>>>>>>
>>>>>> Let me know what you think.
>>>>>
>>>>> I think that can work as well but I feel it is lot more cumbersome. It
>>>>> does require every platform driver to add code adding/registering that
>>>>> carveout, and parse the reserved memory region etc. End of the day, we
>>>>> rely on DMA API and we just have to assign the region to the newly
>>>>> created device. The DMA pool assignment for devices using
>>>>> reserved-memory nodes has simply been the of_reserved_mem_device_init()
>>>>> function.
>>>>
>>>> Given all the things happening in the platform drivers adding and
>>>> registering a single carveout doesn't seem that onerous to me.   I
>>>> also expect setting rproc->vdevbuf_mem_id would involve some form of
>>>> parsing.  Lastly if a couple of platforms end up doing the same thing
>>>> might as well bring the code in the core, hence choosing a generic
>>>> name such as rproc->name for the memory region.
>>>>
>>>> At the very least I would use of_reserved_mem_device_init_by_idx(dev,
>>>> np, 0).  I agree it is not flexible but I'll take that over adding a
>>>> new field to structure rproc.
>>>
>>> I wonder whether this would not introduce side effect for some legacy
>>> drivers. Some rproc platforms can have a memory region defined but not
>>> used for the virtio buffers which is allocated in the Linux default
>>> memory pool.
>>
>> I am actually trying to restore the behavior before the separate vdev
>> device creation. All allocations were coming from the rproc platform
>> device's DMA pool (if assigned, otherwise will fall back to global pool).
> 
> Yes deprecated dma_declare_coherent_memory was used to declare the rproc
> platform pool for vdev if i well remember).

Right, the dma_declare_coherent_memory() usage was introduced only in
v5.1 as part of vdev subdevice creation. Prior to that, the allocations
used the rproc dev DMA pool which would have been initialized in the
platform drivers.

> 
>>
>> You have a valid point though, but are there any drivers relying on this
>> today? All the usage I saw were only using of_reserved_mem_device_init()
>> which is 0-indexed region by default. If this is really an issue, we can
>> use -1 as a means to conditionally follow this path.
> 
> Up-streamed driver seems using nothing but address 0 for time being. 
> I don't know for non-up-streamed drivers...
> But if you have a look to the stm32 platform driver, we also define the
> memory regions for the code. 

ST drivers are already using the "vdev0buffer" on latest kernels, so
they will not be entering the fallback path anyway right. Looking at
4.19 kernel, I see that you guys were also using a single
reserved-memory region (didn't have DT nodes though), so all allocations
would have come from that region. The patch is for fixing the
allocations for drivers that were defining a DMA rproc pool, and still
using them (so not having to force the drivers to add code to fix the
issue).

> Even if we are also interesting by the possibility of having a default pool,
> it is no simple to implement for our driver using index 0.
> We will have to declare it first in DT. But we would also have to determine
> if the first memory pool declaration is a default pool or not vs the other
> memory region declarations.

Yeah, if we used the hard-coded 0 and you were adapting to use a default
pool. Otherwise, you could technically update or define the new generic
name (which has to be added to remoteproc core as well).

> 
>>
>>> If the aim is to minimize impact in the core part, the solution i proposed
>>> in V1 using rproc_of_resm_mem_entry_init seems a good default candidate too.
>>> The constraint would be that the platform driver has to pre-register
>>> vdev<X>buffer reserved memory associated for a max number of vdev.
>>> This max would limit the number of vdev that a remote firmware can request.
>>> Also not very flexible more that the index 0, as managed at platform level.
>>>
>>> Having a default name or a default index seems to me a good compromise...
>>> One advantage of the default name (in this case not rproc->name) is the 
>>> ability to define the memory region in a resource table carveout, instead
>>> of a static definition in DT.
>>
>> Hmm, regarding the default name, vdev rings and vdev buffers are already
>> looking for specific names, right? So, what resource type are you
>> envisioning for this - RSC_CARVEOUT? Wouldn't that become a separate
>> allocation by itself?
> 
> After checking, I think my point on the carveout is not valid. As we should no
> longer use dma_declare_coherent_memory which seems obsolete since the
> introduction of the devicetree. Thus, even if a carveout is defined, we will
> have to declare an associated memory region in DT.
> 
> Anyway as a name is used today for other memory regions, i would be in flavor
> of using the same method to declare a default memory pool in remote proc.
> relying on the rproc_of_resm_mem_entry_init function.

This could definitely be an enhancement and conversion of existing
drivers, but at this point, the idea is to restore the allocations to
how they were for drivers defining a DMA pool and without having to
modify them.

> If an index is preferred in core, platform drivers that declare more that
> one memory region will probably have to implement code based on a default
> memory region name to retrieve the associated index.

So, if we were to get rid of the dma_declare_coherent_memory() usage
from remoteproc core, then I actually don't see need for the other args
in rproc_of_resm_mem_entry_init(), just the name and id. And even that
you would only need if you are going to have to deal with multiple
devices to assign the DMA pool for, for which you would need the name.

regards
Suman

> 
> Regards,
> Arnaud 
> 
> 
>>
>> regards
>> Suman
>>
>>>>>>
>>>>>>>      }
>>>>>>>
>>>>>>>      /* Allocate virtio device */
>>>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>>>> index ed127b2d35ca..07bd73a6d72a 100644
>>>>>>> --- a/include/linux/remoteproc.h
>>>>>>> +++ b/include/linux/remoteproc.h
>>>>>>> @@ -481,6 +481,7 @@ struct rproc_dump_segment {
>>>>>>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>>>>>>   * @dump_segments: list of segments in the firmware
>>>>>>>   * @nb_vdev: number of vdev currently handled by rproc
>>>>>>> + * @vdevbuf_mem_id: default memory-region index for allocating vdev buffers
>>>>>>>   */
>>>>>>>  struct rproc {
>>>>>>>      struct list_head node;
>>>>>>> @@ -514,6 +515,7 @@ struct rproc {
>>>>>>>      bool auto_boot;
>>>>>>>      struct list_head dump_segments;
>>>>>>>      int nb_vdev;
>>>>>>> +    u8 vdevbuf_mem_id;
>>>>>>>      u8 elf_class;
>>>>>>>  };
>>>>>>>
>>>>>>> --
>>>>>>> 2.23.0
>>>>>>>
>>>>>
>>

