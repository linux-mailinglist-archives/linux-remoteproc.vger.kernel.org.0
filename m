Return-Path: <linux-remoteproc+bounces-1793-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102792D0EC
	for <lists+linux-remoteproc@lfdr.de>; Wed, 10 Jul 2024 13:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAC7728A6E3
	for <lists+linux-remoteproc@lfdr.de>; Wed, 10 Jul 2024 11:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32059191466;
	Wed, 10 Jul 2024 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKy73gbW"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138C5190685
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611796; cv=none; b=jTMdzBfb26HBcdPu+/TFdQW51ouZr98Tyy4WOesN/Lle1XQx7MvCum+hyMZIrOi6S7XHtL0Hrqo5CBAmzRjcVBZvvH3oYcr9EjPD3uZVfZ4b5sLI/S4pjeHiVYvVW9YseY2ElFmhOdfgonqDAIEcqIDHbRI3JTcmICJxj0jquXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611796; c=relaxed/simple;
	bh=hZFig92XR51IvT8IRN1su2UTFsFR40kJ/6n4IuiB7E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+lP57cjjUa6j8J5mcscor89WgfWn3BMMT/dMt1/wuWz+llHBe1v2HawbkBmdWlNyKpRemetdolas92UC0EfU8fzKawzd6PBPYpBxJYU9TH6RLNgvhOPuv8STRW02GZ3oImEnHD0hnQCiWpznwFtU6TiiaVuSnzfCbubm/m2lpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKy73gbW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720611793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dantDwMOlETrf9aGxvEc7PJAx1dHcQNitKFTmPZgcf0=;
	b=XKy73gbWx4EP1LEmrjCqFR1SZZuJ2FLgEp3koN4uu7leLQPSabWe6MVbQp935LVY/zRpoh
	BmRb8s03ZdTpjooXrLVaPlvR4tMMQ3I1v8IRwZsAPnqCmaFcynXR4LEYQ1xiYo1L2YJP5/
	cnI2wPDEIYUSFEXtZC698Hj0/xOTjLA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-2N76OdqLNL2xnv0M1dh3FQ-1; Wed, 10 Jul 2024 07:43:11 -0400
X-MC-Unique: 2N76OdqLNL2xnv0M1dh3FQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e98693f43so6403957e87.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 04:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611790; x=1721216590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dantDwMOlETrf9aGxvEc7PJAx1dHcQNitKFTmPZgcf0=;
        b=eIYGsAUWn0MOvSQ2pKXfbNoIjDH/RtClda53F2RHONF8Gmmb1GeggOyemlw+s3IdeO
         X0TZF9E+cbHuz1iTeI+bXgp8BgDQl3WdNDPhlqivVdYtMfmYQBkegqbOoQnMRoTFAYY5
         0cGOh1SKCTlOl9kUsiLVdX6ljjQ8gbYO3pRVlrUq/AR0dPQp7Xx2u1YElflRXykqynrW
         FSAxdENlZPqvMmKSXStOXR6jxr2Z90m77eW2iU/T+r4Fa7x0twYzz17s8crRW2qKoK6J
         S7PygCNSbZbWwhB74BcdDe1Ud5+Oeyk4kwWqErfWKtub75xKUwZSA4iV91xJf7ljn18w
         VX8w==
X-Forwarded-Encrypted: i=1; AJvYcCXg+Q+WJG3f/0JK38+kd15yxcgmudghtbBmaesMMmGi2kTc7IwaNAN/JH1zwDQMzn/EkGuNvZaf7M+IY2aPL1OCqHgQ8xQbjY/y/2+FPxyrVg==
X-Gm-Message-State: AOJu0Yxjflo/c9pinUzq3EGopbWAv6MTfOgyfRNyh9tw6Jo4MSpdHt2j
	Q62P9gRU+zHjhKc/9CAX+6BguKrc8eAr3D6ws2+xMZVgaTYZoYMRRaK9UKl1uZSsbtRW2JKymSV
	adwdS6t6Yg1BqiLpYlS+UEve/sbC5N5TuuBQsBZ4qvF+WeYMzeiNYFhsI2Xh2ko7rwko=
X-Received: by 2002:a05:6512:3b14:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-52eb9991651mr4077094e87.17.1720611790018;
        Wed, 10 Jul 2024 04:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgkEXUDq3v4r1GoviXAGSNIk0Zdz6VLo68qEF34tyrv1bXKV9EaKdlhd51uHaPo0VqKgOvbQ==
X-Received: by 2002:a05:6512:3b14:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-52eb9991651mr4077074e87.17.1720611789296;
        Wed, 10 Jul 2024 04:43:09 -0700 (PDT)
