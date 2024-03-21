Return-Path: <linux-remoteproc+bounces-831-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957888575A
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 Mar 2024 11:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E451F224EC
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 Mar 2024 10:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F72556448;
	Thu, 21 Mar 2024 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="iTz9bqJx"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A52C86A;
	Thu, 21 Mar 2024 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016467; cv=none; b=RaGYZAs4UvRmKc0sJETr+MkRm7I47S05Bkd8Twmex0fRD4fVW00g0GZrziySubMhwl4GJML7s8ju4PI7RqrR+m4n2uG+dJKQcclWRSQPD1vtZ5Y/XdUlPQdB9eM5fA0B6UrSUGC3I86rNYJofVR0HQs3CK2nqf+rTztY+3u2w68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016467; c=relaxed/simple;
	bh=O7BDqjloyA4kDbof+SbBm9l4jtxPLr74tep+vyiPzlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Syn2rvuOELewgEWx+tzrD7MPUPwfsSkkeWUyD7i/ns1jJamA0B1JoBbJexvN4MQ1AlGkw9vWFfbDYvlf2UK0cdb8Y1DsQWhMg6FusZFUVMgd8gBJ4UIs8OBigKHEUiTQKSvr1yqBW5nL20qPnJLOIjISwYjXLfkWhIwlHdNGC4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=iTz9bqJx; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1711016461; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=U8s80dMQE88qc/bcLuuSzpjvbAVZPA42Qrojn0xPfOA=;
	b=iTz9bqJxGUT+LWwNNm1zhan8DaNrevEv7xruZ3vddDcwxohRq6lS5cXqUPPV+I/50+BQgLSfvZZD67KUbbiIObbBFH2RalGDGlmvwzC3hMBdmTDjdpJ8i0iS90kl1IoWLUqOmC4OnjoxQXGB6kHACZCDUcsXWYKyHo2cCnsc7lQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0W3-P6Jl_1711016136;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W3-P6Jl_1711016136)
          by smtp.aliyun-inc.com;
          Thu, 21 Mar 2024 18:15:37 +0800
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
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH vhost v4 3/6] virtio: find_vqs: pass struct instead of multi parameters
Date: Thu, 21 Mar 2024 18:15:29 +0800
Message-Id: <20240321101532.59272-4-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20240321101532.59272-1-xuanzhuo@linux.alibaba.com>
References: <20240321101532.59272-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Git-Hash: 571c18a30348
Content-Transfer-Encoding: 8bit

Now, we pass multi parameters to find_vqs. These parameters
may work for transport or work for vring.

And find_vqs has multi implements in many places:

 arch/um/drivers/virtio_uml.c
 drivers/platform/mellanox/mlxbf-tmfifo.c
 drivers/remoteproc/remoteproc_virtio.c
 drivers/s390/virtio/virtio_ccw.c
 drivers/virtio/virtio_mmio.c
 drivers/virtio/virtio_pci_legacy.c
 drivers/virtio/virtio_pci_modern.c
 drivers/virtio/virtio_vdpa.c

Every time, we try to add a new parameter, that is difficult.
We must change every find_vqs implement.

One the other side, if we want to pass a parameter to vring,
we must change the call path from transport to vring.
Too many functions need to be changed.

So it is time to refactor the find_vqs. We pass a structure
cfg to find_vqs(), that will be passed to vring by transport.

Because the vp_modern_create_avq() use the "const char *names[]",
and the virtio_uml.c changes the name in the subsequent commit, so
change the "names" inside the virtio_vq_config from "const char *const
*names" to "const char **names".

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Johannes Berg <johannes@sipsolutions.net>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/um/drivers/virtio_uml.c             | 20 +++----
 drivers/platform/mellanox/mlxbf-tmfifo.c | 11 ++--
 drivers/remoteproc/remoteproc_virtio.c   | 26 ++++-----
 drivers/s390/virtio/virtio_ccw.c         | 26 ++++-----
 drivers/virtio/virtio_mmio.c             | 24 ++++----
 drivers/virtio/virtio_pci_common.c       | 53 +++++++----------
 drivers/virtio/virtio_pci_common.h       |  9 +--
 drivers/virtio/virtio_pci_legacy.c       | 11 ++--
 drivers/virtio/virtio_pci_modern.c       | 32 +++++-----
 drivers/virtio/virtio_vdpa.c             | 34 +++++------
 include/linux/virtio_config.h            | 74 ++++++++++++++++++------
 11 files changed, 166 insertions(+), 154 deletions(-)

diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
index 1d1e8654b7fc..140560de2940 100644
--- a/arch/um/drivers/virtio_uml.c
+++ b/arch/um/drivers/virtio_uml.c
@@ -937,8 +937,8 @@ static int vu_setup_vq_call_fd(struct virtio_uml_device *vu_dev,
 }
 
 static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
-				     unsigned index, vq_callback_t *callback,
-				     const char *name, bool ctx)
+				     unsigned index,
+				     struct virtio_vq_config *cfg)
 {
 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
 	struct platform_device *pdev = vu_dev->pdev;
@@ -953,10 +953,12 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
 		goto error_kzalloc;
 	}
 	snprintf(info->name, sizeof(info->name), "%s.%d-%s", pdev->name,
-		 pdev->id, name);
+		 pdev->id, cfg->names[index]);
 
 	vq = vring_create_virtqueue(index, num, PAGE_SIZE, vdev, true, true,
-				    ctx, vu_notify, callback, info->name);
+				    cfg->ctx ? cfg->ctx[index] : false,
+				    vu_notify,
+				    cfg->callbacks[index], info->name);
 	if (!vq) {
 		rc = -ENOMEM;
 		goto error_create;
@@ -1013,12 +1015,11 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
 	return ERR_PTR(rc);
 }
 
-static int vu_find_vqs(struct virtio_device *vdev, unsigned nvqs,
-		       struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		       const char * const names[], const bool *ctx,
-		       struct irq_affinity *desc)
+static int vu_find_vqs(struct virtio_device *vdev, struct virtio_vq_config *cfg)
 {
 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
+	struct virtqueue **vqs = cfg->vqs;
+	unsigned int nvqs = cfg->nvqs;
 	int i, queue_idx = 0, rc;
 	struct virtqueue *vq;
 
@@ -1031,8 +1032,7 @@ static int vu_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		return rc;
 
 	for (i = 0; i < nvqs; ++i) {
-		vqs[i] = vu_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
-				     ctx ? ctx[i] : false);
+		vqs[i] = vu_setup_vq(vdev, queue_idx++, cfg);
 		if (IS_ERR(vqs[i])) {
 			rc = PTR_ERR(vqs[i]);
 			goto error_setup;
diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index f4639331f32e..10e74eb95d31 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1056,15 +1056,12 @@ static void mlxbf_tmfifo_virtio_del_vqs(struct virtio_device *vdev)
 
 /* Create and initialize the virtual queues. */
 static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
-					unsigned int nvqs,
-					struct virtqueue *vqs[],
-					vq_callback_t *callbacks[],
-					const char * const names[],
-					const bool *ctx,
-					struct irq_affinity *desc)
+					struct virtio_vq_config *cfg)
 {
 	struct mlxbf_tmfifo_vdev *tm_vdev = mlxbf_vdev_to_tmfifo(vdev);
+	struct virtqueue **vqs = cfg->vqs;
 	struct mlxbf_tmfifo_vring *vring;
+	unsigned int nvqs = cfg->nvqs;
 	struct virtqueue *vq;
 	int i, ret, size;
 
@@ -1080,7 +1077,7 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
 		vq = vring_new_virtqueue(i, vring->num, vring->align, vdev,
 					 false, false, vring->va,
 					 mlxbf_tmfifo_virtio_notify,
-					 callbacks[i], names[i]);
+					 cfg->callbacks[i], cfg->names[i]);
 		if (!vq) {
 			dev_err(&vdev->dev, "vring_new_virtqueue failed\n");
 			ret = -ENOMEM;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cd71827d67af..3da1529e445d 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -102,8 +102,7 @@ EXPORT_SYMBOL(rproc_vq_interrupt);
 
 static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 				    unsigned int id,
-				    void (*callback)(struct virtqueue *vq),
-				    const char *name, bool ctx)
+				    struct virtio_vq_config *cfg)
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 	struct rproc *rproc = vdev_to_rproc(vdev);
@@ -119,9 +118,6 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	if (id >= ARRAY_SIZE(rvdev->vring))
 		return ERR_PTR(-EINVAL);
 
