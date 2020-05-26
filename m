Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D4E1BF2D1
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Apr 2020 10:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgD3IaP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Apr 2020 04:30:15 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21498 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726531AbgD3IaP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:30:15 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03U8MVPW011011;
        Thu, 30 Apr 2020 10:30:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OE0tp6+X5tTQDJZQL0I8xkm+cC1qOOa0U5/6s5K6JSc=;
 b=LbAX5IPlMwEthnL1IMzKAwbxsekznfCygV9FG2jz+zj6MqCUWGZoTSl2iYao4NSWMXbI
 3jMd0Lzy4cFCMptZCqA9K5QrzPRQq+65sLeuRNgxcPjI3zqByopW31dEBU/PA2ZjvHjh
 stzKbtiWhnXeDqh977pXtpZHOjusFBWuSQvICykzi5++xuK6umwEdzeo9ZUscVlL82UM
 buBddmrVhmkAG76Fjj6uvB9rf+wANywSG5TvBe5t8Z7nvv4FvOGQQY4TNb/XQF/6vx4U
 4BCPkvDbc9+sIO7lqBBFybM7i9ONVrs4fJpxuN0K0xrnTGkoFPfx3k18d3zK/0yC4Rai SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30mhq6ayw2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Apr 2020 10:30:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1B2F10002A;
        Thu, 30 Apr 2020 10:30:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 961AF2AD2DD;
        Thu, 30 Apr 2020 10:30:05 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 10:30:04 +0200
Subject: Re: [PATCH v3 1/2] remoteproc: Add remoteproc character device
 interface
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <tsoni@codeaurora.org>,
        <psodagud@codeaurora.org>, <sidgup@codeaurora.org>
References: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
 <1587492618-15896-2-git-send-email-rishabhb@codeaurora.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <d72ead5a-b25a-d4e2-4bbf-1790d2a64fb8@st.com>
Date:   Thu, 30 Apr 2020 10:30:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587492618-15896-2-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-30_03:2020-04-30,2020-04-30 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rishabh,


On 4/21/20 8:10 PM, Rishabh Bhatnagar wrote:
> Add the character device interface into remoteproc framework.
> This interface can be used in order to boot/shutdown remote
> subsystems and provides a basic ioctl based interface to implement
> supplementary functionality. An ioctl call is implemented to enable
> the shutdown on release feature which will allow remote processors to
> be shutdown when the controlling userpsace application crashes or hangs.
> 

Thanks for intruducing Ioctl, this will help for future evolutions.

> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  drivers/remoteproc/Kconfig                         |   9 ++
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/remoteproc_cdev.c               | 143 +++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h           |  21 +++
>  include/linux/remoteproc.h                         |   3 +
>  include/uapi/linux/remoteproc_cdev.h               |  20 +++
>  7 files changed, 198 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_cdev.c
>  create mode 100644 include/uapi/linux/remoteproc_cdev.h
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 2e91370..412b2a0 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -337,6 +337,7 @@ Code  Seq#    Include File                                           Comments
>  0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
>  0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
>  0xB6  all    linux/fpga-dfl.h
> +0xB7  all    uapi/linux/remoteproc_cdev.h			     <mailto:linux-remoteproc@vger.kernel.org>
>  0xC0  00-0F  linux/usb/iowarrior.h
>  0xCA  00-0F  uapi/misc/cxl.h
>  0xCA  10-2F  uapi/misc/ocxl.h
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
> index 0000000..65142ec
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -0,0 +1,143 @@
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
> +#include <uapi/linux/remoteproc_cdev.h>
> +#include <linux/uaccess.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define NUM_RPROC_DEVICES	64
> +static dev_t rproc_major;
> +
> +static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf,
> +				 size_t len, loff_t *pos)
> +{
> +	struct rproc *rproc = container_of(filp->f_inode->i_cdev,
> +					   struct rproc, char_dev);
> +	int ret = 0;
> +	char cmd[10];
> +
> +	if (!len || len > sizeof(cmd))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(cmd, buf, sizeof(cmd));
> +	if (ret)
> +		return -EFAULT;
> +
> +	if (sysfs_streq(cmd, "start")) {
> +		if (rproc->state == RPROC_RUNNING)
> +			return -EBUSY;
> +
> +		ret = rproc_boot(rproc);
> +		if (ret)
> +			dev_err(&rproc->dev, "Boot failed:%d\n", ret);
> +	} else if (sysfs_streq(cmd, "stop")) {
> +		if (rproc->state == RPROC_OFFLINE)
> +			return -ENXIO;

returning ENXIO in this case seems to me no appropriate , what about EPERM or
EINVAL (rproc_sysfs) ?

> +
> +		rproc_shutdown(rproc);
> +	} else {
> +		dev_err(&rproc->dev, "Unrecognized option\n");
> +		ret = -EINVAL;
> +	}
> +
> +	return ret ? ret : len;
> +}
> +
> +static long rproc_device_ioctl(struct file *filp, unsigned int ioctl,
> +				unsigned long arg)
> +{
> +	struct rproc *rproc = container_of(filp->f_inode->i_cdev,
> +					   struct rproc, char_dev);
> +	void __user *argp = (void __user *)arg;
> +	int ret;
> +	bool param;
> +
> +	switch (ioctl) {
> +	case RPROC_SET_SHUTDOWN_ON_RELEASE:
> +		ret = copy_from_user(&param, argp, sizeof(bool));
> +		if (ret) {
> +			dev_err(&rproc->dev, "Data copy from userspace failed\n");
> +			return -EINVAL;
> +		}
> +		rproc->cdev_put_on_release = param;

argp is an void value, where cdev_put_on_release is a bool a check or a conversion  seems
missing

> +		break;
> +	case RPROC_GET_SHUTDOWN_ON_RELEASE:
> +		ret = copy_to_user(argp, &rproc->cdev_put_on_release,
> +				   sizeof(bool));
> +		if (ret) {
> +			dev_err(&rproc->dev, "Data copy to userspace failed\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		dev_err(&rproc->dev, "Unsupported ioctl\n");
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int rproc_cdev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rproc *rproc = container_of(inode->i_cdev, struct rproc,
> +					   char_dev);
> +
> +	if (rproc->cdev_put_on_release && rproc->state != RPROC_OFFLINE)
> +		rproc_shutdown(rproc);
> +
> +	return 0;
> +}
> +
> +
> +static const struct file_operations rproc_fops = {
> +	.write = rproc_cdev_write,
> +	.unlocked_ioctl = rproc_device_ioctl,
> +	.release = rproc_cdev_release,
> +};
> +
> +int rproc_char_device_add(struct rproc *rproc)
> +{
> +	int ret;
> +	dev_t cdevt;
> +
> +	cdev_init(&rproc->char_dev, &rproc_fops);
> +	rproc->char_dev.owner = THIS_MODULE;
> +
> +	cdevt = MKDEV(MAJOR(rproc_major), rproc->index);
> +	ret = cdev_add(&rproc->char_dev, cdevt, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	rproc->dev.devt = cdevt;
> +out:
> +	return ret;
> +}
> +
> +void rproc_char_device_remove(struct rproc *rproc)
> +{
> +	__unregister_chrdev(MAJOR(rproc->dev.devt), rproc->index, 1, "rproc");
> +}
> +
> +void __init rproc_init_cdev(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "rproc");

"remoteproc"instead of "rproc" (in line with sysfs and debugfs naming) .

> +	if (ret < 0)
> +		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
> +}
> +
> +void __exit rproc_exit_cdev(void)
> +{
> +	unregister_chrdev_region(MKDEV(MAJOR(rproc_major), 0),
> +				 NUM_RPROC_DEVICES);
> +}
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 493ef92..fb9d891 100644
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
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad666..9bd2ff5 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -40,6 +40,7 @@
>  #include <linux/virtio.h>
>  #include <linux/completion.h>
>  #include <linux/idr.h>
> +#include <linux/cdev.h>
>  #include <linux/of.h>
>  
>  /**
> @@ -514,6 +515,8 @@ struct rproc {
>  	bool auto_boot;
>  	struct list_head dump_segments;
>  	int nb_vdev;
> +	struct cdev char_dev;
> +	bool cdev_put_on_release;
>  };

These parameters are local variables of rproc_cdev. Could be defined in a separate structure.
with a pointer in rproc to this structure.

>  
>  /**
> diff --git a/include/uapi/linux/remoteproc_cdev.h b/include/uapi/linux/remoteproc_cdev.h
> new file mode 100644
> index 0000000..3975120
> --- /dev/null
> +++ b/include/uapi/linux/remoteproc_cdev.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * IOCTLs for Remoteproc's character device interface.
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +
> +#ifndef _UAPI_REMOTEPROC_CDEV_H_
> +#define _UAPI_REMOTEPROC_CDEV_H_
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define RPROC_MAGIC	0xB7
> +
> +#define RPROC_SET_SHUTDOWN_ON_RELEASE _IOW(RPROC_MAGIC, 1, int)
> +#define RPROC_GET_SHUTDOWN_ON_RELEASE _IOR(RPROC_MAGIC, 2, int)
> +
> +#endif
> 
IOCTLs should probaly be documented.

Thanks,
Arnaud
