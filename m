Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42FD19B6C0
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 22:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732651AbgDAUId (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 16:08:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36892 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732645AbgDAUId (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 16:08:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id u65so566749pfb.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R7eDdx1qelZyEjmG13/wh77DXdQeKNXE0tobEN6ZDRo=;
        b=B9MKkhnJIwiSLqyk04z7PvShDGSOfDwd4jup49SV2akCRHhK5lWMykJnlxCnljcpu7
         tT8bgrDh4a792FlKsZD4WsS3g0YD4G5WklUccuG9uDteo9NL1Z/EJwI+VyUpwlCxBbsW
         1beVk5wXw/mAA4n3ulmPm8iauL9ltHw5NyKS4SGnKPYMT5FJ4a5mNLu3oW6VRZEPBQe7
         lQTk7bugRJNfDKiWWujoSAK2wqffxr4DQqOaVZrCOFBfsfbpii0SzCln+6uXGp5VYmyw
         HqzfFieAKAYZLIx0jraT94AlRahVQpVh3Qq5hle0/WSvPmxDfs+SIFOQIn+fX667Fldh
         pl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R7eDdx1qelZyEjmG13/wh77DXdQeKNXE0tobEN6ZDRo=;
        b=pwf+7IzUoR2+8GOdy3O01ziFzbFLGP9vWpdxwXoPzg+X7qsdqA3YDn84CfOlnSptaI
         2Fpkiy94vxDxhnqX9+0arATwQ7Pz2tz62MEnVoHL1EPnP+TMz+gmBkRxUtZFnUvsuU9e
         M5yftBQqVcJqwbR4V999gRRQReIJXbkuNxnva7wFjH7/zxc7Ri/VAG9QhuzZLUYKxfL4
         EjAnCiR3bSuPJFDJXr6DFZESCIBGbU4Cl8Ketft9eKuBkI6e1M7K8G7XLrrDw6fj2Cqf
         b2rSyPje6R9Dxs0ol+0NLuRqh3mLD1SwAbDpNYuFhOCIFXNeT6g2x0lQa8Ks8x1/sRur
         tnxQ==
X-Gm-Message-State: ANhLgQ11ElPLeOBFOQBgATBSAkGvxJ4DVOKLex01ddNHUd+7ZxLh4ezX
        oWokolFbKQXFzwMY6ge5A0N4FQ==
X-Google-Smtp-Source: ADFU+vvZpZ30+dH95jIKlKit8eUxIFKJ0pbqc3JKrtLESC+2S8FQXlCxe8nS8iewMey88u4dz619Lg==
X-Received: by 2002:a62:1894:: with SMTP id 142mr25672341pfy.27.1585771710780;
        Wed, 01 Apr 2020 13:08:30 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c128sm2145906pfa.11.2020.04.01.13.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:08:30 -0700 (PDT)
Date:   Wed, 1 Apr 2020 13:08:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v2 1/2] remoteproc: Add character device interface
Message-ID: <20200401200827.GF267644@minitux>
References: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 31 Mar 17:03 PDT 2020, Rishabh Bhatnagar wrote:

> Add the character device interface for userspace applications.
> This interface can be used in order to boot up and shutdown
> remote subsystems. Currently there is only a sysfs interface
> which the userspace clients can use. If a usersapce application
> crashes after booting the remote processor does not get any
> indication about the crash. It might still assume that the
> application is running. For example modem uses remotefs service
> to fetch data from disk/flash memory. If the remotefs service
> crashes, modem keeps on requesting data which might lead to a
> crash. Adding a character device interface makes the remote
> processor tightly coupled with the user space application.
> A crash of the application leads to a close on the file descriptors
> therefore shutting down the remoteproc.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/Kconfig               |   9 +++
>  drivers/remoteproc/Makefile              |   1 +
>  drivers/remoteproc/remoteproc_cdev.c     | 100 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h |  22 +++++++
>  include/linux/remoteproc.h               |   2 +
>  5 files changed, 134 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_cdev.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index de3862c..6374b79 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -14,6 +14,15 @@ config REMOTEPROC
>  
>  if REMOTEPROC
>  
> +config REMOTEPROC_CDEV
> +	bool "Remoteproc character device interface"
> +	help
> +	  Say y here to have a character device interface for Remoteproc
> +	  framework. Userspace can boot/shutdown remote processors through
> +	  this interface.
> +
> +	  It's safe to say N if you don't want to use this interface.
> +
>  config IMX_REMOTEPROC
>  	tristate "IMX6/7 remoteproc support"
>  	depends on ARCH_MXC
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index e30a1b1..b7d4f77 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -9,6 +9,7 @@ remoteproc-y				+= remoteproc_debugfs.o
>  remoteproc-y				+= remoteproc_sysfs.o
>  remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
> +obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
>  obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
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

I would prefer this to be a on a single line
	struct rproc *rproc = container_of(..);

> +
> +	if (!rproc)

I don't think this is possible.

> +		return -EINVAL;
> +
> +	if (rproc->state == RPROC_RUNNING)
> +		return -EBUSY;
> +

This is racy, it's possible that state wasn't RUNNING, but at the time
we're entering rproc_boot() it is - or as Clement correctly points out,
the core might be in CRASHED state.

> +	return rproc_boot(rproc);

Feels like we would want a variant of rproc_boot() that doesn't do
refcounting... Maybe a rproc_boot_exclusive() that takes the mutex and
then fails if the core is refcounted already?

> +}
> +
> +static int rproc_cdev_release(struct inode *inode, struct file *file)
> +{
> +	struct rproc *rproc;
> +
> +	rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> +
> +	if (!rproc || rproc->state != RPROC_RUNNING)
> +		return -EINVAL;

rproc can't be NULL here and the core might be in CRASHED state here, in
which case we still want to abort that and shut down the core...

Note that in the event of calling close() the return value is discarded
on the way to userspace and in the event that the process is killed we
still expect the remoteproc to be shut down (if the refcount hit 0). 

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

Can't you use rproc->index as minor?

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

Shouldn't this be cdev_del()?

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

Drop this return, and hence the {}

> +	}
> +}
> +
> +void __exit rproc_exit_cdev(void)
> +{
> +	__unregister_chrdev(MAJOR(rproc_cdev), 0, NUM_RPROC_DEVICES, "rproc");

unregister_chrdev_region();

> +}
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 493ef92..28d61a1 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -47,6 +47,27 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
>  int rproc_init_sysfs(void);
>  void rproc_exit_sysfs(void);
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
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>  
> @@ -63,6 +84,7 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  struct rproc_mem_entry *
>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>  
> +
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad666..c4ca796 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -37,6 +37,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> +#include <linux/cdev.h>
>  #include <linux/virtio.h>
>  #include <linux/completion.h>
>  #include <linux/idr.h>
> @@ -514,6 +515,7 @@ struct rproc {
>  	bool auto_boot;
>  	struct list_head dump_segments;
>  	int nb_vdev;
> +	struct cdev char_dev;
>  };
>  
>  /**
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