-	if (!name)
-		return NULL;
-
 	/* Search allocated memory region by name */
 	mem = rproc_find_carveout_by_name(rproc, "vdev%dvring%d", rvdev->index,
 					  id);
@@ -143,10 +139,12 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	 * Create the new vq, and tell virtio we're not interested in
 	 * the 'weak' smp barriers, since we're talking with a real device.
 	 */
-	vq = vring_new_virtqueue(id, num, rvring->align, vdev, false, ctx,
-				 addr, rproc_virtio_notify, callback, name);
+	vq = vring_new_virtqueue(id, num, rvring->align, vdev, false,
+				 cfg->ctx ? cfg->ctx[id] : false,
+				 addr, rproc_virtio_notify, cfg->callbacks[id],
+				 cfg->names[id]);
 	if (!vq) {
-		dev_err(dev, "vring_new_virtqueue %s failed\n", name);
+		dev_err(dev, "vring_new_virtqueue %s failed\n", cfg->names[id]);
 		rproc_free_vring(rvring);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -180,18 +178,14 @@ static void rproc_virtio_del_vqs(struct virtio_device *vdev)
 	__rproc_virtio_del_vqs(vdev);
 }
 
-static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
-				 struct virtqueue *vqs[],
-				 vq_callback_t *callbacks[],
-				 const char * const names[],
-				 const bool * ctx,
-				 struct irq_affinity *desc)
+static int rproc_virtio_find_vqs(struct virtio_device *vdev, struct virtio_vq_config *cfg)
 {
+	struct virtqueue **vqs = cfg->vqs;
+	unsigned int nvqs = cfg->nvqs;
 	int i, ret, queue_idx = 0;
 
 	for (i = 0; i < nvqs; ++i) {
-		vqs[i] = rp_find_vq(vdev, queue_idx++, callbacks[i], names[i],
-				    ctx ? ctx[i] : false);
+		vqs[i] = rp_find_vq(vdev, queue_idx++, cfg);
 		if (IS_ERR(vqs[i])) {
 			ret = PTR_ERR(vqs[i]);
 			goto error;
diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 773f16c294d9..3d6a78bd9c96 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -499,9 +499,8 @@ static void virtio_ccw_del_vqs(struct virtio_device *vdev)
 }
 
 static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
-					     int i, vq_callback_t *callback,
-					     const char *name, bool ctx,
-					     struct ccw1 *ccw)
+					     int i, struct ccw1 *ccw,
+					     struct virtio_vq_config *cfg)
 {
 	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
 	bool (*notify)(struct virtqueue *vq);
@@ -538,8 +537,11 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
 	}
 	may_reduce = vcdev->revision > 0;
 	vq = vring_create_virtqueue(i, info->num, KVM_VIRTIO_CCW_RING_ALIGN,
-				    vdev, true, may_reduce, ctx,
-				    notify, callback, name);
+				    vdev, true, may_reduce,
+				    cfg->ctx ? cfg->ctx[i] : false,
+				    notify,
+				    cfg->callbacks[i],
+				    cfg->names[i]);
 
 	if (!vq) {
 		/* For now, we fail if we can't get the requested size. */
@@ -650,15 +652,13 @@ static int virtio_ccw_register_adapter_ind(struct virtio_ccw_device *vcdev,
 	return ret;
 }
 
-static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
-			       struct virtqueue *vqs[],
-			       vq_callback_t *callbacks[],
-			       const char * const names[],
-			       const bool *ctx,
-			       struct irq_affinity *desc)
+static int virtio_ccw_find_vqs(struct virtio_device *vdev,
+			       struct virtio_vq_config *cfg)
 {
 	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
+	struct virtqueue **vqs = cfg->vqs;
 	unsigned long *indicatorp = NULL;
+	unsigned int nvqs = cfg->nvqs;
 	int ret, i, queue_idx = 0;
 	struct ccw1 *ccw;
 
@@ -667,9 +667,7 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		return -ENOMEM;
 
 	for (i = 0; i < nvqs; ++i) {
-		vqs[i] = virtio_ccw_setup_vq(vdev, queue_idx++, callbacks[i],
-					     names[i], ctx ? ctx[i] : false,
-					     ccw);
+		vqs[i] = virtio_ccw_setup_vq(vdev, queue_idx++, ccw, cfg);
 		if (IS_ERR(vqs[i])) {
 			ret = PTR_ERR(vqs[i]);
 			vqs[i] = NULL;
diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index a95c98cca63e..14bb1d862151 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -370,8 +370,7 @@ static void vm_synchronize_cbs(struct virtio_device *vdev)
 }
 
 static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int index,
-				  void (*callback)(struct virtqueue *vq),
-				  const char *name, bool ctx)
+				     struct virtio_vq_config *cfg)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 	bool (*notify)(struct virtqueue *vq);
@@ -386,9 +385,6 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 	else
 		notify = vm_notify;
 
