Return-Path: <linux-remoteproc+bounces-691-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F658735C4
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Mar 2024 12:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35DE3282B8B
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Mar 2024 11:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19E07FBC8;
	Wed,  6 Mar 2024 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PCA920Zz"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24C7FBA0;
	Wed,  6 Mar 2024 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725585; cv=none; b=sjI0Yz+HqRPsyf00oEG8KP+E6znltRL3HPDxYIluUH8rwNoddTul0ivHb21F18mEOGKuTFAan9htmPkbaqDxuLj1nIP19BEaGVpvvY17eKsvKNWKGCS3XQMtnYAcYNiYiejJ/qfsWuqhQGY5FgxNj+tOJ6EoQ2wEmzQip12efmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725585; c=relaxed/simple;
	bh=ZymX2ZYETu+8JkXIKKUVVlXMNRGURqjMwLa6klx/p9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cb78wV+HJPyE0Rb5pSRZSJv7b9X7CLRyMWt0onKy4zJz/9JVvEMqA/B9tfFjUxkbOhj1Wq7g4ez91e+gU5Nlb4eA9frjo9gqgP8kZIdUTlSiu+eyXYc/gGTJWGKRzfl/Lh5/S7s9IMmzk0COHQ/4zMZuZJw2Xj1Q62BEUllkjoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PCA920Zz; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709725580; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=B1ArvdFDpgCvpO8WHQUpkUaLMT3WU20rxP77F4IbSYk=;
	b=PCA920Zzj7XZrLUlRtYoBil574KjE8hfXr5o3XtOQh8A8og7Ziior9XPfU1vHTwORJlHBEwbNMf/od3UXrdsbbkRKL2x2QJ+CQyarLcF5iHkDf+Wb5UxaAOE3P2laVpRbmlx0FTEyDi6BNQnkh0XgsBeRDSNNg6GvzRqHis10o8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0W1xQCt3_1709725578;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W1xQCt3_1709725578)
          by smtp.aliyun-inc.com;
          Wed, 06 Mar 2024 19:46:19 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux.dev
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH vhost v1 2/4] virtio: vring_create_virtqueue: pass struct instead of multi parameters
Date: Wed,  6 Mar 2024 19:46:13 +0800
Message-Id: <20240306114615.88770-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20240306114615.88770-1-xuanzhuo@linux.alibaba.com>
References: <20240306114615.88770-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Git-Hash: b9b03370361a
Content-Transfer-Encoding: 8bit

Now, we pass multi parameters to vring_create_virtqueue. These parameters
may from transport or from driver.

vring_create_virtqueue is called by many places.
Every time, we try to add a new parameter, that is difficult.

If parameters from the driver, that should directly be passed to vring.
Then the vring can access the config from driver directly.

If parameters from the transport, we squish the parameters to a
structure. That will be helpful to add new parameter.

Because the virtio_uml.c changes the name, so change the "names" inside
the virtio_vq_config from "const char *const *names" to
"const char **names".

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Johannes Berg <johannes@sipsolutions.net>
---
 arch/um/drivers/virtio_uml.c       | 14 +++++---
 drivers/s390/virtio/virtio_ccw.c   | 14 ++++----
 drivers/virtio/virtio_mmio.c       | 14 ++++----
 drivers/virtio/virtio_pci_legacy.c | 15 ++++----
 drivers/virtio/virtio_pci_modern.c | 15 ++++----
 drivers/virtio/virtio_ring.c       | 57 ++++++++++++------------------
 drivers/virtio/virtio_vdpa.c       | 21 +++++------
 include/linux/virtio_config.h      |  6 ++--
 include/linux/virtio_ring.h        | 40 ++++++++-------------
 9 files changed, 93 insertions(+), 103 deletions(-)

diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
index c13dfeeb90c4..1c2d59d3d02b 100644
--- a/arch/um/drivers/virtio_uml.c
+++ b/arch/um/drivers/virtio_uml.c
@@ -942,6 +942,7 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
 {
 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
 	struct platform_device *pdev = vu_dev->pdev;
+	struct vq_transport_config tp_cfg = {};
 	struct virtio_uml_vq_info *info;
 	struct virtqueue *vq;
 	int num = MAX_SUPPORTED_QUEUE_SIZE;
@@ -955,10 +956,15 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
 	snprintf(info->name, sizeof(info->name), "%s.%d-%s", pdev->name,
 		 pdev->id, cfg->names[cfg->cfg_idx]);
 
-	vq = vring_create_virtqueue(index, num, PAGE_SIZE, vdev, true, true,
-				    cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false,
-				    vu_notify,
-				    cfg->callbacks[cfg->cfg_idx], info->name);
+	tp_cfg.num = num;
+	tp_cfg.vring_align = PAGE_SIZE;
+	tp_cfg.weak_barriers = true;
+	tp_cfg.may_reduce_num = true;
+	tp_cfg.notify = vu_notify;
+
+	cfg->names[cfg->cfg_idx] = info->name;
+
+	vq = vring_create_virtqueue(vdev, index, &tp_cfg, cfg);
 	if (!vq) {
 		rc = -ENOMEM;
 		goto error_create;
diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 11eea5086cff..f8d5bbd13359 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -503,6 +503,7 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
 					     struct virtio_vq_config *cfg)
 {
 	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
+	struct vq_transport_config tp_cfg = {};
 	bool (*notify)(struct virtqueue *vq);
 	int err;
 	struct virtqueue *vq = NULL;
@@ -536,13 +537,14 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
 		goto out_err;
 	}
 	may_reduce = vcdev->revision > 0;
-	vq = vring_create_virtqueue(i, info->num, KVM_VIRTIO_CCW_RING_ALIGN,
-				    vdev, true, may_reduce,
-				    cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false,
-				    notify,
-				    cfg->callbacks[cfg->cfg_idx],
-				    cfg->names[cfg->cfg_idx]);
 
+	tp_cfg.num = info->num;
+	tp_cfg.vring_align = KVM_VIRTIO_CCW_RING_ALIGN;
+	tp_cfg.weak_barriers = true;
+	tp_cfg.may_reduce_num = may_reduce;
+	tp_cfg.notify = notify;
+
+	vq = vring_create_virtqueue(vdev, i, &tp_cfg, cfg);
 	if (!vq) {
 		/* For now, we fail if we can't get the requested size. */
 		dev_warn(&vcdev->cdev->dev, "no vq\n");
diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index feb823d279d2..cb172fa4d7cc 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -373,6 +373,7 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 				     struct virtio_vq_config *cfg)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
+	struct vq_transport_config tp_cfg = {};
 	bool (*notify)(struct virtqueue *vq);
 	struct virtio_mmio_vq_info *info;
 	struct virtqueue *vq;
@@ -411,13 +412,14 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 		goto error_new_virtqueue;
 	}
 
+	tp_cfg.num = num;
+	tp_cfg.vring_align = VIRTIO_MMIO_VRING_ALIGN;
+	tp_cfg.weak_barriers = true;
+	tp_cfg.may_reduce_num = true;
+	tp_cfg.notify = notify;
+
 	/* Create the vring */
