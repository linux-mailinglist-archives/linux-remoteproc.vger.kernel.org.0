Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD862586FC
	for <lists+linux-remoteproc@lfdr.de>; Tue,  1 Sep 2020 06:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgIAEk6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 1 Sep 2020 00:40:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47438 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgIAEk5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Sep 2020 00:40:57 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0814egN8084924;
        Mon, 31 Aug 2020 23:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598935242;
        bh=ZPc+kCEY9KNjFpofORuVv0eLueeotIy+5gFYG818yuQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ldBJbNRgABSQjoHGEBc98T3mIuZAn88kxQXRySknfosOnN4kylICE9oCX2q0NHSZc
         w2dTPrI2Ld9k8HYV3skyQfsgaKZJM5JCt004S0tYCWNnTokF6w+avUzAESOSJ8CL/r
         CJGuVw/faRkSDwr1d1lv8TC2wiVKAB1dzbbUBMKU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0814egYU114208;
        Mon, 31 Aug 2020 23:40:42 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 31
 Aug 2020 23:40:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 31 Aug 2020 23:40:42 -0500
Received: from [10.250.232.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0814eZHT040813;
        Mon, 31 Aug 2020 23:40:36 -0500
Subject: Re: [RFC PATCH 00/22] Enhance VHOST to enable SoC-to-SoC
 communication
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-ntb@googlegroups.com>,
        <linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <netdev@vger.kernel.org>
References: <20200702082143.25259-1-kishon@ti.com>
 <20200702055026-mutt-send-email-mst@kernel.org>
 <603970f5-3289-cd53-82a9-aa62b292c552@redhat.com>
 <14c6cad7-9361-7fa4-e1c6-715ccc7e5f6b@ti.com>
 <59fd6a0b-8566-44b7-3dae-bb52b468219b@redhat.com>
 <ce9eb6a5-cd3a-a390-5684-525827b30f64@ti.com>
 <da2b671c-b05d-a57f-7bdf-8b1043a41240@redhat.com>
 <fee8a0fb-f862-03bd-5ede-8f105b6af529@ti.com>
 <b2178e1d-2f5c-e8a3-72fb-70f2f8d6aa45@redhat.com>
 <45a8a97c-2061-13ee-5da8-9877a4a3b8aa@ti.com>
 <20200715171509.GA3185776@xps15>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <ac339fb0-14e0-d3d2-ea42-c9a5b1bd8b17@ti.com>
Date:   Tue, 1 Sep 2020 10:10:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715171509.GA3185776@xps15>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 15/07/20 10:45 pm, Mathieu Poirier wrote:
> Hey Kishon,
> 
> On Wed, Jul 08, 2020 at 06:43:45PM +0530, Kishon Vijay Abraham I wrote:
>> Hi Jason,
>>
>> On 7/8/2020 4:52 PM, Jason Wang wrote:
>>>
>>> On 2020/7/7 下午10:45, Kishon Vijay Abraham I wrote:
>>>> Hi Jason,
>>>>
>>>> On 7/7/2020 3:17 PM, Jason Wang wrote:
>>>>> On 2020/7/6 下午5:32, Kishon Vijay Abraham I wrote:
>>>>>> Hi Jason,
>>>>>>
>>>>>> On 7/3/2020 12:46 PM, Jason Wang wrote:
>>>>>>> On 2020/7/2 下午9:35, Kishon Vijay Abraham I wrote:
>>>>>>>> Hi Jason,
>>>>>>>>
>>>>>>>> On 7/2/2020 3:40 PM, Jason Wang wrote:
>>>>>>>>> On 2020/7/2 下午5:51, Michael S. Tsirkin wrote:
>>>>>>>>>> On Thu, Jul 02, 2020 at 01:51:21PM +0530, Kishon Vijay Abraham I wrote:
>>>>>>>>>>> This series enhances Linux Vhost support to enable SoC-to-SoC
>>>>>>>>>>> communication over MMIO. This series enables rpmsg communication between
>>>>>>>>>>> two SoCs using both PCIe RC<->EP and HOST1-NTB-HOST2
>>>>>>>>>>>
>>>>>>>>>>> 1) Modify vhost to use standard Linux driver model
>>>>>>>>>>> 2) Add support in vring to access virtqueue over MMIO
>>>>>>>>>>> 3) Add vhost client driver for rpmsg
>>>>>>>>>>> 4) Add PCIe RC driver (uses virtio) and PCIe EP driver (uses vhost) for
>>>>>>>>>>>         rpmsg communication between two SoCs connected to each other
>>>>>>>>>>> 5) Add NTB Virtio driver and NTB Vhost driver for rpmsg communication
>>>>>>>>>>>         between two SoCs connected via NTB
>>>>>>>>>>> 6) Add configfs to configure the components
>>>>>>>>>>>
>>>>>>>>>>> UseCase1 :
>>>>>>>>>>>
>>>>>>>>>>>       VHOST RPMSG                     VIRTIO RPMSG
>>>>>>>>>>>            +                               +
>>>>>>>>>>>            |                               |
>>>>>>>>>>>            |                               |
>>>>>>>>>>>            |                               |
>>>>>>>>>>>            |                               |
>>>>>>>>>>> +-----v------+                 +------v-------+
>>>>>>>>>>> |   Linux    |                 |     Linux    |
>>>>>>>>>>> |  Endpoint  |                 | Root Complex |
>>>>>>>>>>> |            <----------------->              |
>>>>>>>>>>> |            |                 |              |
>>>>>>>>>>> |    SOC1    |                 |     SOC2     |
>>>>>>>>>>> +------------+                 +--------------+
>>>>>>>>>>>
>>>>>>>>>>> UseCase 2:
>>>>>>>>>>>
>>>>>>>>>>>           VHOST RPMSG                                      VIRTIO RPMSG
>>>>>>>>>>>                +                                                 +
>>>>>>>>>>>                |                                                 |
>>>>>>>>>>>                |                                                 |
>>>>>>>>>>>                |                                                 |
>>>>>>>>>>>                |                                                 |
>>>>>>>>>>>         +------v------+                                   +------v------+
>>>>>>>>>>>         |             |                                   |             |
>>>>>>>>>>>         |    HOST1    |                                   |    HOST2    |
>>>>>>>>>>>         |             |                                   |             |
>>>>>>>>>>>         +------^------+                                   +------^------+
>>>>>>>>>>>                |                                                 |
>>>>>>>>>>>                |                                                 |
>>>>>>>>>>> +---------------------------------------------------------------------+
>>>>>>>>>>> |  +------v------+                                   +------v------+  |
>>>>>>>>>>> |  |             |                                   |             |  |
>>>>>>>>>>> |  |     EP      |                                   |     EP      |  |
>>>>>>>>>>> |  | CONTROLLER1 |                                   | CONTROLLER2 |  |
>>>>>>>>>>> |  |             <----------------------------------->             |  |
>>>>>>>>>>> |  |             |                                   |             |  |
>>>>>>>>>>> |  |             |                                   |             |  |
>>>>>>>>>>> |  |             |  SoC With Multiple EP Instances   |             |  |
>>>>>>>>>>> |  |             |  (Configured using NTB Function)  |             |  |
>>>>>>>>>>> |  +-------------+                                   +-------------+  |
>>>>>>>>>>> +---------------------------------------------------------------------+
>>>>>>>>>>>
>>>>>>>>>>> Software Layering:
>>>>>>>>>>>
>>>>>>>>>>> The high-level SW layering should look something like below. This series
>>>>>>>>>>> adds support only for RPMSG VHOST, however something similar should be
>>>>>>>>>>> done for net and scsi. With that any vhost device (PCI, NTB, Platform
>>>>>>>>>>> device, user) can use any of the vhost client driver.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>          +----------------+  +-----------+  +------------+  +----------+
>>>>>>>>>>>          |  RPMSG VHOST   |  | NET VHOST |  | SCSI VHOST |  |    X     |
>>>>>>>>>>>          +-------^--------+  +-----^-----+  +-----^------+  +----^-----+
>>>>>>>>>>>                  |                 |              |              |
>>>>>>>>>>>                  |                 |              |              |
>>>>>>>>>>>                  |                 |              |              |
>>>>>>>>>>> +-----------v-----------------v--------------v--------------v----------+
>>>>>>>>>>> |                            VHOST CORE                                |
>>>>>>>>>>> +--------^---------------^--------------------^------------------^-----+
>>>>>>>>>>>               |               |                    |                  |
>>>>>>>>>>>               |               |                    |                  |
>>>>>>>>>>>               |               |                    |                  |
>>>>>>>>>>> +--------v-------+  +----v------+  +----------v----------+  +----v-----+
>>>>>>>>>>> |  PCI EPF VHOST |  | NTB VHOST |  |PLATFORM DEVICE VHOST|  |    X     |
>>>>>>>>>>> +----------------+  +-----------+  +---------------------+  +----------+
>>>>>>>>>>>
>>>>>>>>>>> This was initially proposed here [1]
>>>>>>>>>>>
>>>>>>>>>>> [1] ->
>>>>>>>>>>> https://lore.kernel.org/r/2cf00ec4-1ed6-f66e-6897-006d1a5b6390@ti.com
>>>>>>>>>> I find this very interesting. A huge patchset so will take a bit
>>>>>>>>>> to review, but I certainly plan to do that. Thanks!
>>>>>>>>> Yes, it would be better if there's a git branch for us to have a look.
>>>>>>>> I've pushed the branch
>>>>>>>> https://github.com/kishon/linux-wip.git vhost_rpmsg_pci_ntb_rfc
>>>>>>> Thanks
>>>>>>>
>>>>>>>
>>>>>>>>> Btw, I'm not sure I get the big picture, but I vaguely feel some of the
>>>>>>>>> work is
>>>>>>>>> duplicated with vDPA (e.g the epf transport or vhost bus).
>>>>>>>> This is about connecting two different HW systems both running Linux and
>>>>>>>> doesn't necessarily involve virtualization.
>>>>>>> Right, this is something similar to VOP
>>>>>>> (Documentation/misc-devices/mic/mic_overview.rst). The different is the
>>>>>>> hardware I guess and VOP use userspace application to implement the device.
>>>>>> I'd also like to point out, this series tries to have communication between
>>>>>> two
>>>>>> SoCs in vendor agnostic way. Since this series solves for 2 usecases (PCIe
>>>>>> RC<->EP and NTB), for the NTB case it directly plugs into NTB framework and
>>>>>> any
>>>>>> of the HW in NTB below should be able to use a virtio-vhost communication
>>>>>>
>>>>>> #ls drivers/ntb/hw/
>>>>>> amd  epf  idt  intel  mscc
>>>>>>
>>>>>> And similarly for the PCIe RC<->EP communication, this adds a generic endpoint
>>>>>> function driver and hence any SoC that supports configurable PCIe endpoint can
>>>>>> use virtio-vhost communication
>>>>>>
>>>>>> # ls drivers/pci/controller/dwc/*ep*
>>>>>> drivers/pci/controller/dwc/pcie-designware-ep.c
>>>>>> drivers/pci/controller/dwc/pcie-uniphier-ep.c
>>>>>> drivers/pci/controller/dwc/pci-layerscape-ep.c
>>>>>
>>>>> Thanks for those backgrounds.
>>>>>
>>>>>
>>>>>>>>      So there is no guest or host as in
>>>>>>>> virtualization but two entirely different systems connected via PCIe cable,
>>>>>>>> one
>>>>>>>> acting as guest and one as host. So one system will provide virtio
>>>>>>>> functionality reserving memory for virtqueues and the other provides vhost
>>>>>>>> functionality providing a way to access the virtqueues in virtio memory.
>>>>>>>> One is
>>>>>>>> source and the other is sink and there is no intermediate entity. (vhost was
>>>>>>>> probably intermediate entity in virtualization?)
>>>>>>> (Not a native English speaker) but "vhost" could introduce some confusion for
>>>>>>> me since it was use for implementing virtio backend for userspace drivers. I
>>>>>>> guess "vringh" could be better.
>>>>>> Initially I had named this vringh but later decided to choose vhost instead of
>>>>>> vringh. vhost is still a virtio backend (not necessarily userspace) though it
>>>>>> now resides in an entirely different system. Whatever virtio is for a frontend
>>>>>> system, vhost can be that for a backend system. vring can be for accessing
>>>>>> virtqueue and can be used either in frontend or backend.
>>>>>
>>>>> Ok.
>>>>>
>>>>>
>>>>>>>>> Have you considered to implement these through vDPA?
>>>>>>>> IIUC vDPA only provides an interface to userspace and an in-kernel rpmsg
>>>>>>>> driver
>>>>>>>> or vhost net driver is not provided.
>>>>>>>>
>>>>>>>> The HW connection looks something like https://pasteboard.co/JfMVVHC.jpg
>>>>>>>> (usecase2 above),
>>>>>>> I see.
>>>>>>>
>>>>>>>
>>>>>>>>      all the boards run Linux. The middle board provides NTB
>>>>>>>> functionality and board on either side provides virtio/vhost
>>>>>>>> functionality and
>>>>>>>> transfer data using rpmsg.
>>>>>>> So I wonder whether it's worthwhile for a new bus. Can we use the existed
>>>>>>> virtio-bus/drivers? It might work as, except for the epf transport, we can
>>>>>>> introduce a epf "vhost" transport driver.
>>>>>> IMHO we'll need two buses one for frontend and other for backend because the
>>>>>> two components can then co-operate/interact with each other to provide a
>>>>>> functionality. Though both will seemingly provide similar callbacks, they are
>>>>>> both provide symmetrical or complimentary funcitonality and need not be
>>>>>> same or
>>>>>> identical.
>>>>>>
>>>>>> Having the same bus can also create sequencing issues.
>>>>>>
>>>>>> If you look at virtio_dev_probe() of virtio_bus
>>>>>>
>>>>>> device_features = dev->config->get_features(dev);
>>>>>>
>>>>>> Now if we use same bus for both front-end and back-end, both will try to
>>>>>> get_features when there has been no set_features. Ideally vhost device should
>>>>>> be initialized first with the set of features it supports. Vhost and virtio
>>>>>> should use "status" and "features" complimentarily and not identically.
>>>>>
>>>>> Yes, but there's no need for doing status/features passthrough in epf vhost
>>>>> drivers.b
>>>>>
>>>>>
>>>>>> virtio device (or frontend) cannot be initialized before vhost device (or
>>>>>> backend) gets initialized with data such as features. Similarly vhost
>>>>>> (backend)
>>>>>> cannot access virqueues or buffers before virtio (frontend) sets
>>>>>> VIRTIO_CONFIG_S_DRIVER_OK whereas that requirement is not there for virtio as
>>>>>> the physical memory for virtqueues are created by virtio (frontend).
>>>>>
>>>>> epf vhost drivers need to implement two devices: vhost(vringh) device and
>>>>> virtio device (which is a mediated device). The vhost(vringh) device is doing
>>>>> feature negotiation with the virtio device via RC/EP or NTB. The virtio device
>>>>> is doing feature negotiation with local virtio drivers. If there're feature
>>>>> mismatch, epf vhost drivers and do mediation between them.
>>>> Here epf vhost should be initialized with a set of features for it to negotiate
>>>> either as vhost device or virtio device no? Where should the initial feature
>>>> set for epf vhost come from?
>>>
>>>
>>> I think it can work as:
>>>
>>> 1) Having an initial features (hard coded in the code) set X in epf vhost
>>> 2) Using this X for both virtio device and vhost(vringh) device
>>> 3) local virtio driver will negotiate with virtio device with feature set Y
>>> 4) remote virtio driver will negotiate with vringh device with feature set Z
>>> 5) mediate between feature Y and feature Z since both Y and Z are a subset of X
>>>
>>>
>>
>> okay. I'm also thinking if we could have configfs for configuring this. Anyways
>> we could find different approaches of configuring this.
>>>>>
>>>>>>> It will have virtqueues but only used for the communication between itself
>>>>>>> and
>>>>>>> uppter virtio driver. And it will have vringh queues which will be probe by
>>>>>>> virtio epf transport drivers. And it needs to do datacopy between
>>>>>>> virtqueue and
>>>>>>> vringh queues.
>>>>>>>
>>>>>>> It works like:
>>>>>>>
>>>>>>> virtio drivers <- virtqueue/virtio-bus -> epf vhost drivers <- vringh
>>>>>>> queue/epf>
>>>>>>>
>>>>>>> The advantages is that there's no need for writing new buses and drivers.
>>>>>> I think this will work however there is an addtional copy between vringh queue
>>>>>> and virtqueue,
>>>>>
>>>>> I think not? E.g in use case 1), if we stick to virtio bus, we will have:
>>>>>
>>>>> virtio-rpmsg (EP) <- virtio ring(1) -> epf vhost driver (EP) <- virtio ring(2)
>>>>> -> virtio pci (RC) <-> virtio rpmsg (RC)
>>>> IIUC epf vhost driver (EP) will access virtio ring(2) using vringh?
>>>
>>>
>>> Yes.
>>>
>>>
>>>> And virtio
>>>> ring(2) is created by virtio pci (RC).
>>>
>>>
>>> Yes.
>>>
>>>
>>>>> What epf vhost driver did is to read from virtio ring(1) about the buffer len
>>>>> and addr and them DMA to Linux(RC)?
>>>> okay, I made some optimization here where vhost-rpmsg using a helper writes a
>>>> buffer from rpmsg's upper layer directly to remote Linux (RC) as against here
>>>> were it has to be first written to virtio ring (1).
>>>>
>>>> Thinking how this would look for NTB
>>>> virtio-rpmsg (HOST1) <- virtio ring(1) -> NTB(HOST1) <-> NTB(HOST2)  <- virtio
>>>> ring(2) -> virtio-rpmsg (HOST2)
>>>>
>>>> Here the NTB(HOST1) will access the virtio ring(2) using vringh?
>>>
>>>
>>> Yes, I think so it needs to use vring to access virtio ring (1) as well.
>>
>> NTB(HOST1) and virtio ring(1) will be in the same system. So it doesn't have to
>> use vring. virtio ring(1) is by the virtio device the NTB(HOST1) creates.
>>>
>>>
>>>>
>>>> Do you also think this will work seamlessly with virtio_net.c, virtio_blk.c?
>>>
>>>
>>> Yes.
>>
>> okay, I haven't looked at this but the backend of virtio_blk should access an
>> actual storage device no?
>>>
>>>
>>>>
>>>> I'd like to get clarity on two things in the approach you suggested, one is
>>>> features (since epf vhost should ideally be transparent to any virtio driver)
>>>
>>>
>>> We can have have an array of pre-defined features indexed by virtio device id
>>> in the code.
>>>
>>>
>>>> and the other is how certain inputs to virtio device such as number of buffers
>>>> be determined.
>>>
>>>
>>> We can start from hard coded the value like 256, or introduce some API for user
>>> to change the value.
>>>
>>>
>>>>
>>>> Thanks again for your suggestions!
>>>
>>>
>>> You're welcome.
>>>
>>> Note that I just want to check whether or not we can reuse the virtio
>>> bus/driver. It's something similar to what you proposed in Software Layering
>>> but we just replace "vhost core" with "virtio bus" and move the vhost core
>>> below epf/ntb/platform transport.
>>
>> Got it. My initial design was based on my understanding of your comments [1].
>>
>> I'll try to create something based on your proposed design here.
> 
> Based on the above conversation it seems like I should wait for another revision
> of this set before reviewing the RPMSG part.  Please confirm that my
> understanding is correct.

