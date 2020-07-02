Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFAB211E6B
	for <lists+linux-remoteproc@lfdr.de>; Thu,  2 Jul 2020 10:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgGBIYS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 2 Jul 2020 04:24:18 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55488 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbgGBIYN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Jul 2020 04:24:13 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0628Ni8l042491;
        Thu, 2 Jul 2020 03:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593678224;
        bh=BfOZr+xGOsPGiy8RO9cNV8MqKJURhNwgLuqcM2C41xI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dB1wF8myW4K6PFl4X6Fp9lnd6sEshzIz4rwrrXqOfcQgLTxCi2rTbf5VGlHypGs3L
         MCCeL7VqngSsw7+LPl2cWwD9C894EuMxplgAdS2z15O6ZjEJOCaccndOHpgGxjUitt
         BlcB+FRMEsaTD/M9MBmtJvRhEK9Dqr9XB6/8hxo0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0628NiT6032240
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jul 2020 03:23:44 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 2 Jul
 2020 03:23:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 2 Jul 2020 03:23:43 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0628LiYW006145;
        Thu, 2 Jul 2020 03:23:38 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-ntb@googlegroups.com>,
        <linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <netdev@vger.kernel.org>
Subject: [RFC PATCH 20/22] NTB: Add a new NTB client driver to implement VIRTIO functionality
Date:   Thu, 2 Jul 2020 13:51:41 +0530
Message-ID: <20200702082143.25259-21-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702082143.25259-1-kishon@ti.com>
References: <20200702082143.25259-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new NTB client driver to implement VIRTIO functionality. When two
hosts are connected using NTB, one of the hosts should run NTB client
driver that implements VIRTIO functionality and the other host should
run NTB client implements VHOST functionality. This interfaces with
VIRTIO layer so that any virtio client driver can exchange data with
the remote vhost client driver.

Since each NTB host can only expose fewer contiguous memory range to
the remote NTB host (number of memory windows supported), reserve
contiguous memory range using dma_alloc_coherent() and then manage
this area using gen_pool for providing buffers to the virtio client
driver. The virtio client driver should only provide this buffer
region to the remote vhost driver.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/ntb/Kconfig      |   9 +
 drivers/ntb/Makefile     |   1 +
 drivers/ntb/ntb_virtio.c | 853 +++++++++++++++++++++++++++++++++++++++
 drivers/ntb/ntb_virtio.h |  56 +++
 4 files changed, 919 insertions(+)
 create mode 100644 drivers/ntb/ntb_virtio.c
 create mode 100644 drivers/ntb/ntb_virtio.h

diff --git a/drivers/ntb/Kconfig b/drivers/ntb/Kconfig
index df16c755b4da..e171b3256f68 100644
--- a/drivers/ntb/Kconfig
+++ b/drivers/ntb/Kconfig
@@ -37,4 +37,13 @@ config NTB_TRANSPORT
 
 	 If unsure, say N.
 
+config NTB_VIRTIO
+	tristate "NTB VIRTIO"
+	help
+	 The NTB virtio driver sits between the NTB HW driver and the virtio
+	 client driver and lets the virtio client driver to exchange data with
+	 the remote vhost driver over the NTB hardware.
+
+	 If unsure, say N.
+
 endif # NTB
diff --git a/drivers/ntb/Makefile b/drivers/ntb/Makefile
index 3a6fa181ff99..d37ab488bcbc 100644
--- a/drivers/ntb/Makefile
+++ b/drivers/ntb/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_NTB) += ntb.o hw/ test/
 obj-$(CONFIG_NTB_TRANSPORT) += ntb_transport.o
+obj-$(CONFIG_NTB_VIRTIO) += ntb_virtio.o
 
 ntb-y			:= core.o
 ntb-$(CONFIG_NTB_MSI)	+= msi.o
