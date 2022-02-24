Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021514C253C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 24 Feb 2022 09:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiBXIM2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 24 Feb 2022 03:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbiBXIMK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Feb 2022 03:12:10 -0500
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04126251E69;
        Thu, 24 Feb 2022 00:11:29 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0V5NDoAE_1645690283;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0V5NDoAE_1645690283)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 24 Feb 2022 16:11:24 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH v6 10/26] virtio_ring: packed: implement virtqueue_reset_vring_packed()
Date:   Thu, 24 Feb 2022 16:10:46 +0800
Message-Id: <20220224081102.80224-11-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220224081102.80224-1-xuanzhuo@linux.alibaba.com>
References: <20220224081102.80224-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: bd1c915e263f
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

virtio ring supports reset.

Queue reset is divided into several stages.

1. notify device queue reset
2. vring release
3. attach new vring
4. notify device queue re-enable

After the first step is completed, the vring reset operation can be
performed. If the newly set vring num does not change, then just reset
the vq related value.

Otherwise, the vring will be released and the vring will be reallocated.
And the vring will be attached to the vq. If this process fails, the
function will exit, and the state of the vq will be the vring release
state. You can call this function again to reallocate the vring.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a2e771263ea7..3ee2d0e17515 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1886,6 +1886,8 @@ static int vring_virtqueue_attach_packed(struct vring_virtqueue *vq,
 static void vring_virtqueue_init_packed(struct vring_virtqueue *vq,
 					struct virtio_device *vdev)
 {
+	vq->vq.reset = VIRTIO_VQ_RESET_STEP_NONE;
+
 	vq->we_own_ring = true;
 	vq->broken = false;
 	vq->last_used_idx = 0;
@@ -1969,6 +1971,50 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	return NULL;
 }
 
+static int virtqueue_reset_vring_packed(struct virtqueue *_vq, u32 num)
+{
+	struct vring_virtqueue *vq = to_vvq(_vq);
+	struct virtio_device *vdev = _vq->vdev;
+	struct vring_packed vring;
+	int err;
+
+	if (num > _vq->num_max)
+		return -E2BIG;
+
+	switch (vq->vq.reset) {
+	case VIRTIO_VQ_RESET_STEP_NONE:
+		return -ENOENT;
+
+	case VIRTIO_VQ_RESET_STEP_VRING_ATTACH:
+	case VIRTIO_VQ_RESET_STEP_DEVICE:
+		if (vq->packed.vring.num == num || !num)
+			break;
+
+		vring_free(_vq);
+
+		fallthrough;
+
+	case VIRTIO_VQ_RESET_STEP_VRING_RELEASE:
+		if (!num)
+			num = vq->packed.vring.num;
+
+		err = vring_create_vring_packed(&vring, vdev, num);
+		if (err)
+			return -ENOMEM;
+
+		err = vring_virtqueue_attach_packed(vq, &vring, vdev);
+		if (err) {
+			vring_free_vring_packed(&vring, vdev);
+			return -ENOMEM;
+		}
+	}
+
+	vring_virtqueue_init_packed(vq, vdev);
+	vq->vq.reset = VIRTIO_VQ_RESET_STEP_VRING_ATTACH;
+
+	return 0;
+}
+
 
 /*
  * Generic functions and exported symbols.
-- 
2.31.0

