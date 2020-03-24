Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F29DB190BBB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 12:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgCXLBI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 07:01:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41530 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCXLBH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 07:01:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OB15Hx032239;
        Tue, 24 Mar 2020 06:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585047665;
        bh=XKhx04a8kB4X1/2+v849KTNyp/laSUYHWfloGGphVZY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=db0CKCThfXzw6drz4GhOMcW0Qb11ueQh3ozoJAxGYdC+Q7KwhDsMiK2W7BHFvJIh3
         QKd/Td3uUGYyPj37F3dy0pSUoLEGORC8fzpe1VQvHrXTYjmrOLGgMxTFzOc+cCwXLB
         /r22LTemL1X6Sk2tYkI/eeC5eb6RmRefKn8+JWps=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02OB15Jw037609
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Mar 2020 06:01:05 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 06:01:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 06:01:04 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OB0rAo008648;
        Tue, 24 Mar 2020 06:01:02 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <afd@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv9 04/15] remoteproc/omap: Add support to parse internal memories from DT
Date:   Tue, 24 Mar 2020 13:00:24 +0200
Message-ID: <20200324110035.29907-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324110035.29907-1-t-kristo@ti.com>
References: <20200324110035.29907-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The OMAP remoteproc driver has been enhanced to parse and store
the kernel mappings for different internal RAM memories that may
be present within each remote processor IP subsystem. Different
devices have varying memories present on current SoCs. The current
support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
L2 RAM memories.

IPUs are expected to have the L2RAM at a fixed device address of
0x20000000, based on the current limitations on Attribute MMU
configurations.

NOTE:
The current logic doesn't handle the parsing of memories for DRA7
remoteproc devices, and will be added alongside the DRA7 support.

Signed-off-by: Suman Anna <s-anna@ti.com>
[t-kristo: converted to parse mem names / device addresses from pdata]
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Andrew F. Davis <afd@ti.com>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v9:
  * no changes

 drivers/remoteproc/omap_remoteproc.c | 94 ++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index fe11cb709770..cdcc9c227b96 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
 	unsigned int boot_reg;
 };
 
+/**
+ * struct omap_rproc_mem - internal memory structure
+ * @cpu_addr: MPU virtual address of the memory region
+ * @bus_addr: bus address used to access the memory region
+ * @dev_addr: device address of the memory region from DSP view
+ * @size: size of the memory region
+ */
+struct omap_rproc_mem {
+	void __iomem *cpu_addr;
+	phys_addr_t bus_addr;
+	u32 dev_addr;
+	size_t size;
+};
+
 /**
  * struct omap_rproc - omap remote processor state
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
  * @boot_data: boot data structure for setting processor boot address
+ * @mem: internal memory regions data
+ * @num_mems: number of internal memory regions
  * @rproc: rproc handle
  * @reset: reset handle
  */
@@ -51,16 +67,30 @@ struct omap_rproc {
 	struct mbox_chan *mbox;
 	struct mbox_client client;
 	struct omap_rproc_boot_data *boot_data;
+	struct omap_rproc_mem *mem;
+	int num_mems;
 	struct rproc *rproc;
 	struct reset_control *reset;
 };
 
+/**
+ * struct omap_rproc_mem_data - memory definitions for an omap remote processor
+ * @name: name for this memory entry
+ * @dev_addr: device address for the memory entry
+ */
+struct omap_rproc_mem_data {
+	const char *name;
+	const u32 dev_addr;
+};
+
 /**
  * struct omap_rproc_dev_data - device data for the omap remote processor
  * @device_name: device name of the remote processor
+ * @mems: memory definitions for this remote processor
  */
 struct omap_rproc_dev_data {
 	const char *device_name;
+	const struct omap_rproc_mem_data *mems;
 };
 
 /**
@@ -221,12 +251,18 @@ static const struct rproc_ops omap_rproc_ops = {
 	.kick		= omap_rproc_kick,
 };
 
+static const struct omap_rproc_mem_data ipu_mems[] = {
+	{ .name = "l2ram", .dev_addr = 0x20000000 },
+	{ },
+};
+
 static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
 	.device_name	= "dsp",
 };
 
 static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
 	.device_name	= "ipu",
+	.mems		= ipu_mems,
 };
 
 static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
@@ -235,6 +271,7 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
 
 static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
 	.device_name	= "ipu",
+	.mems		= ipu_mems,
 };
 
 static const struct of_device_id omap_rproc_of_match[] = {
@@ -309,6 +346,59 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
 	return 0;
 }
 
+static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
+					       struct rproc *rproc)
+{
+	struct omap_rproc *oproc = rproc->priv;
+	struct device *dev = &pdev->dev;
+	const struct omap_rproc_dev_data *data;
+	struct resource *res;
+	int num_mems;
+	int i;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	if (!data->mems)
+		return 0;
+
+	num_mems = of_property_count_elems_of_size(dev->of_node, "reg",
+						   sizeof(u32)) / 2;
+
+	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
+				  GFP_KERNEL);
+	if (!oproc->mem)
+		return -ENOMEM;
+
+	for (i = 0; data->mems[i].name; i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   data->mems[i].name);
+		if (!res) {
+			dev_err(dev, "no memory defined for %s\n",
+				data->mems[i].name);
+			return -ENOMEM;
+		}
+		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
+		if (IS_ERR(oproc->mem[i].cpu_addr)) {
+			dev_err(dev, "failed to parse and map %s memory\n",
+				data->mems[i].name);
+			return PTR_ERR(oproc->mem[i].cpu_addr);
+		}
+		oproc->mem[i].bus_addr = res->start;
+		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
+		oproc->mem[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
+			data->mems[i].name, &oproc->mem[i].bus_addr,
+			oproc->mem[i].size, oproc->mem[i].cpu_addr,
+			oproc->mem[i].dev_addr);
+	}
+	oproc->num_mems = num_mems;
+
+	return 0;
+}
+
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -348,6 +438,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	/* All existing OMAP IPU and DSP processors have an MMU */
 	rproc->has_iommu = true;
 
+	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
+	if (ret)
+		goto free_rproc;
+
 	ret = omap_rproc_get_boot_data(pdev, rproc);
 	if (ret)
 		goto free_rproc;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
