Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665EA8A985
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Aug 2019 23:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfHLVlG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 12 Aug 2019 17:41:06 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49444 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfHLVlF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Aug 2019 17:41:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7CLf2eT027286;
        Mon, 12 Aug 2019 16:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565646062;
        bh=LrYi7GAYKhxzC78TSx/J78d4+BTwfUFqzvrItVQC2d8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EsBrNYPolTliIhXGnJ5odFKM0trcYLOVPfvxnaamoYpweKKM6+8JA31yLhkdsvreC
         f98rOR/c6qgTiO2qoYKYvvuXbf1kZ42+VjT3WQ7mWnbrgSORceC+yghRyBhMp4Bf4i
         s8wqFOkYiLvQFDCQt3Cm4aqzRENGkqh61moXuaWo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7CLf2ab061745
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 12 Aug 2019 16:41:02 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 16:41:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 16:41:01 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7CLf1Ww036234;
        Mon, 12 Aug 2019 16:41:01 -0500
Subject: Re: [PATCH] rpmsg: add a description field
To:     Fabien DESSENNE <fabien.dessenne@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Loic PALLARDY <loic.pallardy@st.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
References: <20190809214005.32159-1-s-anna@ti.com>
 <a11da259-e111-f5a2-8913-e3572d44ce02@st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <75216f07-4b92-baff-2ade-b38e71376929@ti.com>
Date:   Mon, 12 Aug 2019 16:41:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a11da259-e111-f5a2-8913-e3572d44ce02@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Fabien,

On 8/12/19 8:43 AM, Fabien DESSENNE wrote:
> Hi Suman,
> 
> See my remarks below

Thank you for all the review comments.

> 
> BR
> 
> Fabien
> 
> 
> On 09/08/2019 11:40 PM, Suman Anna wrote:
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
>>
>> Based on an initial patch from Ohad Ben-Cohen.
>>
>> Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
>> [s-anna@ti.com: forward port, add sysfs documentation, fixup qcom drivers]
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo@ti.com: reworked to support both rpmsg with/without the desc field]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   Documentation/ABI/testing/sysfs-bus-rpmsg | 29 +++++++++++++++
>>   drivers/rpmsg/qcom_glink_native.c         |  1 +
>>   drivers/rpmsg/qcom_smd.c                  |  1 +
> 
> 
> Should not you extend qcom_glink_create_ept() and qcom_smd_create_ept() 
> so they compare both 'name' AND 'desc' (just like this is proposed in 
> rpmsg_device_match()) ?

I did not understand your comment against the qcom create_ept()s, we do
not initialize it for the virtio_rpmsg_create_ept() either. The desc
field is only for the rpmsg_device and is filled in before the
rpmsg_register_device() function, and is already zero-initialized for
the qcom transports in the qcom_glink_rx_open() and
qcom_smd_create_device() functions.

> 
> 
>>   drivers/rpmsg/rpmsg_char.c                |  1 +
>>   drivers/rpmsg/rpmsg_core.c                |  6 ++++
>>   drivers/rpmsg/virtio_rpmsg_bus.c          | 44 +++++++++++++++++++----
>>   drivers/soc/qcom/wcnss_ctrl.c             |  1 +
>>   include/linux/rpmsg.h                     |  4 +++
>>   8 files changed, 80 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-rpmsg b/Documentation/ABI/testing/sysfs-bus-rpmsg
>> index 990fcc420935..7f1b09ecc64d 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-rpmsg
>> +++ b/Documentation/ABI/testing/sysfs-bus-rpmsg
>> @@ -93,3 +93,32 @@ Description:
>>   		This sysfs entry allows the rpmsg driver for a rpmsg device
>>   		to be specified which will override standard OF, ID table
>>   		and name matching.
>> +
>> +What:		/sys/bus/rpmsg/devices/.../desc
>> +Date:		August 2019
>> +KernelVersion:	5.4
>> +Contact:	Bjorn Andersson <bjorn.andersson@linaro.org>
>> +Description:
>> +		Every rpmsg device is a communication channel with a remote
>> +		processor. Channels are identified by a textual name (see
>> +		/sys/bus/rpmsg/devices/.../name above) and have a local
>> +		("source") rpmsg address, and remote ("destination") rpmsg
>> +		address.
>> +
>> +		A channel is first created when an entity, whether local
>> +		or remote, starts listening on it for messages (and is thus
>> +		called an rpmsg server). When that happens, a "name service"
>> +		announcement is sent to the other processor, in order to let
>> +		it know about the creation of the channel (this way remote
>> +		clients know they can start sending messages).
>> +
>> +		The listening entity (or client) which communicates with a
>> +		remote processor is referred as rpmsg driver. The rpmsg device
>> +		and rpmsg driver are matched based on rpmsg device name (see
>> +		/sys/bus/rpmsg/devices/.../name above) and rpmsg driver ID table.
>> +
>> +		This sysfs entry contains an additional optional description of
>> +		the rpmsg device that can be optionally included as part of the
>> +		"name service" announcement. This description is then passed on
>> +		to the corresponding rpmsg drivers to further distinguish multiple
>> +		devices associated with the same rpmsg driver.
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index f46c787733e8..cfdabddc15ac 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -1456,6 +1456,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
>>   		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>>   		chinfo.src = RPMSG_ADDR_ANY;
>>   		chinfo.dst = RPMSG_ADDR_ANY;
>> +		chinfo.desc[0] = '\0';
>>   
>>   		rpmsg_unregister_device(glink->dev, &chinfo);
>>   	}
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 4abbeea782fa..7cd6b9c47065 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1307,6 +1307,7 @@ static void qcom_channel_state_worker(struct work_struct *work)
>>   		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>>   		chinfo.src = RPMSG_ADDR_ANY;
>>   		chinfo.dst = RPMSG_ADDR_ANY;
>> +		chinfo.desc[0] = '\0';
>>   		rpmsg_unregister_device(&edge->dev, &chinfo);
>>   		channel->registered = false;
>>   		spin_lock_irqsave(&edge->channels_lock, flags);
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index eea5ebbb5119..4bd91445a2fd 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -442,6 +442,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>   	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
>>   	chinfo.src = eptinfo.src;
>>   	chinfo.dst = eptinfo.dst;
>> +	chinfo.desc[0] = '\0';
>>   
>>   	return rpmsg_eptdev_create(ctrldev, chinfo);
>>   };
> 
> 
> It would be good to add DEVICE_ATTR_RO(desc) / desc_show()

