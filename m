Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8946D5F94
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Apr 2023 13:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbjDDLxy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Apr 2023 07:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234428AbjDDLxx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Apr 2023 07:53:53 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7E010B;
        Tue,  4 Apr 2023 04:53:51 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 334BrhOE122750;
        Tue, 4 Apr 2023 06:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1680609223;
        bh=2qooRBWGx2utSFiJsiQrVnbluSiFCjjxxyE462xieWc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sxPopdHr6tppWyF3FojsugEMJ0qW2GHhgVLiVIldItWVppImUu1T+PJbb0zsyHL+o
         BXBzdq9MNhCkIXbHWMm3/phtPPO9vPiGG1zzgUgTwbSfOUR5DaU2W1ybFJ9a6IDmZP
         POacR50HOF3A3/JrKOfUv9CYmo3Oi/kPPDZgltE4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 334Brh0l033475
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Apr 2023 06:53:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 4
 Apr 2023 06:53:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 4 Apr 2023 06:53:42 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 334BrgV5112115;
        Tue, 4 Apr 2023 06:53:42 -0500
Received: from localhost (a0501179-pc.dhcp.ti.com [10.24.69.114])
        by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 334Brf6D009989;
        Tue, 4 Apr 2023 06:53:42 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <srk@ti.com>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: [PATCH v7 2/4] soc: ti: pruss: Add pruss_{request,release}_mem_region() API
Date:   Tue, 4 Apr 2023 17:23:34 +0530
Message-ID: <20230404115336.599430-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230404115336.599430-1-danishanwar@ti.com>
References: <20230404115336.599430-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: "Andrew F. Davis" <afd@ti.com>

Add two new API - pruss_request_mem_region() & pruss_release_mem_region(),
to the PRUSS platform driver to allow client drivers to acquire and release
the common memory resources present within a PRU-ICSS subsystem. This
allows the client drivers to directly manipulate the respective memories,
as per their design contract with the associated firmware.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/soc/ti/pruss.c           | 77 ++++++++++++++++++++++++++++++++
 include/linux/pruss_internal.h   | 27 +++--------
 include/linux/remoteproc/pruss.h | 39 ++++++++++++++++
 3 files changed, 121 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 28b77d715903..7aa0f7171af1 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -92,6 +92,82 @@ void pruss_put(struct pruss *pruss)
 }
 EXPORT_SYMBOL_GPL(pruss_put);
 
