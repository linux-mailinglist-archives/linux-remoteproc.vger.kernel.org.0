Return-Path: <linux-remoteproc+bounces-1931-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 004CC949FC1
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2024 08:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99012855F8
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2024 06:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691BC1B4C4F;
	Wed,  7 Aug 2024 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pKmJHWBi"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7901B150A;
	Wed,  7 Aug 2024 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011792; cv=none; b=PhQlAosQC9JN7gEijsW9iPHtaEcTbSRk7e3VBd29Ph5N8iStCIFaEkehvXpavKcZPJOOY5z51WKhi+DtT05p/aOH9CHQvHS0qw6w/aRu3gaIHyBU8vQOn9rwOCPYYTpettDoWB0jEWBcPBMI7hoKoJjqNnZlGlJkURC6lzhnh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011792; c=relaxed/simple;
	bh=7QgV/ZHhocROh2hZABYiQr9FFv/aqv6zBQ1Ih5cZ5Tc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAu8zxiCc5nr5SQzupp0RYv7ls7au2HhTc6mOd3RtNu077WLH7MBxAzx0noN1v4+ILO6gB6y/cDe0J/i0tS/Q8wvCXwXUeowHb53qjgpVybDXxf6J6vfX3QRcSLtMZDNae7JQdJO9eGkBdeH5O8qhBW6X1J9m37oiNvK84GlvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pKmJHWBi; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4776N5v8039245;
	Wed, 7 Aug 2024 01:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723011785;
	bh=cxP4iX+ffde6WXWM2eFaHeTZ5/MpOyZkQ5y56kbOPx8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pKmJHWBihUp2QDEOk78fGgi2Ja+cyh241IJGI62puLBbD+7ausyTqL0DTmWe/7S73
	 fW9LbYjVpREEFa4sIO4nzRgFL8lxn+oWjMIY/dxh5xhPlojVbm+9soINsxR3VXHYxH
	 prd6MWpF/ckoA0gK7ccVzGvGHURa2+8u8U5jjUR4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4776N5Xl023147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 01:23:05 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 01:23:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 01:23:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4776MvbR109450;
	Wed, 7 Aug 2024 01:23:03 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] remoteproc: k3-r5: Acquire mailbox handle during probe routine
Date: Wed, 7 Aug 2024 11:52:55 +0530
Message-ID: <20240807062256.1721682-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807062256.1721682-1-b-padhi@ti.com>
References: <20240807062256.1721682-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Acquire the mailbox handle during device probe and do not release handle
in stop/detach routine or error paths. This removes the redundant
requests for mbox handle later during rproc start/attach. This also
allows to defer remoteproc driver's probe if mailbox is not probed yet.

Fixes: 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 78 +++++++++---------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index dbcd8840ae8d..cb4ef2c0ebb7 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -194,6 +194,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
+	/* Do not forward message from a detached core */
+	if (kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -229,6 +233,10 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
+	/* Do not forward message to a detached core */
+	if (kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(kproc->mbox, (void *)msg);
 	if (ret < 0)
@@ -399,12 +407,9 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
 	client->knows_txdone = false;
 
 	kproc->mbox = mbox_request_channel(client, 0);
-	if (IS_ERR(kproc->mbox)) {
-		ret = -EBUSY;
-		dev_err(dev, "mbox_request_channel failed: %ld\n",
-			PTR_ERR(kproc->mbox));
-		return ret;
-	}
+	if (IS_ERR(kproc->mbox))
+		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
+				     "mbox_request_channel failed\n");
 
 	/*
 	 * Ping the remote processor, this is only for sanity-sake for now;
@@ -552,10 +557,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	u32 boot_addr;
 	int ret;
 
-	ret = k3_r5_rproc_request_mbox(rproc);
-	if (ret)
-		return ret;
-
 	boot_addr = rproc->bootaddr;
 	/* TODO: add boot_addr sanity checking */
 	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
@@ -564,7 +565,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	core = kproc->core;
 	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
 	if (ret)
-		goto put_mbox;
+		return ret;
 
 	/* unhalt/run all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
@@ -580,13 +581,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
 			dev_err(dev, "%s: can not start core 1 before core 0\n",
 				__func__);
-			ret = -EPERM;
-			goto put_mbox;
+			return -EPERM;
 		}
 
 		ret = k3_r5_core_run(core);
 		if (ret)
-			goto put_mbox;
+			return ret;
 	}
 
 	return 0;
@@ -596,8 +596,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		if (k3_r5_core_halt(core))
 			dev_warn(core->dev, "core halt back failed\n");
 	}
-put_mbox:
-	mbox_free_channel(kproc->mbox);
 	return ret;
 }
 
@@ -658,8 +656,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 			goto out;
 	}
 
-	mbox_free_channel(kproc->mbox);
-
 	return 0;
 
 unroll_core_halt:
@@ -674,42 +670,22 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running R5F remote processor (IPC-only mode)
  *
- * The R5F attach callback only needs to request the mailbox, the remote
- * processor is already booted, so there is no need to issue any TI-SCI
- * commands to boot the R5F cores in IPC-only mode. This callback is invoked
- * only in IPC-only mode.
+ * The R5F attach callback is a NOP. The remote processor is already booted, and
+ * all required resources have been acquired during probe routine, so there is
+ * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
+ * This callback is invoked only in IPC-only mode and exists because
+ * rproc_validate() checks for its existence.
  */
-static int k3_r5_rproc_attach(struct rproc *rproc)
-{
-	struct k3_r5_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = k3_r5_rproc_request_mbox(rproc);
-	if (ret)
-		return ret;
-
-	dev_info(dev, "R5F core initialized in IPC-only mode\n");
-	return 0;
-}
+static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
 
 /*
  * Detach from a running R5F remote processor (IPC-only mode)
  *
- * The R5F detach callback performs the opposite operation to attach callback
- * and only needs to release the mailbox, the R5F cores are not stopped and
- * will be left in booted state in IPC-only mode. This callback is invoked
- * only in IPC-only mode.
+ * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
+ * left in booted state in IPC-only mode. This callback is invoked only in
+ * IPC-only mode and exists for sanity sake.
  */
-static int k3_r5_rproc_detach(struct rproc *rproc)
-{
-	struct k3_r5_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	mbox_free_channel(kproc->mbox);
-	dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
-	return 0;
-}
+static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
 
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
@@ -1278,6 +1254,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		kproc->rproc = rproc;
 		core->rproc = rproc;
 
+		ret = k3_r5_rproc_request_mbox(rproc);
+		if (ret)
+			return ret;
+
 		ret = k3_r5_rproc_configure_mode(kproc);
 		if (ret < 0)
 			goto err_config;
@@ -1394,6 +1374,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
 			}
 		}
 
+		mbox_free_channel(kproc->mbox);
+
 		rproc_del(rproc);
 
 		k3_r5_reserved_mem_exit(kproc);
-- 
2.34.1