-	if (!name)
-		return NULL;
-
 	/* Select the queue we're interested in */
 	writel(index, vm_dev->base + VIRTIO_MMIO_QUEUE_SEL);
 
@@ -414,7 +410,11 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 
 	/* Create the vring */
 	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
-				 true, true, ctx, notify, callback, name);
+				    true, true,
+				    cfg->ctx ? cfg->ctx[index] : false,
+				    notify,
+				    cfg->callbacks[index],
+				    cfg->names[index]);
 	if (!vq) {
 		err = -ENOMEM;
 		goto error_new_virtqueue;
@@ -487,15 +487,12 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 	return ERR_PTR(err);
 }
 
-static int vm_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
-		       struct virtqueue *vqs[],
-		       vq_callback_t *callbacks[],
-		       const char * const names[],
-		       const bool *ctx,
-		       struct irq_affinity *desc)
+static int vm_find_vqs(struct virtio_device *vdev, struct virtio_vq_config *cfg)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 	int irq = platform_get_irq(vm_dev->pdev, 0);
+	struct virtqueue **vqs = cfg->vqs;
+	unsigned int nvqs = cfg->nvqs;
 	int i, err, queue_idx = 0;
 
 	if (irq < 0)
@@ -510,8 +507,7 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 		enable_irq_wake(irq);
 
 	for (i = 0; i < nvqs; ++i) {
-		vqs[i] = vm_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
-				     ctx ? ctx[i] : false);
+		vqs[i] = vm_setup_vq(vdev, queue_idx++, cfg);
 		if (IS_ERR(vqs[i])) {
 			vm_del_vqs(vdev);
 			return PTR_ERR(vqs[i]);
diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 783758672ef9..2a5fc5498115 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -172,9 +172,7 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 }
 
 static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned int index,
-				     void (*callback)(struct virtqueue *vq),
-				     const char *name,
-				     bool ctx,
+				     struct virtio_vq_config *cfg,
 				     u16 msix_vec)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
@@ -186,13 +184,12 @@ static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned int in
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
-	vq = vp_dev->setup_vq(vp_dev, info, index, callback, name, ctx,
-			      msix_vec);
+	vq = vp_dev->setup_vq(vp_dev, info, index, cfg, msix_vec);
 	if (IS_ERR(vq))
 		goto out_info;
 
 	info->vq = vq;
-	if (callback) {
+	if (cfg->callbacks[index]) {
 		spin_lock_irqsave(&vp_dev->lock, flags);
 		list_add(&info->node, &vp_dev->virtqueues);
 		spin_unlock_irqrestore(&vp_dev->lock, flags);
@@ -284,15 +281,15 @@ void vp_del_vqs(struct virtio_device *vdev)
 	vp_dev->vqs = NULL;
 }
 
-static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
-		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], bool per_vq_vectors,
-		const bool *ctx,
-		struct irq_affinity *desc)
+static int vp_find_vqs_msix(struct virtio_device *vdev,
+			    struct virtio_vq_config *cfg,
+			    bool per_vq_vectors)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	u16 msix_vec;
 	int i, err, nvectors, allocated_vectors, queue_idx = 0;
+	struct virtqueue **vqs = cfg->vqs;
+	unsigned int nvqs = cfg->nvqs;
 
 	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
 	if (!vp_dev->vqs)
@@ -302,7 +299,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 		/* Best option: one for change interrupt, one per vq. */
 		nvectors = 1;
 		for (i = 0; i < nvqs; ++i)
