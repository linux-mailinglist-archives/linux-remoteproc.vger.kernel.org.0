Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AB127E7EF
	for <lists+linux-remoteproc@lfdr.de>; Wed, 30 Sep 2020 13:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729694AbgI3Lxo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 30 Sep 2020 07:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729668AbgI3Lxn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 07:53:43 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1CCC0613D5
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2020 04:53:37 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so1478101wrv.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2020 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mAdddMc4b1Ivj/NQYU0Gk0TnCEaiEJrMXeuU0l1+c0Y=;
        b=yTfn4Gx3jVhjR4dW1wRnfJULUrKxWxGrJdpmYkuRFvcvkLJMQwxfrL0clC0UA9Dttl
         wkOujPcGutPov3DHG8viMSjQP9h1p/vrcVviFlOdAOQeM1TpJ/N+K6YpuzibnVuUUfyn
         vb6v6SDCLfOGxWELhOs5L+9tAcS2+VDxqyONP+J5RWdPY08yMr9uutyVH8jU7gyqS0YC
         8X32SuLRm9KQvpctt1foDzs9itIM4hJAdboVO9Fa9bFVnADx+52XZ9AbMXm5iRDjZjz6
         JEMinz4llXCS+sihPoL0TWqFWLzgIfFNqxQsRqQmgAu0hGf6xMpiMScB64abSWWplqRm
         1RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mAdddMc4b1Ivj/NQYU0Gk0TnCEaiEJrMXeuU0l1+c0Y=;
        b=fGxbpArtjoVETyJlH9ZNwZZ+tW4Z5YNnBZxJ80wm3zlW/Ki//v0CAf38fJxptlYKx4
         Ph9fzuyp2CboUG7xxBSxGaq1xFYlMVq/aAZjAf4+vgG/2bKi6fKSgpBG4xusTKMgx86B
         zoF+/h9Nt6K7+i8vwKw1JvbONix5abgZK/7Oa3lfiBupxQpjVhrqh+cdMVsYUPEAXmqx
         a4rvDe1vDpPQu+R8CSlIlMQB+6Hac0cOOVO85URPdMVd35Zlgk4/291/w1MjjgUuQ2cc
         yLAS4SEYMkqBsBNnEnupoch/eJpHF0bBueZzIx2BvPikGfS1WEgl0NOhkq4bt2VK1Wja
         aUNA==
X-Gm-Message-State: AOAM532me6V8GtMRnydlpXSfSnSPryYDTJLP0LsrgMiDqV372mAgDEFv
        gbidSEamwMPC1Zarn47CoiEKdRiufuyckOhN
X-Google-Smtp-Source: ABdhPJyvSwlGiMz363FEb4juwrIfg5hHEdgpqjWKhWlvKOFuzzzBWL8R71miQQ9h/rJCjQ/n22SLRw==
X-Received: by 2002:adf:ffca:: with SMTP id x10mr2937097wrs.342.1601466816075;
        Wed, 30 Sep 2020 04:53:36 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:53:35 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        jstephan@baylibre.com, stephane.leprovost@mediatek.com,
        gpain@baylibre.com, mturquette@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 3/4] rpmsg: apu_rpmsg: update the way to store IOMMU mapping
Date:   Wed, 30 Sep 2020 13:53:49 +0200
Message-Id: <20200930115350.5272-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930115350.5272-1-abailon@baylibre.com>
References: <20200930115350.5272-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In order to reduce the memory mapping operations we are going to
add an IOCTL to request a mapping.
To make easier to add this new operation, use 2 lists to store the
mappings, one for the request and one for the device.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/apu_rpmsg.c | 104 +++++++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 34 deletions(-)

diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
index e14597c467d7..343bd08a859a 100644
--- a/drivers/rpmsg/apu_rpmsg.c
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -38,12 +38,14 @@ struct rpmsg_apu {
 	u8 available_response;
 	spinlock_t ctx_lock;
 	struct list_head requests;
+
+	struct list_head buffers;
 };
 
 struct rpmsg_request {
 	u8 ready;
 	struct list_head node;
-	struct apu_buffer *buffer;
+	struct list_head buffers;
 	void *req;
 };
 