I can add it, but it serves no purpose today on the rpmsg_char driver.
It is not filled in with any value of use today.

> 
> 
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index ea88fd4e2a6e..334a50425b5c 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -302,6 +302,10 @@ static int rpmsg_device_match(struct device *dev, void *data)
>>   	if (strncmp(chinfo->name, rpdev->id.name, RPMSG_NAME_SIZE))
>>   		return 0;
>>   
>> +	if (chinfo->desc && chinfo->desc != rpdev->desc &&
> 
> 
> chinfo->desc is defined as 'char desc[RPMSG_NAME_SIZE]', so I do not 
> think that you shall check chinfo->desc (can't be NULL)
> 
> Did you want to check *chinfo->desc ? (desc differs from '\0')
> 
> I can't understand the "chinfo->desc != rpdec->desc" test.

Yeah, this can do with some cleanup.

> 
> 
>> +	    strncmp(chinfo->desc, rpdev->desc, RPMSG_NAME_SIZE))
>> +		return 0;
>> +
>>   	/* found a match ! */
>>   	return 1;
>>   }
>> @@ -365,6 +369,7 @@ static DEVICE_ATTR_RW(field)
>>   
>>   /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg */
>>   rpmsg_show_attr(name, id.name, "%s\n");
>> +rpmsg_show_attr(desc, desc, "%s\n");
>>   rpmsg_show_attr(src, src, "0x%x\n");
>>   rpmsg_show_attr(dst, dst, "0x%x\n");
>>   rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>> @@ -386,6 +391,7 @@ static DEVICE_ATTR_RO(modalias);
>>   
>>   static struct attribute *rpmsg_dev_attrs[] = {
>>   	&dev_attr_name.attr,
>> +	&dev_attr_desc.attr,
>>   	&dev_attr_modalias.attr,
>>   	&dev_attr_dst.attr,
>>   	&dev_attr_src.attr,
> 
> 
> What about adding strncpy(desc) in rpmsg_dev_probe() ?

chinfo variable in rpmsg_dev_probe is zero initialized. Again, we are
not using the desc for the endpoints, only the rpmsg_device, and that is
already copied before rpmsg_register_device().

> 
> 
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 376ebbf880d6..49901582ff0e 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -110,6 +110,23 @@ struct rpmsg_ns_msg {
>>   	u32 flags;
>>   } __packed;
>>   
>> +/**
>> + * struct rpmsg_ns_msg_ext - dynamic name service announcement message v2
>> + * @name: name of remote service that is published
>> + * @desc: description of remote service
>> + * @addr: address of remote service that is published
>> + * @flags: indicates whether service is created or destroyed
>> + *
>> + * Interchangeable nameservice message with rpmsg_ns_msg. This one has
>> + * the addition of the desc field for extra flexibility.
>> + */
>> +struct rpmsg_ns_msg_ext {
>> +	char name[RPMSG_NAME_SIZE];
>> +	char desc[RPMSG_NAME_SIZE];
> 
> 
> It may be better to use a dedicated value for desc length (#define 
> RPMSG_DESC_SIZE).

I still expect this to be a single word. If we were to increase this,
how many characters do you think it should be? I picked the same size as
the name field, 32 characters is decently large enough.

> 
> I also wonder if 32 chars are enough for a (text) description.

desc is kinda a misnomer (coming from original patch), it is supposed to
serve the equivalent of a dev_name since the virtio rpmsg devices are
kinda non-DT legacy-style, name field serves as the compatible.

> 
> 
>> +	u32 addr;
>> +	u32 flags;
>> +} __packed;
>> +
>>   /**
>>    * enum rpmsg_ns_flags - dynamic name service announcement flags
>>    *
>> @@ -402,8 +419,9 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>>   	if (tmp) {
>>   		/* decrement the matched device's refcount back */
>>   		put_device(tmp);
>> -		dev_err(dev, "channel %s:%x:%x already exist\n",
>> -				chinfo->name, chinfo->src, chinfo->dst);
>> +		dev_err(dev, "channel %s:%s:%x:%x already exist\n",
>> +			chinfo->name, chinfo->desc,
>> +			chinfo->src, chinfo->dst);
>>   		return NULL;
>>   	}
>>   
>> @@ -419,6 +437,7 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>>   	rpdev->src = chinfo->src;
>>   	rpdev->dst = chinfo->dst;
>>   	rpdev->ops = &virtio_rpmsg_ops;
>> +	strncpy(rpdev->desc, chinfo->desc, RPMSG_NAME_SIZE);
>>   
>>   	/*
>>   	 * rpmsg server channels has predefined local address (for now),
>> @@ -816,18 +835,29 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>>   		       void *priv, u32 src)
>>   {
>>   	struct rpmsg_ns_msg *msg = data;
>> +	struct rpmsg_ns_msg_ext *msg_ext = data;
>>   	struct rpmsg_device *newch;
>>   	struct rpmsg_channel_info chinfo;
>>   	struct virtproc_info *vrp = priv;
>>   	struct device *dev = &vrp->vdev->dev;
>>   	int ret;
>> +	u32 addr;
>> +	u32 flags;
>>   
>>   #if defined(CONFIG_DYNAMIC_DEBUG)
>>   	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
>>   			 data, len, true);
>>   #endif
>>   
>> -	if (len != sizeof(*msg)) {
>> +	if (len == sizeof(*msg)) {
>> +		addr = msg->addr;
>> +		flags = msg->flags;
>> +		chinfo.desc[0] = '\0';
>> +	} else if (len == sizeof(*msg_ext)) {
>> +		addr = msg_ext->addr;
>> +		flags = msg_ext->flags;
>> +		strncpy(chinfo.desc, msg_ext->desc, sizeof(chinfo.desc));
>> +	} else if (len != sizeof(*msg)) {
> 
> 
> shall be 'else', not 'else if'

Thanks for catching, will fix it in the next version.

regards
Suman

> 
> 
>>   		dev_err(dev, "malformed ns msg (%d)\n", len);
>>   		return -EINVAL;
>>   	}
>> @@ -847,14 +877,14 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>>   	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
>>   
>>   	dev_info(dev, "%sing channel %s addr 0x%x\n",
>> -		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
>> -		 msg->name, msg->addr);
>> +		 flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
>> +		 msg->name, addr);
>>   
>>   	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>>   	chinfo.src = RPMSG_ADDR_ANY;
>> -	chinfo.dst = msg->addr;
>> +	chinfo.dst = addr;
>>   
>> -	if (msg->flags & RPMSG_NS_DESTROY) {
>> +	if (flags & RPMSG_NS_DESTROY) {
>>   		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
>>   		if (ret)
>>   			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
>> diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
>> index e5c68051fb17..ad9f28dc13f1 100644
>> --- a/drivers/soc/qcom/wcnss_ctrl.c
>> +++ b/drivers/soc/qcom/wcnss_ctrl.c
>> @@ -276,6 +276,7 @@ struct rpmsg_endpoint *qcom_wcnss_open_channel(void *wcnss, const char *name, rp
>>   	strscpy(chinfo.name, name, sizeof(chinfo.name));
>>   	chinfo.src = RPMSG_ADDR_ANY;
>>   	chinfo.dst = RPMSG_ADDR_ANY;
>> +	chinfo.desc[0] = '\0';
>>   
>>   	return rpmsg_create_ept(_wcnss->channel->rpdev, cb, priv, chinfo);
>>   }
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 9fe156d1c018..436faf04ba1c 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -28,11 +28,13 @@ struct rpmsg_endpoint_ops;
>>   /**
>>    * struct rpmsg_channel_info - channel info representation
>>    * @name: name of service
>> + * @desc: description of service
>>    * @src: local address
>>    * @dst: destination address
>>    */
>>   struct rpmsg_channel_info {
>>   	char name[RPMSG_NAME_SIZE];
>> +	char desc[RPMSG_NAME_SIZE];
>>   	u32 src;
>>   	u32 dst;
>>   };
>> @@ -42,6 +44,7 @@ struct rpmsg_channel_info {
>>    * @dev: the device struct
>>    * @id: device id (used to match between rpmsg drivers and devices)
>>    * @driver_override: driver name to force a match
>> + * @desc: description of remote service
>>    * @src: local address
>>    * @dst: destination address
>>    * @ept: the rpmsg endpoint of this channel
>> @@ -51,6 +54,7 @@ struct rpmsg_device {
>>   	struct device dev;
>>   	struct rpmsg_device_id id;
>>   	char *driver_override;
>> +	char desc[RPMSG_NAME_SIZE];
>>   	u32 src;
>>   	u32 dst;
>>   	struct rpmsg_endpoint *ept;
> 

