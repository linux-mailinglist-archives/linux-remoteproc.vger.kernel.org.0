Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83185227B41
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Jul 2020 10:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgGUI4o (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Jul 2020 04:56:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:26706 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgGUI4n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jul 2020 04:56:43 -0400
IronPort-SDR: 6MY+9rRLTa2d6YwLrjTNsxQaIaR450RwyhcXr1DAVrFCYV4PRJSD/K61qjEUuY34xaF9YLhfva
 UtXvp+BRojdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="138185710"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="138185710"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 01:56:42 -0700
IronPort-SDR: TpdKrDz9JGh4iMjJ9lzszW63bLwgZ1ozoUcNU3k9So1MPTZ+sz+xE9w5PU6C13pNQrszS4khGL
 cYroNWPl6bBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="271662711"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.33.230])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2020 01:56:40 -0700
Date:   Tue, 21 Jul 2020 10:56:38 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [PATCH RESEND v4] rpmsg: virtio: add endianness conversions
Message-ID: <20200721085638.GA3815@ubuntu>
References: <20200616061456.GA2999@ubuntu>
 <20200616073011.GB2999@ubuntu>
 <20200630175057.GA3831001@xps15>
 <20200701055912-mutt-send-email-mst@kernel.org>
 <20200706124716.GA5457@ubuntu>
 <20200706125657.GB5457@ubuntu>
 <20200706133835.GC5457@ubuntu>
 <c5a4b0c7-859e-24ad-cf1e-3f80a2f15f38@st.com>
 <20200707153436.GA5970@ubuntu>
 <CANLsYkwuPsm+5uCWc91NLF4oxANvxVvgQ9NcRnoPAoVRGk+H5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwuPsm+5uCWc91NLF4oxANvxVvgQ9NcRnoPAoVRGk+H5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

According to the VirtIO 1.0 spec data, sent over virtual queues must
be in little-endian format. Update the RPMsg VirtIO implementation
to enforce that but let legacy configurations continue use native
endianness.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---

Ping: 2 weeks since the original submission. Also added back the updated
"reviewed-by" tag.

v4: fix a left-over use of an LE value in calculation - thanks to Arnaud for
catching!

v3: use the virtio_byteorder.h header

v2: Following suggestions from Michael and Mathieu switch to using virtio16/32
types and conversion functions.

 drivers/rpmsg/virtio_rpmsg_bus.c | 63 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 07d4f3374098..9006fc7f73d0 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/virtio.h>
+#include <linux/virtio_byteorder.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/wait.h>
@@ -84,11 +85,11 @@ struct virtproc_info {
  * Every message sent(/received) on the rpmsg bus begins with this header.
  */
 struct rpmsg_hdr {
-	u32 src;
-	u32 dst;
-	u32 reserved;
-	u16 len;
-	u16 flags;
+	__virtio32 src;
+	__virtio32 dst;
+	__virtio32 reserved;
+	__virtio16 len;
+	__virtio16 flags;
 	u8 data[];
 } __packed;
 
@@ -106,8 +107,8 @@ struct rpmsg_hdr {
  */
 struct rpmsg_ns_msg {
 	char name[RPMSG_NAME_SIZE];
-	u32 addr;
-	u32 flags;
+	__virtio32 addr;
+	__virtio32 flags;
 } __packed;
 
 /**
@@ -335,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_CREATE;
+		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -359,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_DESTROY;
+		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -612,18 +613,18 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 		}
 	}
 
-	msg->len = len;
+	msg->len = cpu_to_virtio16(vrp->vdev, len);
 	msg->flags = 0;
-	msg->src = src;
-	msg->dst = dst;
+	msg->src = cpu_to_virtio32(vrp->vdev, src);
+	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
 	msg->reserved = 0;
 	memcpy(msg->data, data, len);
 
 	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
-		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
+		src, dst, len, msg->flags, msg->reserved);
 #if defined(CONFIG_DYNAMIC_DEBUG)
 	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
-			 msg, sizeof(*msg) + msg->len, true);
+			 msg, sizeof(*msg) + len, true);
 #endif
 
 	rpmsg_sg_init(&sg, msg, sizeof(*msg) + len);
@@ -704,13 +705,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 {
 	struct rpmsg_endpoint *ept;
 	struct scatterlist sg;
+	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
 	int err;
 
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
-		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
+		virtio32_to_cpu(vrp->vdev, msg->src),
+		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
+		virtio16_to_cpu(vrp->vdev, msg->flags),
+		virtio32_to_cpu(vrp->vdev, msg->reserved));
 #if defined(CONFIG_DYNAMIC_DEBUG)
 	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
-			 msg, sizeof(*msg) + msg->len, true);
+			 msg, sizeof(*msg) + msg_len, true);
 #endif
 
 	/*
@@ -718,15 +723,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * the reported payload length.
 	 */
 	if (len > vrp->buf_size ||
-	    msg->len > (len - sizeof(struct rpmsg_hdr))) {
-		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
+	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
+		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
 	}
 
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 
-	ept = idr_find(&vrp->endpoints, msg->dst);
+	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
 
 	/* let's make sure no one deallocates ept while we use it */
 	if (ept)
@@ -739,8 +744,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		mutex_lock(&ept->cb_lock);
 
 		if (ept->cb)
-			ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
-				msg->src);
+			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
+				virtio32_to_cpu(vrp->vdev, msg->src));
 
 		mutex_unlock(&ept->cb_lock);
 
@@ -846,15 +851,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	/* don't trust the remote processor for null terminating the name */
 	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
 
-	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
-		 msg->name, msg->addr);
-
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = msg->addr;
+	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
+
+	dev_info(dev, "%sing channel %s addr 0x%x\n",
+		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
+		 "destroy" : "creat", msg->name, chinfo.dst);
 
-	if (msg->flags & RPMSG_NS_DESTROY) {
+	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
 		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-- 
2.27.0

