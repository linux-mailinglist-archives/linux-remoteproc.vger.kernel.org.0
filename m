Return-Path: <linux-remoteproc+bounces-878-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE688ACCD
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 Mar 2024 19:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5B8A1F21A0A
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 Mar 2024 18:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8218F12AAC1;
	Mon, 25 Mar 2024 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rMVTwBPZ"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E350128366;
	Mon, 25 Mar 2024 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711387258; cv=none; b=Q4U/52+geCdgHoFqN5+a2614p/x5lNgIjwRG27WkXN3jSdz32Quf0tQsnVDq7B8H8xFRwmMQkGtBNPMmrZX6DGW2cdMiyBF8+JXjVVH6XKlhUSzTq7nNVH3iwVHHWV3wflc+NPfCorFzjAGALNsEORoAHSKsvM/EX5sEpCK7Q+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711387258; c=relaxed/simple;
	bh=doSXqmfNCIrnIQ8WZ124pCpIFd/YqEDzew9qdB+htgc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tq4gWolYc8iWU26SalCgFiwf93nWzj9edO1ODKWDkJvQyg04bWsPWf+9n8AiMzj7FJeYY41YRhKeCW3Y+27OW8tM40Gk/fTdtL1iiKnzvvnssundnEXulc9LIGzxUtCziDp9ahakFGWfhIUUqdBnT2GkHqpD4KAeaEsfGW6yGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rMVTwBPZ; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42PHKpUB040400;
	Mon, 25 Mar 2024 12:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711387251;
	bh=ZM3h+sPKMb5zkmKkQkz4C8fHzS5NMjpmjj6SKZ6KW+I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rMVTwBPZ33T7o9fESP9mrLdYu4/tbXyyhxm9IQMu3bbadThXHJqsJ/+BAKUwkDFSv
	 e22FO83Mddcfw+54lcTMEL+lLHpj82VzIdAR3mhtT+WYKvtHEHvhsoPYiXUv/mqRgP
	 Duh4sfoZmDlQ0Z5GVvmYPx3GXFNScHWvpsqa1xiE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42PHKpBq008644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Mar 2024 12:20:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 25
 Mar 2024 12:20:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 25 Mar 2024 12:20:51 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42PHKkYj075282;
	Mon, 25 Mar 2024 12:20:50 -0500
From: Andrew Davis <afd@ti.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Hari Nagalla <hnagalla@ti.com>,
        Nick Saulnier <nsaulnier@ti.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 13/13] mailbox: omap: Remove kernel FIFO message queuing
Date: Mon, 25 Mar 2024 12:20:45 -0500
Message-ID: <20240325172045.113047-14-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325172045.113047-1-afd@ti.com>
References: <20240325172045.113047-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The kernel FIFO queue has a couple issues. The biggest issue is that
it causes extra latency in a path that can be used in real-time tasks,
such as communication with real-time remote processors.

The whole FIFO idea itself looks to be a leftover from before the
unified mailbox framework. The current mailbox framework expects
mbox_chan_received_data() to be called with data immediately as it
arrives. Remove the FIFO and pass the messages to the mailbox
framework directly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/mailbox/Kconfig        |   9 ---
 drivers/mailbox/omap-mailbox.c | 103 +--------------------------------
 2 files changed, 3 insertions(+), 109 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 42940108a1874..78e4c74fbe5c2 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -68,15 +68,6 @@ config OMAP2PLUS_MBOX
 	  OMAP2/3; or IPU, IVA HD and DSP in OMAP4/5. Say Y here if you
 	  want to use OMAP2+ Mailbox framework support.
 
-config OMAP_MBOX_KFIFO_SIZE
-	int "Mailbox kfifo default buffer size (bytes)"
-	depends on OMAP2PLUS_MBOX
-	default 256
-	help
-	  Specify the default size of mailbox's kfifo buffers (bytes).
-	  This can also be changed at runtime (via the mbox_kfifo_size
-	  module parameter).
-
 config ROCKCHIP_MBOX
 	bool "Rockchip Soc Integrated Mailbox Support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index c5d4083125856..4e7e0e2f537b0 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -65,14 +65,6 @@ struct omap_mbox_fifo {
 	u32 intr_bit;
 };
 
-struct omap_mbox_queue {
-	spinlock_t		lock;
-	struct kfifo		fifo;
-	struct work_struct	work;
-	struct omap_mbox	*mbox;
-	bool full;
-};
-
 struct omap_mbox_match_data {
 	u32 intr_type;
 };
