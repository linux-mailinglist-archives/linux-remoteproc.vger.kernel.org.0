Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDDE1F18E5
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 Jun 2020 14:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgFHMji (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 8 Jun 2020 08:39:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:28440 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgFHMjh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 08:39:37 -0400
IronPort-SDR: BKTZAfERdgStE/rPtvjev2S16WM5sTPqggyz9z2W4aWbYIiw3EFcQ59Y4GUSIizQtu+vfyJK4m
 NTizilkM/UyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 05:39:36 -0700
IronPort-SDR: W8zLtZIYRLHlc+ADwd5DKcd8F+ttu8Ry5yMSvsH35hgJQjchf4Oa2v9MWyskb33nEoOkxU3n8x
 ZSImkPLdLmyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="349157608"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.46.212])
  by orsmga001.jf.intel.com with ESMTP; 08 Jun 2020 05:39:34 -0700
Date:   Mon, 8 Jun 2020 14:39:32 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [PATCH] rpmsg: virtio: add endianness conversions
Message-ID: <20200608123932.GF10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

According to the VirtIO 1.0 spec data, sent over virtual queues must
be in little-endian format. Update the RPMsg VirtIO implementation
to enforce that.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 61 ++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 07d4f33..b8ff42b 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -11,6 +11,8 @@
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
+#include <asm/byteorder.h>
+
 #include <linux/dma-mapping.h>
 #include <linux/idr.h>
 #include <linux/jiffies.h>
@@ -22,6 +24,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/types.h>
 #include <linux/virtio.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
@@ -84,11 +87,11 @@ struct virtproc_info {
  * Every message sent(/received) on the rpmsg bus begins with this header.
  */
 struct rpmsg_hdr {
-	u32 src;
-	u32 dst;
-	u32 reserved;
-	u16 len;
-	u16 flags;
+	__le32 src;
+	__le32 dst;
+	__le32 reserved;
+	__le16 len;
+	__le16 flags;
 	u8 data[];
 } __packed;
 
@@ -106,8 +109,8 @@ struct rpmsg_hdr {
  */
 struct rpmsg_ns_msg {
 	char name[RPMSG_NAME_SIZE];
-	u32 addr;
-	u32 flags;
+	__le32 addr;
+	__le32 flags;
 } __packed;
 
 /**
@@ -335,8 +338,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_CREATE;
+		nsm.addr = cpu_to_le32(rpdev->ept->addr);
+		nsm.flags = cpu_to_le32(RPMSG_NS_CREATE);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -359,8 +362,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_DESTROY;
+		nsm.addr = cpu_to_le32(rpdev->ept->addr);
+		nsm.flags = cpu_to_le32(RPMSG_NS_DESTROY);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -612,15 +615,15 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 		}
 	}
 
-	msg->len = len;
+	msg->len = cpu_to_le16(len);
 	msg->flags = 0;
-	msg->src = src;
-	msg->dst = dst;
+	msg->src = cpu_to_le32(src);
+	msg->dst = cpu_to_le32(dst);
 	msg->reserved = 0;
 	memcpy(msg->data, data, len);
 
 	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
-		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
+		src, dst, len, msg->flags, msg->reserved);
 #if defined(CONFIG_DYNAMIC_DEBUG)
 	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
 			 msg, sizeof(*msg) + msg->len, true);
@@ -704,13 +707,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 {
 	struct rpmsg_endpoint *ept;
 	struct scatterlist sg;
+	unsigned int msg_len = le16_to_cpu(msg->len);
 	int err;
 
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
-		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
+		le32_to_cpu(msg->src), le32_to_cpu(msg->dst), msg_len,
+		le16_to_cpu(msg->flags), le32_to_cpu(msg->reserved));
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
+	ept = idr_find(&vrp->endpoints, le32_to_cpu(msg->dst));
 
 	/* let's make sure no one deallocates ept while we use it */
 	if (ept)
@@ -739,8 +744,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		mutex_lock(&ept->cb_lock);
 
 		if (ept->cb)
-			ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
-				msg->src);
+			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
+				le32_to_cpu(msg->src));
 
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
+	chinfo.dst = le32_to_cpu(msg->addr);
+
+	dev_info(dev, "%sing channel %s addr 0x%x\n",
+		 le32_to_cpu(msg->flags) & RPMSG_NS_DESTROY ? "destroy" : "creat",
+		 msg->name, chinfo.dst);
 
-	if (msg->flags & RPMSG_NS_DESTROY) {
+	if (le32_to_cpu(msg->flags) & RPMSG_NS_DESTROY) {
 		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-- 
1.9.3

