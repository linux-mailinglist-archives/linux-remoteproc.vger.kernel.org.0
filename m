Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBEBA4D8A4B
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Mar 2022 18:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237570AbiCNRDD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Mar 2022 13:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236970AbiCNRDD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Mar 2022 13:03:03 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17D512A93;
        Mon, 14 Mar 2022 10:01:51 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22ECqRmj023781;
        Mon, 14 Mar 2022 18:01:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=bs34S5cmLmIOpzw+4RQ0N6JrznyTwQU44aexDRM3ApU=;
 b=QKK03LvVFMqvpZqBdsLeEwSkZxz30eQFnK34rUKm991LzMB/46bcYs5oBb2Xq0esDoGV
 bT5rqNjhhwf7JSdkHezNIG090RN2pluHMNlvCe7VQUXeuwF8QHVCBRwWDqsNLm4yhy0T
 sWG2eYWqZqPJ+ZUnw3oVcMyZeItfy5XenUS42gSLqzAPpFv7QpMHJJLdL/Vop7EOemf/
 t4o1fPj2AOvWxsx3opifS9O4fgx+o+CbAkxPC5zCM1In7ICdSfXA01V81X1BOZZI4vCW
 JMWvl3/RBwciDDqyVsAytrjLP9dfrOk+KNtY5EuC+MdyPEjGDHz549CQ1JgOSGRhp1GC Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63h1f3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Mar 2022 18:01:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC323100034;
        Mon, 14 Mar 2022 18:01:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D25A02309F1;
        Mon, 14 Mar 2022 18:01:41 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar 2022 18:01:41
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [RFC PATCH v4 1/4] remoteproc: core: Introduce virtio device add/remove functions
Date:   Mon, 14 Mar 2022 18:01:23 +0100
Message-ID: <20220314170126.2333996-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314170126.2333996-1-arnaud.pouliquen@foss.st.com>
References: <20220314170126.2333996-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In preparation of the migration of the management of rvdev in
remoteproc_virtio.c, this patch spins off new functions to manage the
remoteproc virtio device.
 - rproc_rvdev_add_device
 - rproc_rvdev_remove_device

The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
moved to remoteproc_virtio.c.

The rproc_vdev_data structure is introduced to provide information for
the rvdev creation. This structure allows to manage the rvdev and vrings
allocation in the rproc_rvdev_add_device function.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
Update vs previous revision:
 - remove useless commit sentence,
 - move rproc_vdev_data declaration in remoteproc_internal.h.
---
 drivers/remoteproc/remoteproc_core.c     | 157 +++++++++++++----------
 drivers/remoteproc/remoteproc_internal.h |  15 +++
 2 files changed, 106 insertions(+), 66 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 69f51acf235e..42daa36a94c0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -484,74 +484,23 @@ static int copy_dma_range_map(struct device *to, struct device *from)
 	return 0;
 }
 