diff --git a/drivers/ntb/ntb_virtio.c b/drivers/ntb/ntb_virtio.c
new file mode 100644
index 000000000000..10fbe189ab8b
--- /dev/null
+++ b/drivers/ntb/ntb_virtio.c
@@ -0,0 +1,853 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * NTB Client Driver to implement VIRTIO functionality
+ *
+ * Copyright (C) 2020 Texas Instruments
+ * Author: Kishon Vijay Abraham I <kishon@ti.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/genalloc.h>
+#include <linux/module.h>
+#include <linux/ntb.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_pci.h>
+#include <linux/virtio_ring.h>
+#include <linux/vringh.h>
+
+#include "ntb_virtio.h"
+
+#define BUFFER_OFFSET		0x20000
+
+struct ntb_virtio_queue {
+	struct delayed_work db_handler;
+	struct virtqueue *vq;
+};
+
+struct ntb_virtio {
+	struct ntb_virtio_queue vqueue[MAX_VQS];
+	struct work_struct link_cleanup;
+	struct delayed_work link_work;
+	struct virtio_device vdev;
+	struct gen_pool *gen_pool;
+	dma_addr_t mw_phys_addr;
+	struct virtqueue **vqs;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	/* mutex to protect sending commands to ntb vhost */
+	struct mutex lock;
+	void *mw_addr;
+	u64 mw_size;
+};
+
+#define to_ntb_virtio(v) container_of((v), struct ntb_virtio, vdev)
+
+/* ntb_virtio_send_command - Send commands to the remote NTB vhost device
+ * @ntb: NTB virtio device that communicates with the remote vhost device
+ * @command: The command that has to be sent to the remote vhost device
+ *
+ * Helper function to send commands to the remote NTB vhost device.
+ */
+static int ntb_virtio_send_command(struct ntb_virtio *ntb, u32 command)
+{
+	struct ntb_dev *ndev;
+	ktime_t timeout;
+	bool timedout;
+	int ret = 0;
+	u8 status;
+
+	ndev = ntb->ndev;
+
+	mutex_lock(&ntb->lock);
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VHOST_COMMAND, command);
+	timeout = ktime_add_ms(ktime_get(), COMMAND_TIMEOUT);
+	while (1) {
+		timedout = ktime_after(ktime_get(), timeout);
+		status = ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX,
+					    VHOST_COMMAND_STATUS);
+		if (status == HOST_CMD_STATUS_ERROR) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (status == HOST_CMD_STATUS_OKAY)
+			break;
+
+		if (WARN_ON(timedout)) {
+			ret = -ETIMEDOUT;
+			break;
+		}
+
+		usleep_range(5, 10);
+	}
+
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VHOST_COMMAND_STATUS,
+			    HOST_CMD_STATUS_NONE);
+	mutex_unlock(&ntb->lock);
+
+	return ret;
+}
+
+/* ntb_virtio_get_features - virtio_config_ops to get vhost device features
+ * @vdev: Virtio device that communicates with remove vhost device
+ *
+ * virtio_config_ops to get vhost device features. The remote vhost device
+ * populates the vhost device features in scratchpad register.
+ */
+static u64 ntb_virtio_get_features(struct virtio_device *vdev)
+{
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	u64 val;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+
+	val = ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX, VHOST_FEATURES_UPPER);
+	val <<= 32;
+	val |= ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX, VHOST_FEATURES_LOWER);
+
+	return val;
+}
+
+/* ntb_virtio_finalize_features - virtio_config_ops to finalize features with
+ *   remote vhost device
+ * @vdev: Virtio device that communicates with remove vhost device
+ *
+ * Indicate the negotiated features to the remote vhost device by sending
+ * HOST_CMD_FINALIZE_FEATURES command.
+ */
+static int ntb_virtio_finalize_features(struct virtio_device *vdev)
+{
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	int ret;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	/* Give virtio_ring a chance to accept features. */
+	vring_transport_features(vdev);
+
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VIRTIO_FEATURES_LOWER,
+			    lower_32_bits(vdev->features));
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VIRTIO_FEATURES_UPPER,
+			    upper_32_bits(vdev->features));
+
+	ret = ntb_virtio_send_command(ntb, HOST_CMD_FINALIZE_FEATURES);
+	if (ret) {
+		dev_err(dev, "Failed to set configuration event vector\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* ntb_virtio_get_status - virtio_config_ops to get device status
+ * @vdev: Virtio device that communicates with remove vhost device
+ *
+ * virtio_config_ops to get device status. The remote vhost device
+ * populates the vhost device status in scratchpad register.
+ */
+static u8 ntb_virtio_get_status(struct virtio_device *vdev)
+{
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+
+	return ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX, VHOST_DEVICE_STATUS);
+}
+
+/* ntb_virtio_set_status - virtio_config_ops to set device status
+ * @vdev: Virtio device that communicates with remove vhost device
+ *
+ * virtio_config_ops to set device status. This function updates the
+ * status in scratchpad register and sends a notification to the vhost
+ * device using HOST_CMD_SET_STATUS command.
+ */
+static void ntb_virtio_set_status(struct virtio_device *vdev, u8 status)
+{
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	int ret;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	/* We should never be setting status to 0. */
+	if (WARN_ON(!status))
+		return;
+
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VHOST_DEVICE_STATUS,
+			    status);
+
+	ret = ntb_virtio_send_command(ntb, HOST_CMD_SET_STATUS);
+	if (ret)
+		dev_err(dev, "Failed to set device status\n");
+}
+
+/* ntb_virtio_vq_db_work - Handle doorbell event receive for a virtqueue
+ * @work: The work_struct holding the ntb_virtio_vq_db_work() function for every
+ *   created virtqueue
+ *
+ * This function is invoked when the remote vhost driver sends a notification
+ * to the virtqueue. (vhost_virtqueue_kick() on the remote vhost driver). This
+ * function invokes the virtio client driver's virtqueue callback.
+ */
+static void ntb_virtio_vq_db_work(struct work_struct *work)
+{
+	struct ntb_virtio_queue *vqueue;
+	struct virtqueue *vq;
+
+	vqueue = container_of(work, struct ntb_virtio_queue, db_handler.work);
+	vq = vqueue->vq;
+
+	if (!vq->callback)
+		return;
+
+	vq->callback(vq);
+}
+
+/* ntb_virtio_notify - Send notification to the remote vhost virtqueue
+ * @vq: The local virtio virtqueue corresponding to the remote vhost virtqueue
+ *   where the notification has to be sent
+ *
+ * Use NTB doorbell to send notification for the remote vhost virtqueue.
+ */
+bool ntb_virtio_notify(struct virtqueue *vq)
+{
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	int ret;
+
+	ntb = vq->priv;
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	ret = ntb_peer_db_set(ntb->ndev, vq->index);
+	if (ret) {
+		dev_err(dev, "Failed to notify remote virtqueue\n");
+		return false;
+	}
+
+	return true;
+}
+
+/* ntb_virtio_find_vq - Find a virtio virtqueue and instantiate it
+ * @vdev: Virtio device that communicates with remove vhost device
+ * @index: Index of the vhost virtqueue
+ * @callback: Callback function that has to be associated with the created
+ *   virtqueue
+ *
+ * Create a new virtio virtqueue which will be used by the remote vhost
+ * to access this virtio device.
+ */
+static struct virtqueue *
+ntb_virtio_find_vq(struct virtio_device *vdev, unsigned int index,
+		   void (*callback)(struct virtqueue *vq),
+		   const char *name, bool ctx)
+{
+	struct ntb_virtio_queue *vqueue;
+	resource_size_t xlat_align_size;
+	unsigned int vq_size, offset;
+	resource_size_t xlat_align;
+	struct ntb_virtio *ntb;
+	u16 queue_num_buffers;
+	struct ntb_dev *ndev;
+	struct virtqueue *vq;
+	struct device *dev;
+	void *mw_addr;
+	void *vq_addr;
+	int ret;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+	mw_addr = ntb->mw_addr;
+
+	queue_num_buffers = ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX,
+					       VHOST_QUEUE_NUM_BUFFERS(index));
+	if (!queue_num_buffers) {
+		dev_err(dev, "Invalid number of buffers\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = ntb_mw_get_align(ndev, NTB_DEF_PEER_IDX, 0, &xlat_align,
+			       &xlat_align_size, NULL);
+	if (ret) {
+		dev_err(dev, "Failed to get memory window align size\n");
+		return ERR_PTR(ret);
+	}
+
+	/* zero vring */
+	vq_size = vring_size(queue_num_buffers, xlat_align);
+	offset = index * vq_size;
+	if (offset + vq_size >= BUFFER_OFFSET) {
+		dev_err(dev, "Not enough memory for allocating vq\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	vq_addr = mw_addr + offset;
+	memset(vq_addr, 0, vq_size);
+
+	/*
+	 * Create the new vq, and tell virtio we're not interested in
+	 * the 'weak' smp barriers, since we're talking with a real device.
+	 */
+	vq = vring_new_virtqueue(index, queue_num_buffers, xlat_align, vdev,
+				 false, ctx, vq_addr, ntb_virtio_notify,
+				 callback, name);
+	if (!vq) {
+		dev_err(dev, "vring_new_virtqueue %s failed\n", name);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	vq->vdev = vdev;
+	vq->priv = ntb;
+
+	vqueue = &ntb->vqueue[index];
+	vqueue->vq = vq;
+
+	INIT_DELAYED_WORK(&vqueue->db_handler, ntb_virtio_vq_db_work);
+
+	return vq;
+}
+
+/* ntb_virtio_find_vqs - Find virtio virtqueues requested by virtio driver and
+ *   instantiate them
+ * @vdev: Virtio device that communicates with remove vhost device
+ * @nvqs: The number of virtqueues to be created
+ * @vqs: Array of pointers to the created vhost virtqueues
+ * @callback: Array of callback function that has to be associated with
+ *   each of the created virtqueues
+ * @names: Names that should be associated with each virtqueue
+ * @ctx: Context flag to find virtqueue
+ * @desc: Interrupt affinity descriptor
+ *
+ * Find virtio virtqueues requested by virtio driver and instantiate them. The
+ * number of buffers supported by the virtqueue is provided by the vhost
+ * device.
+ */
+static int
+ntb_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
+		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
+		    const char * const names[], const bool *ctx,
+		    struct irq_affinity *desc)
+{
+	struct ntb_virtio *ntb;
+	struct device *dev;
+	int queue_idx = 0;
+	int i;
+
+	ntb = to_ntb_virtio(vdev);
+	dev = ntb->dev;
+
+	for (i = 0; i < nvqs; ++i) {
+		if (!names[i]) {
+			vqs[i] = NULL;
+			continue;
+		}
+
+		vqs[i] = ntb_virtio_find_vq(vdev, queue_idx++, callbacks[i],
+					    names[i], ctx ? ctx[i] : false);
+		if (IS_ERR(vqs[i])) {
+			dev_err(dev, "Failed to find virtqueue\n");
+			return  PTR_ERR(vqs[i]);
+		}
+	}
+
+	return 0;
+}
+
+/* ntb_virtio_del_vqs - Free memory allocated for virtio virtqueues
+ * @vdev: Virtio device that communicates with remove vhost device
+ *
+ * Free memory allocated for virtio virtqueues.
+ */
+void ntb_virtio_del_vqs(struct virtio_device *vdev)
+{
+	struct ntb_virtio_queue *vqueue;
+	struct virtqueue *vq, *tmp;
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	int index;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+
+	list_for_each_entry_safe(vq, tmp, &vdev->vqs, list) {
+		index = vq->index;
+		vqueue = &ntb->vqueue[index];
+		cancel_delayed_work_sync(&vqueue->db_handler);
+		vring_del_virtqueue(vq);
+	}
+}
+
+/* ntb_virtio_reset - virtio_config_ops to reset the device
+ * @vdev: Virtio device that communicates with remove vhost device
+ *
+ * virtio_config_ops to reset the device. This sends HOST_CMD_RESET
+ * command to reset the device.
+ */
+static void ntb_virtio_reset(struct virtio_device *vdev)
+{
+	struct ntb_virtio *ntb;
+	struct device *dev;
+	int ret;
+
+	ntb = to_ntb_virtio(vdev);
+	dev = ntb->dev;
+
+	ret = ntb_virtio_send_command(ntb, HOST_CMD_RESET);
+	if (ret)
+		dev_err(dev, "Failed to reset device\n");
+}
+
+/* ntb_virtio_get - Copy the device configuration space data to buffer
+ *   from virtio driver
+ * @vdev: Virtio device that communicates with remove vhost device
+ * @offset: Offset in the device configuration space
+ * @buf: Buffer address from virtio driver where configuration space
+ *   data has to be copied
+ * @len: Length of the data from device configuration space to be copied
+ *
+ * Copy the device configuration space data to buffer from virtio driver.
+ */
+static void ntb_virtio_get(struct virtio_device *vdev, unsigned int offset,
+			   void *buf, unsigned int len)
+{
+	unsigned int cfg_offset;
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	int i, size;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	size = len / 4;
+	for (i = 0; i < size; i++) {
+		cfg_offset = VHOST_DEVICE_CFG_SPACE + i + offset;
+		*(u32 *)buf = ntb_spad_read(ndev, cfg_offset);
+		buf += 4;
+	}
+}
+
+/* ntb_virtio_set - Copy the device configuration space data from buffer
+ *   provided by virtio driver
+ * @vdev: Virtio device that communicates with remove vhost device
+ * @offset: Offset in the device configuration space
+ * @buf: Buffer address provided by virtio driver which has the configuration
+ *   space data to be copied
+ * @len: Length of the data from device configuration space to be copied
+ *
+ * Copy the device configuration space data from buffer provided by virtio
+ * driver to the device.
+ */
+static void ntb_virtio_set(struct virtio_device *vdev, unsigned int offset,
+			   const void *buf, unsigned int len)
+{
+	struct ntb_virtio *ntb;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	int i, size;
+
+	ntb = to_ntb_virtio(vdev);
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	size = len / 4;
+	for (i = 0; i < size; i++) {
+		ntb_spad_write(ndev, VHOST_DEVICE_CFG_SPACE + i, *(u32 *)buf);
+		buf += 4;
+	}
+}
+
+/* ntb_virtio_alloc_buffer - Allocate buffers from specially reserved memory
+ *   of virtio which can be accessed by both virtio and vhost
+ * @vdev: Virtio device that communicates with remove vhost device
+ * @size: The size of the memory that has to be allocated
+ *
+ * Allocate buffers from specially reserved memory of virtio which can be
+ * accessed by both virtio and vhost.
+ */
+static void *ntb_virtio_alloc_buffer(struct virtio_device *vdev, size_t size)
+{
+	struct ntb_virtio *ntb;
+	struct gen_pool *pool;
+	struct ntb_dev *ndev;
+	struct device *dev;
+	unsigned long addr;
+
+	ntb = to_ntb_virtio(vdev);
+	pool = ntb->gen_pool;
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	addr = gen_pool_alloc(pool, size);
+	if (!addr) {
+		dev_err(dev, "Failed to allocate memory\n");
+		return NULL;
+	}
+
+	return (void *)addr;
+}
+
+/* ntb_virtio_alloc_buffer - Free buffers allocated using
+ *   ntb_virtio_alloc_buffer()
+ * @vdev: Virtio device that communicates with remove vhost device
+ * @addr: Address returned by ntb_virtio_alloc_buffer()
+ * @size: The size of the allocated memory
+ *
+ * Free buffers allocated using ntb_virtio_alloc_buffer().
+ */
+static void ntb_virtio_free_buffer(struct virtio_device *vdev, void *addr,
+				   size_t size)
+{
+	struct ntb_virtio *ntb;
+	struct gen_pool *pool;
+	struct ntb_dev *ndev;
+	struct device *dev;
+
+	ntb = to_ntb_virtio(vdev);
+	pool = ntb->gen_pool;
+	ndev = ntb->ndev;
+	dev = ntb->dev;
+
+	gen_pool_free(pool, (unsigned long)addr, size);
+}
+
+static const struct virtio_config_ops ntb_virtio_config_ops = {
+	.get_features	= ntb_virtio_get_features,
+	.finalize_features = ntb_virtio_finalize_features,
+	.find_vqs	= ntb_virtio_find_vqs,
+	.del_vqs	= ntb_virtio_del_vqs,
+	.reset		= ntb_virtio_reset,
+	.set_status	= ntb_virtio_set_status,
+	.get_status	= ntb_virtio_get_status,
+	.get		= ntb_virtio_get,
+	.set		= ntb_virtio_set,
+	.alloc_buffer	= ntb_virtio_alloc_buffer,
+	.free_buffer	= ntb_virtio_free_buffer,
+};
+
+/* ntb_virtio_release - Callback function to free device
+ * @dev: Device in virtio_device that has to be freed
+ *
+ * Callback function from device core invoked to free the device after
+ * all references have been removed. This frees the allocated memory for
+ * struct ntb_virtio.
+ */
+static void ntb_virtio_release(struct device *dev)
+{
+	struct virtio_device *vdev;
+	struct ntb_virtio *ntb;
+
+	vdev = dev_to_virtio(dev);
+	ntb = to_ntb_virtio(vdev);
+
+	kfree(ntb);
+}
+
+/* ntb_virtio_link_cleanup - Cleanup once link to the remote host is lost
+ * @ntb: NTB virtio device that communicates with remove vhost device
+ *
+ * Performs the cleanup that has to be done once the link to the remote host
+ * is lost or when the NTB virtio driver is removed.
+ */
+static void ntb_virtio_link_cleanup(struct ntb_virtio *ntb)
+{
+	dma_addr_t mw_phys_addr;
+	struct gen_pool *pool;
+	struct ntb_dev *ndev;
+	struct pci_dev *pdev;
+	void *mw_addr;
+	u64 mw_size;
+
+	ndev = ntb->ndev;
+	pool = ntb->gen_pool;
+	pdev = ndev->pdev;
+	mw_size = ntb->mw_size;
+	mw_addr = ntb->mw_addr;
+	mw_phys_addr = ntb->mw_phys_addr;
+
+	ntb_mw_clear_trans(ndev, 0, 0);
+	gen_pool_destroy(pool);
+	dma_free_coherent(&pdev->dev, mw_size, mw_addr, mw_phys_addr);
+}
+
+/* ntb_virtio_link_cleanup_work - Cleanup once link to the remote host is lost
+ * @work: The work_struct holding the ntb_virtio_link_cleanup_work() function
+ *   that is scheduled
+ *
+ * Performs the cleanup that has to be done once the link to the remote host
+ * is lost. This acts as a wrapper to ntb_virtio_link_cleanup() for the cleanup
+ * operation.
+ */
+static void ntb_virtio_link_cleanup_work(struct work_struct *work)
+{
+	struct ntb_virtio *ntb;
+
+	ntb = container_of(work, struct ntb_virtio, link_cleanup);
+	ntb_virtio_link_cleanup(ntb);
+}
+
+/* ntb_virtio_link_work - Initialization once link to the remote host is
+ *   established
+ * @work: The work_struct holding the ntb_virtio_link_work() function that is
+ *   scheduled
+ *
+ * Performs the NTB virtio initialization that has to be done once the link to
+ * the remote host is established. Reads the initialization data written by
+ * vhost driver (to get memory window size accessible by vhost) and reserves
+ * memory for virtqueues and buffers.
+ */
+static void ntb_virtio_link_work(struct work_struct *work)
+{
+	struct virtio_device *vdev;
+	dma_addr_t mw_phys_addr;
+	struct ntb_virtio *ntb;
+	u32 deviceid, vendorid;
+	struct gen_pool *pool;
+	struct ntb_dev *ndev;
+	struct pci_dev *pdev;
+	struct device *dev;
+	void *mw_addr;
+	u64 mw_size;
+	u32 type;
+	int ret;
+
+	ntb = container_of(work, struct ntb_virtio, link_work.work);
+	ndev = ntb->ndev;
+	pdev = ndev->pdev;
+	dev = &ndev->dev;
+
+	type = ntb_spad_read(ndev, VIRTIO_TYPE);
+	if (type != TYPE_VHOST)
+		goto out;
+
+	mw_size = ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX,
+				     VHOST_MW0_SIZE_UPPER);
+	mw_size <<= 32;
+	mw_size |= ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX,
+				      VHOST_MW0_SIZE_LOWER);
+	ntb->mw_size = mw_size;
+
+	mw_addr = dma_alloc_coherent(&pdev->dev, mw_size, &mw_phys_addr,
+				     GFP_KERNEL);
+	if (!mw_addr)
+		return;
+
+	pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!pool) {
+		dev_err(dev, "Failed to create gen pool\n");
+		goto err_gen_pool;
+	}
+
+	ret = gen_pool_add_virt(pool, (unsigned long)mw_addr + BUFFER_OFFSET,
+				mw_phys_addr + BUFFER_OFFSET,
+				mw_size - BUFFER_OFFSET, -1);
+	if (ret) {
+		dev_err(dev, "Failed to add memory to the pool\n");
+		goto err_gen_pool_add_virt;
+	}
+
+	ret = ntb_mw_set_trans(ndev, 0, 0, mw_phys_addr, mw_size);
+	if (ret) {
+		dev_err(dev, "Failed to set memory window translation\n");
+		goto err_gen_pool_add_virt;
+	}
+
+	ntb->mw_phys_addr = mw_phys_addr;
+	ntb->mw_addr = mw_addr;
+	ntb->mw_size = mw_size;
+	ntb->gen_pool = pool;
+
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VIRTIO_MW0_LOWER_ADDR,
+			    lower_32_bits(mw_phys_addr));
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VIRTIO_MW0_UPPER_ADDR,
+			    upper_32_bits(mw_phys_addr));
+
+	ntb_peer_spad_write(ndev, NTB_DEF_PEER_IDX, VIRTIO_TYPE, TYPE_VIRTIO);
+
+	deviceid = ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX, VHOST_DEVICEID);
+	vendorid = ntb_peer_spad_read(ndev, NTB_DEF_PEER_IDX, VHOST_VENDORID);
+
+	vdev = &ntb->vdev;
+	vdev->id.device = deviceid;
+	vdev->id.vendor = vendorid;
+	vdev->config = &ntb_virtio_config_ops,
+	vdev->dev.parent = dev;
+	vdev->dev.release = ntb_virtio_release;
+
+	ret = register_virtio_device(vdev);
+	if (ret) {
+		dev_err(dev, "failed to register vdev: %d\n", ret);
+		goto err_register_virtio;
+	}
+
+	return;
+
+out:
+	if (ntb_link_is_up(ndev, NULL, NULL) == 1)
+		schedule_delayed_work(&ntb->link_work,
+				      msecs_to_jiffies(NTB_LINK_DOWN_TIMEOUT));
+	return;
+
+err_register_virtio:
+	ntb_mw_clear_trans(ndev, 0, 0);
+
+err_gen_pool_add_virt:
+	gen_pool_destroy(pool);
+
+err_gen_pool:
+	dma_free_coherent(&pdev->dev, mw_size, mw_addr, mw_phys_addr);
+}
+
+/* ntb_vhost_event_callback - Callback to link event interrupt
+ * @data: Private data specific to NTB virtio driver
+ *
+ * Callback function from NTB HW driver whenever both the hosts in the NTB
+ * setup has invoked ntb_link_enable().
+ */
+static void ntb_virtio_event_callback(void *data)
+{
+	struct ntb_virtio *ntb = data;
+
+	if (ntb_link_is_up(ntb->ndev, NULL, NULL) == 1)
+		schedule_delayed_work(&ntb->link_work, 0);
+	else
+		schedule_work(&ntb->link_cleanup);
+}
+
+/* ntb_virtio_vq_db_callback - Callback to doorbell interrupt to handle virtio
+ *   virtqueue work
+ * @data: Private data specific to NTB virtio driver
+ * @vector: Doorbell vector on which interrupt is received
+ *
+ * Callback function from NTB HW driver whenever remote vhost driver has sent
+ * a notification using doorbell. This schedules work corresponding to the
+ * virtqueue for which notification has been received.
+ */
+static void ntb_virtio_vq_db_callback(void *data, int vector)
+{
+	struct ntb_virtio_queue *vqueue;
+	struct ntb_virtio *ntb;
+
+	ntb = data;
+	vqueue = &ntb->vqueue[vector - 1];
+
+	schedule_delayed_work(&vqueue->db_handler, 0);
+}
+
+static const struct ntb_ctx_ops ntb_virtio_ops = {
+	.link_event = ntb_virtio_event_callback,
+	.db_event = ntb_virtio_vq_db_callback,
+};
+
+/* ntb_virtio_probe - Initialize struct ntb_virtio when a new NTB device is
+ *   created
+ * @client: struct ntb_client * representing the ntb virtio client driver
+ * @ndev: NTB device created by NTB HW driver
+ *
+ * Probe function to initialize struct ntb_virtio when a new NTB device is
+ * created.
+ */
+static int ntb_virtio_probe(struct ntb_client *self, struct ntb_dev *ndev)
+{
+	struct device *dev = &ndev->dev;
+	struct ntb_virtio *ntb;
+	int ret;
+
+	ntb = kzalloc(sizeof(*ntb), GFP_KERNEL);
+	if (!ntb)
+		return -ENOMEM;
+
+	ntb->ndev = ndev;
+	ntb->dev = dev;
+
+	mutex_init(&ntb->lock);
+	INIT_DELAYED_WORK(&ntb->link_work, ntb_virtio_link_work);
+	INIT_WORK(&ntb->link_cleanup, ntb_virtio_link_cleanup_work);
+
+	ret = ntb_set_ctx(ndev, ntb, &ntb_virtio_ops);
+	if (ret) {
+		dev_err(dev, "Failed to set NTB virtio context\n");
+		goto err;
+	}
+
+	ntb_link_enable(ndev, NTB_SPEED_AUTO, NTB_WIDTH_AUTO);
+
+	return 0;
+
+err:
+	kfree(ntb);
+
+	return ret;
+}
+
+/* ntb_virtio_free - Free the initializations performed by ntb_virtio_probe()
+ * @client: struct ntb_client * representing the ntb virtio client driver
+ * @ndev: NTB device created by NTB HW driver
+ *
+ * Free the initializations performed by ntb_virtio_probe().
+ */
+void ntb_virtio_free(struct ntb_client *client, struct ntb_dev *ndev)
+{
+	struct virtio_device *vdev;
+	struct ntb_virtio *ntb;
+
+	ntb = ndev->ctx;
+	vdev = &ntb->vdev;
+
+	ntb_virtio_link_cleanup(ntb);
+	cancel_work_sync(&ntb->link_cleanup);
+	cancel_delayed_work_sync(&ntb->link_work);
+	ntb_link_disable(ndev);
+
+	if (device_is_registered(&vdev->dev))
+		unregister_virtio_device(vdev);
+}
+
+static struct ntb_client ntb_virtio_client = {
+	.ops = {
+		.probe = ntb_virtio_probe,
+		.remove = ntb_virtio_free,
+	},
+};
+
+static int __init ntb_virtio_init(void)
+{
+	int ret;
+
+	ret = ntb_register_client(&ntb_virtio_client);
+	if (ret) {
+		pr_err("Failed to register ntb vhost driver --> %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(ntb_virtio_init);
+
+static void __exit ntb_virtio_exit(void)
+{
+	ntb_unregister_client(&ntb_virtio_client);
+}
+module_exit(ntb_virtio_exit);
+
+MODULE_DESCRIPTION("NTB VIRTIO Driver");
+MODULE_AUTHOR("Kishon Vijay Abraham I <kishon@ti.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/ntb/ntb_virtio.h b/drivers/ntb/ntb_virtio.h
new file mode 100644
index 000000000000..bc68ca38f60b
--- /dev/null
+++ b/drivers/ntb/ntb_virtio.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * NTB VIRTIO/VHOST Header
+ *
+ * Copyright (C) 2020 Texas Instruments
+ * Author: Kishon Vijay Abraham I <kishon@ti.com>
+ */
+
+#ifndef __LINUX_NTB_VIRTIO_H
+#define __LINUX_NTB_VIRTIO_H
+
+#define VIRTIO_TYPE			0
+enum virtio_type {
+	TYPE_VIRTIO = 1,
+	TYPE_VHOST,
+};
+
+#define VHOST_VENDORID			1
+#define VHOST_DEVICEID			2
+#define VHOST_FEATURES_UPPER		3
+#define VHOST_FEATURES_LOWER		4
+#define VIRTIO_FEATURES_UPPER		5
+#define VIRTIO_FEATURES_LOWER		6
+#define VHOST_MW0_SIZE_LOWER		7
+#define VHOST_MW0_SIZE_UPPER		8
+#define VIRTIO_MW0_LOWER_ADDR		9
+#define VIRTIO_MW0_UPPER_ADDR		10
+#define VHOST_DEVICE_STATUS		11
+#define VHOST_CONFIG_GENERATION		12
+
+#define VHOST_COMMAND			13
+enum host_cmd {
+	HOST_CMD_NONE,
+	HOST_CMD_SET_STATUS,
+	HOST_CMD_FINALIZE_FEATURES,
+	HOST_CMD_RESET,
+};
+
+#define VHOST_COMMAND_STATUS		14
+enum host_cmd_status {
+	HOST_CMD_STATUS_NONE,
+	HOST_CMD_STATUS_OKAY,
+	HOST_CMD_STATUS_ERROR,
+};
+
+#define VHOST_QUEUE_BASE		15
+#define VHOST_QUEUE_NUM_BUFFERS(n)	(VHOST_QUEUE_BASE + (n))
+
+#define VHOST_DEVICE_CFG_SPACE		23
+
+#define NTB_LINK_DOWN_TIMEOUT		10	/* 10 milli-sec */
+#define COMMAND_TIMEOUT			1000	/* 1 sec */
+
+#define MAX_VQS				8
+
+#endif /* __LINUX_NTB_VIRTIO_H */
-- 
2.17.1

