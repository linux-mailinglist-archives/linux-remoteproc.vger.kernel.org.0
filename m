Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B0014F559
	for <lists+linux-remoteproc@lfdr.de>; Sat,  1 Feb 2020 01:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgBAATG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jan 2020 19:19:06 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36868 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgBAATG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jan 2020 19:19:06 -0500
Received: by mail-pg1-f195.google.com with SMTP id q127so4439818pga.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jan 2020 16:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jhVQntw0uTPkhYI8/ogogSMazFvt80HWKbW/1XUiKNE=;
        b=HEN3YwTuJ0W6sbzj/eI8OZRa7TQYgN/Ih9Biw54UbVWGUick4IaFrCQ/b56RMTq2Kj
         6znPsCKU1QtUubINv9sER/nCA5+CpMFNEkRtutlMqBf3zvMmD37/TtsGPEnDhKWgNglX
         s07Yt+Hfm8Wj2qmfq8fGHeNw9rLPHpUdTFooNtg5GlnrQkt9C/HxBRNzZZq5UEmV2SJ/
         khYYDNM16P9Dlro2WDYPNxRQpWyK0juin0cfXPH2Oe396Doq0CpPqJMg5T9xq7D3qWbQ
         6EipJ9CFe3aONQkfP2fvMuOxQW+JZ+v27DXsbpJsFVlcHEXvGLOBW7FJzxOrIr1zq7Ud
         StEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jhVQntw0uTPkhYI8/ogogSMazFvt80HWKbW/1XUiKNE=;
        b=mpAjbkEMcTJT547krvkWhsxWZJvlR0hVSFLFJNjDlmp2GZy6Qlgtoi5a41el1b2kQK
         k/dI5L5i1rwcfm8oHc0XnTeNgyn6ed6JlQ1IBlmE6trN7zarzJ2ZcUOHswWXidcOkuc6
         fgZhJX4m8OXSE+580lnhOPci5Q0FFxvIn14a4xPf9NFGn/QStNWhxYEVWt5fPH3VRNuf
         noHn3FBVwOe+m9bY+nmWYFz7OsXUTdvaN5ZDw11dYi0cWWlthMhOfszFuuHjmaOkOcTe
         uA4NlOq/gJV4zBJ1zslxL8UqDQaaeR/EvYwnGTgkvlEIZfchZawQrxhJkmMB3eH0NG6f
         Fbiw==
X-Gm-Message-State: APjAAAVqJsZmxCo+CEYKT/vxkUPPjJuZ2B8Gf86lE1rqzHWwXLb73jhG
        U++AyMV8hGVU45G0dUDNwSPTMA==
X-Google-Smtp-Source: APXvYqwbB/2p/SQ19BhnxDF8IEUPQ4/xi6OFGad1+hsp/ci1+FNXQu/nhgl3lKLjHmI3e9qzN9BmRA==
X-Received: by 2002:a65:4381:: with SMTP id m1mr13232245pgp.68.1580516345367;
        Fri, 31 Jan 2020 16:19:05 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r145sm11905815pfr.5.2020.01.31.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 16:19:04 -0800 (PST)
Date:   Fri, 31 Jan 2020 17:19:02 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Suman Anna <s-anna@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Xiang Xiao <xiaoxiang@xiaomi.com>
Subject: Re: [PATCH v2] rpmsg: add a description field
Message-ID: <20200201001902.GA1057@xps15>
References: <20190815231448.10100-1-s-anna@ti.com>
 <3d70ae75-4c62-f310-37fa-8c57bfc09dc1@st.com>
 <351bbba8-e2c6-a195-93fe-d6ed87a9fe79@ti.com>
 <bf847c2c-1d84-556d-0dfa-7b7fa697ce2a@st.com>
 <779ed73a-6879-1367-774b-dd881213bfc0@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <779ed73a-6879-1367-774b-dd881213bfc0@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good afternoon,

Please see my comments inlined in the original thread.