-/**
- * rproc_handle_vdev() - handle a vdev fw resource
- * @rproc: the remote processor
- * @ptr: the vring resource descriptor
- * @offset: offset of the resource entry
- * @avail: size of available data (for sanity checking the image)
- *
- * This resource entry requests the host to statically register a virtio
- * device (vdev), and setup everything needed to support it. It contains
- * everything needed to make it possible: the virtio device id, virtio
- * device features, vrings information, virtio config space, etc...
- *
- * Before registering the vdev, the vrings are allocated from non-cacheable
- * physically contiguous memory. Currently we only support two vrings per
- * remote processor (temporary limitation). We might also want to consider
- * doing the vring allocation only later when ->find_vqs() is invoked, and
- * then release them upon ->del_vqs().
- *
- * Note: @da is currently not really handled correctly: we dynamically
- * allocate it using the DMA API, ignoring requested hard coded addresses,
- * and we don't take care of any required IOMMU programming. This is all
- * going to be taken care of when the generic iommu-based DMA API will be
- * merged. Meanwhile, statically-addressed iommu-based firmware images should
- * use RSC_DEVMEM resource entries to map their required @da to the physical
- * address of their base CMA region (ouch, hacky!).
- *
- * Return: 0 on success, or an appropriate error code otherwise
- */
-static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
-			     int offset, int avail)
+static struct rproc_vdev *
+rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
 {
-	struct fw_rsc_vdev *rsc = ptr;
-	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
-	int i, ret;
+	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
 	char name[16];
-
-	/* make sure resource isn't truncated */
-	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
-			avail) {
-		dev_err(dev, "vdev rsc is truncated\n");
-		return -EINVAL;
-	}
-
-	/* make sure reserved bytes are zeroes */
-	if (rsc->reserved[0] || rsc->reserved[1]) {
-		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
-		return -EINVAL;
-	}
-
-	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
-		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
-
-	/* we currently support only two vrings per rvdev */
-	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
-		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
-		return -EINVAL;
-	}
+	int i, ret;
 
 	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
 	if (!rvdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	kref_init(&rvdev->refcount);
 
-	rvdev->id = rsc->id;
+	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
-	rvdev->index = rproc->nb_vdev++;
+	rvdev->index = rvdev_data->index;
 
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
@@ -563,7 +512,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	ret = device_register(&rvdev->dev);
 	if (ret) {
 		put_device(&rvdev->dev);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
@@ -576,7 +525,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
 					   dma_get_mask(rproc->dev.parent));
 	if (ret) {
-		dev_warn(dev,
+		dev_warn(&rvdev->dev,
 			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
 			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
 	}
@@ -589,7 +538,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	}
 
 	/* remember the resource offset*/
-	rvdev->rsc_offset = offset;
+	rvdev->rsc_offset = rvdev_data->rsc_offset;
 
 	/* allocate the vring resources */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
@@ -605,21 +554,20 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 
 	rproc_add_subdev(rproc, &rvdev->subdev);
 
-	return 0;
+	return rvdev;
 
 unwind_vring_allocations:
 	for (i--; i >= 0; i--)
 		rproc_free_vring(&rvdev->vring[i]);
 free_rvdev:
 	device_unregister(&rvdev->dev);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-void rproc_vdev_release(struct kref *ref)
+static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
 {
-	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
-	struct rproc_vring *rvring;
 	struct rproc *rproc = rvdev->rproc;
+	struct rproc_vring *rvring;
 	int id;
 
 	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
@@ -632,6 +580,83 @@ void rproc_vdev_release(struct kref *ref)
 	device_unregister(&rvdev->dev);
 }
 
+/**
+ * rproc_handle_vdev() - handle a vdev fw resource
+ * @rproc: the remote processor
+ * @ptr: the vring resource descriptor
+ * @offset: offset of the resource entry
+ * @avail: size of available data (for sanity checking the image)
+ *
+ * This resource entry requests the host to statically register a virtio
+ * device (vdev), and setup everything needed to support it. It contains
+ * everything needed to make it possible: the virtio device id, virtio
+ * device features, vrings information, virtio config space, etc...
+ *
+ * Before registering the vdev, the vrings are allocated from non-cacheable
+ * physically contiguous memory. Currently we only support two vrings per
+ * remote processor (temporary limitation). We might also want to consider
+ * doing the vring allocation only later when ->find_vqs() is invoked, and
+ * then release them upon ->del_vqs().
+ *
+ * Note: @da is currently not really handled correctly: we dynamically
+ * allocate it using the DMA API, ignoring requested hard coded addresses,
+ * and we don't take care of any required IOMMU programming. This is all
+ * going to be taken care of when the generic iommu-based DMA API will be
+ * merged. Meanwhile, statically-addressed iommu-based firmware images should
+ * use RSC_DEVMEM resource entries to map their required @da to the physical
+ * address of their base CMA region (ouch, hacky!).
+ *
+ * Return: 0 on success, or an appropriate error code otherwise
+ */
+static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
+			     int offset, int avail)
+{
+	struct fw_rsc_vdev *rsc = ptr;
+	struct device *dev = &rproc->dev;
+	struct rproc_vdev *rvdev;
+	struct rproc_vdev_data rvdev_data;
+
+	/* make sure resource isn't truncated */
+	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
+			avail) {
+		dev_err(dev, "vdev rsc is truncated\n");
+		return -EINVAL;
+	}
+
+	/* make sure reserved bytes are zeroes */
+	if (rsc->reserved[0] || rsc->reserved[1]) {
+		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
+		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
+
+	/* we currently support only two vrings per rvdev */
+	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
+		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
+		return -EINVAL;
+	}
+
+	rvdev_data.id = rsc->id;
+	rvdev_data.index = rproc->nb_vdev++;
+	rvdev_data.rsc_offset = offset;
+	rvdev_data.rsc = rsc;
+
+	rvdev = rproc_rvdev_add_device(rproc, &rvdev_data);
+	if (IS_ERR(rvdev))
+		return PTR_ERR(rvdev);
+
+	return 0;
+}
+
+void rproc_vdev_release(struct kref *ref)
+{
+	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
+
+	rproc_rvdev_remove_device(rvdev);
+}
+
 /**
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index a328e634b1de..f582e353da3d 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,21 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+/**
+ * struct rproc_vdev_data - remoteproc virtio device data
+ * @rsc_offset: offset of the vdev's resource entry
+ * @id: virtio device id (as in virtio_ids.h)
+ * @index: vdev position versus other vdev declared in resource table
+ * @rsc: pointer to the vdev resource entry. Valid onlyduring vdev init as the resource can
+ *       be cached by rproc.
+ */
+struct rproc_vdev_data {
+	u32 rsc_offset;
+	unsigned int id;
+	unsigned int index;
+	struct fw_rsc_vdev *rsc;
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
-- 
2.25.1

