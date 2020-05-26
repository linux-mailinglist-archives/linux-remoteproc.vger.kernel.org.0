Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD701A162C
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Apr 2020 21:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgDGTsA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Apr 2020 15:48:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46998 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgDGTsA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Apr 2020 15:48:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 037JlukC027693;
        Tue, 7 Apr 2020 14:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586288876;
        bh=G0g/ujhbkCn0w978vN5Cpx5M/lHsfzHDsD90bCOEhFc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L9Zrev1zbKsuw5Psd7V23JxRSG9T1ud4mvNbSiMT/I1eSOo4lx5FDldrYfeDq2LeO
         vh7pUbZFvFePYXNjJrUI/MEraqMwjIlQzyRqVYuRzIv/3VT2vuRv9++N6E8w0VNYC0
         b7gVUg76tNYvncWoHToX5+mO/49QG+xHvfoxKNg8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 037JluNR099348
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Apr 2020 14:47:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Apr
 2020 14:47:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Apr 2020 14:47:56 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 037JluJf016510;
        Tue, 7 Apr 2020 14:47:56 -0500
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
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6287a462-6261-8b79-ae30-762c30487bb5@ti.com>
Date:   Tue, 7 Apr 2020 14:47:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <592f2ed1-7833-d4f1-2894-d2300b9cc9dc@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On 3/30/20 7:29 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 3/27/20 10:09 PM, Mathieu Poirier wrote:
>> On Wed, 25 Mar 2020 at 17:39, Suman Anna <s-anna@ti.com> wrote:
>>>
>>> Hi Mathieu,
>>>
>>> On 3/25/20 3:38 PM, Mathieu Poirier wrote:
>>>> On Thu, Mar 19, 2020 at 11:23:20AM -0500, Suman Anna wrote:
>>>>> From: Tero Kristo <t-kristo@ti.com>
>>>>>
>>>>> In some cases, like with OMAP remoteproc, we are not creating dedicated
>>>>> memory pool for the virtio device. Instead, we use the same memory pool
>>>>> for all shared memories. The current virtio memory pool handling forces
>>>>> a split between these two, as a separate device is created for it,
>>>>> causing memory to be allocated from bad location if the dedicated pool
>>>>> is not available. Fix this by falling back to using the parent device
>>>>> memory pool if dedicated is not available.
>>>>>
>>>>> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
>>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>> ---
>>>>> v2:
>>>>>  - Address Arnaud's concerns about hard-coded memory-region index 0
>>>>>  - Update the comment around the new code addition
>>>>> v1: https://patchwork.kernel.org/patch/11422721/
>>>>>
>>>>>  drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
>>>>>  include/linux/remoteproc.h             |  2 ++
>>>>>  2 files changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>>>> index eb817132bc5f..b687715cdf4b 100644
>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>>>> @@ -369,6 +369,21 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>>>>>                              goto out;
>>>>>                      }
>>>>>              }
>>>>> +    } else {
>>>>> +            struct device_node *np = rproc->dev.parent->of_node;
>>>>> +
>>>>> +            /*
>>>>> +             * If we don't have dedicated buffer, just attempt to re-assign
>>>>> +             * the reserved memory from our parent. A default memory-region
>>>>> +             * at index 0 from the parent's memory-regions is assigned for
>>>>> +             * the rvdev dev to allocate from, and this can be customized
>>>>> +             * by updating the vdevbuf_mem_id in platform drivers if
>>>>> +             * desired. Failure is non-critical and the allocations will
>>>>> +             * fall back to global pools, so don't check return value
>>>>> +             * either.
>>>>
>>>> I'm perplex...  In the changelog it is indicated that if a memory pool is
>>>> not dedicated allocation happens from a bad location but here failure of
>>>> getting a hold of a dedicated memory pool is not critical.
>>>
>>> So, the comment here is a generic one while the bad location part in the
>>> commit description is actually from OMAP remoteproc usage perspective
>>> (if you remember the dev_warn messages we added to the memory-region
>>> parse logic in the driver).
>>
>> I can't tell... Are you referring to the comment lines after
>> of_reserved_mem_device_init() in omap_rproc_probe()?
>>
>>>
>>> Before the fixed-memory carveout support, all the DMA allocations in
>>> remoteproc core were made from the rproc platform device's DMA pool (
>>> which can be NULL). That is lost after the fixed-memory support, and
>>> they were always allocated from global DMA pools if no dedicated pools
>>> are used. After this patch, that continues to be case for drivers that
>>> still do not use any dedicated pools, while it does restore the usage of
>>> the platform device's DMA pool if a driver uses one (OMAP remoteproc
>>> falls into the latter).
>>>
>>>>
>>>>> +             */
>>>>> +            of_reserved_mem_device_init_by_idx(dev, np,
>>>>> +                                               rproc->vdevbuf_mem_id);
>>>>
>>>> I wonder if using an index setup by platform code is really the best way
>>>> forward when we already have the carveout mechanic available to us.  I see the
>>>> platform code adding a carveout that would have the same name as rproc->name.
>>>> From there in rproc_add_virtio_dev() we could have something like:
>>>>
>>>>         mem = rproc_find_carveout_by_name(rproc, "%s", rproc->name);
>>>>
>>>>
>>>> That would be very flexible, the location of the reserved memory withing the
>>>> memory-region could change without fear of breaking things and no need to add to
>>>> struct rproc.
>>>>
>>>> Let me know what you think.
>>>
>>> I think that can work as well but I feel it is lot more cumbersome. It
>>> does require every platform driver to add code adding/registering that
>>> carveout, and parse the reserved memory region etc. End of the day, we
>>> rely on DMA API and we just have to assign the region to the newly
>>> created device. The DMA pool assignment for devices using
>>> reserved-memory nodes has simply been the of_reserved_mem_device_init()
>>> function.
>>
>> Given all the things happening in the platform drivers adding and
>> registering a single carveout doesn't seem that onerous to me.   I
>> also expect setting rproc->vdevbuf_mem_id would involve some form of
>> parsing.  Lastly if a couple of platforms end up doing the same thing
>> might as well bring the code in the core, hence choosing a generic
>> name such as rproc->name for the memory region.
>>
>> At the very least I would use of_reserved_mem_device_init_by_idx(dev,
>> np, 0).  I agree it is not flexible but I'll take that over adding a
>> new field to structure rproc.
> 
> I wonder whether this would not introduce side effect for some legacy
> drivers. Some rproc platforms can have a memory region defined but not
> used for the virtio buffers which is allocated in the Linux default
> memory pool.

I am actually trying to restore the behavior before the separate vdev
device creation. All allocations were coming from the rproc platform
device's DMA pool (if assigned, otherwise will fall back to global pool).

You have a valid point though, but are there any drivers relying on this
today? All the usage I saw were only using of_reserved_mem_device_init()
which is 0-indexed region by default. If this is really an issue, we can
use -1 as a means to conditionally follow this path.

> If the aim is to minimize impact in the core part, the solution i proposed
> in V1 using rproc_of_resm_mem_entry_init seems a good default candidate too.
> The constraint would be that the platform driver has to pre-register
> vdev<X>buffer reserved memory associated for a max number of vdev.
> This max would limit the number of vdev that a remote firmware can request.
> Also not very flexible more that the index 0, as managed at platform level.
> 
> Having a default name or a default index seems to me a good compromise...
> One advantage of the default name (in this case not rproc->name) is the 
> ability to define the memory region in a resource table carveout, instead
> of a static definition in DT.

Hmm, regarding the default name, vdev rings and vdev buffers are already
looking for specific names, right? So, what resource type are you
envisioning for this - RSC_CARVEOUT? Wouldn't that become a separate
allocation by itself?

regards
Suman

>>>>
>>>>>      }
>>>>>
>>>>>      /* Allocate virtio device */
>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>> index ed127b2d35ca..07bd73a6d72a 100644
>>>>> --- a/include/linux/remoteproc.h
>>>>> +++ b/include/linux/remoteproc.h
>>>>> @@ -481,6 +481,7 @@ struct rproc_dump_segment {
>>>>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>>>>   * @dump_segments: list of segments in the firmware
>>>>>   * @nb_vdev: number of vdev currently handled by rproc
>>>>> + * @vdevbuf_mem_id: default memory-region index for allocating vdev buffers
>>>>>   */
>>>>>  struct rproc {
>>>>>      struct list_head node;
>>>>> @@ -514,6 +515,7 @@ struct rproc {
>>>>>      bool auto_boot;
>>>>>      struct list_head dump_segments;
>>>>>      int nb_vdev;
>>>>> +    u8 vdevbuf_mem_id;
>>>>>      u8 elf_class;
>>>>>  };
>>>>>
>>>>> --
>>>>> 2.23.0
>>>>>
>>>

