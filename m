Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5C519F588
	for <lists+linux-remoteproc@lfdr.de>; Mon,  6 Apr 2020 14:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgDFMGE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 6 Apr 2020 08:06:04 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:37152 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbgDFMGE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 08:06:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id AE97327E0456;
        Mon,  6 Apr 2020 14:06:02 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id TGEQGX26-dUG; Mon,  6 Apr 2020 14:06:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id D18CB27E08CF;
        Mon,  6 Apr 2020 14:06:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id peAjCYORDKTX; Mon,  6 Apr 2020 14:06:01 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id B673027E0456;
        Mon,  6 Apr 2020 14:06:01 +0200 (CEST)
Date:   Mon, 6 Apr 2020 14:06:01 +0200 (CEST)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        psodagud <psodagud@codeaurora.org>, tsoni <tsoni@codeaurora.org>,
        sidgup <sidgup@codeaurora.org>
Message-ID: <634144036.14036712.1586174761552.JavaMail.zimbra@kalray.eu>
In-Reply-To: <730c75c9-15e2-19c5-d97a-190bf1e6ffaa@st.com>
References: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org> <5b1c8287-0077-87e7-9364-b1f5a104c9e3@st.com> <6261646b2e0c4d9c8a30900b2f475890@codeaurora.org> <730c75c9-15e2-19c5-d97a-190bf1e6ffaa@st.com>
Subject: Re: [PATCH v2 1/2] remoteproc: Add character device interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC80 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Add character device interface
Thread-Index: ksfbnUgo6xvpb68JoDnDY0Vjuu4HFQ==
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

----- On 6 Apr, 2020, at 11:01, Arnaud Pouliquen arnaud.pouliquen@st.com wrote:

> On 4/3/20 9:13 PM, rishabhb@codeaurora.org wrote:
>> On 2020-04-02 10:28, Arnaud POULIQUEN wrote:
>>> Hi
>>>
>>> On 4/1/20 2:03 AM, Rishabh Bhatnagar wrote:
>>>> Add the character device interface for userspace applications.
>>>> This interface can be used in order to boot up and shutdown
>>>> remote subsystems. Currently there is only a sysfs interface
>>>> which the userspace clients can use. If a usersapce application
>>>> crashes after booting the remote processor does not get any
>>>> indication about the crash. It might still assume that the
>>>> application is running. For example modem uses remotefs service
>>>> to fetch data from disk/flash memory. If the remotefs service
>>>> crashes, modem keeps on requesting data which might lead to a
>>>> crash. Adding a character device interface makes the remote
>>>> processor tightly coupled with the user space application.
>>>> A crash of the application leads to a close on the file descriptors
>>>> therefore shutting down the remoteproc.
>>>
>>> Sorry I'm late in the discussion, I hope I've gone through the whole
>>> discussion so I don't reopen a closed point...
>>>
>>> Something here is not crystal clear to me so I'd rather share it...
>>>
>>> I suppose that you the automatic restart of the application is not possible to
>>> stop and restart the remote processor...
>> Yes correct, while we wait for the application to restart we might observe a
>> fatal crash.
>>>
>>> Why this use case can not be solved by a process monitor or a service
>>> in userland that detects the application crash and stop the remote
>>> firmware using
>>> the sysfs interface?
>>>
>> What happens in the case where the process monitor itself crashes? This is
>> actually the approach we follow in our downstream code. We have a central entity
>> in userspace that controls bootup/shutdown of some remote processors based on
>> the
>> votes from userspace clients. We have observed cases where this entity
>> itself crashes and remote processors are left hanging.
> 
> Your description makes me feel like this patch is only a workaround of something
> that
> should be fixed in the userland, even if i understand that hanging is one of the
> most
> critical problem and have to be fixed.
> For instance, how to handle several applications that interact with the remote
> processor
> ( e.g. rpmsg service applications) how to stop and restart everything. Using the
> char
> device would probaly resolve only a part of the issue...
> 
> I'm not aware about your environment and i'm not a userland expert. But what i
> still not
> understand why a parent process can not do the job...
> I just test a simple script on my side that treat the kill -9 of an application
> ("cat" in my case).

This is not entirely true, if the parent process is killed with a SIGKILL, then
the process will not be able to handle anything and the remoteproc will still
be running.

What I understood from Rishabh patch is a way to allow a single process handling
the rproc state. We have the same kind of need and currently, if the
user application crashes, then the rproc is still running (which happens).

> 
> #start the remote firmware
> cp  $1 /lib/firmware/
> echo $1> /sys/class/remoteproc/remoteproc0/firmware
> echo start >/sys/class/remoteproc/remoteproc0/state
> #your binary
> cat /dev/kmsg
> # stop the remote firmware in case of crash (and potentially some other apps)
> echo stop >/sys/class/remoteproc/remoteproc0/state
> 