+/**
+ * pruss_request_mem_region() - request a memory resource
+ * @pruss: the pruss instance
+ * @mem_id: the memory resource id
+ * @region: pointer to memory region structure to be filled in
+ *
+ * This function allows a client driver to request a memory resource,
+ * and if successful, will let the client driver own the particular
+ * memory region until released using the pruss_release_mem_region()
+ * API.
+ *
+ * Return: 0 if requested memory region is available (in such case pointer to
+ * memory region is returned via @region), an error otherwise
+ */
+int pruss_request_mem_region(struct pruss *pruss, enum pruss_mem mem_id,
+			     struct pruss_mem_region *region)
+{
+	if (!pruss || !region || mem_id >= PRUSS_MEM_MAX)
+		return -EINVAL;
+
+	mutex_lock(&pruss->lock);
+
+	if (pruss->mem_in_use[mem_id]) {
+		mutex_unlock(&pruss->lock);
+		return -EBUSY;
+	}
+
+	*region = pruss->mem_regions[mem_id];
+	pruss->mem_in_use[mem_id] = region;
+
+	mutex_unlock(&pruss->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pruss_request_mem_region);
+
+/**
+ * pruss_release_mem_region() - release a memory resource
+ * @pruss: the pruss instance
+ * @region: the memory region to release
+ *
+ * This function is the complimentary function to
+ * pruss_request_mem_region(), and allows the client drivers to
+ * release back a memory resource.
+ *
+ * Return: 0 on success, an error code otherwise
+ */
+int pruss_release_mem_region(struct pruss *pruss,
+			     struct pruss_mem_region *region)
+{
+	int id;
+
+	if (!pruss || !region)
+		return -EINVAL;
+
+	mutex_lock(&pruss->lock);
+
+	/* find out the memory region being released */
+	for (id = 0; id < PRUSS_MEM_MAX; id++) {
+		if (pruss->mem_in_use[id] == region)
+			break;
+	}
+
+	if (id == PRUSS_MEM_MAX) {
+		mutex_unlock(&pruss->lock);
+		return -EINVAL;
+	}
+
+	pruss->mem_in_use[id] = NULL;
+
+	mutex_unlock(&pruss->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pruss_release_mem_region);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
@@ -294,6 +370,7 @@ static int pruss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pruss->dev = dev;
+	mutex_init(&pruss->lock);
 
 	child = of_get_child_by_name(np, "memories");
 	if (!child) {
diff --git a/include/linux/pruss_internal.h b/include/linux/pruss_internal.h
index 8f91cb164054..cf5287fa01df 100644
--- a/include/linux/pruss_internal.h
+++ b/include/linux/pruss_internal.h
@@ -9,37 +9,18 @@
 #ifndef _PRUSS_INTERNAL_H_
 #define _PRUSS_INTERNAL_H_
 
+#include <linux/mutex.h>
 #include <linux/remoteproc/pruss.h>
 #include <linux/types.h>
 
-/*
- * enum pruss_mem - PRUSS memory range identifiers
- */
-enum pruss_mem {
-	PRUSS_MEM_DRAM0 = 0,
-	PRUSS_MEM_DRAM1,
-	PRUSS_MEM_SHRD_RAM2,
-	PRUSS_MEM_MAX,
-};
-
-/**
- * struct pruss_mem_region - PRUSS memory region structure
- * @va: kernel virtual address of the PRUSS memory region
- * @pa: physical (bus) address of the PRUSS memory region
- * @size: size of the PRUSS memory region
- */
-struct pruss_mem_region {
-	void __iomem *va;
-	phys_addr_t pa;
-	size_t size;
-};
-
 /**
  * struct pruss - PRUSS parent structure
  * @dev: pruss device pointer
  * @cfg_base: base iomap for CFG region
  * @cfg_regmap: regmap for config region
  * @mem_regions: data for each of the PRUSS memory regions
+ * @mem_in_use: to indicate if memory resource is in use
+ * @lock: mutex to serialize access to resources
  * @core_clk_mux: clk handle for PRUSS CORE_CLK_MUX
  * @iep_clk_mux: clk handle for PRUSS IEP_CLK_MUX
  */
@@ -48,6 +29,8 @@ struct pruss {
 	void __iomem *cfg_base;
 	struct regmap *cfg_regmap;
 	struct pruss_mem_region mem_regions[PRUSS_MEM_MAX];
+	struct pruss_mem_region *mem_in_use[PRUSS_MEM_MAX];
+	struct mutex lock; /* PRU resource lock */
 	struct clk *core_clk_mux;
 	struct clk *iep_clk_mux;
 };
diff --git a/include/linux/remoteproc/pruss.h b/include/linux/remoteproc/pruss.h
index 93a98cac7829..33f930e0a0ce 100644
--- a/include/linux/remoteproc/pruss.h
+++ b/include/linux/remoteproc/pruss.h
@@ -44,6 +44,28 @@ enum pru_ctable_idx {
 	PRU_C31,
 };
 
+/*
+ * enum pruss_mem - PRUSS memory range identifiers
+ */
+enum pruss_mem {
+	PRUSS_MEM_DRAM0 = 0,
+	PRUSS_MEM_DRAM1,
+	PRUSS_MEM_SHRD_RAM2,
+	PRUSS_MEM_MAX,
+};
+
+/**
+ * struct pruss_mem_region - PRUSS memory region structure
+ * @va: kernel virtual address of the PRUSS memory region
+ * @pa: physical (bus) address of the PRUSS memory region
+ * @size: size of the PRUSS memory region
+ */
+struct pruss_mem_region {
+	void __iomem *va;
+	phys_addr_t pa;
+	size_t size;
+};
+
 struct device_node;
 struct rproc;
 struct pruss;
@@ -52,6 +74,10 @@ struct pruss;
 
 struct pruss *pruss_get(struct rproc *rproc);
 void pruss_put(struct pruss *pruss);
+int pruss_request_mem_region(struct pruss *pruss, enum pruss_mem mem_id,
+			     struct pruss_mem_region *region);
+int pruss_release_mem_region(struct pruss *pruss,
+			     struct pruss_mem_region *region);
 
 #else
 
@@ -62,6 +88,19 @@ static inline struct pruss *pruss_get(struct rproc *rproc)
 
 static inline void pruss_put(struct pruss *pruss) { }
 
+static inline int pruss_request_mem_region(struct pruss *pruss,
+					   enum pruss_mem mem_id,
+					   struct pruss_mem_region *region)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int pruss_release_mem_region(struct pruss *pruss,
+					   struct pruss_mem_region *region)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_TI_PRUSS */
 
 #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
-- 
2.25.1