-			if (names[i] && callbacks[i])
+			if (cfg->names[i] && cfg->callbacks[i])
 				++nvectors;
 	} else {
 		/* Second best: one for change, shared for all vqs. */
@@ -310,22 +307,21 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 	}
 
 	err = vp_request_msix_vectors(vdev, nvectors, per_vq_vectors,
-				      per_vq_vectors ? desc : NULL);
+				      per_vq_vectors ? cfg->desc : NULL);
 	if (err)
 		goto error_find;
 
 	vp_dev->per_vq_vectors = per_vq_vectors;
 	allocated_vectors = vp_dev->msix_used_vectors;
 	for (i = 0; i < nvqs; ++i) {
-		if (!callbacks[i])
+		if (!cfg->callbacks[i])
 			msix_vec = VIRTIO_MSI_NO_VECTOR;
 		else if (vp_dev->per_vq_vectors)
 			msix_vec = allocated_vectors++;
 		else
 			msix_vec = VP_MSIX_VQ_VECTOR;
-		vqs[i] = vp_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
-				     ctx ? ctx[i] : false,
-				     msix_vec);
+
+		vqs[i] = vp_setup_vq(vdev, queue_idx++, cfg, msix_vec);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
 			goto error_find;
@@ -338,7 +334,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 		snprintf(vp_dev->msix_names[msix_vec],
 			 sizeof *vp_dev->msix_names,
 			 "%s-%s",
-			 dev_name(&vp_dev->vdev.dev), names[i]);
+			 dev_name(&vp_dev->vdev.dev), cfg->names[i]);
 		err = request_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec),
 				  vring_interrupt, 0,
 				  vp_dev->msix_names[msix_vec],
@@ -353,11 +349,11 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 	return err;
 }
 
-static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
-		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], const bool *ctx)
+static int vp_find_vqs_intx(struct virtio_device *vdev, struct virtio_vq_config *cfg)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtqueue **vqs = cfg->vqs;
+	unsigned int nvqs = cfg->nvqs;
 	int i, err, queue_idx = 0;
 
 	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
@@ -372,9 +368,7 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
 	vp_dev->intx_enabled = 1;
 	vp_dev->per_vq_vectors = false;
 	for (i = 0; i < nvqs; ++i) {
-		vqs[i] = vp_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
-				     ctx ? ctx[i] : false,
-				     VIRTIO_MSI_NO_VECTOR);
+		vqs[i] = vp_setup_vq(vdev, queue_idx++, cfg, VIRTIO_MSI_NO_VECTOR);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
 			goto out_del_vqs;
@@ -388,26 +382,23 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
 }
 
 /* the config->find_vqs() implementation */
-int vp_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
-		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], const bool *ctx,
-		struct irq_affinity *desc)
+int vp_find_vqs(struct virtio_device *vdev, struct virtio_vq_config *cfg)
 {
 	int err;
 
 	/* Try MSI-X with one vector per queue. */
-	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, true, ctx, desc);
+	err = vp_find_vqs_msix(vdev, cfg, true);
 	if (!err)
 		return 0;
 	/* Fallback: MSI-X with one vector for config, one shared for queues. */
-	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, false, ctx, desc);
+	err = vp_find_vqs_msix(vdev, cfg, false);
 	if (!err)
 		return 0;
 	/* Is there an interrupt? If not give up. */
 	if (!(to_vp_device(vdev)->pci_dev->irq))
 		return err;
 	/* Finally fall back to regular interrupts. */
