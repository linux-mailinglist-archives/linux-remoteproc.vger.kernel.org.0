Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4253EA0C77
	for <lists+linux-remoteproc@lfdr.de>; Wed, 28 Aug 2019 23:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfH1Vhp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 28 Aug 2019 17:37:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40066 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfH1Vhp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Aug 2019 17:37:45 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SLbdka094266;
        Wed, 28 Aug 2019 16:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567028259;
        bh=pArZ5Rs2Z2fF33UIiB1eww/Vj/p59a0ykfdwOu7vvzw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VXSNQdT9IR9HJk7YR5TJWE+aIljBU8wlO0k9iI64n2M/TjJY/BRBCgK8dNxAPj8sK
         ZANzDGDedaBy4VgY/NZFDnyEa1n4/vPHHFimLdTBBFAfyGEYKaUXj1+UN+2j8lyQpk
         KyrPXdtDK6xVWde+4Wa7tP7u7A0doK8dOLygjm6k=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SLbdrB103744
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 16:37:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 16:37:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 16:37:39 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SLbco5076503;
        Wed, 28 Aug 2019 16:37:38 -0500
Subject: Re: [PATCH v2] rpmsg: add a description field
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Fabien Dessenne <fabien.dessenne@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
References: <20190815231448.10100-1-s-anna@ti.com>
 <3d70ae75-4c62-f310-37fa-8c57bfc09dc1@st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <351bbba8-e2c6-a195-93fe-d6ed87a9fe79@ti.com>
Date:   Wed, 28 Aug 2019 16:37:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3d70ae75-4c62-f310-37fa-8c57bfc09dc1@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On 8/27/19 8:58 AM, Arnaud Pouliquen wrote:
> Hi Suman,
> 
> On 8/16/19 1:14 AM, Suman Anna wrote:
>> From: Ohad Ben-Cohen <ohad@wizery.com>
>>
>> Add a new description field to the rpmsg bus infrastructure
>> that can be passed onto the rpmsg client drivers for additional
>> information. The current rpmsg bus client drivers need to have
>> a fixed id_table for proper matching, this new field can allow
>> flexibility for the client drivers (eg: like creating unique
>> cdevs).
>>
>> The description field is published through an enhanced name
>> service announcement message structure. The name service
>> message processing logic is updated to maintain backward
>> compatibility with the previous message structure.
> 
> Could you give some concrete use cases associated with your need?.
> I'm not sure I'm interpreting it correctly...

I have a generic rpmsg-rpc driver that allows userspace to execute any
of a set of remote functions provided by a service. And we can have the
same set of functions exported from different rprocs, or different
services presenting different sets of functions. And the same service is
used by multiple applications through their own fds. I use the desc
field to differentiate between the services.

> 
> Your patch seems to me a way to create a kind of sub-service. Why not
> simply concatenate this in the name services, i.e creating several name
> services ("service-0", "service-1"...)?

Every-time a new service is added, it requires a driver update adding
the new service name to the compatible list, or a corresponding udev
rule. It is really upto the individual rpmsg driver as to how it uses
the desc field, so it is optional as far as a rpmsg driver is concerned
(since this didn't exist previously, and so all existing drivers will
continue to work as before).

> 
> Regarding your implementation, the descriptor field seems used to:
> - instantiate a rpmsg service
> - retrieve the instance from the userland based on the descriptor.
> 
> What not just use this descriptor to provide information to userland via
> sysfs, but not use it as a criteria to find the rpmsg device?

The rpmsg device logic for actually probing a rpmsg driver still relies
on the name field. I added the additional check against desc to just
ensure that there are no name clashes on the desc field. Do you have any
concerns with this check?