-	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
-				 true, true,
-				 cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false,
-				 notify,
-				 cfg->callbacks[cfg->cfg_idx],
-				 cfg->names[cfg->cfg_idx]);
+	vq = vring_create_virtqueue(vdev, index, &tp_cfg, cfg);
 	if (!vq) {
 		err = -ENOMEM;
 		goto error_new_virtqueue;
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index e8d22fce32f5..6fe675b2a5e5 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -113,6 +113,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				  struct virtio_vq_config *cfg,
 				  u16 msix_vec)
 {
+	struct vq_transport_config tp_cfg = {};
 	struct virtqueue *vq;
 	u16 num;
 	int err;
@@ -125,14 +126,14 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 
 	info->msix_vector = msix_vec;
 
+	tp_cfg.num = num;
+	tp_cfg.vring_align = VIRTIO_PCI_VRING_ALIGN;
+	tp_cfg.weak_barriers = true;
+	tp_cfg.may_reduce_num = false;
+	tp_cfg.notify = vp_notify;
+
 	/* create the vring */
-	vq = vring_create_virtqueue(index, num,
-				    VIRTIO_PCI_VRING_ALIGN, &vp_dev->vdev,
-				    true, false,
-				    cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false,
-				    vp_notify,
-				    cfg->callbacks[cfg->cfg_idx],
-				    cfg->names[cfg->cfg_idx]);
+	vq = vring_create_virtqueue(&vp_dev->vdev, index, &tp_cfg, cfg);
 	if (!vq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index b2cdf5d3824d..dd75534346d1 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -535,6 +535,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 {
 
 	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+	struct vq_transport_config tp_cfg = {};
 	bool (*notify)(struct virtqueue *vq);
 	struct virtqueue *vq;
 	bool is_avq;
@@ -558,14 +559,14 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 
 	info->msix_vector = msix_vec;
 
+	tp_cfg.num = num;
+	tp_cfg.vring_align = SMP_CACHE_BYTES;
+	tp_cfg.weak_barriers = true;
+	tp_cfg.may_reduce_num = true;
+	tp_cfg.notify = notify;
+
 	/* create the vring */
-	vq = vring_create_virtqueue(index, num,
-				    SMP_CACHE_BYTES, &vp_dev->vdev,
-				    true, true,
-				    cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false,
-				    notify,
-				    cfg->callbacks[cfg->cfg_idx],
-				    cfg->names[cfg->cfg_idx]);
+	vq = vring_create_virtqueue(&vp_dev->vdev, index, &tp_cfg, cfg);
 	if (!vq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 6f7e5010a673..08858e2d761e 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2662,43 +2662,32 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
 	return &vq->vq;
 }
 
-struct virtqueue *vring_create_virtqueue(
-	unsigned int index,
-	unsigned int num,
-	unsigned int vring_align,
-	struct virtio_device *vdev,
-	bool weak_barriers,
-	bool may_reduce_num,
-	bool context,
-	bool (*notify)(struct virtqueue *),
-	void (*callback)(struct virtqueue *),
-	const char *name)
+struct virtqueue *vring_create_virtqueue(struct virtio_device *vdev,
+					 unsigned int index,
+					 struct vq_transport_config *tp_cfg,
+					 struct virtio_vq_config *cfg)
 {
+	struct device *dma_dev;
+	unsigned int num;
+	unsigned int vring_align;
+	bool weak_barriers;
+	bool may_reduce_num;
+	bool context;
+	bool (*notify)(struct virtqueue *_);
+	void (*callback)(struct virtqueue *_);
+	const char *name;
 
-	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
-		return vring_create_virtqueue_packed(index, num, vring_align,
-				vdev, weak_barriers, may_reduce_num,
-				context, notify, callback, name, vdev->dev.parent);
+	dma_dev = tp_cfg->dma_dev ? : vdev->dev.parent;
 
-	return vring_create_virtqueue_split(index, num, vring_align,
-			vdev, weak_barriers, may_reduce_num,
-			context, notify, callback, name, vdev->dev.parent);
-}
-EXPORT_SYMBOL_GPL(vring_create_virtqueue);
+	num            = tp_cfg->num;
+	vring_align    = tp_cfg->vring_align;
+	weak_barriers  = tp_cfg->weak_barriers;
+	may_reduce_num = tp_cfg->may_reduce_num;
+	notify         = tp_cfg->notify;
 
-struct virtqueue *vring_create_virtqueue_dma(
-	unsigned int index,
-	unsigned int num,
-	unsigned int vring_align,
-	struct virtio_device *vdev,
-	bool weak_barriers,
-	bool may_reduce_num,
-	bool context,
-	bool (*notify)(struct virtqueue *),
-	void (*callback)(struct virtqueue *),
-	const char *name,
-	struct device *dma_dev)
-{
+	name     = cfg->names[cfg->cfg_idx];
+	callback = cfg->callbacks[cfg->cfg_idx];
+	context  = cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false;
 
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
 		return vring_create_virtqueue_packed(index, num, vring_align,
@@ -2709,7 +2698,7 @@ struct virtqueue *vring_create_virtqueue_dma(
 			vdev, weak_barriers, may_reduce_num,
 			context, notify, callback, name, dma_dev);
 }
-EXPORT_SYMBOL_GPL(vring_create_virtqueue_dma);
+EXPORT_SYMBOL_GPL(vring_create_virtqueue);
 
 /**
  * virtqueue_resize - resize the vring of vq
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index 7f3e173f669c..1ab219fce653 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -146,8 +146,8 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 {
 	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
 	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
-	struct device *dma_dev;
 	const struct vdpa_config_ops *ops = vdpa->config;
+	struct vq_transport_config tp_cfg = {};
 	struct virtio_vdpa_vq_info *info;
 	bool (*notify)(struct virtqueue *vq) = virtio_vdpa_notify;
 	struct vdpa_callback cb;
@@ -201,16 +201,17 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	align = ops->get_vq_align(vdpa);
 
 	if (ops->get_vq_dma_dev)
-		dma_dev = ops->get_vq_dma_dev(vdpa, index);
+		tp_cfg.dma_dev = ops->get_vq_dma_dev(vdpa, index);
 	else
-		dma_dev = vdpa_get_dma_dev(vdpa);
-	vq = vring_create_virtqueue_dma(index, max_num, align, vdev,
-					true, may_reduce_num,
-					cfg->ctx ? cfg->ctx[cfg->cfg_idx] : false,
-					notify,
-					cfg->callbacks[cfg->cfg_idx],
-					cfg->names[cfg->cfg_idx],
-					dma_dev);
+		tp_cfg.dma_dev = vdpa_get_dma_dev(vdpa);
+
+	tp_cfg.num = max_num;
+	tp_cfg.vring_align = align;
+	tp_cfg.weak_barriers = true;
+	tp_cfg.may_reduce_num = may_reduce_num;
+	tp_cfg.notify = notify;
+
+	vq = vring_create_virtqueue(vdev, index, &tp_cfg, cfg);
 	if (!vq) {
 		err = -ENOMEM;
 		goto error_new_virtqueue;
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 80a1e3ecbdeb..f79e7e9be512 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -45,7 +45,7 @@ struct virtio_vq_config {
 
 	struct virtqueue   **vqs;
 	vq_callback_t      **callbacks;
-	const char   *const *names;
+	const char         **names;
 	const bool          *ctx;
 	struct irq_affinity *desc;
 };
@@ -266,7 +266,7 @@ int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 	cfg.nvqs = nvqs;
 	cfg.vqs = vqs;
 	cfg.callbacks = callbacks;
-	cfg.names = names;
+	cfg.names = (const char **)names;
 	cfg.desc = desc;
 
 	return vdev->config->find_vqs(vdev, &cfg);
@@ -283,7 +283,7 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
 	cfg.nvqs = nvqs;
 	cfg.vqs = vqs;
 	cfg.callbacks = callbacks;
-	cfg.names = names;
+	cfg.names = (const char **)names;
 	cfg.ctx = ctx;
 	cfg.desc = desc;
 
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 9b33df741b63..cd8042c79814 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -5,6 +5,7 @@
 #include <asm/barrier.h>
 #include <linux/irqreturn.h>
 #include <uapi/linux/virtio_ring.h>
+#include <linux/virtio_config.h>
 
 /*
  * Barriers in virtio are tricky.  Non-SMP virtio guests can't assume
@@ -60,38 +61,25 @@ struct virtio_device;
 struct virtqueue;
 struct device;
 
+struct vq_transport_config {
+	unsigned int num;
+	unsigned int vring_align;
+	bool weak_barriers;
+	bool may_reduce_num;
+	bool (*notify)(struct virtqueue *vq);
+	struct device *dma_dev;
+};
+
 /*
  * Creates a virtqueue and allocates the descriptor ring.  If
  * may_reduce_num is set, then this may allocate a smaller ring than
  * expected.  The caller should query virtqueue_get_vring_size to learn
  * the actual size of the ring.
  */
-struct virtqueue *vring_create_virtqueue(unsigned int index,
-					 unsigned int num,
-					 unsigned int vring_align,
-					 struct virtio_device *vdev,
-					 bool weak_barriers,
-					 bool may_reduce_num,
-					 bool ctx,
-					 bool (*notify)(struct virtqueue *vq),
-					 void (*callback)(struct virtqueue *vq),
-					 const char *name);
-
-/*
- * Creates a virtqueue and allocates the descriptor ring with per
- * virtqueue DMA device.
- */
-struct virtqueue *vring_create_virtqueue_dma(unsigned int index,
-					     unsigned int num,
-					     unsigned int vring_align,
-					     struct virtio_device *vdev,
-					     bool weak_barriers,
-					     bool may_reduce_num,
-					     bool ctx,
-					     bool (*notify)(struct virtqueue *vq),
-					     void (*callback)(struct virtqueue *vq),
-					     const char *name,
-					     struct device *dma_dev);
+struct virtqueue *vring_create_virtqueue(struct virtio_device *vdev,
+					 unsigned int index,
+					 struct vq_transport_config *tp_cfg,
+					 struct virtio_vq_config *cfg);
 
 /*
  * Creates a virtqueue with a standard layout but a caller-allocated
-- 
2.32.0.3.g01195cf9f