-	return vp_find_vqs_intx(vdev, nvqs, vqs, callbacks, names, ctx);
+	return vp_find_vqs_intx(vdev, cfg);
 }
 
 const char *vp_bus_name(struct virtio_device *vdev)
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 7fef52bee455..5ba8b82fb765 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -95,9 +95,7 @@ struct virtio_pci_device {
 	struct virtqueue *(*setup_vq)(struct virtio_pci_device *vp_dev,
 				      struct virtio_pci_vq_info *info,
 				      unsigned int idx,
-				      void (*callback)(struct virtqueue *vq),
-				      const char *name,
-				      bool ctx,
+				      struct virtio_vq_config *vq_cfg,
 				      u16 msix_vec);
 	void (*del_vq)(struct virtio_pci_vq_info *info);
 
@@ -126,10 +124,7 @@ bool vp_notify(struct virtqueue *vq);
 /* the config->del_vqs() implementation */
 void vp_del_vqs(struct virtio_device *vdev);
 /* the config->find_vqs() implementation */
-int vp_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
-		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], const bool *ctx,
-		struct irq_affinity *desc);
+int vp_find_vqs(struct virtio_device *vdev, struct virtio_vq_config *cfg);
 const char *vp_bus_name(struct virtio_device *vdev);
 
 /* Setup the affinity for a virtqueue:
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index d9cbb02b35a1..a8de653dd7a7 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -110,9 +110,7 @@ static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
 static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				  struct virtio_pci_vq_info *info,
 				  unsigned int index,
-				  void (*callback)(struct virtqueue *vq),
-				  const char *name,
-				  bool ctx,
+				  struct virtio_vq_config *cfg,
 				  u16 msix_vec)
 {
 	struct virtqueue *vq;
@@ -130,8 +128,11 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	/* create the vring */
 	vq = vring_create_virtqueue(index, num,
 				    VIRTIO_PCI_VRING_ALIGN, &vp_dev->vdev,
-				    true, false, ctx,
-				    vp_notify, callback, name);
+				    true, false,
+				    cfg->ctx ? cfg->ctx[index] : false,
+				    vp_notify,
+				    cfg->callbacks[index],
+				    cfg->names[index]);
 	if (!vq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index f62b530aa3b5..bcb829ffec64 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -530,9 +530,7 @@ static bool vp_notify_with_data(struct virtqueue *vq)
 static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				  struct virtio_pci_vq_info *info,
 				  unsigned int index,
-				  void (*callback)(struct virtqueue *vq),
-				  const char *name,
-				  bool ctx,
+				  struct virtio_vq_config *cfg,
 				  u16 msix_vec)
 {
 
@@ -563,8 +561,11 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	/* create the vring */
 	vq = vring_create_virtqueue(index, num,
 				    SMP_CACHE_BYTES, &vp_dev->vdev,
-				    true, true, ctx,
-				    notify, callback, name);
+				    true, true,
+				    cfg->ctx ? cfg->ctx[index] : false,
+				    notify,
+				    cfg->callbacks[index],
+				    cfg->names[index]);
 	if (!vq)
 		return ERR_PTR(-ENOMEM);
 
@@ -593,15 +594,11 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	return ERR_PTR(err);
 }
 
-static int vp_modern_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
-			      struct virtqueue *vqs[],
-			      vq_callback_t *callbacks[],
-			      const char * const names[], const bool *ctx,
-			      struct irq_affinity *desc)
+static int vp_modern_find_vqs(struct virtio_device *vdev, struct virtio_vq_config *cfg)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct virtqueue *vq;
-	int rc = vp_find_vqs(vdev, nvqs, vqs, callbacks, names, ctx, desc);
+	int rc = vp_find_vqs(vdev, cfg);
 
 	if (rc)
 		return rc;
