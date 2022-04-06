Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73254F651F
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Apr 2022 18:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbiDFQNY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 6 Apr 2022 12:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237680AbiDFQMg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Apr 2022 12:12:36 -0400
Received: from out30-54.freemail.mail.aliyun.com (out30-54.freemail.mail.aliyun.com [115.124.30.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D9424BD73;
        Tue,  5 Apr 2022 20:44:10 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0V9JmrcR_1649216644;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0V9JmrcR_1649216644)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 06 Apr 2022 11:44:05 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     virtualization@lists.linux-foundation.org
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
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH v9 08/32] virtio_ring: split: extract the logic of attach vring
Date:   Wed,  6 Apr 2022 11:43:22 +0800
Message-Id: <20220406034346.74409-9-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 881cb3483d12
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Separate the logic of attach vring, subsequent patches will call it
separately.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 6de67439cb57..083f2992ba0d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -916,6 +916,19 @@ static void *virtqueue_detach_unused_buf_split(struct virtqueue *_vq)
 	return NULL;
 }
 
+static void vring_virtqueue_attach_split(struct vring_virtqueue *vq,
+					 struct vring vring,
+					 struct vring_desc_state_split *desc_state,
+					 struct vring_desc_extra *desc_extra)
+{
+	vq->split.vring = vring;
+	vq->split.queue_dma_addr = 0;
+	vq->split.queue_size_in_bytes = 0;
+
+	vq->split.desc_state = desc_state;
+	vq->split.desc_extra = desc_extra;
+}
+
 static int vring_alloc_state_extra_split(u32 num,
 					 struct vring_desc_state_split **desc_state,
 					 struct vring_desc_extra **desc_extra)
@@ -2262,10 +2275,6 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
 		vq->weak_barriers = false;
 
-	vq->split.queue_dma_addr = 0;
-	vq->split.queue_size_in_bytes = 0;
-
-	vq->split.vring = vring;
 	vq->split.avail_flags_shadow = 0;
 	vq->split.avail_idx_shadow = 0;
 
@@ -2283,8 +2292,7 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 		return NULL;
 	}
 
-	vq->split.desc_state = state;
-	vq->split.desc_extra = extra;
+	vring_virtqueue_attach_split(vq, vring, state, extra);
 
 	/* Put everything in free lists. */
 	vq->free_head = 0;
-- 
2.31.0