> 
> In this case you can use the remote endpoint address(dst addr) to
> instantiate the service. The descriptor field could just be an
> information to help application to retrieve the good instance of the
> service.
> 
>>
>> Based on an initial patch from Ohad Ben-Cohen.
>>
>> Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
>> [s-anna@ti.com: forward port, add sysfs documentation, fixup qcom
>> drivers]
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo@ti.com: reworked to support both rpmsg with/without the desc
>> field]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>> v2:
>>   - Localized the desc match check to virtio-rpmsg-bus
>>   - Enforced NULL termination of desc similar to name
>> v1: https://patchwork.kernel.org/patch/11087717/
>>   Documentation/ABI/testing/sysfs-bus-rpmsg | 29 ++++++++++
>>   drivers/rpmsg/qcom_glink_native.c         |  1 +
>>   drivers/rpmsg/qcom_smd.c                  |  1 +
>>   drivers/rpmsg/rpmsg_char.c                |  1 +
>>   drivers/rpmsg/rpmsg_core.c                |  2 +
>>   drivers/rpmsg/virtio_rpmsg_bus.c          | 67 +++++++++++++++++++++--
>>   drivers/soc/qcom/wcnss_ctrl.c             |  1 +
>>   include/linux/rpmsg.h                     |  4 ++
>>   8 files changed, 101 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-rpmsg
>> b/Documentation/ABI/testing/sysfs-bus-rpmsg
>> index 990fcc420935..7f1b09ecc64d 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-rpmsg
>> +++ b/Documentation/ABI/testing/sysfs-bus-rpmsg
>> @@ -93,3 +93,32 @@ Description:
>>           This sysfs entry allows the rpmsg driver for a rpmsg device
>>           to be specified which will override standard OF, ID table
>>           and name matching.
>> +
>> +What:        /sys/bus/rpmsg/devices/.../desc
>> +Date:        August 2019
>> +KernelVersion:    5.4
>> +Contact:    Bjorn Andersson <bjorn.andersson@linaro.org>
>> +Description:
>> +        Every rpmsg device is a communication channel with a remote
>> +        processor. Channels are identified by a textual name (see
>> +        /sys/bus/rpmsg/devices/.../name above) and have a local
>> +        ("source") rpmsg address, and remote ("destination") rpmsg
>> +        address.
>> +
>> +        A channel is first created when an entity, whether local
>> +        or remote, starts listening on it for messages (and is thus
>> +        called an rpmsg server). When that happens, a "name service"
>> +        announcement is sent to the other processor, in order to let
>> +        it know about the creation of the channel (this way remote
>> +        clients know they can start sending messages).
>> +
>> +        The listening entity (or client) which communicates with a
>> +        remote processor is referred as rpmsg driver. The rpmsg device
>> +        and rpmsg driver are matched based on rpmsg device name (see
>> +        /sys/bus/rpmsg/devices/.../name above) and rpmsg driver ID
>> table.
>> +
>> +        This sysfs entry contains an additional optional description of
>> +        the rpmsg device that can be optionally included as part of the
>> +        "name service" announcement. This description is then passed on
>> +        to the corresponding rpmsg drivers to further distinguish
>> multiple
>> +        devices associated with the same rpmsg driver.
>> diff --git a/drivers/rpmsg/qcom_glink_native.c
>> b/drivers/rpmsg/qcom_glink_native.c
>> index f46c787733e8..cfdabddc15ac 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -1456,6 +1456,7 @@ static void qcom_glink_rx_close(struct
>> qcom_glink *glink, unsigned int rcid)
>>           strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>>           chinfo.src = RPMSG_ADDR_ANY;
>>           chinfo.dst = RPMSG_ADDR_ANY;
>> +        chinfo.desc[0] = '\0';
>>             rpmsg_unregister_device(glink->dev, &chinfo);
>>       }
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 4abbeea782fa..7cd6b9c47065 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1307,6 +1307,7 @@ static void qcom_channel_state_worker(struct
>> work_struct *work)
>>           strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>>           chinfo.src = RPMSG_ADDR_ANY;
>>           chinfo.dst = RPMSG_ADDR_ANY;
>> +        chinfo.desc[0] = '\0';
>>           rpmsg_unregister_device(&edge->dev, &chinfo);
>>           channel->registered = false;
>>           spin_lock_irqsave(&edge->channels_lock, flags);
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index eea5ebbb5119..4bd91445a2fd 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -442,6 +442,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp,
>> unsigned int cmd,
>>       chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
>>       chinfo.src = eptinfo.src;
>>       chinfo.dst = eptinfo.dst;
>> +    chinfo.desc[0] = '\0';
>>         return rpmsg_eptdev_create(ctrldev, chinfo);
>>   };
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index ea88fd4e2a6e..ba0f2c1a7fa4 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -365,6 +365,7 @@ static DEVICE_ATTR_RW(field)
>>     /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg */
>>   rpmsg_show_attr(name, id.name, "%s\n");
>> +rpmsg_show_attr(desc, desc, "%s\n");
>>   rpmsg_show_attr(src, src, "0x%x\n");
>>   rpmsg_show_attr(dst, dst, "0x%x\n");
>>   rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>> @@ -386,6 +387,7 @@ static DEVICE_ATTR_RO(modalias);
>>     static struct attribute *rpmsg_dev_attrs[] = {
>>       &dev_attr_name.attr,
>> +    &dev_attr_desc.attr,
>>       &dev_attr_modalias.attr,
>>       &dev_attr_dst.attr,
>>       &dev_attr_src.attr,
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
>> b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 5d3685bd76a2..b42277cd7759 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -110,6 +110,23 @@ struct rpmsg_ns_msg {
>>       u32 flags;
>>   } __packed;
>>   +/**
>> + * struct rpmsg_ns_msg_ext - dynamic name service announcement
>> message v2
>> + * @name: name of remote service that is published
>> + * @desc: description of remote service
>> + * @addr: address of remote service that is published
>> + * @flags: indicates whether service is created or destroyed
>> + *
>> + * Interchangeable nameservice message with rpmsg_ns_msg. This one has
>> + * the addition of the desc field for extra flexibility.
>> + */
>> +struct rpmsg_ns_msg_ext {
>> +    char name[RPMSG_NAME_SIZE];
>> +    char desc[RPMSG_NAME_SIZE];
>> +    u32 addr;
>> +    u32 flags;
>> +} __packed;
>> +
>>   /**
>>    * enum rpmsg_ns_flags - dynamic name service announcement flags
>>    *
>> @@ -384,6 +401,24 @@ static void virtio_rpmsg_release_device(struct
>> device *dev)
>>       kfree(vch);
>>   }
>>   +static int virtio_rpmsg_desc_match(struct device *dev, void *data)
>> +{
>> +    struct rpmsg_channel_info *chinfo = data;
>> +    struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>> +
>> +    if (!*chinfo->desc)
>> +        return 0;
>> +
>> +    if (strncmp(chinfo->name, rpdev->id.name, RPMSG_NAME_SIZE))
>> +        return 0;
>> +
>> +    if (strncmp(chinfo->desc, rpdev->desc, RPMSG_NAME_SIZE))
>> +        return 0;
>> +
>> +    /* found a match ! */
>> +    return 1;
>> +}
>> +
>>   /*
>>    * create an rpmsg channel using its name and address info.
>>    * this function will be used to create both static and dynamic
>> @@ -407,6 +442,15 @@ static struct rpmsg_device
>> *rpmsg_create_channel(struct virtproc_info *vrp,
>>           return NULL;
>>       }
>>   +    tmp = device_find_child(dev, chinfo, virtio_rpmsg_desc_match);
>> +    if (tmp) {
>> +        /* decrement the matched device's refcount back */
>> +        put_device(tmp);
>> +        dev_err(dev, "channel %s:%x:%x failed, desc '%s' already
>> exists\n",
>> +            chinfo->name, chinfo->src, chinfo->dst, chinfo->desc);
>> +        return NULL;
>> +    }
>> +
>>       vch = kzalloc(sizeof(*vch), GFP_KERNEL);
>>       if (!vch)
>>           return NULL;
>> @@ -419,6 +463,7 @@ static struct rpmsg_device
>> *rpmsg_create_channel(struct virtproc_info *vrp,
>>       rpdev->src = chinfo->src;
>>       rpdev->dst = chinfo->dst;
>>       rpdev->ops = &virtio_rpmsg_ops;
>> +    strncpy(rpdev->desc, chinfo->desc, RPMSG_NAME_SIZE);
>>         /*
>>        * rpmsg server channels has predefined local address (for now),
>> @@ -816,18 +861,30 @@ static int rpmsg_ns_cb(struct rpmsg_device
>> *rpdev, void *data, int len,
>>                  void *priv, u32 src)
>>   {
>>       struct rpmsg_ns_msg *msg = data;
>> +    struct rpmsg_ns_msg_ext *msg_ext = data;
>>       struct rpmsg_device *newch;
>>       struct rpmsg_channel_info chinfo;
>>       struct virtproc_info *vrp = priv;
>>       struct device *dev = &vrp->vdev->dev;
>>       int ret;
>> +    u32 addr;
>> +    u32 flags;
>>     #if defined(CONFIG_DYNAMIC_DEBUG)
>>       dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
>>                data, len, true);
>>   #endif
>>   -    if (len != sizeof(*msg)) {
>> +    if (len == sizeof(*msg)) {
>> +        addr = msg->addr;
>> +        flags = msg->flags;
>> +        chinfo.desc[0] = '\0';
>> +    } else if (len == sizeof(*msg_ext)) {
>> +        addr = msg_ext->addr;
>> +        flags = msg_ext->flags;
>> +        msg_ext->desc[RPMSG_NAME_SIZE - 1] = '\0';
>> +        strncpy(chinfo.desc, msg_ext->desc, sizeof(chinfo.desc));
>> +    } else {
>>           dev_err(dev, "malformed ns msg (%d)\n", len);
>>           return -EINVAL;
>>       }
>> @@ -847,14 +904,14 @@ static int rpmsg_ns_cb(struct rpmsg_device
>> *rpdev, void *data, int len,
>>       msg->name[RPMSG_NAME_SIZE - 1] = '\0';
>>         dev_info(dev, "%sing channel %s addr 0x%x\n",
>> -         msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
>> -         msg->name, msg->addr);
>> +         flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
>> +         msg->name, addr);
>>         strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>>       chinfo.src = RPMSG_ADDR_ANY;
>> -    chinfo.dst = msg->addr;
>> +    chinfo.dst = addr;
>>   -    if (msg->flags & RPMSG_NS_DESTROY) {
>> +    if (flags & RPMSG_NS_DESTROY) {
>>           ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
>>           if (ret)
>>               dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
>> diff --git a/drivers/soc/qcom/wcnss_ctrl.c
>> b/drivers/soc/qcom/wcnss_ctrl.c
>> index e5c68051fb17..ad9f28dc13f1 100644
>> --- a/drivers/soc/qcom/wcnss_ctrl.c
>> +++ b/drivers/soc/qcom/wcnss_ctrl.c
>> @@ -276,6 +276,7 @@ struct rpmsg_endpoint
>> *qcom_wcnss_open_channel(void *wcnss, const char *name, rp
>>       strscpy(chinfo.name, name, sizeof(chinfo.name));
>>       chinfo.src = RPMSG_ADDR_ANY;
>>       chinfo.dst = RPMSG_ADDR_ANY;
>> +    chinfo.desc[0] = '\0';
>>         return rpmsg_create_ept(_wcnss->channel->rpdev, cb, priv,
>> chinfo);

> There is another way to create a service, by registering an RPMsg
> drivers (e.g.
> https://elixir.bootlin.com/linux/v5.3-rc6/source/samples/rpmsg/rpmsg_client_sample.c)

I am not sure I understand, you obviously need a rpmsg driver for a
rpmsg device to probe.

> 
> In this case the descriptor can not be used, right?
> To be compliant probably need to extend the rpmsg_device_id struct...

As I mentioned above, it is optional for backward compatibility, and the
rpmsg client sample doesn't have any use for it atm, even if a firmware
publishes a desc field alongside the "rpmsg-client-sample" name. That is
why, I haven't extended the rpmsg_device_id.

regards
Suman

> 
> Regards,
> Arnaud
>>   }
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 9fe156d1c018..436faf04ba1c 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -28,11 +28,13 @@ struct rpmsg_endpoint_ops;
>>   /**
>>    * struct rpmsg_channel_info - channel info representation
>>    * @name: name of service
>> + * @desc: description of service
>>    * @src: local address
>>    * @dst: destination address
>>    */
>>   struct rpmsg_channel_info {
>>       char name[RPMSG_NAME_SIZE];
>> +    char desc[RPMSG_NAME_SIZE];
>>       u32 src;
>>       u32 dst;
>>   };
>> @@ -42,6 +44,7 @@ struct rpmsg_channel_info {
>>    * @dev: the device struct
>>    * @id: device id (used to match between rpmsg drivers and devices)
>>    * @driver_override: driver name to force a match
>> + * @desc: description of remote service
>>    * @src: local address
>>    * @dst: destination address
>>    * @ept: the rpmsg endpoint of this channel
>> @@ -51,6 +54,7 @@ struct rpmsg_device {
>>       struct device dev;
>>       struct rpmsg_device_id id;
>>       char *driver_override;
>> +    char desc[RPMSG_NAME_SIZE];
>>       u32 src;
>>       u32 dst;
>>       struct rpmsg_endpoint *ept;
>>