@@ -739,10 +736,17 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 static int vp_modern_create_avq(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	vq_callback_t *callbacks[] = { NULL };
+	struct virtio_vq_config cfg = {};
 	struct virtio_pci_admin_vq *avq;
 	struct virtqueue *vq;
+	const char *names[1];
 	u16 admin_q_num;
 
+	cfg.nvqs = 1;
+	cfg.callbacks = callbacks;
+	cfg.names = names;
+
 	if (!virtio_has_feature(vdev, VIRTIO_F_ADMIN_VQ))
 		return 0;
 
@@ -753,8 +757,10 @@ static int vp_modern_create_avq(struct virtio_device *vdev)
 	avq = &vp_dev->admin_vq;
 	avq->vq_index = vp_modern_avq_index(&vp_dev->mdev);
 	sprintf(avq->name, "avq.%u", avq->vq_index);
-	vq = vp_dev->setup_vq(vp_dev, &vp_dev->admin_vq.info, avq->vq_index, NULL,
-			      avq->name, NULL, VIRTIO_MSI_NO_VECTOR);
+
+	cfg.names[0] = avq->name;
+	vq = vp_dev->setup_vq(vp_dev, &vp_dev->admin_vq.info, avq->vq_index,
+			      &cfg, VIRTIO_MSI_NO_VECTOR);
 	if (IS_ERR(vq)) {
 		dev_err(&vdev->dev, "failed to setup admin virtqueue, err=%ld",
 			PTR_ERR(vq));
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index c1a3fbacd463..8cc2eb02c929 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -142,8 +142,7 @@ static irqreturn_t virtio_vdpa_virtqueue_cb(void *private)
 
 static struct virtqueue *
 virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
-		     void (*callback)(struct virtqueue *vq),
-		     const char *name, bool ctx)
+		     struct virtio_vq_config *cfg)
 {
 	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
 	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
@@ -161,9 +160,6 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	bool may_reduce_num = true;
 	int err;
 
-	if (!name)
-		return NULL;
-
 	if (index >= vdpa->nvqs)
 		return ERR_PTR(-ENOENT);
 
@@ -206,8 +202,12 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	else
 		dma_dev = vdpa_get_dma_dev(vdpa);
 	vq = vring_create_virtqueue_dma(index, max_num, align, vdev,
-					true, may_reduce_num, ctx,
-					notify, callback, name, dma_dev);
+					true, may_reduce_num,
+					cfg->ctx ? cfg->ctx[index] : false,
+					notify,
+					cfg->callbacks[index],
+					cfg->names[index],
+					dma_dev);
 	if (!vq) {
 		err = -ENOMEM;
 		goto error_new_virtqueue;
@@ -216,7 +216,7 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	vq->num_max = max_num;
 
 	/* Setup virtqueue callback */
-	cb.callback = callback ? virtio_vdpa_virtqueue_cb : NULL;
+	cb.callback = cfg->callbacks[cfg->cfg_idx] ? virtio_vdpa_virtqueue_cb : NULL;
 	cb.private = info;
 	cb.trigger = NULL;
 	ops->set_vq_cb(vdpa, index, &cb);
@@ -356,12 +356,8 @@ create_affinity_masks(unsigned int nvecs, struct irq_affinity *affd)
 	return masks;
 }
 
