Return-Path: <linux-remoteproc+bounces-450-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C784A245
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 19:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30408B2178A
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 18:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A7148CC5;
	Mon,  5 Feb 2024 18:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OZMvbcRj"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB248780;
	Mon,  5 Feb 2024 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157681; cv=none; b=aiB6W/DueJiaIE4Go2aPufYXr4bXP7h68HOULQ3AWJQf90vg/BZkxswCl7749tJRA12t6La4yG/Ju96J0+laqVCt/pNVFYkRInAh0eC/ZR8NyLfCQSGW06wbjFQysWRjg0ZbGWNQv4TGgoq81n7BrbqF3L7GJQvioe39Xh85aVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157681; c=relaxed/simple;
	bh=njlR0rO+G4g3TL1gkbOtBkBHGf3Jn2TMwjfojhYgCJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YY7AsgZluACf5Vzi1DzfTnszn1vfbKPcE+aMdFOyj/IoCN1+hxM3OPXED2S/UHABgvInku0GRvsapVPpx3Aa/iu1wH9OEffrPHg/A23esxU57jha+ibBAAwh8xwMobJwsTZ2NngS7uyLW7uY0tddDAAzGPOkjMrkIfyAwAM9xcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OZMvbcRj; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415IRuL3120261;
	Mon, 5 Feb 2024 12:27:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707157676;
	bh=PChh5xsLsnerdCoIJ9CmTZI/Hl/y3vuBaVRnyyN6aKc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OZMvbcRjUTPLU6bYtZTrZVUWFyRjR+3PIUPVpjBOgHKRCt3FChySbfNkkOrsmkObg
	 s2XuRuVlKU6c2+ts9sIyuZ8iS0DTAI3c9pH7y41EanZzQjtichfQSAQ/TWxjyc3ui+
	 esGCyoTXDEJyLuhNXEqU+vPiMQBqqqM+zym4GuLA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415IRuaT010269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 12:27:56 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 12:27:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 12:27:55 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415IRsX8058567;
	Mon, 5 Feb 2024 12:27:55 -0600
From: Andrew Davis <afd@ti.com>
To: Jai Luthra <j-luthra@ti.com>, Hari Nagalla <hnagalla@ti.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 4/5] remoteproc: k3-dsp: Use devm_ioremap_wc() helper
Date: Mon, 5 Feb 2024 12:27:52 -0600
Message-ID: <20240205182753.36978-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205182753.36978-1-afd@ti.com>
References: <20240205182753.36978-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use a device lifecycle managed ioremap helper function. This helps prevent
mistakes like unmapping out of order in cleanup functions and forgetting
to unmap on all error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 48 +++++------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 800c8c6767086..f799f74734b4a 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -598,16 +598,13 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 	/* use remaining reserved memory regions for static carveouts */
 	for (i = 0; i < num_rmems; i++) {
 		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np) {
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
+		if (!rmem_np)
+			return -EINVAL;
 
 		rmem = of_reserved_mem_lookup(rmem_np);
 		if (!rmem) {
 			of_node_put(rmem_np);
-			ret = -EINVAL;
-			goto unmap_rmem;
+			return -EINVAL;
 		}
 		of_node_put(rmem_np);
 
@@ -615,12 +612,11 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 		/* 64-bit address regions currently not supported */
 		kproc->rmem[i].dev_addr = (u32)rmem->base;
 		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
+		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
 		if (!kproc->rmem[i].cpu_addr) {
 			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
 				i + 1, &rmem->base, &rmem->size);
-			ret = -ENOMEM;
-			goto unmap_rmem;
+			return -ENOMEM;
 		}
 
 		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
@@ -631,19 +627,6 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 	kproc->num_rmems = num_rmems;
 
 	return 0;
-
-unmap_rmem:
-	for (i--; i >= 0; i--)
-		iounmap(kproc->rmem[i].cpu_addr);
-	return ret;
-}
-
-static void k3_dsp_reserved_mem_exit(struct k3_dsp_rproc *kproc)
-{
-	int i;
-
-	for (i = 0; i < kproc->num_rmems; i++)
-		iounmap(kproc->rmem[i].cpu_addr);
 }
 
 static void k3_dsp_release_tsp(void *data)
@@ -752,10 +735,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
 					       NULL, &p_state);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
-		goto release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
 
 	/* configure J721E devices for either remoteproc or IPC-only mode */
 	if (p_state) {
@@ -779,8 +760,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		if (data->uses_lreset) {
 			ret = reset_control_status(kproc->reset);
 			if (ret < 0) {
-				dev_err_probe(dev, ret, "failed to get reset status\n");
-				goto release_mem;
+				return dev_err_probe(dev, ret, "failed to get reset status\n");
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
 				k3_dsp_rproc_reset(kproc);
@@ -789,18 +769,12 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	}
 
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to add register device with remoteproc core\n");
-		goto release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add register device with remoteproc core\n");
 
 	platform_set_drvdata(pdev, kproc);
 
 	return 0;
-
-release_mem:
-	k3_dsp_reserved_mem_exit(kproc);
-	return ret;
 }
 
 static void k3_dsp_rproc_remove(struct platform_device *pdev)
@@ -820,8 +794,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
 	}
 
 	rproc_del(kproc->rproc);
-
-	k3_dsp_reserved_mem_exit(kproc);
 }
 
 static const struct k3_dsp_mem_data c66_mems[] = {
-- 
2.39.2