@@ -90,7 +82,6 @@ struct omap_mbox_device {
 struct omap_mbox {
 	const char		*name;
 	int			irq;
-	struct omap_mbox_queue	*rxq;
 	struct omap_mbox_device *parent;
 	struct omap_mbox_fifo	tx_fifo;
 	struct omap_mbox_fifo	rx_fifo;
@@ -99,10 +90,6 @@ struct omap_mbox {
 	bool			send_no_irq;
 };
 
-static unsigned int mbox_kfifo_size = CONFIG_OMAP_MBOX_KFIFO_SIZE;
-module_param(mbox_kfifo_size, uint, S_IRUGO);
-MODULE_PARM_DESC(mbox_kfifo_size, "Size of omap's mailbox kfifo (bytes)");
-
 static inline
 unsigned int mbox_read_reg(struct omap_mbox_device *mdev, size_t ofs)
 {
@@ -202,30 +189,6 @@ static void omap_mbox_disable_irq(struct omap_mbox *mbox, omap_mbox_irq_t irq)
 	mbox_write_reg(mbox->parent, bit, irqdisable);
 }
 
-/*
- * Message receiver(workqueue)
- */
-static void mbox_rx_work(struct work_struct *work)
-{
-	struct omap_mbox_queue *mq =
-			container_of(work, struct omap_mbox_queue, work);
-	u32 msg;
-	int len;
-
-	while (kfifo_len(&mq->fifo) >= sizeof(msg)) {
-		len = kfifo_out(&mq->fifo, (unsigned char *)&msg, sizeof(msg));
-		WARN_ON(len != sizeof(msg));
-
-		mbox_chan_received_data(mq->mbox->chan, (void *)(uintptr_t)msg);
-		spin_lock_irq(&mq->lock);
-		if (mq->full) {
-			mq->full = false;
-			omap_mbox_enable_irq(mq->mbox, IRQ_RX);
-		}
-		spin_unlock_irq(&mq->lock);
-	}
-}
-
 /*
  * Mailbox interrupt handler
  */
@@ -238,27 +201,15 @@ static void __mbox_tx_interrupt(struct omap_mbox *mbox)
 
 static void __mbox_rx_interrupt(struct omap_mbox *mbox)
 {
-	struct omap_mbox_queue *mq = mbox->rxq;
 	u32 msg;
-	int len;
 
 	while (!mbox_fifo_empty(mbox)) {
-		if (unlikely(kfifo_avail(&mq->fifo) < sizeof(msg))) {
-			omap_mbox_disable_irq(mbox, IRQ_RX);
-			mq->full = true;
-			goto nomem;
-		}
-
 		msg = mbox_fifo_read(mbox);
-
-		len = kfifo_in(&mq->fifo, (unsigned char *)&msg, sizeof(msg));
-		WARN_ON(len != sizeof(msg));
+		mbox_chan_received_data(mbox->chan, (void *)(uintptr_t)msg);
 	}
 
-	/* no more messages in the fifo. clear IRQ source. */
+	/* clear IRQ source. */
 	ack_mbox_irq(mbox, IRQ_RX);
-nomem:
-	schedule_work(&mbox->rxq->work);
 }
 
 static irqreturn_t mbox_interrupt(int irq, void *p)
@@ -274,57 +225,15 @@ static irqreturn_t mbox_interrupt(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
-static struct omap_mbox_queue *mbox_queue_alloc(struct omap_mbox *mbox,
-					void (*work)(struct work_struct *))
-{
-	struct omap_mbox_queue *mq;
-	unsigned int size;
-
-	if (!work)
-		return NULL;
-
-	mq = kzalloc(sizeof(*mq), GFP_KERNEL);
-	if (!mq)
-		return NULL;
-
-	spin_lock_init(&mq->lock);
-
-	/* kfifo size sanity check: alignment and minimal size */
-	size = ALIGN(mbox_kfifo_size, sizeof(u32));
-	size = max_t(unsigned int, size, sizeof(u32));
-	if (kfifo_alloc(&mq->fifo, size, GFP_KERNEL))
-		goto error;
-
-	INIT_WORK(&mq->work, work);
-	return mq;
-
-error:
-	kfree(mq);
-	return NULL;
-}
-
-static void mbox_queue_free(struct omap_mbox_queue *q)
-{
-	kfifo_free(&q->fifo);
-	kfree(q);
-}
-
 static int omap_mbox_startup(struct omap_mbox *mbox)
 {
 	int ret = 0;
-	struct omap_mbox_queue *mq;
-
-	mq = mbox_queue_alloc(mbox, mbox_rx_work);
-	if (!mq)
-		return -ENOMEM;
-	mbox->rxq = mq;
-	mq->mbox = mbox;
 
 	ret = request_irq(mbox->irq, mbox_interrupt, IRQF_SHARED,
 			  mbox->name, mbox);
 	if (unlikely(ret)) {
 		pr_err("failed to register mailbox interrupt:%d\n", ret);
-		goto fail_request_irq;
+		return ret;
 	}
 
 	if (mbox->send_no_irq)
@@ -333,18 +242,12 @@ static int omap_mbox_startup(struct omap_mbox *mbox)
 	omap_mbox_enable_irq(mbox, IRQ_RX);
 
 	return 0;
-
-fail_request_irq:
-	mbox_queue_free(mbox->rxq);
-	return ret;
 }
 
 static void omap_mbox_fini(struct omap_mbox *mbox)
 {
 	omap_mbox_disable_irq(mbox, IRQ_RX);
 	free_irq(mbox->irq, mbox);
-	flush_work(&mbox->rxq->work);
-	mbox_queue_free(mbox->rxq);
 }
 
 static int omap_mbox_chan_startup(struct mbox_chan *chan)
-- 
2.39.2