Received: from redhat.com ([2a02:14f:174:f6ae:a6e3:8cbc:2cbd:b8ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74159csm77658215e9.42.2024.07.10.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:43:08 -0700 (PDT)
Date: Wed, 10 Jul 2024 07:42:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
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
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	linux-um@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 2/2] virtio: fix vq # for balloon
Message-ID: <3d655be73ce220f176b2c163839d83699f8faf43.1720611677.git.mst@redhat.com>
References: <cover.1720611677.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720611677.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

virtio balloon communicates to the core that in some
configurations vq #s are non-contiguous by setting name
pointer to NULL.

Unfortunately, core then turned around and just made them
contiguous again. Result is that driver is out of spec.

Implement what the API was supposed to do
in the 1st place. Compatibility with buggy hypervisors
is handled inside virtio-balloon, which is the only driver
making use of this facility, so far.

Message-ID: <cover.1720173841.git.mst@redhat.com>
Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
Cc: "Alexander Duyck" <alexander.h.duyck@linux.intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/um/drivers/virtio_uml.c           |  4 ++--
 drivers/remoteproc/remoteproc_virtio.c |  4 ++--
 drivers/s390/virtio/virtio_ccw.c       |  4 ++--
 drivers/virtio/virtio_mmio.c           |  4 ++--
 drivers/virtio/virtio_pci_common.c     | 11 ++++++++---
 drivers/virtio/virtio_vdpa.c           |  4 ++--
 6 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
index 2b6e701776b6..c903e4959f51 100644
--- a/arch/um/drivers/virtio_uml.c
+++ b/arch/um/drivers/virtio_uml.c
@@ -1019,7 +1019,7 @@ static int vu_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		       struct irq_affinity *desc)
 {
 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
-	int i, queue_idx = 0, rc;
+	int i, rc;
 	struct virtqueue *vq;
 
 	/* not supported for now */
@@ -1038,7 +1038,7 @@ static int vu_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 			continue;
 		}
 
-		vqs[i] = vu_setup_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = vu_setup_vq(vdev, i, vqi->callback,
 				     vqi->name, vqi->ctx);
 		if (IS_ERR(vqs[i])) {
 			rc = PTR_ERR(vqs[i]);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d3f39009b28e..1019b2825c26 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -185,7 +185,7 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 				 struct virtqueue_info vqs_info[],
 				 struct irq_affinity *desc)
 {
-	int i, ret, queue_idx = 0;
+	int i, ret;
 
 	for (i = 0; i < nvqs; ++i) {
 		struct virtqueue_info *vqi = &vqs_info[i];
@@ -195,7 +195,7 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 			continue;
 		}
 
-		vqs[i] = rp_find_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = rp_find_vq(vdev, i, vqi->callback,
 				    vqi->name, vqi->ctx);
 		if (IS_ERR(vqs[i])) {
 			ret = PTR_ERR(vqs[i]);
diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 62eca9419ad7..82a3440bbabb 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -694,7 +694,7 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 {
 	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
 	dma64_t *indicatorp = NULL;
-	int ret, i, queue_idx = 0;
+	int ret, i;
 	struct ccw1 *ccw;
 	dma32_t indicatorp_dma = 0;
 
@@ -710,7 +710,7 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 			continue;
 		}
 
-		vqs[i] = virtio_ccw_setup_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = virtio_ccw_setup_vq(vdev, i, vqi->callback,
 					     vqi->name, vqi->ctx, ccw);
 		if (IS_ERR(vqs[i])) {
 			ret = PTR_ERR(vqs[i]);
diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 90e784e7b721..db6a0366f082 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -494,7 +494,7 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 	int irq = platform_get_irq(vm_dev->pdev, 0);
-	int i, err, queue_idx = 0;
+	int i, err;
 
 	if (irq < 0)
 		return irq;
@@ -515,7 +515,7 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 			continue;
 		}
 
-		vqs[i] = vm_setup_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = vm_setup_vq(vdev, i, vqi->callback,
 				     vqi->name, vqi->ctx);
 		if (IS_ERR(vqs[i])) {
 			vm_del_vqs(vdev);
diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 7d82facafd75..fa606e7321ad 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -293,7 +293,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct virtqueue_info *vqi;
 	u16 msix_vec;
-	int i, err, nvectors, allocated_vectors, queue_idx = 0;
+	int i, err, nvectors, allocated_vectors;
 
 	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
 	if (!vp_dev->vqs)
@@ -332,7 +332,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
 			msix_vec = allocated_vectors++;
 		else
 			msix_vec = VP_MSIX_VQ_VECTOR;
-		vqs[i] = vp_setup_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = vp_setup_vq(vdev, i, vqi->callback,
 				     vqi->name, vqi->ctx, msix_vec);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
@@ -368,7 +368,7 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
 			    struct virtqueue_info vqs_info[])
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	int i, err, queue_idx = 0;
+	int i, err;
 
 	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
 	if (!vp_dev->vqs)
@@ -388,8 +388,13 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
 			vqs[i] = NULL;
 			continue;
 		}
+<<<<<<< HEAD
 		vqs[i] = vp_setup_vq(vdev, queue_idx++, vqi->callback,
 				     vqi->name, vqi->ctx,
+=======
+		vqs[i] = vp_setup_vq(vdev, i, callbacks[i], names[i],
+				     ctx ? ctx[i] : false,
+>>>>>>> f814759f80b7... virtio: fix vq # for balloon
 				     VIRTIO_MSI_NO_VECTOR);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index 7364bd53e38d..149e893583e9 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -368,7 +368,7 @@ static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 	struct cpumask *masks;
 	struct vdpa_callback cb;
 	bool has_affinity = desc && ops->set_vq_affinity;
-	int i, err, queue_idx = 0;
+	int i, err;
 
 	if (has_affinity) {
 		masks = create_affinity_masks(nvqs, desc ? desc : &default_affd);
@@ -384,7 +384,7 @@ static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 			continue;
 		}
 
-		vqs[i] = virtio_vdpa_setup_vq(vdev, queue_idx++, vqi->callback,
+		vqs[i] = virtio_vdpa_setup_vq(vdev, i, vqi->callback,
 					      vqi->name, vqi->ctx);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
-- 
MST