On Thu, Jan 30, 2020 at 07:25:54PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> Following our discussion, here is a patches that proposes a solution for non static name services management, to be able to instanciate a rpmsg service.
> An alternative is the patch proposed by Xiang: https://patchwork.kernel.org/patch/10791741/
> So the capability to support non static names is required at least by TI and Xiaomi.
> This is also something that could be considered for my rpmsg tty driver, as it supports multi instances...
> 
> IMHO the patch proposed by Xiang seems simpler and more flexible to meet this requirement.
> 
> Regards,
> Arnaud
> 
> > -----Original Message-----
> > From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > Sent: mardi 3 septembre 2019 11:34
> > To: Suman Anna <s-anna@ti.com>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>
> > Cc: Fabien DESSENNE <fabien.dessenne@st.com>; Ohad Ben-Cohen
> > <ohad@wizery.com>; Loic PALLARDY <loic.pallardy@st.com>; linux-
> > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Tero Kristo <t-
> > kristo@ti.com>; Xiang Xiao <xiaoxiang@xiaomi.com>
> > Subject: Re: [PATCH v2] rpmsg: add a description field
> > 
> > Hi Suman,
> > 
> > Sorry for the delay in replying...
> > 
> > On 8/28/19 11:37 PM, Suman Anna wrote:
> > > Hi Arnaud,
> > >
> > > On 8/27/19 8:58 AM, Arnaud Pouliquen wrote:
> > >> Hi Suman,
> > >>
> > >> On 8/16/19 1:14 AM, Suman Anna wrote:
> > >>> From: Ohad Ben-Cohen <ohad@wizery.com>
> > >>>
> > >>> Add a new description field to the rpmsg bus infrastructure that can
> > >>> be passed onto the rpmsg client drivers for additional information.
> > >>> The current rpmsg bus client drivers need to have a fixed id_table
> > >>> for proper matching, this new field can allow flexibility for the
> > >>> client drivers (eg: like creating unique cdevs).
> > >>>
> > >>> The description field is published through an enhanced name service
> > >>> announcement message structure. The name service message processing
> > >>> logic is updated to maintain backward compatibility with the
> > >>> previous message structure.
> > >>
> > >> Could you give some concrete use cases associated with your need?.
> > >> I'm not sure I'm interpreting it correctly...
> > >
> > > I have a generic rpmsg-rpc driver that allows userspace to execute any
> > > of a set of remote functions provided by a service. And we can have
> > > the same set of functions exported from different rprocs, or different
> > > services presenting different sets of functions. And the same service
> > > is used by multiple applications through their own fds. I use the desc
> > > field to differentiate between the services.
> > 
> > Thanks, this help me to understand the need. Very interesting feature, do you
> > plan to upstream it? :)
> > 
> > >
> > >>
> > >> Your patch seems to me a way to create a kind of sub-service. Why not
> > >> simply concatenate this in the name services, i.e creating several
> > >> name services ("service-0", "service-1"...)?
> > >
> > > Every-time a new service is added, it requires a driver update adding
> > > the new service name to the compatible list, or a corresponding udev
> > > rule. It is really upto the individual rpmsg driver as to how it uses
> > > the desc field, so it is optional as far as a rpmsg driver is
> > > concerned (since this didn't exist previously, and so all existing
> > > drivers will continue to work as before).
> > >
> > 
> > >>
> > >> Regarding your implementation, the descriptor field seems used to:
> > >> - instantiate a rpmsg service
> > >> - retrieve the instance from the userland based on the descriptor.
> > >>
> > >> What not just use this descriptor to provide information to userland
> > >> via sysfs, but not use it as a criteria to find the rpmsg device?
> > >
> > > The rpmsg device logic for actually probing a rpmsg driver still
> > > relies on the name field. I added the additional check against desc to
> > > just ensure that there are no name clashes on the desc field. Do you
> > > have any concerns with this check?
> > 
> > First be sure that I understand and agree with the need to have a more dynamic
> > way of managing the services. My concerns is more about the way to implement
> > it. In my view the need corresponds to the introduction of a kind of sub-services to
> > instantiate a service, plus a way to identify the sub service. Adding a second field
> > is one solution, but seems to me a duplication of the service name. And i have
> > also in mind the OpenAMP lib that should support this extra field, with footprint
> > impact.
> > 
> > Xiang Xiao from Xiaomi company proposed an alternative patch a few months
> > ago: https://patchwork.kernel.org/patch/10791741/.
> > The idea is let the driver to check the device match. In this case it could support
> > "dynamic" name service. A service name could be a concatenation of the basic
> > service name + a descriptor.
> > 
> > Could this patch answer to your need? IMHO, I would prefer this solution that
> > gives advantage to not extend the message protocol for NS announcement.

