Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6333C5C67
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Jul 2021 14:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbhGLMkw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 12 Jul 2021 08:40:52 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10910 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233878AbhGLMku (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 08:40:50 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CCXTHd000711;
        Mon, 12 Jul 2021 14:38:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=+X54rusOLAVjSlZi7gsxmvV/XtscYd6e+FwjiJthqh8=;
 b=3VcPOHaP3HUZeRT5oOlkPRBh+hpKgv8yPaAKx8qKZh0/joDYQCe6WD0lWiBiK4lsb722
 +GY2PHlMbGI2YEJB56HGFRO67LAJfmOyCOR3HFznm1XliRcyYcGotNW3QLysgWwbpPXA
 Hte6iB71XeAeJi2aK24hhsTGKHhER2QOdlDuqy8FS4C21vRslyVIq4w4jnYuvTL95eVB
 hMaygtuhkkfnT5b0YB+b7fzjLeMHjobTp6Er4kjeTRBX1cHz/4BjRnr1S2fUcc1lvuqn
 GHd2Nm4u8IBXZww8r8OAjacLoVibEMXC9CoFdeuluSwHp3PWmkxe79c/99Qio4fNU9WK Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rh6w9nqn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 14:38:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFCA110002A;
        Mon, 12 Jul 2021 14:37:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C30342248B0;
        Mon, 12 Jul 2021 14:37:59 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 14:37:59
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 3/4] rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
Date:   Mon, 12 Jul 2021 14:37:51 +0200
Message-ID: <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_07:2021-07-12,2021-07-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Create the rpmsg_ctrl.c module and move the code related to the
rpmsg_ctrldev device in this new module.

Add the dependency between rpmsg_char and rpmsg_ctrl in the
kconfig file.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/Kconfig      |   9 ++
 drivers/rpmsg/Makefile     |   1 +
 drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
 drivers/rpmsg/rpmsg_char.h |   2 +
 drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
 5 files changed, 229 insertions(+), 168 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf13..d822ec9ec692 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -10,11 +10,20 @@ config RPMSG_CHAR
 	tristate "RPMSG device interface"
 	depends on RPMSG
 	depends on NET
+	select RPMSG_CTRL
 	help
 	  Say Y here to export rpmsg endpoints as device files, usually found
 	  in /dev. They make it possible for user-space programs to send and
 	  receive rpmsg packets.
 
+config RPMSG_CTRL
+	tristate "RPMSG control interface"
+	depends on RPMSG
+	help
+	  Say Y here to enable the support of the /dev/rpmsg_ctrlX API. This API
+	  allows user-space programs to create endpoints with specific service name,
+	  source and destination addresses.
+
 config RPMSG_NS
 	tristate "RPMSG name service announcement"
 	depends on RPMSG
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..58e3b382e316 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
 obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 941c5c54dd72..fbe10d527c5c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -25,33 +25,15 @@
 
 #include "rpmsg_char.h"
 
-#define RPMSG_DEV_MAX	(MINORMASK + 1)
-
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
-static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
 static DEFINE_IDA(rpmsg_minor_ida);
 
 #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
 #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
 
-#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
-#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
-
-/**
- * struct rpmsg_ctrldev - control device for instantiating endpoint devices
- * @rpdev:	underlaying rpmsg device
- * @cdev:	cdev for the ctrl device
- * @dev:	device for the ctrl device
- */
-struct rpmsg_ctrldev {
-	struct rpmsg_device *rpdev;
-	struct cdev cdev;
-	struct device dev;
-};
-
 /**
  * struct rpmsg_eptdev - endpoint device context
  * @dev:	endpoint device
@@ -408,151 +390,11 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
-static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	get_device(&ctrldev->dev);
-	filp->private_data = ctrldev;
-
-	return 0;
-}
-
-static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	put_device(&ctrldev->dev);
-
-	return 0;
-}
-
-static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
-				unsigned long arg)
-{
-	struct rpmsg_ctrldev *ctrldev = fp->private_data;
-	void __user *argp = (void __user *)arg;
-	struct rpmsg_endpoint_info eptinfo;
-	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
-
-	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
-		return -EFAULT;
-
-	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
-	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
-	chinfo.src = eptinfo.src;
-	chinfo.dst = eptinfo.dst;
-
-	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
-};
-
-static const struct file_operations rpmsg_ctrldev_fops = {
-	.owner = THIS_MODULE,
-	.open = rpmsg_ctrldev_open,
-	.release = rpmsg_ctrldev_release,
-	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
-	.compat_ioctl = compat_ptr_ioctl,
-};
-
-static void rpmsg_ctrldev_release_device(struct device *dev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
-
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-	cdev_del(&ctrldev->cdev);
-	kfree(ctrldev);
-}
-
-static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev;
-	struct device *dev;
-	int ret;
-
-	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
-	if (!ctrldev)
-		return -ENOMEM;
-
-	ctrldev->rpdev = rpdev;
-
-	dev = &ctrldev->dev;
-	device_initialize(dev);
-	dev->parent = &rpdev->dev;
-	dev->class = rpmsg_class;
-
-	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
-	ctrldev->cdev.owner = THIS_MODULE;
-
-	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
-	if (ret < 0)
-		goto free_ctrldev;
-	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
-
-	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
-	if (ret < 0)
-		goto free_minor_ida;
-	dev->id = ret;
-	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
-
-	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
-	if (ret)
-		goto free_ctrl_ida;
-
-	/* We can now rely on the release function for cleanup */
-	dev->release = rpmsg_ctrldev_release_device;
-
-	ret = device_add(dev);
-	if (ret) {
-		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
-		put_device(dev);
-	}
-
-	dev_set_drvdata(&rpdev->dev, ctrldev);
-
-	return ret;
-
-free_ctrl_ida:
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-free_minor_ida:
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-free_ctrldev:
-	put_device(dev);
-	kfree(ctrldev);
-
-	return ret;
-}
-
-static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
-	int ret;
-
-	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
-	if (ret)
-		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
-
-	device_del(&ctrldev->dev);
-	put_device(&ctrldev->dev);
-}
-
-static struct rpmsg_driver rpmsg_chrdev_driver = {
-	.probe = rpmsg_chrdev_probe,
-	.remove = rpmsg_chrdev_remove,
-	.drv = {
-		.name = "rpmsg_chrdev",
-	},
-};
-
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
-	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
 	if (ret < 0) {
 		pr_err("rpmsg: failed to allocate char dev region\n");
 		return ret;
@@ -565,20 +407,12 @@ static int rpmsg_chrdev_init(void)
 		return PTR_ERR(rpmsg_class);
 	}
 