-static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
-				struct virtqueue *vqs[],
-				vq_callback_t *callbacks[],
-				const char * const names[],
-				const bool *ctx,
-				struct irq_affinity *desc)
+static int virtio_vdpa_find_vqs(struct virtio_device *vdev,
+				struct virtio_vq_config *cfg)
 {
 	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
 	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
@@ -369,19 +365,19 @@ static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 	struct irq_affinity default_affd = { 0 };
 	struct cpumask *masks;
 	struct vdpa_callback cb;
-	bool has_affinity = desc && ops->set_vq_affinity;
+	bool has_affinity = cfg->desc && ops->set_vq_affinity;
+	struct virtqueue **vqs = cfg->vqs;
+	unsigned int nvqs = cfg->nvqs;
 	int i, err, queue_idx = 0;
 
 	if (has_affinity) {
-		masks = create_affinity_masks(nvqs, desc ? desc : &default_affd);
+		masks = create_affinity_masks(nvqs, cfg->desc ? cfg->desc : &default_affd);
 		if (!masks)
 			return -ENOMEM;
 	}
 
 	for (i = 0; i < nvqs; ++i) {
-		vqs[i] = virtio_vdpa_setup_vq(vdev, queue_idx++,
-					      callbacks[i], names[i], ctx ?
-					      ctx[i] : false);
+		vqs[i] = virtio_vdpa_setup_vq(vdev, queue_idx++, cfg);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
 			goto err_setup_vq;
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index d362a29550fa..5fc585e115bc 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -18,6 +18,28 @@ struct virtio_shm_region {
 
 typedef void vq_callback_t(struct virtqueue *);
 
+/**
+ * struct virtio_vq_config - configure for find_vqs()
+ * @nvqs: the number of virtqueues to find
+ * @vqs: on success, includes new virtqueues
+ * @callbacks: array of callbacks, for each virtqueue
+ *	include a NULL entry for vqs that do not need a callback
+ * @names: array of virtqueue names (mainly for debugging)
+ * @ctx: (optional) array of context. If the value of the vq in the array
+ *	is true, the driver can pass ctx to virtio core when adding bufs to
+ *	virtqueue.
+ * @desc: desc for interrupts
+ */
+struct virtio_vq_config {
+	unsigned int nvqs;
+
+	struct virtqueue   **vqs;
+	vq_callback_t      **callbacks;
+	const char         **names;
+	const bool          *ctx;
+	struct irq_affinity *desc;
+};
+
 /**
  * struct virtio_config_ops - operations for configuring a virtio device
  * Note: Do not assume that a transport implements all of the operations
@@ -51,11 +73,7 @@ typedef void vq_callback_t(struct virtqueue *);
  *	parallel with being added/removed.
  * @find_vqs: find virtqueues and instantiate them.
  *	vdev: the virtio_device
- *	nvqs: the number of virtqueues to find
- *	vqs: on success, includes new virtqueues
- *	callbacks: array of callbacks, for each virtqueue
- *		include a NULL entry for vqs that do not need a callback
- *	names: array of virtqueue names (mainly for debugging)
+ *	cfg: the config from the driver
  *	Returns 0 on success or error status
  * @del_vqs: free virtqueues found by find_vqs().
  * @synchronize_cbs: synchronize with the virtqueue callbacks (optional)
@@ -95,6 +113,7 @@ typedef void vq_callback_t(struct virtqueue *);
  * @create_avq: create admin virtqueue resource.
  * @destroy_avq: destroy admin virtqueue resource.
  */
+
 struct virtio_config_ops {
 	void (*get)(struct virtio_device *vdev, unsigned offset,
 		    void *buf, unsigned len);
@@ -104,10 +123,7 @@ struct virtio_config_ops {
 	u8 (*get_status)(struct virtio_device *vdev);
 	void (*set_status)(struct virtio_device *vdev, u8 status);
 	void (*reset)(struct virtio_device *vdev);
-	int (*find_vqs)(struct virtio_device *, unsigned nvqs,
-			struct virtqueue *vqs[], vq_callback_t *callbacks[],
-			const char * const names[], const bool *ctx,
-			struct irq_affinity *desc);
+	int (*find_vqs)(struct virtio_device *vdev, struct virtio_vq_config *cfg);
 	void (*del_vqs)(struct virtio_device *);
 	void (*synchronize_cbs)(struct virtio_device *);
 	u64 (*get_features)(struct virtio_device *vdev);
@@ -216,8 +232,14 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
 	vq_callback_t *callbacks[] = { c };
 	const char *names[] = { n };
 	struct virtqueue *vq;
-	int err = vdev->config->find_vqs(vdev, 1, &vq, callbacks, names, NULL,
-					 NULL);
+	struct virtio_vq_config cfg = {};
+
+	cfg.nvqs = 1;
+	cfg.vqs = &vq;
+	cfg.callbacks = callbacks;
+	cfg.names = names;
+
+	int err = vdev->config->find_vqs(vdev, &cfg);
 	if (err < 0)
 		return ERR_PTR(err);
 	return vq;
@@ -225,21 +247,37 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
 
 static inline
 int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
-			struct virtqueue *vqs[], vq_callback_t *callbacks[],
-			const char * const names[],
-			struct irq_affinity *desc)
+		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
+		    const char * const names[],
+		    struct irq_affinity *desc)
 {
-	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
+	struct virtio_vq_config cfg = {};
+
+	cfg.nvqs = nvqs;
+	cfg.vqs = vqs;
+	cfg.callbacks = callbacks;
+	cfg.names = (const char **)names;
+	cfg.desc = desc;
+
+	return vdev->config->find_vqs(vdev, &cfg);
 }
 
 static inline
 int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
 			struct virtqueue *vqs[], vq_callback_t *callbacks[],
-			const char * const names[], const bool *ctx,
+			const char *names[], const bool *ctx,
 			struct irq_affinity *desc)
 {
-	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, ctx,
-				      desc);
+	struct virtio_vq_config cfg = {};
+
+	cfg.nvqs = nvqs;
+	cfg.vqs = vqs;
+	cfg.callbacks = callbacks;
+	cfg.names = names;
+	cfg.ctx = ctx;
+	cfg.desc = desc;
+
+	return vdev->config->find_vqs(vdev, &cfg);
 }
 
 /**
-- 
2.32.0.3.g01195cf9f


