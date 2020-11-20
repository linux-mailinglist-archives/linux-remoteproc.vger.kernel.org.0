Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BC32BB88C
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Nov 2020 22:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgKTVm4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 20 Nov 2020 16:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728596AbgKTVmz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 16:42:55 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709E0C061A04
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:55 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id m9so8447254pgb.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=63rMQGgTveQJcbvHL2mx/Fk9RBk50g78bSEyxHKSZcQ=;
        b=UtkdwYVxWYYem2V8rU+RzKN2jmDFckKfsKlrokcoVTlCJUrDNLUGOZiUriZpQoqpOo
         LgLP9zifdEj0igh2atnYeeBjK8Rsa29VYVwCKVgB/G4EyOWnIWhUUdvsx+ntC1PmVUGW
         Hzs5qyBMFfw0obxXBEtNjoTvPRtabygbEE0c+Cskil6u/b/MsRp7vVvGRCYA72vxk4uq
         GtA/8qNzaootwNSNa+grkaThW5fdg1p4eF86hKnj0TcS7NUeoFDyVpZyCofG9qs3yqqA
         cY/vpDfL2pgf3JvjyzedpYeIke5O0JkufUJcuSekJL2xkAhfzb9PJxT6awk1Vtws3X4/
         FJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63rMQGgTveQJcbvHL2mx/Fk9RBk50g78bSEyxHKSZcQ=;
        b=PdxOU3ma1DXiKfMpeINtnK+1Z2bAG8FoyGtzfMzczBWM3MpP9QafRWfHhdmdMXLg4V
         QKFSHoX1yF7LaCKBJt/s3o/EBrTvcOLGcZBldxUSux44nFViO8vUXNqeqGBQELkE+Nub
         f9hwBMAtumPkvYQE73U7jFy2jL54AIW23SzK9H46jCqxXUYOlX24bINR3RFCZBTsZIeV
         r9uLf8KC3A3HC0cI/PzBIrmZd49gZnnEqwSNZqQg7aIcMIsteo2gIci1pa71fTOXineJ
         Q9wk3ftJmQXfL6VHB5IGiNUb3FvP+clJiADg0CDoEAOiTbuExe9VpIQhcWiOFOEZOqAU
         zm+Q==
X-Gm-Message-State: AOAM533t7UtFqGrgZ/F7GnFszVq/j3iNYycAGQwiRkuKMDyZNauk8gTT
        aOlQU5vTXBimOY5j023jYvjaksjTwPYotA==
X-Google-Smtp-Source: ABdhPJyFOF0cow3f1y89onw/qO+L9XkPq1jkEvE/Hh0l/fGHzBbq28gHIgejUhm6fVt8+gs6ApO2eg==
X-Received: by 2002:a17:90b:30d0:: with SMTP id hi16mr12164670pjb.144.1605908574903;
        Fri, 20 Nov 2020 13:42:54 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm4713197pfj.157.2020.11.20.13.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 13:42:54 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/8] rpmsg: Turn name service into a stand alone driver
Date:   Fri, 20 Nov 2020 14:42:45 -0700
Message-Id: <20201120214245.172963-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120214245.172963-1-mathieu.poirier@linaro.org>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Make the RPMSG name service announcement a stand alone driver so that it
can be reused by other subsystems.  It is also the first step in making the
functionatlity transport independent, i.e that is not tied to virtIO.

Co-developed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Co-developed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/Kconfig            |   9 +++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c |  87 +++++----------------
 include/linux/rpmsg/ns.h         |   3 +
 5 files changed, 159 insertions(+), 67 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index f96716893c2a..0b4407abdf13 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -15,6 +15,14 @@ config RPMSG_CHAR
 	  in /dev. They make it possible for user-space programs to send and
 	  receive rpmsg packets.
 
+config RPMSG_NS
+	tristate "RPMSG name service announcement"
+	depends on RPMSG
+	help
+	  Say Y here to enable the support of the name service announcement
+	  channel that probes the associated RPMsg device on remote endpoint
+	  service announcement.
+
 config RPMSG_MTK_SCP
 	tristate "MediaTek SCP"
 	depends on MTK_SCP
