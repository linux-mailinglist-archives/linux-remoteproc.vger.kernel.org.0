Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC193197975
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Mar 2020 12:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgC3Kmf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 06:42:35 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:58930 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbgC3Kmf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 06:42:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id DF24E27E031E;
        Mon, 30 Mar 2020 12:42:33 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id emZMPI3v_1tB; Mon, 30 Mar 2020 12:42:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 5148127E071F;
        Mon, 30 Mar 2020 12:42:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id drJWvjV_7T23; Mon, 30 Mar 2020 12:42:33 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 3A2C527E031E;
        Mon, 30 Mar 2020 12:42:33 +0200 (CEST)
Date:   Mon, 30 Mar 2020 12:42:32 +0200 (CEST)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        psodagud <psodagud@codeaurora.org>, tsoni <tsoni@codeaurora.org>,
        sidgup <sidgup@codeaurora.org>
Message-ID: <463931027.12801248.1585564952633.JavaMail.zimbra@kalray.eu>
In-Reply-To: <679f34c02ed9842dd71af2033d610f9a@codeaurora.org>
References: <1585241440-7572-1-git-send-email-rishabhb@codeaurora.org> <1585241440-7572-2-git-send-email-rishabhb@codeaurora.org> <1233159221.12306373.1585244277714.JavaMail.zimbra@kalray.eu> <679f34c02ed9842dd71af2033d610f9a@codeaurora.org>
Subject: Re: [PATCH 1/2] remoteproc: Add userspace char device driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC80 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Add userspace char device driver
Thread-Index: BiJjxMq784DOYQUsXrreGxutreFRWg==
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rishabh,

----- On 28 Mar, 2020, at 01:09, Rishabh Bhatnagar rishabhb@codeaurora.org wrote:

> On 2020-03-26 10:37, Clément Leger wrote:
>> Hi Rishabh,
>> 
>> While being interesting to have a such a userspace interface, I have
>> some remarks.
>> 
>> ----- On 26 Mar, 2020, at 17:50, Rishabh Bhatnagar
>> rishabhb@codeaurora.org wrote:
>> 
>>> Add the driver for creating the character device interface for
>>> userspace applications. The character device interface can be used
>>> in order to boot up and shutdown the remote processor.
>>> This might be helpful for remote processors that are booted by
>>> userspace applications and need to shutdown when the application
>>> crahes/shutsdown.
>>> 
>>> Change-Id: If23c8986272bb7c943eb76665f127ff706f12394
>>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>>> ---
>>> drivers/remoteproc/Makefile               |  1 +
>>> drivers/remoteproc/remoteproc_internal.h  |  6 +++
>>> drivers/remoteproc/remoteproc_userspace.c | 90
>>> +++++++++++++++++++++++++++++++
>>> include/linux/remoteproc.h                |  2 +
>>> 4 files changed, 99 insertions(+)
>>> create mode 100644 drivers/remoteproc/remoteproc_userspace.c
>>> 
>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>> index e30a1b1..facb3fa 100644
>>> --- a/drivers/remoteproc/Makefile
>>> +++ b/drivers/remoteproc/Makefile
>>> @@ -7,6 +7,7 @@ obj-$(CONFIG_REMOTEPROC)		+= remoteproc.o
>>> remoteproc-y				:= remoteproc_core.o
>>> remoteproc-y				+= remoteproc_debugfs.o
>>> remoteproc-y				+= remoteproc_sysfs.o
>>> +remoteproc-y				+= remoteproc_userspace.o
>>> remoteproc-y				+= remoteproc_virtio.o
>>> remoteproc-y				+= remoteproc_elf_loader.o
>>> obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>> b/drivers/remoteproc/remoteproc_internal.h
>>> index 493ef92..97513ba 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -47,6 +47,9 @@ struct dentry *rproc_create_trace_file(const char
>>> *name,
>>> struct rproc *rproc,
>>> int rproc_init_sysfs(void);
>>> void rproc_exit_sysfs(void);
>>> 
>>> +void rproc_init_cdev(void);
>>> +void rproc_exit_cdev(void);
>>> +
>>> void rproc_free_vring(struct rproc_vring *rvring);
>>> int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>> 
>>> @@ -63,6 +66,9 @@ struct resource_table
>>> *rproc_elf_find_loaded_rsc_table(struct
>>> rproc *rproc,
>>> struct rproc_mem_entry *
>>> rproc_find_carveout_by_name(struct rproc *rproc, const char *name,
>>> ...);
>>> 
>>> +/* from remoteproc_userspace.c */
>>> +int rproc_char_device_add(struct rproc *rproc);
>>> +
>>> static inline
>>> int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware
>>> *fw)
>>> {
>>> diff --git a/drivers/remoteproc/remoteproc_userspace.c
>>> b/drivers/remoteproc/remoteproc_userspace.c
>>> new file mode 100644
>>> index 0000000..2ef7679
>>> --- /dev/null
>>> +++ b/drivers/remoteproc/remoteproc_userspace.c
>>> @@ -0,0 +1,90 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Character device interface driver for Remoteproc framework.
>>> + *
>>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/fs.h>
>>> +#include <linux/cdev.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/remoteproc.h>
>>> +
>>> +#include "remoteproc_internal.h"
>>> +
>>> +#define NUM_RPROC_DEVICES	64
>>> +static dev_t rproc_cdev;
>>> +static DEFINE_IDA(cdev_minor_ida);
>>> +
>>> +static int rproc_open(struct inode *inode, struct file *file)
>>> +{
>>> +	struct rproc *rproc;
>>> +
>>> +	rproc = container_of(inode->i_cdev, struct rproc, char_dev);
>>> +	if (!rproc)
>>> +		return -EINVAL;
>>> +
>>> +	return rproc_boot(rproc);
>>> +}
>> 
>> What happens if multiple user open this chardev ? Apparently,
>> rproc_boot returns 0 if already powered_up, so the next user won't know
>> what is the state of the rproc.
>> Exclusive access could probably be a good idea.
> Since it is synchronized inside rproc_boot multiple users simultaneously
> calling open shouldn't be a problem. If it is one after the other then
> second caller will get result as 0 and assume that rproc booted
> successfully.

It will be the same for close, it will assume the rproc has been stopped ?
But in fact it will still be running until the refcount is 0.

> That is the expected flow right?

I would expect only one caller to be successful, others should probably
receive a EBUSY errno IMHO.

>> 
>>> +
>>> +static int rproc_release(struct inode *inode, struct file *file)
>>> +{
>>> +	struct rproc *rproc;
>>> +
>>> +	rproc = container_of(inode->i_cdev, struct rproc, char_dev);
>>> +	if (!rproc)
>>> +		return -EINVAL;
>>> +
>>> +	rproc_shutdown(rproc);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct file_operations rproc_fops = {
>>> +	.open = rproc_open,
>>> +	.release = rproc_release,
>>> +};
>>> +
>>> +int rproc_char_device_add(struct rproc *rproc)
>>> +{
>>> +	int ret, minor;
>>> +	dev_t cdevt;
>>> +
>>> +	minor = ida_simple_get(&cdev_minor_ida, 0, NUM_RPROC_DEVICES,
>>> +			GFP_KERNEL);
>>> +	if (minor < 0) {
>>> +	pr_err("%s: No more minor numbers left! rc:%d\n", __func__,
>>> +							minor);
>>> +		return -ENODEV;
>>> +	}
>> 
>> How can you make the link between the chardev and the device instance ?
> I do this rproc->dev.devt = cdevt. Let me know of there is a better way
> to do this?

If this is sufficient to create a link in the sysfs, then it's ok but I'm
no expert here.

Clément

>> In our case, we have several remoteproc instances and thus we will end
>> up having multiple chardev.
>> 
>> Regards,
>> 
>> Clément
>> 
> rproc_char_device_add will be called for each remoteproc that is
> added. So we will have one char dev per remoteproc.
>>> +
>>> +	cdev_init(&rproc->char_dev, &rproc_fops);
>>> +	rproc->char_dev.owner = THIS_MODULE;
>>> +
>>> +	cdevt = MKDEV(MAJOR(rproc_cdev), minor);
>>> +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
>>> +	if (ret < 0)
>>> +		ida_simple_remove(&cdev_minor_ida, minor);
>>> +
>>> +	rproc->dev.devt = cdevt;
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void __init rproc_init_cdev(void)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = alloc_chrdev_region(&rproc_cdev, 0, NUM_RPROC_DEVICES,
>>> "rproc");
>>> +	if (ret < 0) {
>>> +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
>>> +		return;
>>> +	}
>>> +}
>>> +
>>> +void __exit rproc_exit_cdev(void)
>>> +{
>>> +	unregister_chrdev_region(MKDEV(MAJOR(rproc_cdev), 0),
>>> +				NUM_RPROC_DEVICES);
>>> +}
>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>> index 16ad666..c4ca796 100644
>>> --- a/include/linux/remoteproc.h
>>> +++ b/include/linux/remoteproc.h
>>> @@ -37,6 +37,7 @@
>>> 
>>> #include <linux/types.h>
>>> #include <linux/mutex.h>
>>> +#include <linux/cdev.h>
>>> #include <linux/virtio.h>
>>> #include <linux/completion.h>
>>> #include <linux/idr.h>
>>> @@ -514,6 +515,7 @@ struct rproc {
>>> 	bool auto_boot;
>>> 	struct list_head dump_segments;
>>> 	int nb_vdev;
>>> +	struct cdev char_dev;
>>> };
>>> 
>>> /**
>>> --
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>>> Forum,
> >> a Linux Foundation Collaborative Project
