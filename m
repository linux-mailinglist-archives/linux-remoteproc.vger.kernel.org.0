Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2922D19A5F8
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 09:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731850AbgDAHME (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 03:12:04 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:52004 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731848AbgDAHMD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 03:12:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 9BDF027E0838;
        Wed,  1 Apr 2020 09:12:01 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id xJfPBX6lBuZC; Wed,  1 Apr 2020 09:12:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F1EE727E087A;
        Wed,  1 Apr 2020 09:12:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id b6oGcJgFmnPO; Wed,  1 Apr 2020 09:12:00 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id D892A27E0838;
        Wed,  1 Apr 2020 09:12:00 +0200 (CEST)
Date:   Wed, 1 Apr 2020 09:12:00 +0200 (CEST)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        psodagud <psodagud@codeaurora.org>, tsoni <tsoni@codeaurora.org>,
        sidgup <sidgup@codeaurora.org>
Message-ID: <1808621854.13146176.1585725120655.JavaMail.zimbra@kalray.eu>
In-Reply-To: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org>
References: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 1/2] remoteproc: Add character device interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC80 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Add character device interface
Thread-Index: aYJZh7zfz1Q/b6NDi2Jk4BWAbqBfGA==
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rishabh,

----- On 1 Apr, 2020, at 02:03, Rishabh Bhatnagar rishabhb@codeaurora.org wrote:

> Add the character device interface for userspace applications.
> This interface can be used in order to boot up and shutdown
> remote subsystems. Currently there is only a sysfs interface
> which the userspace clients can use. If a usersapce application

Typo: usersapce -> userspace.

> crashes after booting the remote processor does not get any
> indication about the crash. It might still assume that the
> application is running. For example modem uses remotefs service
> to fetch data from disk/flash memory. If the remotefs service
> crashes, modem keeps on requesting data which might lead to a
> crash. Adding a character device interface makes the remote
> processor tightly coupled with the user space application.

Should probably use userspace for coherency.

> A crash of the application leads to a close on the file descriptors
> therefore shutting down the remoteproc.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
> drivers/remoteproc/Kconfig               |   9 +++
> drivers/remoteproc/Makefile              |   1 +
> drivers/remoteproc/remoteproc_cdev.c     | 100 +++++++++++++++++++++++++++++++
> drivers/remoteproc/remoteproc_internal.h |  22 +++++++
> include/linux/remoteproc.h               |   2 +
> 5 files changed, 134 insertions(+)
> create mode 100644 drivers/remoteproc/remoteproc_cdev.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index de3862c..6374b79 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -14,6 +14,15 @@ config REMOTEPROC
> 
> if REMOTEPROC
> 
> +config REMOTEPROC_CDEV
> +	bool "Remoteproc character device interface"
> +	help
> +	  Say y here to have a character device interface for Remoteproc

Not sure about the capital Remoteproc 'R' here, but maybe others can
comment.