I don't think we can move forward without an answer to Arnaud's question, i.e if
the concatenation of the basic name service and a descriptor would work.

If it is the case I think we can do something even more simple than what Xiang
is proposing by tweaking rpmsg_id_match() a little.  Something like:

 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
                                  const struct rpmsg_device_id *id)
 {
-       return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
+       size_t len = min(strlen(id->name), (size_t)RPMSG_NAME_SIZE);
+
+       /*
+        * Allow for wildcard matches.  For example if rpmsg_driver::id_table
+        * is:
+        *
+        * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
+        *      { .name = "rpmsg-client-sample" },
+        *      { },
+        * }
+        *
+        * Then it is possible to support "rpmsg-client-sample*", i.e:
+        *      rpmsg-client-sample_instance0
+        *      rpmsg-client-sample_instance1
+        *      ...
+        *      rpmsg-client-sample_instanceX
+        */
+       return strncmp(id->name, rpdev->id.name, len) == 0;
 }

More trickery will be required if we want to support the same service name from
more than one remoteproc but the base idea remains. 


> > 
> > Regards,
> > Arnaud
> > 
> > >
> > >>
> > >> In this case you can use the remote endpoint address(dst addr) to
> > >> instantiate the service. The descriptor field could just be an
> > >> information to help application to retrieve the good instance of the
> > >> service.
> > >>
> > >>>
> > >>> Based on an initial patch from Ohad Ben-Cohen.
> > >>>
> > >>> Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
> > >>> [s-anna@ti.com: forward port, add sysfs documentation, fixup qcom
> > >>> drivers]
> > >>> Signed-off-by: Suman Anna <s-anna@ti.com>
> > >>> [t-kristo@ti.com: reworked to support both rpmsg with/without the
> > >>> desc field]
> > >>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > >>> ---
> > >>> v2:
> > >>>  � - Localized the desc match check to virtio-rpmsg-bus
> > >>>  � - Enforced NULL termination of desc similar to name
> > >>> v1: https://patchwork.kernel.org/patch/11087717/
> > >>>  � Documentation/ABI/testing/sysfs-bus-rpmsg | 29 ++++++++++
> > >>>  � drivers/rpmsg/qcom_glink_native.c�������� |� 1 +
> > >>>  � drivers/rpmsg/qcom_smd.c����������������� |� 1 +
> > >>>  � drivers/rpmsg/rpmsg_char.c��������������� |� 1 +
> > >>>  � drivers/rpmsg/rpmsg_core.c��������������� |� 2 +
> > >>>  � drivers/rpmsg/virtio_rpmsg_bus.c��������� | 67
> > >>> +++++++++++++++++++++--
> > >>>  � drivers/soc/qcom/wcnss_ctrl.c������������ |� 1 +
> > >>>  � include/linux/rpmsg.h�������������������� |� 4 ++
> > >>>  � 8 files changed, 101 insertions(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/ABI/testing/sysfs-bus-rpmsg
> > >>> b/Documentation/ABI/testing/sysfs-bus-rpmsg
> > >>> index 990fcc420935..7f1b09ecc64d 100644
> > >>> --- a/Documentation/ABI/testing/sysfs-bus-rpmsg
> > >>> +++ b/Documentation/ABI/testing/sysfs-bus-rpmsg
> > >>> @@ -93,3 +93,32 @@ Description:
> > >>>  ��������� This sysfs entry allows the rpmsg driver for a rpmsg
> > >>> device
> > >>>  ��������� to be specified which will override standard OF, ID table
> > >>>  ��������� and name matching.
> > >>> +
> > >>> +What:������� /sys/bus/rpmsg/devices/.../desc
> > >>> +Date:������� August 2019
> > >>> +KernelVersion:��� 5.4
> > >>> +Contact:��� Bjorn Andersson <bjorn.andersson@linaro.org>
> > >>> +Description:
> > >>> +������� Every rpmsg device is a communication channel with a remote
> > >>> +������� processor. Channels are identified by a textual name (see
> > >>> +������� /sys/bus/rpmsg/devices/.../name above) and have a local
> > >>> +������� ("source") rpmsg address, and remote ("destination") rpmsg
> > >>> +������� address.
> > >>> +
> > >>> +������� A channel is first created when an entity, whether local
> > >>> +������� or remote, starts listening on it for messages (and is thus
> > >>> +������� called an rpmsg server). When that happens, a "name service"
> > >>> +������� announcement is sent to the other processor, in order to
> > >>> +let
> > >>> +������� it know about the creation of the channel (this way remote
> > >>> +������� clients know they can start sending messages).
> > >>> +
> > >>> +������� The listening entity (or client) which communicates with a
> > >>> +������� remote processor is referred as rpmsg driver. The rpmsg
> > >>> +device
> > >>> +������� and rpmsg driver are matched based on rpmsg device name
> > >>> +(see
> > >>> +������� /sys/bus/rpmsg/devices/.../name above) and rpmsg driver ID
> > >>> table.
> > >>> +
> > >>> +������� This sysfs entry contains an additional optional
> > >>> +description of
> > >>> +������� the rpmsg device that can be optionally included as part of
> > >>> +the
> > >>> +������� "name service" announcement. This description is then
> > >>> +passed on
> > >>> +������� to the corresponding rpmsg drivers to further distinguish
> > >>> multiple
> > >>> +������� devices associated with the same rpmsg driver.
> > >>> diff --git a/drivers/rpmsg/qcom_glink_native.c
> > >>> b/drivers/rpmsg/qcom_glink_native.c
> > >>> index f46c787733e8..cfdabddc15ac 100644
> > >>> --- a/drivers/rpmsg/qcom_glink_native.c
> > >>> +++ b/drivers/rpmsg/qcom_glink_native.c
> > >>> @@ -1456,6 +1456,7 @@ static void qcom_glink_rx_close(struct
> > >>> qcom_glink *glink, unsigned int rcid)
> > >>>  ��������� strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
> > >>>  ��������� chinfo.src = RPMSG_ADDR_ANY;
> > >>>  ��������� chinfo.dst = RPMSG_ADDR_ANY;
> > >>> +������� chinfo.desc[0] = '\0';
> > >>>  � ��������� rpmsg_unregister_device(glink->dev, &chinfo);
> > >>>  ����� }
> > >>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> > >>> index 4abbeea782fa..7cd6b9c47065 100644
> > >>> --- a/drivers/rpmsg/qcom_smd.c
> > >>> +++ b/drivers/rpmsg/qcom_smd.c
> > >>> @@ -1307,6 +1307,7 @@ static void qcom_channel_state_worker(struct
> > >>> work_struct *work)
> > >>>  ��������� strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
> > >>>  ��������� chinfo.src = RPMSG_ADDR_ANY;
> > >>>  ��������� chinfo.dst = RPMSG_ADDR_ANY;
> > >>> +������� chinfo.desc[0] = '\0';
> > >>>  ��������� rpmsg_unregister_device(&edge->dev, &chinfo);
> > >>>  ��������� channel->registered = false;
> > >>>  ��������� spin_lock_irqsave(&edge->channels_lock, flags); diff
> > >>> --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > >>> index eea5ebbb5119..4bd91445a2fd 100644
> > >>> --- a/drivers/rpmsg/rpmsg_char.c
> > >>> +++ b/drivers/rpmsg/rpmsg_char.c
> > >>> @@ -442,6 +442,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp,
> > >>> unsigned int cmd,
> > >>>  ����� chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
> > >>>  ����� chinfo.src = eptinfo.src;
> > >>>  ����� chinfo.dst = eptinfo.dst;
> > >>> +��� chinfo.desc[0] = '\0';
> > >>>  � ����� return rpmsg_eptdev_create(ctrldev, chinfo);
> > >>>  � };
> > >>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > >>> index ea88fd4e2a6e..ba0f2c1a7fa4 100644
> > >>> --- a/drivers/rpmsg/rpmsg_core.c
> > >>> +++ b/drivers/rpmsg/rpmsg_core.c
> > >>> @@ -365,6 +365,7 @@ static DEVICE_ATTR_RW(field)
> > >>>  � � /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg
> > >>> */
> > >>>  � rpmsg_show_attr(name, id.name, "%s\n");
> > >>> +rpmsg_show_attr(desc, desc, "%s\n");
> > >>>  � rpmsg_show_attr(src, src, "0x%x\n");
> > >>>  � rpmsg_show_attr(dst, dst, "0x%x\n");
> > >>>  � rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
> > >>> @@ -386,6 +387,7 @@ static DEVICE_ATTR_RO(modalias);
> > >>>  � � static struct attribute *rpmsg_dev_attrs[] = {
> > >>>  ����� &dev_attr_name.attr,
> > >>> +��� &dev_attr_desc.attr,
> > >>>  ����� &dev_attr_modalias.attr,
> > >>>  ����� &dev_attr_dst.attr,
> > >>>  ����� &dev_attr_src.attr,
> > >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
> > >>> b/drivers/rpmsg/virtio_rpmsg_bus.c
> > >>> index 5d3685bd76a2..b42277cd7759 100644
> > >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > >>> @@ -110,6 +110,23 @@ struct rpmsg_ns_msg {
> > >>>  ����� u32 flags;
> > >>>  � } __packed;
> > >>>  � +/**
> > >>> + * struct rpmsg_ns_msg_ext - dynamic name service announcement
> > >>> message v2
> > >>> + * @name: name of remote service that is published
> > >>> + * @desc: description of remote service
> > >>> + * @addr: address of remote service that is published
> > >>> + * @flags: indicates whether service is created or destroyed
> > >>> + *
> > >>> + * Interchangeable nameservice message with rpmsg_ns_msg. This one
> > >>> +has
> > >>> + * the addition of the desc field for extra flexibility.
> > >>> + */
> > >>> +struct rpmsg_ns_msg_ext {
> > >>> +��� char name[RPMSG_NAME_SIZE];
> > >>> +��� char desc[RPMSG_NAME_SIZE];
> > >>> +��� u32 addr;
> > >>> +��� u32 flags;
> > >>> +} __packed;
> > >>> +
> > >>>  � /**
> > >>>  �� * enum rpmsg_ns_flags - dynamic name service announcement flags
> > >>>  �� *
> > >>> @@ -384,6 +401,24 @@ static void virtio_rpmsg_release_device(struct
> > >>> device *dev)
> > >>>  ����� kfree(vch);
> > >>>  � }
> > >>>  � +static int virtio_rpmsg_desc_match(struct device *dev, void
> > >>> *data)
> > >>> +{
> > >>> +��� struct rpmsg_channel_info *chinfo = data;
> > >>> +��� struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> > >>> +
> > >>> +��� if (!*chinfo->desc)
> > >>> +������� return 0;
> > >>> +
> > >>> +��� if (strncmp(chinfo->name, rpdev->id.name, RPMSG_NAME_SIZE))
> > >>> +������� return 0;
> > >>> +
> > >>> +��� if (strncmp(chinfo->desc, rpdev->desc, RPMSG_NAME_SIZE))
> > >>> +������� return 0;
> > >>> +
> > >>> +��� /* found a match ! */
> > >>> +��� return 1;
> > >>> +}
> > >>> +
> > >>>  � /*
> > >>>  �� * create an rpmsg channel using its name and address info.
> > >>>  �� * this function will be used to create both static and dynamic
> > >>> @@ -407,6 +442,15 @@ static struct rpmsg_device
> > >>> *rpmsg_create_channel(struct virtproc_info *vrp,
> > >>>  ��������� return NULL;
> > >>>  ����� }
> > >>>  � +��� tmp = device_find_child(dev, chinfo,
> > >>> virtio_rpmsg_desc_match);
> > >>> +��� if (tmp) {
> > >>> +������� /* decrement the matched device's refcount back */
> > >>> +������� put_device(tmp);
> > >>> +������� dev_err(dev, "channel %s:%x:%x failed, desc '%s' already
> > >>> exists\n",
> > >>> +����������� chinfo->name, chinfo->src, chinfo->dst, chinfo->desc);
> > >>> +������� return NULL;
> > >>> +��� }
> > >>> +
> > >>>  ����� vch = kzalloc(sizeof(*vch), GFP_KERNEL);
> > >>>  ����� if (!vch)
> > >>>  ��������� return NULL;
> > >>> @@ -419,6 +463,7 @@ static struct rpmsg_device
> > >>> *rpmsg_create_channel(struct virtproc_info *vrp,
> > >>>  ����� rpdev->src = chinfo->src;
> > >>>  ����� rpdev->dst = chinfo->dst;
> > >>>  ����� rpdev->ops = &virtio_rpmsg_ops;
> > >>> +��� strncpy(rpdev->desc, chinfo->desc, RPMSG_NAME_SIZE);
> > >>>  � ����� /*
> > >>>  ������ * rpmsg server channels has predefined local address (for
> > >>> now), @@ -816,18 +861,30 @@ static int rpmsg_ns_cb(struct
> > >>> rpmsg_device *rpdev, void *data, int len,
> > >>>  ���������������� void *priv, u32 src)
> > >>>  � {
> > >>>  ����� struct rpmsg_ns_msg *msg = data;
> > >>> +��� struct rpmsg_ns_msg_ext *msg_ext = data;
> > >>>  ����� struct rpmsg_device *newch;
> > >>>  ����� struct rpmsg_channel_info chinfo;
> > >>>  ����� struct virtproc_info *vrp = priv;
> > >>>  ����� struct device *dev = &vrp->vdev->dev;
> > >>>  ����� int ret;
> > >>> +��� u32 addr;
> > >>> +��� u32 flags;
> > >>>  � � #if defined(CONFIG_DYNAMIC_DEBUG)
> > >>>  ����� dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16,
> > >>> 1,
> > >>>  �������������� data, len, true);
> > >>>  � #endif
> > >>>  � -��� if (len != sizeof(*msg)) {
> > >>> +��� if (len == sizeof(*msg)) {
> > >>> +������� addr = msg->addr;
> > >>> +������� flags = msg->flags;
> > >>> +������� chinfo.desc[0] = '\0';
> > >>> +��� } else if (len == sizeof(*msg_ext)) {
> > >>> +������� addr = msg_ext->addr;
> > >>> +������� flags = msg_ext->flags;
> > >>> +������� msg_ext->desc[RPMSG_NAME_SIZE - 1] = '\0';
> > >>> +������� strncpy(chinfo.desc, msg_ext->desc, sizeof(chinfo.desc));
> > >>> +��� } else {
> > >>>  ��������� dev_err(dev, "malformed ns msg (%d)\n", len);
> > >>>  ��������� return -EINVAL;
> > >>>  ����� }
> > >>> @@ -847,14 +904,14 @@ static int rpmsg_ns_cb(struct rpmsg_device
> > >>> *rpdev, void *data, int len,
> > >>>  ����� msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> > >>>  � ����� dev_info(dev, "%sing channel %s addr 0x%x\n",
> > >>> -�������� msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> > >>> -�������� msg->name, msg->addr);
> > >>> +�������� flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> > >>> +�������� msg->name, addr);
> > >>>  � ����� strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> > >>>  ����� chinfo.src = RPMSG_ADDR_ANY;
> > >>> -��� chinfo.dst = msg->addr;
> > >>> +��� chinfo.dst = addr;
> > >>>  � -��� if (msg->flags & RPMSG_NS_DESTROY) {
> > >>> +��� if (flags & RPMSG_NS_DESTROY) {
> > >>>  ��������� ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
> > >>>  ��������� if (ret)
> > >>>  ������������� dev_err(dev, "rpmsg_destroy_channel failed: %d\n",
> > >>> ret); diff --git a/drivers/soc/qcom/wcnss_ctrl.c
> > >>> b/drivers/soc/qcom/wcnss_ctrl.c index e5c68051fb17..ad9f28dc13f1
> > >>> 100644
> > >>> --- a/drivers/soc/qcom/wcnss_ctrl.c
> > >>> +++ b/drivers/soc/qcom/wcnss_ctrl.c
> > >>> @@ -276,6 +276,7 @@ struct rpmsg_endpoint
> > >>> *qcom_wcnss_open_channel(void *wcnss, const char *name, rp
> > >>>  ����� strscpy(chinfo.name, name, sizeof(chinfo.name));
> > >>>  ����� chinfo.src = RPMSG_ADDR_ANY;
> > >>>  ����� chinfo.dst = RPMSG_ADDR_ANY;
> > >>> +��� chinfo.desc[0] = '\0';
> > >>>  � ����� return rpmsg_create_ept(_wcnss->channel->rpdev, cb, priv,
> > >>> chinfo);
> > >
> > >> There is another way to create a service, by registering an RPMsg
> > >> drivers (e.g.
> > >> https://elixir.bootlin.com/linux/v5.3-rc6/source/samples/rpmsg/rpmsg_
> > >> client_sample.c)
> > >
> > > I am not sure I understand, you obviously need a rpmsg driver for a
> > > rpmsg device to probe.
> > >
> > >>
> > >> In this case the descriptor can not be used, right?
> > >> To be compliant probably need to extend the rpmsg_device_id struct...
> > >
> > > As I mentioned above, it is optional for backward compatibility, and
> > > the rpmsg client sample doesn't have any use for it atm, even if a
> > > firmware publishes a desc field alongside the "rpmsg-client-sample"
> > > name. That is why, I haven't extended the rpmsg_device_id.
> > >
> > > regards
> > > Suman
> > >
> > >>
> > >> Regards,
> > >> Arnaud
> > >>>  � }
> > >>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h index
> > >>> 9fe156d1c018..436faf04ba1c 100644
> > >>> --- a/include/linux/rpmsg.h
> > >>> +++ b/include/linux/rpmsg.h
> > >>> @@ -28,11 +28,13 @@ struct rpmsg_endpoint_ops;
> > >>>  � /**
> > >>>  �� * struct rpmsg_channel_info - channel info representation
> > >>>  �� * @name: name of service
> > >>> + * @desc: description of service
> > >>>  �� * @src: local address
> > >>>  �� * @dst: destination address
> > >>>  �� */
> > >>>  � struct rpmsg_channel_info {
> > >>>  ����� char name[RPMSG_NAME_SIZE];
> > >>> +��� char desc[RPMSG_NAME_SIZE];
> > >>>  ����� u32 src;
> > >>>  ����� u32 dst;
> > >>>  � };
> > >>> @@ -42,6 +44,7 @@ struct rpmsg_channel_info {
> > >>>  �� * @dev: the device struct
> > >>>  �� * @id: device id (used to match between rpmsg drivers and
> > >>> devices)
> > >>>  �� * @driver_override: driver name to force a match
> > >>> + * @desc: description of remote service
> > >>>  �� * @src: local address
> > >>>  �� * @dst: destination address
> > >>>  �� * @ept: the rpmsg endpoint of this channel @@ -51,6 +54,7 @@
> > >>> struct rpmsg_device {
> > >>>  ����� struct device dev;
> > >>>  ����� struct rpmsg_device_id id;
> > >>>  ����� char *driver_override;
> > >>> +��� char desc[RPMSG_NAME_SIZE];
> > >>>  ����� u32 src;
> > >>>  ����� u32 dst;
> > >>>  ����� struct rpmsg_endpoint *ept;
> > >>>
> > >
