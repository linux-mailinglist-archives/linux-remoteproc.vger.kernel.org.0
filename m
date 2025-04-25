Return-Path: <linux-remoteproc+bounces-3523-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E01A9C5C0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 25 Apr 2025 12:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C5547B5A28
	for <lists+linux-remoteproc@lfdr.de>; Fri, 25 Apr 2025 10:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF0119D8A7;
	Fri, 25 Apr 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DUOCTJKk"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1098239594;
	Fri, 25 Apr 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577725; cv=none; b=FKYACZZ/X/WgRbu11JoXSdIYU+7AgeWivCqvn9pKRl/SrFyY4A7TIUvKEC9saNsSKm0tXVDsd4TbHKqi9GbwupY/7LjxPNSv+caw9440kuOOmrg4woLIlZlb92oYbtdGojQ+t7Y/BG3MtN27i8m8plLIqg0/cL9/Sd7lgGl6gbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577725; c=relaxed/simple;
	bh=Hz7qeNnxs11xco4iVtZ+rl/7ysUfRPDLlxD1aFSHFbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nc10J+GmVt+StYcP35D8jAeNClJx2tYfYhTFUKcIwflommvlTFo63GYqFJcecoslWse+46B271ZtcSHuu2t8XcIcTA3/ng/npjjUbusSW1DTRcm9TryFlaAcU43sH2xSL4nclDHHCTkvATRuQIv7jkrHHk9xTDFvGx4dpXxPb3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DUOCTJKk; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAftVx2123059
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577715;
	bh=86ts2PrystE7mE6nGFjoEkSEM8y7kMtJns0VdUj/NqM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DUOCTJKkfBjYTr1rxjnD4drSXdgoYy55jOyBVI+ppBxVVajjy1QmkzkBEu0U+z/x9
	 MQPu2QkJWDCuIYxO1dOShiLiU9qnLSmABsnnyY5Bd/ltlm8VthRNVfN7//l3kFDAAx
	 HveJcUY5r8o3Z6XoNACTEVUnl9JxZDChYFXY7QMA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAftux088329
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:41:55 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:41:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:41:55 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZP038329;
	Fri, 25 Apr 2025 05:41:52 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 04/35] remoteproc: k3-r5: Re-order internal memory initialization functions
Date: Fri, 25 Apr 2025 16:11:04 +0530
Message-ID: <20250425104135.830255-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The internal memory struct pointer, 'mem', will be refactored from
k3_r5_core struct into k3_r5_rproc struct in a future commit.

Therefore, move the internal memory initialization function,
k3_r5_core_of_get_internal_memories() above k3_r5_cluster_rproc_init()
so that the former can be invoked by the later.

While at it, also re-order the k3_r5_core_of_get_sram_memories() to keep
all the internal memory initialization functions at one place.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-5-b-padhi@ti.com/

v10: Changelog:
1. Re-ordered both core_of_get_{internal/sram}_memories() together.
2. Moved release_tsp() re-ordering into a separate future commit.
3. Updated commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-2-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 258 +++++++++++------------
 1 file changed, 129 insertions(+), 129 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index ba082ca13e750..062a654cac0f0 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1227,6 +1227,135 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	return ret;
 }
 
+static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
+					       struct k3_r5_core *core)
+{
+	static const char * const mem_names[] = {"atcm", "btcm"};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int num_mems;
+	int i;
+
+	num_mems = ARRAY_SIZE(mem_names);
+	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
+	if (!core->mem)
+		return -ENOMEM;
+
+	for (i = 0; i < num_mems; i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   mem_names[i]);
+		if (!res) {
+			dev_err(dev, "found no memory resource for %s\n",
+				mem_names[i]);
+			return -EINVAL;
+		}
+		if (!devm_request_mem_region(dev, res->start,
+					     resource_size(res),
+					     dev_name(dev))) {
+			dev_err(dev, "could not request %s region for resource\n",
+				mem_names[i]);
+			return -EBUSY;
+		}
+
+		/*
+		 * TCMs are designed in general to support RAM-like backing
+		 * memories. So, map these as Normal Non-Cached memories. This
+		 * also avoids/fixes any potential alignment faults due to
+		 * unaligned data accesses when using memcpy() or memset()
+		 * functions (normally seen with device type memory).
+		 */
+		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
+							resource_size(res));
+		if (!core->mem[i].cpu_addr) {
+			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
+			return -ENOMEM;
+		}
+		core->mem[i].bus_addr = res->start;
+
+		/*
+		 * TODO:
+		 * The R5F cores can place ATCM & BTCM anywhere in its address
+		 * based on the corresponding Region Registers in the System
+		 * Control coprocessor. For now, place ATCM and BTCM at
+		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
+		 * SoCs) based on loczrama setting
+		 */
+		if (!strcmp(mem_names[i], "atcm")) {
+			core->mem[i].dev_addr = core->loczrama ?
+							0 : K3_R5_TCM_DEV_ADDR;
+		} else {
+			core->mem[i].dev_addr = core->loczrama ?
+							K3_R5_TCM_DEV_ADDR : 0;
+		}
+		core->mem[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			mem_names[i], &core->mem[i].bus_addr,
+			core->mem[i].size, core->mem[i].cpu_addr,
+			core->mem[i].dev_addr);
+	}
+	core->num_mems = num_mems;
+
+	return 0;
+}
+
+static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
+					   struct k3_r5_core *core)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *sram_np;
+	struct resource res;
+	int num_sram;
+	int i, ret;
+
+	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
+	if (num_sram <= 0) {
+		dev_dbg(dev, "device does not use reserved on-chip memories, num_sram = %d\n",
+			num_sram);
+		return 0;
+	}
+
+	core->sram = devm_kcalloc(dev, num_sram, sizeof(*core->sram), GFP_KERNEL);
+	if (!core->sram)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sram; i++) {
+		sram_np = of_parse_phandle(np, "sram", i);
+		if (!sram_np)
+			return -EINVAL;
+
+		if (!of_device_is_available(sram_np)) {
+			of_node_put(sram_np);
+			return -EINVAL;
+		}
+
+		ret = of_address_to_resource(sram_np, 0, &res);
+		of_node_put(sram_np);
+		if (ret)
+			return -EINVAL;
+
+		core->sram[i].bus_addr = res.start;
+		core->sram[i].dev_addr = res.start;
+		core->sram[i].size = resource_size(&res);
+		core->sram[i].cpu_addr = devm_ioremap_wc(dev, res.start,
+							 resource_size(&res));
+		if (!core->sram[i].cpu_addr) {
+			dev_err(dev, "failed to parse and map sram%d memory at %pad\n",
+				i, &res.start);
+			return -ENOMEM;
+		}
+
+		dev_dbg(dev, "memory sram%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			i, &core->sram[i].bus_addr,
+			core->sram[i].size, core->sram[i].cpu_addr,
+			core->sram[i].dev_addr);
+	}
+	core->num_sram = num_sram;
+
+	return 0;
+}
+
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1366,135 +1495,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 	}
 }
 