@@ -62,6 +70,7 @@ config RPMSG_VIRTIO
 	tristate "Virtio RPMSG bus driver"
 	depends on HAS_DMA
 	select RPMSG
+	select RPMSG_NS
 	select VIRTIO
 
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index ffe932ef6050..8d452656f0ee 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
new file mode 100644
index 000000000000..762ff1ae279f
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+ */
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/ns.h>
+#include <linux/slab.h>
+
+#include "rpmsg_internal.h"
+
+/**
+ * rpmsg_ns_register_device() - register name service device based on rpdev
+ * @rpdev: prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * basis for the rpmsg name service device.
+ */
+int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
+{
+	strcpy(rpdev->id.name, "rpmsg_ns");
+	rpdev->driver_override = "rpmsg_ns";
+	rpdev->src = RPMSG_NS_ADDR;
+	rpdev->dst = RPMSG_NS_ADDR;
+
+	return rpmsg_register_device(rpdev);
+}
+EXPORT_SYMBOL(rpmsg_ns_register_device);
+
+/* invoked when a name service announcement arrives */
+static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
+		       void *priv, u32 src)
+{
+	struct rpmsg_ns_msg *msg = data;
+	struct rpmsg_device *newch;
+	struct rpmsg_channel_info chinfo;
+	struct device *dev = rpdev->dev.parent;
+	int ret;
+
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
+			 data, len, true);
+#endif
+
+	if (len != sizeof(*msg)) {
+		dev_err(dev, "malformed ns msg (%d)\n", len);
+		return -EINVAL;
+	}
+
+	/* don't trust the remote processor for null terminating the name */
+	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
+
+	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
+	chinfo.src = RPMSG_ADDR_ANY;
+	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
+
+	dev_info(dev, "%sing channel %s addr 0x%x\n",
+		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
+		 "destroy" : "creat", msg->name, chinfo.dst);
+
+	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
+		ret = rpmsg_release_channel(rpdev, &chinfo);
+		if (ret)
+			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
+	} else {
+		newch = rpmsg_create_channel(rpdev, &chinfo);
+		if (!newch)
+			dev_err(dev, "rpmsg_create_channel failed\n");
+	}
+
+	return 0;
+}
+
+static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_endpoint *ns_ept;
+	struct rpmsg_channel_info ns_chinfo = {
+		.src = RPMSG_NS_ADDR,
+		.dst = RPMSG_NS_ADDR,
+		.name = "name_service",
+	};
+
+	/*
+	 * Create the NS announcement service endpoint associated to the RPMsg
+	 * device. The endpoint will be automatically destroyed when the RPMsg
+	 * device will be deleted.
+	 */
+	ns_ept = rpmsg_create_ept(rpdev, rpmsg_ns_cb, NULL, ns_chinfo);
+	if (!ns_ept) {
+		dev_err(&rpdev->dev, "failed to create the ns ept\n");
+		return -ENOMEM;
+	}
+	rpdev->ept = ns_ept;
+
+	return 0;
+}
+
+static struct rpmsg_driver rpmsg_ns_driver = {
+	.drv.name = KBUILD_MODNAME,
+	.probe = rpmsg_ns_probe,
+};
+
+static int rpmsg_ns_init(void)
+{
+	int ret;
+
+	ret = register_rpmsg_driver(&rpmsg_ns_driver);
+	if (ret < 0)
+		pr_err("%s: Failed to register rpmsg driver\n", __func__);
+
+	return ret;
+}
+postcore_initcall(rpmsg_ns_init);
+
+static void rpmsg_ns_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_ns_driver);
+}
+module_exit(rpmsg_ns_exit);
+
+MODULE_DESCRIPTION("Name service announcement rpmsg driver");
+MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
+MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 6ec299f7f790..e87d4cf926eb 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -49,7 +49,6 @@
  * @endpoints_lock: lock of the endpoints set
  * @sendq:	wait queue of sending contexts waiting for a tx buffers
  * @sleepers:	number of senders that are waiting for a tx buffer
- * @ns_ept:	the bus's name service endpoint
  *
  * This structure stores the rpmsg state of a given virtio remote processor
  * device (there might be several virtio proc devices for each physical
@@ -68,7 +67,6 @@ struct virtproc_info {
 	struct mutex endpoints_lock;
 	wait_queue_head_t sendq;
 	atomic_t sleepers;
-	struct rpmsg_endpoint *ns_ept;
 };
 
 /* The feature bitmap for virtio rpmsg */
@@ -815,69 +813,14 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
 	wake_up_interruptible(&vrp->sendq);
 }
 
