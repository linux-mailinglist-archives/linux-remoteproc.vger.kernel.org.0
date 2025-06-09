Return-Path: <linux-remoteproc+bounces-3913-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D7AD221C
	for <lists+linux-remoteproc@lfdr.de>; Mon,  9 Jun 2025 17:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CF957A2057
	for <lists+linux-remoteproc@lfdr.de>; Mon,  9 Jun 2025 15:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0966D204C0C;
	Mon,  9 Jun 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ptEdEcuB"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAC19F42C
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Jun 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482155; cv=none; b=aNChhcgraxIEdP671LFkGMH/TAi5GKbhbC9t32ENACv2OcM8xdnINfamwtywWzpWgIGOGB00Lz1vFaHRR3R8Pp8WGoYubP6TBs04EFsDmvJywAxn1Tjzvz0JNkh/Odj4UUxxbAJz1O9kq+1TDJSTtpv0YWhB2AKYVvzRTrNrB/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482155; c=relaxed/simple;
	bh=6KmN6eehOW6aWMqhbhImjl2sz5uIOMYwJhHZArcANy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+rrJzZrGPtbkxJdmcDGTM0ZBoBvr7R0TTYz80VCnDhvVDSbUcbp5d+Y9nzQheo9yOHMewz9XZq6NNK3/xIxIIdYRrCQoDvq7d1uYYZOi8kl/HjIcT2bEUcvImhn1eeUUlJ1Rll8occsmLwlWM17qPpL3gQwbLhnxtxD8fgRspg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ptEdEcuB; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749482151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kuCNha6dzvGJqC3ijxAL4Vk5/nn29zCQUbjRHyj5jI=;
	b=ptEdEcuBavUnTtsnFglESu8sdGQhYaDVWAy8BNufnUaG8sy59F9UZuXC25B1hRDeiERR//
	tIcfcwjfJLWP2sgi2lsk+RI1EUg7mvcJhYTFv/HVQpX5Q7Spo1EvezplC93DfL+wpt9MNw
	5l0PVHXWSqcms7d7XJYvk795CphIh4A=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v4 1/3] rpmsg: char: Reuse eptdev logic for anonymous device
Date: Mon,  9 Jun 2025 23:15:29 +0800
Message-Id: <20250609151531.22621-2-dawei.li@linux.dev>
In-Reply-To: <20250609151531.22621-1-dawei.li@linux.dev>
References: <20250609151531.22621-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Current uAPI implementation for rpmsg ctrl & char device manipulation is
abstracted in procedures below:
- fd = open("/dev/rpmsg_ctrlX")
- ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
  generated.
- fd_ep = open("/dev/rpmsgY", O_RDWR)
- operations on fd_ep(write, read, poll ioctl)
- ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
- close(fd_ep)
- close(fd)

This /dev/rpmsgY abstraction is less favorable for:
- Performance issue: It's time consuming for some operations are involved:
  - Device node creation.
    Depends on specific config, especially CONFIG_DEVTMPFS, the overall
    overhead is based on coordination between DEVTMPFS and userspace
    tools such as udev and mdev.

  - Extra kernel-space switch cost.

  - Other major costs brought by heavy-weight logic like device_add().

- /dev/rpmsgY node can be opened only once. It doesn't make much sense
    that a dynamically created device node can be opened only once.

- For some container application such as docker, a client can't access
  host's device node unless specified explicitly. But in case of
  /dev/rpmsgY, which is generated dynamically and whose existence is
  unknown for clients in advance, this uAPI based on device node doesn't
  fit well.

An anonymous inode based approach is introduced to address the issues above.
Rather than generating device node and opening it, rpmsg code just creates
an anonymous inode representing eptdev and return the fd to userspace.

The legacy abstraction based on struct dev and struct cdev is honored
for:
- Avoid legacy uAPI break(RPMSG_CREATE_EPT_IOCTL)
- Reuse existing logic:
  -- dev_err() and friends.
  -- Life cycle management of struct device.

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 80 ++++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index eec7642d2686..6c19f2146698 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -91,7 +91,8 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 	/* wake up any blocked readers */
 	wake_up_interruptible(&eptdev->readq);
 