-static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
-					       struct k3_r5_core *core)
-{
-	static const char * const mem_names[] = {"atcm", "btcm"};
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems;
-	int i;
-
-	num_mems = ARRAY_SIZE(mem_names);
-	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
-	if (!core->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   mem_names[i]);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				mem_names[i]);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				mem_names[i]);
-			return -EBUSY;
-		}
-
-		/*
-		 * TCMs are designed in general to support RAM-like backing
-		 * memories. So, map these as Normal Non-Cached memories. This
-		 * also avoids/fixes any potential alignment faults due to
-		 * unaligned data accesses when using memcpy() or memset()
-		 * functions (normally seen with device type memory).
-		 */
-		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							resource_size(res));
-		if (!core->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
-			return -ENOMEM;
-		}
-		core->mem[i].bus_addr = res->start;
-
-		/*
-		 * TODO:
-		 * The R5F cores can place ATCM & BTCM anywhere in its address
-		 * based on the corresponding Region Registers in the System
-		 * Control coprocessor. For now, place ATCM and BTCM at
-		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
-		 * SoCs) based on loczrama setting
-		 */
-		if (!strcmp(mem_names[i], "atcm")) {
-			core->mem[i].dev_addr = core->loczrama ?
-							0 : K3_R5_TCM_DEV_ADDR;
-		} else {
-			core->mem[i].dev_addr = core->loczrama ?
-							K3_R5_TCM_DEV_ADDR : 0;
-		}
-		core->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			mem_names[i], &core->mem[i].bus_addr,
-			core->mem[i].size, core->mem[i].cpu_addr,
-			core->mem[i].dev_addr);
-	}
-	core->num_mems = num_mems;
-
-	return 0;
-}
-
-static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
-					   struct k3_r5_core *core)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	struct device_node *sram_np;
-	struct resource res;
-	int num_sram;
-	int i, ret;
-
-	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
-	if (num_sram <= 0) {
-		dev_dbg(dev, "device does not use reserved on-chip memories, num_sram = %d\n",
-			num_sram);
-		return 0;
-	}
-
-	core->sram = devm_kcalloc(dev, num_sram, sizeof(*core->sram), GFP_KERNEL);
-	if (!core->sram)
-		return -ENOMEM;
-
-	for (i = 0; i < num_sram; i++) {
-		sram_np = of_parse_phandle(np, "sram", i);
-		if (!sram_np)
-			return -EINVAL;
-
-		if (!of_device_is_available(sram_np)) {
-			of_node_put(sram_np);
-			return -EINVAL;
-		}
-
-		ret = of_address_to_resource(sram_np, 0, &res);
-		of_node_put(sram_np);
-		if (ret)
-			return -EINVAL;
-
-		core->sram[i].bus_addr = res.start;
-		core->sram[i].dev_addr = res.start;
-		core->sram[i].size = resource_size(&res);
-		core->sram[i].cpu_addr = devm_ioremap_wc(dev, res.start,
-							 resource_size(&res));
-		if (!core->sram[i].cpu_addr) {
-			dev_err(dev, "failed to parse and map sram%d memory at %pad\n",
-				i, &res.start);
-			return -ENOMEM;
-		}
-
-		dev_dbg(dev, "memory sram%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i, &core->sram[i].bus_addr,
-			core->sram[i].size, core->sram[i].cpu_addr,
-			core->sram[i].dev_addr);
-	}
-	core->num_sram = num_sram;
-
-	return 0;
-}
-
 static void k3_r5_release_tsp(void *data)
 {
 	struct ti_sci_proc *tsp = data;
-- 
2.34.1