Right, there are multiple parts in this series that has to be aligned. 
I'd still think irrespective of the approach something like Address 
Service Notification support might have to be supported by rpmsg.

Thanks
Kishon
> 
> Thanks,
> Mathieu
> 
>>
>> Regards
>> Kishon
>>
>> [1] ->
>> https://lore.kernel.org/linux-pci/59982499-0fc1-2e39-9ff9-993fb4dd7dcc@redhat.com/
>>>
>>> Thanks
>>>
>>>
>>>>
>>>> Regards
>>>> Kishon
>>>>
>>>>>
>>>>>> in some cases adds latency because of forwarding interrupts
>>>>>> between vhost and virtio driver, vhost drivers providing features (which means
>>>>>> it has to be aware of which virtio driver will be connected).
>>>>>> virtio drivers (front end) generally access the buffers from it's local memory
>>>>>> but when in backend it can access over MMIO (like PCI EPF or NTB) or
>>>>>> userspace.
>>>>>>> Does this make sense?
>>>>>> Two copies in my opinion is an issue but lets get others opinions as well.
>>>>>
>>>>> Sure.
>>>>>
>>>>>
>>>>>> Thanks for your suggestions!
>>>>>
>>>>> You're welcome.
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> Regards
>>>>>> Kishon
>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>
>>>>>>>> Thanks
>>>>>>>> Kishon
>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> Kishon Vijay Abraham I (22):
>>>>>>>>>>>        vhost: Make _feature_ bits a property of vhost device
>>>>>>>>>>>        vhost: Introduce standard Linux driver model in VHOST
>>>>>>>>>>>        vhost: Add ops for the VHOST driver to configure VHOST device
>>>>>>>>>>>        vringh: Add helpers to access vring in MMIO
>>>>>>>>>>>        vhost: Add MMIO helpers for operations on vhost virtqueue
>>>>>>>>>>>        vhost: Introduce configfs entry for configuring VHOST
>>>>>>>>>>>        virtio_pci: Use request_threaded_irq() instead of request_irq()
>>>>>>>>>>>        rpmsg: virtio_rpmsg_bus: Disable receive virtqueue callback when
>>>>>>>>>>>          reading messages
>>>>>>>>>>>        rpmsg: Introduce configfs entry for configuring rpmsg
>>>>>>>>>>>        rpmsg: virtio_rpmsg_bus: Add Address Service Notification support
>>>>>>>>>>>        rpmsg: virtio_rpmsg_bus: Move generic rpmsg structure to
>>>>>>>>>>>          rpmsg_internal.h
>>>>>>>>>>>        virtio: Add ops to allocate and free buffer
>>>>>>>>>>>        rpmsg: virtio_rpmsg_bus: Use virtio_alloc_buffer() and
>>>>>>>>>>>          virtio_free_buffer()
>>>>>>>>>>>        rpmsg: Add VHOST based remote processor messaging bus
>>>>>>>>>>>        samples/rpmsg: Setup delayed work to send message
>>>>>>>>>>>        samples/rpmsg: Wait for address to be bound to rpdev for sending
>>>>>>>>>>>          message
>>>>>>>>>>>        rpmsg.txt: Add Documentation to configure rpmsg using configfs
>>>>>>>>>>>        virtio_pci: Add VIRTIO driver for VHOST on Configurable PCIe
>>>>>>>>>>> Endpoint
>>>>>>>>>>>          device
>>>>>>>>>>>        PCI: endpoint: Add EP function driver to provide VHOST interface
>>>>>>>>>>>        NTB: Add a new NTB client driver to implement VIRTIO functionality
>>>>>>>>>>>        NTB: Add a new NTB client driver to implement VHOST functionality
>>>>>>>>>>>        NTB: Describe the ntb_virtio and ntb_vhost client in the
>>>>>>>>>>> documentation
>>>>>>>>>>>
>>>>>>>>>>>       Documentation/driver-api/ntb.rst              |   11 +
>>>>>>>>>>>       Documentation/rpmsg.txt                       |   56 +
>>>>>>>>>>>       drivers/ntb/Kconfig                           |   18 +
>>>>>>>>>>>       drivers/ntb/Makefile                          |    2 +
>>>>>>>>>>>       drivers/ntb/ntb_vhost.c                       |  776 +++++++++++
>>>>>>>>>>>       drivers/ntb/ntb_virtio.c                      |  853 ++++++++++++
>>>>>>>>>>>       drivers/ntb/ntb_virtio.h                      |   56 +
>>>>>>>>>>>       drivers/pci/endpoint/functions/Kconfig        |   11 +
>>>>>>>>>>>       drivers/pci/endpoint/functions/Makefile       |    1 +
>>>>>>>>>>>       .../pci/endpoint/functions/pci-epf-vhost.c    | 1144
>>>>>>>>>>> ++++++++++++++++
>>>>>>>>>>>       drivers/rpmsg/Kconfig                         |   10 +
>>>>>>>>>>>       drivers/rpmsg/Makefile                        |    3 +-
>>>>>>>>>>>       drivers/rpmsg/rpmsg_cfs.c                     |  394 ++++++
>>>>>>>>>>>       drivers/rpmsg/rpmsg_core.c                    |    7 +
>>>>>>>>>>>       drivers/rpmsg/rpmsg_internal.h                |  136 ++
>>>>>>>>>>>       drivers/rpmsg/vhost_rpmsg_bus.c               | 1151
>>>>>>>>>>> +++++++++++++++++
>>>>>>>>>>>       drivers/rpmsg/virtio_rpmsg_bus.c              |  184 ++-
>>>>>>>>>>>       drivers/vhost/Kconfig                         |    1 +
>>>>>>>>>>>       drivers/vhost/Makefile                        |    2 +-
>>>>>>>>>>>       drivers/vhost/net.c                           |   10 +-
>>>>>>>>>>>       drivers/vhost/scsi.c                          |   24 +-
>>>>>>>>>>>       drivers/vhost/test.c                          |   17 +-
>>>>>>>>>>>       drivers/vhost/vdpa.c                          |    2 +-
>>>>>>>>>>>       drivers/vhost/vhost.c                         |  730 ++++++++++-
>>>>>>>>>>>       drivers/vhost/vhost_cfs.c                     |  341 +++++
>>>>>>>>>>>       drivers/vhost/vringh.c                        |  332 +++++
>>>>>>>>>>>       drivers/vhost/vsock.c                         |   20 +-
>>>>>>>>>>>       drivers/virtio/Kconfig                        |    9 +
>>>>>>>>>>>       drivers/virtio/Makefile                       |    1 +
>>>>>>>>>>>       drivers/virtio/virtio_pci_common.c            |   25 +-
>>>>>>>>>>>       drivers/virtio/virtio_pci_epf.c               |  670 ++++++++++
>>>>>>>>>>>       include/linux/mod_devicetable.h               |    6 +
>>>>>>>>>>>       include/linux/rpmsg.h                         |    6 +
>>>>>>>>>>>       {drivers/vhost => include/linux}/vhost.h      |  132 +-
>>>>>>>>>>>       include/linux/virtio.h                        |    3 +
>>>>>>>>>>>       include/linux/virtio_config.h                 |   42 +
>>>>>>>>>>>       include/linux/vringh.h                        |   46 +
>>>>>>>>>>>       samples/rpmsg/rpmsg_client_sample.c           |   32 +-
>>>>>>>>>>>       tools/virtio/virtio_test.c                    |    2 +-
>>>>>>>>>>>       39 files changed, 7083 insertions(+), 183 deletions(-)
>>>>>>>>>>>       create mode 100644 drivers/ntb/ntb_vhost.c
>>>>>>>>>>>       create mode 100644 drivers/ntb/ntb_virtio.c
>>>>>>>>>>>       create mode 100644 drivers/ntb/ntb_virtio.h
>>>>>>>>>>>       create mode 100644 drivers/pci/endpoint/functions/pci-epf-vhost.c
>>>>>>>>>>>       create mode 100644 drivers/rpmsg/rpmsg_cfs.c
>>>>>>>>>>>       create mode 100644 drivers/rpmsg/vhost_rpmsg_bus.c
>>>>>>>>>>>       create mode 100644 drivers/vhost/vhost_cfs.c
>>>>>>>>>>>       create mode 100644 drivers/virtio/virtio_pci_epf.c
>>>>>>>>>>>       rename {drivers/vhost => include/linux}/vhost.h (66%)
>>>>>>>>>>>
>>>>>>>>>>> -- 
>>>>>>>>>>> 2.17.1
>>>>>>>>>>>
>>>