-	cdev_device_del(&eptdev->cdev, &eptdev->dev);
+	if (eptdev->dev.devt)
+		cdev_device_del(&eptdev->cdev, &eptdev->dev);
 	put_device(&eptdev->dev);
 
 	return 0;
@@ -132,21 +133,17 @@ static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable
 	return 0;
 }
 
-static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
+static int __rpmsg_eptdev_open(struct rpmsg_eptdev *eptdev)
 {
-	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
 	struct rpmsg_endpoint *ept;
 	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
 
-	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		mutex_unlock(&eptdev->ept_lock);
 		return -EBUSY;
 	}
 
 	if (!eptdev->rpdev) {
-		mutex_unlock(&eptdev->ept_lock);
 		return -ENETRESET;
 	}
 
@@ -164,21 +161,32 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	if (!ept) {
 		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
 		put_device(dev);
-		mutex_unlock(&eptdev->ept_lock);
 		return -EINVAL;
 	}
 
 	ept->flow_cb = rpmsg_ept_flow_cb;
 	eptdev->ept = ept;
-	filp->private_data = eptdev;
-	mutex_unlock(&eptdev->ept_lock);
 
 	return 0;
 }
 
-static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
+static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
+	int ret;
+
+	mutex_lock(&eptdev->ept_lock);
+	ret = __rpmsg_eptdev_open(eptdev);
+	if (!ret)
+		filp->private_data = eptdev;
+	mutex_unlock(&eptdev->ept_lock);
+
+	return ret;
+}
+
+static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_eptdev *eptdev = filp->private_data;
 	struct device *dev = &eptdev->dev;
 
 	/* Close the endpoint, if it's not already destroyed by the parent */
@@ -400,12 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
 	ida_free(&rpmsg_ept_ida, dev->id);
-	ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
+	if (eptdev->dev.devt)
+		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
 	kfree(eptdev);
 }
 
-static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
-						      struct device *parent)
+static struct rpmsg_eptdev *rpmsg_eptdev_alloc(struct rpmsg_device *rpdev,
+					       struct device *parent, bool cdev)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
@@ -428,33 +437,50 @@ static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
 
-	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
-	eptdev->cdev.owner = THIS_MODULE;
+	if (cdev) {
+		cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
+		eptdev->cdev.owner = THIS_MODULE;
+	}
 
 	return eptdev;
 }
 
-static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
+static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
+						      struct device *parent)
+{
+	return rpmsg_eptdev_alloc(rpdev, parent, true);
+}
+
+static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
+			    struct rpmsg_channel_info chinfo, bool cdev)
 {
 	struct device *dev = &eptdev->dev;
 	int ret;
 
 	eptdev->chinfo = chinfo;
 
-	ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
-	if (ret < 0)
-		goto free_eptdev;
-	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+	if (cdev) {
+		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
+		if (ret < 0)
+			goto free_eptdev;
 
+		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+	}
+
+	/* Anonymous inode device still need device name for dev_err() and friends */
 	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
 	dev_set_name(dev, "rpmsg%d", ret);
 
-	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
-	if (ret)
-		goto free_ept_ida;
+	ret = 0;
+
+	if (cdev) {
+		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
+		if (ret)
+			goto free_ept_ida;
+	}
 
 	/* We can now rely on the release function for cleanup */
 	dev->release = rpmsg_eptdev_release_device;
@@ -464,7 +490,8 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
 free_ept_ida:
 	ida_free(&rpmsg_ept_ida, dev->id);
 free_minor_ida:
-	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
+	if (cdev)
+		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_eptdev:
 	put_device(dev);
 	kfree(eptdev);
@@ -472,6 +499,11 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
 	return ret;
 }
 
+static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
+{
+	return rpmsg_eptdev_add(eptdev, chinfo, true);
+}
+
 int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
 			       struct rpmsg_channel_info chinfo)
 {
-- 
2.25.1