This is not really "production proof" and what happens if the application is
responsible of setting the firmware which might be jitted ? 
And if the script receives the SIGKILL, then we are back to the same problem.

I really think, this is a step forward an easier and reliable use of the remoteproc
on userland to guarantee a coherent rproc state even if host application
crashes.

Regards,

Clément

> Anyway, it's just my feeling, let other people give their feedback.
> 
>>> I just want to be sure that there is no alternative to this, because
>>> having two ways
>>> for application to shutdown the firmware seems to me confusing...
>> Does making this interface optional/configurable helps?
>>>
>>> What about the opposite service, mean inform the application that the remote
>>> processor is crashed?
>>> Do you identify such need? or the "auto" crash recovery is sufficient?
>> Auto recovery works perfectly for us. Although there is a mechanism in
>> place using QMI(Qualcomm MSM interface) that can notify clients about remote
>> processor crash.
> 
> Thanks for the information.
> 
> Regards
> Arnaud
> 
>>>
>>> Thanks,
>>> Arnaud
>>>>
>>>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>>>> ---
>>>>  drivers/remoteproc/Kconfig               |   9 +++
>>>>  drivers/remoteproc/Makefile              |   1 +
>>>>  drivers/remoteproc/remoteproc_cdev.c     | 100 +++++++++++++++++++++++++++++++
>>>>  drivers/remoteproc/remoteproc_internal.h |  22 +++++++
>>>>  include/linux/remoteproc.h               |   2 +
>>>>  5 files changed, 134 insertions(+)
>>>>  create mode 100644 drivers/remoteproc/remoteproc_cdev.c
>>>>
>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>> index de3862c..6374b79 100644
>>>> --- a/drivers/remoteproc/Kconfig
>>>> +++ b/drivers/remoteproc/Kconfig
>>>> @@ -14,6 +14,15 @@ config REMOTEPROC
>>>>
>>>>  if REMOTEPROC
>>>>
>>>> +config REMOTEPROC_CDEV
>>>> +    bool "Remoteproc character device interface"
>>>> +    help
>>>> +      Say y here to have a character device interface for Remoteproc
>>>> +      framework. Userspace can boot/shutdown remote processors through
>>>> +      this interface.
>>>> +
>>>> +      It's safe to say N if you don't want to use this interface.
>>>> +
>>>>  config IMX_REMOTEPROC
>>>>      tristate "IMX6/7 remoteproc support"
>>>>      depends on ARCH_MXC
>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>> index e30a1b1..b7d4f77 100644
>>>> --- a/drivers/remoteproc/Makefile
>>>> +++ b/drivers/remoteproc/Makefile
>>>> @@ -9,6 +9,7 @@ remoteproc-y                += remoteproc_debugfs.o
>>>>  remoteproc-y                += remoteproc_sysfs.o
>>>>  remoteproc-y                += remoteproc_virtio.o
>>>>  remoteproc-y                += remoteproc_elf_loader.o
>>>> +obj-$(CONFIG_REMOTEPROC_CDEV)        += remoteproc_cdev.o
>>>>  obj-$(CONFIG_IMX_REMOTEPROC)        += imx_rproc.o
>>>>  obj-$(CONFIG_MTK_SCP)            += mtk_scp.o mtk_scp_ipi.o
>>>>  obj-$(CONFIG_OMAP_REMOTEPROC)        += omap_remoteproc.o
>>>> diff --git a/drivers/remoteproc/remoteproc_cdev.c
>>>> b/drivers/remoteproc/remoteproc_cdev.c
>>>> new file mode 100644
>>>> index 0000000..8182bd1
>>>> --- /dev/null
>>>> +++ b/drivers/remoteproc/remoteproc_cdev.c
>>>> @@ -0,0 +1,100 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Character device interface driver for Remoteproc framework.
>>>> + *
>>>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <linux/cdev.h>
>>>> +#include <linux/fs.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/remoteproc.h>
>>>> +
>>>> +#include "remoteproc_internal.h"
>>>> +
>>>> +#define NUM_RPROC_DEVICES    64
>>>> +static dev_t rproc_cdev;
>>>> +static DEFINE_IDA(cdev_minor_ida);
>>>> +
>>>> +static int rproc_cdev_open(struct inode *inode, struct file *file)
>>>> +{
>>>> +    struct rproc *rproc;
>>>> +
>>>> +    rproc = container_of(inode->i_cdev, struct rproc, char_dev);
>>>> +
>>>> +    if (!rproc)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (rproc->state == RPROC_RUNNING)
>>>> +        return -EBUSY;
>>>> +
>>>> +    return rproc_boot(rproc);
>>>> +}
>>>> +
>>>> +static int rproc_cdev_release(struct inode *inode, struct file *file)
>>>> +{
>>>> +    struct rproc *rproc;
>>>> +
>>>> +    rproc = container_of(inode->i_cdev, struct rproc, char_dev);
>>>> +
>>>> +    if (!rproc || rproc->state != RPROC_RUNNING)
>>>> +        return -EINVAL;
>>>> +
>>>> +    rproc_shutdown(rproc);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct file_operations rproc_fops = {
>>>> +    .open = rproc_cdev_open,
>>>> +    .release = rproc_cdev_release,
>>>> +};
>>>> +
>>>> +int rproc_char_device_add(struct rproc *rproc)
>>>> +{
>>>> +    int ret, minor;
>>>> +    dev_t cdevt;
>>>> +
>>>> +    minor = ida_simple_get(&cdev_minor_ida, 0, NUM_RPROC_DEVICES,
>>>> +                   GFP_KERNEL);
>>>> +    if (minor < 0) {
>>>> +        dev_err(&rproc->dev, "%s: No more minor numbers left! rc:%d\n",
>>>> +            __func__, minor);
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    cdev_init(&rproc->char_dev, &rproc_fops);
>>>> +    rproc->char_dev.owner = THIS_MODULE;
>>>> +
>>>> +    cdevt = MKDEV(MAJOR(rproc_cdev), minor);
>>>> +    ret = cdev_add(&rproc->char_dev, cdevt, 1);
>>>> +    if (ret < 0)
>>>> +        ida_simple_remove(&cdev_minor_ida, minor);
>>>> +
>>>> +    rproc->dev.devt = cdevt;
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +void rproc_char_device_remove(struct rproc *rproc)
>>>> +{
>>>> +    __unregister_chrdev(MAJOR(rproc->dev.devt), MINOR(rproc->dev.devt), 1,
>>>> +                "rproc");
>>>> +    ida_simple_remove(&cdev_minor_ida, MINOR(rproc->dev.devt));
>>>> +}
>>>> +
>>>> +void __init rproc_init_cdev(void)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = alloc_chrdev_region(&rproc_cdev, 0, NUM_RPROC_DEVICES, "rproc");
>>>> +    if (ret < 0) {
>>>> +        pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
>>>> +        return;
>>>> +    }
>>>> +}
>>>> +
>>>> +void __exit rproc_exit_cdev(void)
>>>> +{
>>>> +    __unregister_chrdev(MAJOR(rproc_cdev), 0, NUM_RPROC_DEVICES, "rproc");
>>>> +}
>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>>> b/drivers/remoteproc/remoteproc_internal.h
>>>> index 493ef92..28d61a1 100644
>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>> @@ -47,6 +47,27 @@ struct dentry *rproc_create_trace_file(const char *name,
>>>> struct rproc *rproc,
>>>>  int rproc_init_sysfs(void);
>>>>  void rproc_exit_sysfs(void);
>>>>
>>>> +#ifdef CONFIG_REMOTEPROC_CDEV
>>>> +void rproc_init_cdev(void);
>>>> +void rproc_exit_cdev(void);
>>>> +int rproc_char_device_add(struct rproc *rproc);
>>>> +void rproc_char_device_remove(struct rproc *rproc);
>>>> +#else
>>>> +static inline void rproc_init_cdev(void)
>>>> +{
>>>> +}
>>>> +static inline void rproc_exit_cdev(void)
>>>> +{
>>>> +}
>>>> +static inline int rproc_char_device_add(struct rproc *rproc)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +static inline void  rproc_char_device_remove(struct rproc *rproc)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>>  void rproc_free_vring(struct rproc_vring *rvring);
>>>>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>>>
>>>> @@ -63,6 +84,7 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct
>>>> rproc *rproc,
>>>>  struct rproc_mem_entry *
>>>>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>>>>
>>>> +
>>>>  static inline
>>>>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>>>  {
>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>> index 16ad666..c4ca796 100644
>>>> --- a/include/linux/remoteproc.h
>>>> +++ b/include/linux/remoteproc.h
>>>> @@ -37,6 +37,7 @@
>>>>
>>>>  #include <linux/types.h>
>>>>  #include <linux/mutex.h>
>>>> +#include <linux/cdev.h>
>>>>  #include <linux/virtio.h>
>>>>  #include <linux/completion.h>
>>>>  #include <linux/idr.h>
>>>> @@ -514,6 +515,7 @@ struct rproc {
>>>>      bool auto_boot;
>>>>      struct list_head dump_segments;
>>>>      int nb_vdev;
>>>> +    struct cdev char_dev;
>>>>  };
>>>>
>>>>  /**