-	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
-	if (ret < 0) {
-		pr_err("rpmsgchr: failed to register rpmsg driver\n");
-		class_destroy(rpmsg_class);
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-	}
-
-	return ret;
+	return 0;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
-	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
index 22573b60e008..c328eb250b87 100644
--- a/drivers/rpmsg/rpmsg_char.h
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -6,6 +6,8 @@
 #ifndef __RPMSG_CHRDEV_H__
 #define __RPMSG_CHRDEV_H__
 
+#define RPMSG_DEV_MAX	(MINORMASK + 1)
+
 #if IS_REACHABLE(CONFIG_RPMSG_CHAR)
 /**
  * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
new file mode 100644
index 000000000000..87a1746367eb
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021, STMicroelectronics
+ * Copyright (c) 2016, Linaro Ltd.
+ * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
+ * Copyright (c) 2012, PetaLogix
+ * Copyright (c) 2011, Texas Instruments, Inc.
+ * Copyright (c) 2011, Google, Inc.
+ *
+ * Based on rpmsg performance statistics driver by Michal Simek, which in turn
+ * was based on TI & Google OMX rpmsg driver.
+ */
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/rpmsg.h>
+
+#include "rpmsg_char.h"
+
+static dev_t rpmsg_major;
+
+static DEFINE_IDA(rpmsg_ctrl_ida);
+static DEFINE_IDA(rpmsg_minor_ida);
+
+#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
+#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
+
+/**
+ * struct rpmsg_ctrldev - control device for instantiating endpoint devices
+ * @rpdev:	underlaying rpmsg device
+ * @cdev:	cdev for the ctrl device
+ * @dev:	device for the ctrl device
+ */
+struct rpmsg_ctrldev {
+	struct rpmsg_device *rpdev;
+	struct cdev cdev;
+	struct device dev;
+};
+
+static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	get_device(&ctrldev->dev);
+	filp->private_data = ctrldev;
+
+	return 0;
+}
+
+static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	put_device(&ctrldev->dev);
+
+	return 0;
+}
+
+static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
+				unsigned long arg)
+{
+	struct rpmsg_ctrldev *ctrldev = fp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct rpmsg_endpoint_info eptinfo;
+	struct rpmsg_channel_info chinfo;
+
+	if (cmd != RPMSG_CREATE_EPT_IOCTL)
+		return -EINVAL;
+
+	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
+		return -EFAULT;
+
+	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
+	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
+	chinfo.src = eptinfo.src;
+	chinfo.dst = eptinfo.dst;
+
+	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
+};
+
+static const struct file_operations rpmsg_ctrldev_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_ctrldev_open,
+	.release = rpmsg_ctrldev_release,
+	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+static void rpmsg_ctrldev_release_device(struct device *dev)
+{
+	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
+
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	cdev_del(&ctrldev->cdev);
+	kfree(ctrldev);
+}
+
+static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrldev *ctrldev;
+	struct device *dev;
+	int ret;
+
+	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
+	if (!ctrldev)
+		return -ENOMEM;
+
+	ctrldev->rpdev = rpdev;
+
+	dev = &ctrldev->dev;
+	device_initialize(dev);
+	dev->parent = &rpdev->dev;
+
+	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
+	ctrldev->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		goto free_ctrldev;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_minor_ida;
+	dev->id = ret;
+	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+
+	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
+	if (ret)
+		goto free_ctrl_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_ctrldev_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
+		put_device(dev);
+	}
+
+	dev_set_drvdata(&rpdev->dev, ctrldev);
+
+	return ret;
+
+free_ctrl_ida:
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+free_ctrldev:
+	put_device(dev);
+	kfree(ctrldev);
+
+	return ret;
+}
+
+static void rpmsg_ctrldev_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
+	int ret;
+
+	/* Destroy all endpoints */
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
+
+	device_del(&ctrldev->dev);
+	put_device(&ctrldev->dev);
+}
+
+static struct rpmsg_driver rpmsg_ctrldev_driver = {
+	.probe = rpmsg_ctrldev_probe,
+	.remove = rpmsg_ctrldev_remove,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
+static int rpmsg_ctrldev_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
+	if (ret < 0) {
+		pr_err("rpmsg: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
+
+	return ret;
+}
+postcore_initcall(rpmsg_ctrldev_init);
+
+static void rpmsg_ctrldev_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+}
+module_exit(rpmsg_ctrldev_exit);
+
+MODULE_DESCRIPTION("rpmsg control interface");
+MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