> +	  framework. Userspace can boot/shutdown remote processors through
> +	  this interface.
> +
> +	  It's safe to say N if you don't want to use this interface.
> +
> config IMX_REMOTEPROC
> 	tristate "IMX6/7 remoteproc support"
> 	depends on ARCH_MXC
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index e30a1b1..b7d4f77 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -9,6 +9,7 @@ remoteproc-y				+= remoteproc_debugfs.o
> remoteproc-y				+= remoteproc_sysfs.o
> remoteproc-y				+= remoteproc_virtio.o
> remoteproc-y				+= remoteproc_elf_loader.o
> +obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
> obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
> diff --git a/drivers/remoteproc/remoteproc_cdev.c
> b/drivers/remoteproc/remoteproc_cdev.c
> new file mode 100644
> index 0000000..8182bd1
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Character device interface driver for Remoteproc framework.
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/remoteproc.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define NUM_RPROC_DEVICES	64
> +static dev_t rproc_cdev;
> +static DEFINE_IDA(cdev_minor_ida);
> +
> +static int rproc_cdev_open(struct inode *inode, struct file *file)
> +{
> +	struct rproc *rproc;
> +
> +	rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> +
> +	if (!rproc)
> +		return -EINVAL;
> +
> +	if (rproc->state == RPROC_RUNNING)
> +		return -EBUSY;
> +
> +	return rproc_boot(rproc);
> +}
> +
> +static int rproc_cdev_release(struct inode *inode, struct file *file)
> +{
> +	struct rproc *rproc;
> +
> +	rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> +
> +	if (!rproc || rproc->state != RPROC_RUNNING)

rproc state != RUNNING can probably happen if the remoteproc
crashed I think. However, you'll return EINVAL, though I'm not
sure about what the user could do in such cases, maybe returning
another more meaningful value could be useful.

> +		return -EINVAL;
> +
> +	rproc_shutdown(rproc);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations rproc_fops = {
> +	.open = rproc_cdev_open,
> +	.release = rproc_cdev_release,
> +};
> +
> +int rproc_char_device_add(struct rproc *rproc)
> +{
> +	int ret, minor;
> +	dev_t cdevt;
> +
> +	minor = ida_simple_get(&cdev_minor_ida, 0, NUM_RPROC_DEVICES,
> +			       GFP_KERNEL);
> +	if (minor < 0) {
> +		dev_err(&rproc->dev, "%s: No more minor numbers left! rc:%d\n",
> +			__func__, minor);
> +		return -ENODEV;
> +	}
> +
> +	cdev_init(&rproc->char_dev, &rproc_fops);
> +	rproc->char_dev.owner = THIS_MODULE;
> +
> +	cdevt = MKDEV(MAJOR(rproc_cdev), minor);
> +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> +	if (ret < 0)
> +		ida_simple_remove(&cdev_minor_ida, minor);
> +
> +	rproc->dev.devt = cdevt;
> +	return ret;
> +}
> +
> +void rproc_char_device_remove(struct rproc *rproc)
> +{
> +	__unregister_chrdev(MAJOR(rproc->dev.devt), MINOR(rproc->dev.devt), 1,
> +			    "rproc");
> +	ida_simple_remove(&cdev_minor_ida, MINOR(rproc->dev.devt));
> +}
> +
> +void __init rproc_init_cdev(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rproc_cdev, 0, NUM_RPROC_DEVICES, "rproc");
> +	if (ret < 0) {
> +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> +		return;
> +	}
> +}
> +
> +void __exit rproc_exit_cdev(void)
> +{
> +	__unregister_chrdev(MAJOR(rproc_cdev), 0, NUM_RPROC_DEVICES, "rproc");
> +}
> diff --git a/drivers/remoteproc/remoteproc_internal.h
> b/drivers/remoteproc/remoteproc_internal.h
> index 493ef92..28d61a1 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -47,6 +47,27 @@ struct dentry *rproc_create_trace_file(const char *name,
> struct rproc *rproc,
> int rproc_init_sysfs(void);
> void rproc_exit_sysfs(void);
> 
> +#ifdef CONFIG_REMOTEPROC_CDEV
> +void rproc_init_cdev(void);
> +void rproc_exit_cdev(void);
> +int rproc_char_device_add(struct rproc *rproc);
> +void rproc_char_device_remove(struct rproc *rproc);
> +#else
> +static inline void rproc_init_cdev(void)
> +{
> +}
> +static inline void rproc_exit_cdev(void)
> +{
> +}
> +static inline int rproc_char_device_add(struct rproc *rproc)
> +{
> +	return 0;
> +}
> +static inline void  rproc_char_device_remove(struct rproc *rproc)
> +{
> +}
> +#endif
> +
> void rproc_free_vring(struct rproc_vring *rvring);
> int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
> 
> @@ -63,6 +84,7 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct
> rproc *rproc,
> struct rproc_mem_entry *
> rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> 
> +

Useless newline ?

> static inline
> int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad666..c4ca796 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -37,6 +37,7 @@
> 
> #include <linux/types.h>
> #include <linux/mutex.h>
> +#include <linux/cdev.h>
> #include <linux/virtio.h>
> #include <linux/completion.h>
> #include <linux/idr.h>
> @@ -514,6 +515,7 @@ struct rproc {
> 	bool auto_boot;
> 	struct list_head dump_segments;
> 	int nb_vdev;
> +	struct cdev char_dev;
> };
> 
> /**
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