-/* invoked when a name service announcement arrives */
-static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
-		       void *priv, u32 src)
-{
-	struct rpmsg_ns_msg *msg = data;
-	struct rpmsg_device *newch;
-	struct rpmsg_channel_info chinfo;
-	struct virtproc_info *vrp = priv;
-	struct device *dev = &vrp->vdev->dev;
-	bool little_endian = virtio_is_little_endian(vrp->vdev);
-	int ret;
-
-#if defined(CONFIG_DYNAMIC_DEBUG)
-	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
-			 data, len, true);
-#endif
-
-	if (len != sizeof(*msg)) {
-		dev_err(dev, "malformed ns msg (%d)\n", len);
-		return -EINVAL;
-	}
-
-	/*
-	 * the name service ept does _not_ belong to a real rpmsg channel,
-	 * and is handled by the rpmsg bus itself.
-	 * for sanity reasons, make sure a valid rpdev has _not_ sneaked
-	 * in somehow.
-	 */
-	if (rpdev) {
-		dev_err(dev, "anomaly: ns ept has an rpdev handle\n");
-		return -EINVAL;
-	}
-
-	/* don't trust the remote processor for null terminating the name */
-	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
-
-	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
-	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = __rpmsg32_to_cpu(little_endian, msg->addr);
-
-	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 __rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY ?
-		 "destroy" : "creat", msg->name, chinfo.dst);
-
-	if (__rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY) {
-		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
-		if (ret)
-			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-	} else {
-		newch = __rpmsg_create_channel(vrp, &chinfo);
-		if (!newch)
-			dev_err(dev, "rpmsg_create_channel failed\n");
-	}
-
-	return 0;
-}
-
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
 	static const char * const names[] = { "input", "output" };
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
+	struct virtio_rpmsg_channel *vch;
+	struct rpmsg_device *rpdev_ns;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -953,14 +896,26 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	/* if supported by the remote processor, enable the name service */
 	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
-		/* a dedicated endpoint handles the name service msgs */
-		vrp->ns_ept = __rpmsg_create_ept(vrp, NULL, rpmsg_ns_cb,
-						vrp, RPMSG_NS_ADDR);
-		if (!vrp->ns_ept) {
-			dev_err(&vdev->dev, "failed to create the ns ept\n");
+		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
+		if (!vch) {
 			err = -ENOMEM;
 			goto free_coherent;
 		}
+
+		/* Link the channel to our vrp */
+		vch->vrp = vrp;
+
+		/* Assign public information to the rpmsg_device */
+		rpdev_ns = &vch->rpdev;
+		rpdev_ns->ops = &virtio_rpmsg_ops;
+		rpdev_ns->little_endian = virtio_is_little_endian(vrp->vdev);
+
+		rpdev_ns->dev.parent = &vrp->vdev->dev;
+		rpdev_ns->dev.release = virtio_rpmsg_release_device;
+
+		err = rpmsg_ns_register_device(rpdev_ns);
+		if (err)
+			goto free_coherent;
 	}
 
 	/*
@@ -985,6 +940,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	return 0;
 
 free_coherent:
+	kfree(vch);
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
@@ -1013,9 +969,6 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	if (ret)
 		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
 
-	if (vrp->ns_ept)
-		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
-
 	idr_destroy(&vrp->endpoints);
 
 	vdev->config->del_vqs(vrp->vdev);
diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
index 73ecc91dc26f..a7804edd6d58 100644
--- a/include/linux/rpmsg/ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -4,6 +4,7 @@
 #define _LINUX_RPMSG_NS_H
 
 #include <linux/mod_devicetable.h>
+#include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/types.h>
 
@@ -39,4 +40,6 @@ enum rpmsg_ns_flags {
 /* Address 53 is reserved for advertising remote services */
 #define RPMSG_NS_ADDR			(53)
 
+int rpmsg_ns_register_device(struct rpmsg_device *rpdev);
+
 #endif
-- 
2.25.1