@@ -53,6 +55,11 @@ struct apu_buffer {
 	struct dma_buf_attachment *attachment;
 	struct sg_table *sg_table;
 	u32 iova;
+
+	struct rpmsg_apu *apu;
+	struct list_head node;
+	struct list_head req_node;
+	struct kref refcount;
 };
 
 /*
@@ -106,23 +113,46 @@ static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
 	return 0;
 }
 
-static int apu_device_memory_map(struct rpmsg_apu *apu,
-				 struct apu_buffer *buffer)
+static struct apu_buffer *apu_device_memory_map(struct rpmsg_apu *apu,
+		uint32_t fd, struct rpmsg_request *rpmsg_req)
 {
 	struct rpmsg_device *rpdev = apu->rpdev;
+	struct apu_buffer *buffer;
 	phys_addr_t phys;
 	int total_buf_space;
 	int iova_pfn;
 	int ret;
 
-	if (!buffer->fd)
-		return 0;
+	if (!fd)
+		return NULL;
+
+	list_for_each_entry(buffer, &apu->buffers, node) {
+		if (buffer->fd == fd) {
+			kref_get(&buffer->refcount);
+			if (rpmsg_req)
+				list_add(&buffer->req_node,
+					 &rpmsg_req->buffers);
+
+			return buffer;
+		}
+	}
+
+	buffer = kmalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&buffer->refcount);
+	buffer->fd = fd;
+	buffer->apu = apu;
+	INIT_LIST_HEAD(&buffer->req_node);
+	INIT_LIST_HEAD(&buffer->node);
 
 	buffer->dma_buf = dma_buf_get(buffer->fd);
 	if (IS_ERR(buffer->dma_buf)) {
 		dev_err(&rpdev->dev, "Failed to get dma_buf from fd: %ld\n",
 			PTR_ERR(buffer->dma_buf));
-		return PTR_ERR(buffer->dma_buf);
+		ret = PTR_ERR(buffer->dma_buf);
+		goto err_free_buffer;
 	}
 
 	buffer->attachment = dma_buf_attach(buffer->dma_buf, &rpdev->dev);
@@ -158,7 +188,9 @@ static int apu_device_memory_map(struct rpmsg_apu *apu,
 		goto err_free_iova;
 	}
 
-	return 0;
+	list_add(&buffer->node, &apu->buffers);
+
+	return buffer;
 
 err_free_iova:
 	free_iova(apu->iovad, iova_pfn);
@@ -170,13 +202,17 @@ static int apu_device_memory_map(struct rpmsg_apu *apu,
 	dma_buf_detach(buffer->dma_buf, buffer->attachment);
 err_dma_buf_put:
 	dma_buf_put(buffer->dma_buf);
+err_free_buffer:
+	kfree(buffer);
 
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void apu_device_memory_unmap(struct rpmsg_apu *apu,
-				    struct apu_buffer *buffer)
+static void apu_device_memory_unmap(struct kref *ref)
 {
+	struct apu_buffer *buffer = container_of(ref, struct apu_buffer,
+						 refcount);
+	struct rpmsg_apu *apu = buffer->apu;
 	int total_buf_space;
 
 	if (!buffer->fd)
@@ -190,6 +226,8 @@ static void apu_device_memory_unmap(struct rpmsg_apu *apu,
 				 DMA_BIDIRECTIONAL);
 	dma_buf_detach(buffer->dma_buf, buffer->attachment);
 	dma_buf_put(buffer->dma_buf);
+	list_del(&buffer->node);
+	kfree(buffer);
 }
 
 static int apu_send_request(struct rpmsg_apu *apu,
@@ -198,7 +236,7 @@ static int apu_send_request(struct rpmsg_apu *apu,
 	int ret;
 	struct rpmsg_device *rpdev = apu->rpdev;
 	struct apu_dev_request *dev_req;
-	struct apu_buffer *buffer;
+	struct apu_buffer *buffer, *tmp;
 	struct rpmsg_request *rpmsg_req;
 	unsigned long flags;
 
@@ -222,14 +260,21 @@ static int apu_send_request(struct rpmsg_apu *apu,
 	dev_req_buffer_size = (u32 *)(dev_req_da + dev_req->count);
 	memcpy(dev_req->data, req->data, req->size_in);
 
-	buffer = kmalloc_array(req->count, sizeof(*buffer), GFP_KERNEL);
+	rpmsg_req = kzalloc(sizeof(*rpmsg_req), GFP_KERNEL);
+	if (!rpmsg_req)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&rpmsg_req->buffers);
 	for (i = 0; i < req->count; i++) {
-		buffer[i].fd = fd[i];
-		ret = apu_device_memory_map(apu, &buffer[i]);
-		if (ret)
+		buffer = apu_device_memory_map(apu, fd[i], rpmsg_req);
+		if (IS_ERR(buffer)) {
+			ret = PTR_ERR(buffer);
 			goto err_free_memory;
-		dev_req_da[i] = buffer[i].iova;
+		}
+
+		dev_req_da[i] = buffer->iova;
 		dev_req_buffer_size[i] = buffer_size[i];
+		list_add(&buffer->req_node, &rpmsg_req->buffers);
 	}
 
 	ret = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
@@ -238,15 +283,8 @@ static int apu_send_request(struct rpmsg_apu *apu,
 
 	dev_req->id = ret;
 
-	rpmsg_req = kzalloc(sizeof(*rpmsg_req), GFP_KERNEL);
-	if (!rpmsg_req) {
-		ret =  -ENOMEM;
-		goto err_ida_remove;
-	}
-
 	req->id = dev_req->id;
 	rpmsg_req->req = req;
-	rpmsg_req->buffer = buffer;
 	spin_lock_irqsave(&apu->ctx_lock, flags);
 	list_add(&rpmsg_req->node, &apu->requests);
 	spin_unlock_irqrestore(&apu->ctx_lock, flags);
@@ -261,15 +299,12 @@ static int apu_send_request(struct rpmsg_apu *apu,
 
 err:
 	list_del(&rpmsg_req->node);
-	kfree(rpmsg_req);
 	kfree(req);
-err_ida_remove:
 	ida_simple_remove(&req_ida, dev_req->id);
 err_free_memory:
-	for (i--; i >= 0; i--)
-		apu_device_memory_unmap(apu, &buffer[i]);
-
-	kfree(buffer);
+	list_for_each_entry_safe(buffer, tmp, &rpmsg_req->buffers, req_node)
+		kref_put(&buffer->refcount, apu_device_memory_unmap);
+	kfree(rpmsg_req);
 	kfree(dev_req);
 
 	return ret;
@@ -296,12 +331,12 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	struct rpmsg_apu *apu = fp->private_data;
 	struct apu_request apu_req;
 	struct apu_request *apu_req_full;
+	struct apu_buffer *buffer, *tmp;
 	void __user *argp = (void __user *)arg;
 	int len;
 	int ret;
 	unsigned long flags;
 	struct rpmsg_request *rpmsg_req;
-	int i;
 
 	ret = 0;
 
@@ -370,11 +405,11 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 					ret = -EFAULT;
 				apu->available_response--;
 				ida_simple_remove(&req_ida, req->id);
-				for (i = 0; i < req->count ; i++)
-					apu_device_memory_unmap(apu,
-							&rpmsg_req->buffer[i]);
+				list_for_each_entry_safe(buffer, tmp, &rpmsg_req->buffers, req_node) {
+					kref_put(&buffer->refcount, apu_device_memory_unmap);
+					list_del(&buffer->req_node);
+				}
 				list_del(&rpmsg_req->node);
-				kfree(rpmsg_req->buffer);
 				kfree(rpmsg_req->req);
 				kfree(rpmsg_req);
 				break;
@@ -554,6 +589,7 @@ static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (!apu)
 		return -ENOMEM;
 	apu->rpdev = rpdev;
+	INIT_LIST_HEAD(&apu->buffers);
 
 	apu->rproc = apu_get_rproc(rpdev);
 	if (IS_ERR_OR_NULL(apu->rproc))
-- 
2.26.2

