Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9A26E1B4F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 14 Apr 2023 06:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjDNE46 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 14 Apr 2023 00:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjDNE4l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 14 Apr 2023 00:56:41 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BD059E6;
        Thu, 13 Apr 2023 21:56:18 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33E4uBOu104812;
        Thu, 13 Apr 2023 23:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1681448171;
        bh=xJ4OveLdrgFbW7sZqqwcPVAfRJBv7r/pM4QWvoToqww=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=F7HIAFaDi665zisGcGaeNa04g35aI/Ks681EyFxoWAgPQLEAH3RLx4rsW7eRFH867
         9U0kzPN9LItCJ6NWOnKvoOJTq5s2Zs4buGDDAyErSrU+HACjVR5hNQ9tiVaHhYL8Sj
         wSmODGYmLgHBiWYJ1yLNGBcFb56cBUwWJEdz6pck=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33E4uBBe103788
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Apr 2023 23:56:11 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 13
 Apr 2023 23:56:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 13 Apr 2023 23:56:11 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33E4uAMn120352;
        Thu, 13 Apr 2023 23:56:10 -0500
Received: from localhost (uda0501179.dhcp.ti.com [10.24.69.114])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 33E4u9m6000800;
        Thu, 13 Apr 2023 23:56:10 -0500
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
Subject: [PATCH v9 3/4] soc: ti: pruss: Add pruss_cfg_read()/update(), pruss_cfg_get_gpmux()/set_gpmux() APIs
Date:   Fri, 14 Apr 2023 10:25:41 +0530
Message-ID: <20230414045542.3249939-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414045542.3249939-1-danishanwar@ti.com>
References: <20230414045542.3249939-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add two new generic API pruss_cfg_read() and pruss_cfg_update() to
the PRUSS platform driver to read and program respectively a register
within the PRUSS CFG sub-module represented by a syscon driver. These
APIs are internal to PRUSS driver.

Add two new helper functions pruss_cfg_get_gpmux() & pruss_cfg_set_gpmux()
to get and set the GP MUX mode for programming the PRUSS internal wrapper
mux functionality as needed by usecases.

Various useful registers and macros for certain register bit-fields and
their values have also been added.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/soc/ti/pruss.c       | 45 ++++++++++++++++++
 drivers/soc/ti/pruss.h       | 88 ++++++++++++++++++++++++++++++++++++
 include/linux/pruss_driver.h | 32 +++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/soc/ti/pruss.h

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 8ada3758b31a..4ad6ccb039c8 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -21,6 +21,7 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/slab.h>
+#include "pruss.h"
 
 /**
  * struct pruss_private_data - PRUSS driver private data
@@ -168,6 +169,50 @@ int pruss_release_mem_region(struct pruss *pruss,
 }
 EXPORT_SYMBOL_GPL(pruss_release_mem_region);
 
+/**
+ * pruss_cfg_get_gpmux() - get the current GPMUX value for a PRU device
+ * @pruss: pruss instance
+ * @pru_id: PRU identifier (0-1)
+ * @mux: pointer to store the current mux value into
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+int pruss_cfg_get_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 *mux)
+{
+	int ret;
+	u32 val;
+
+	if (pru_id >= PRUSS_NUM_PRUS || !mux)
+		return -EINVAL;
+
+	ret = pruss_cfg_read(pruss, PRUSS_CFG_GPCFG(pru_id), &val);
+	if (!ret)
+		*mux = (u8)((val & PRUSS_GPCFG_PRU_MUX_SEL_MASK) >>
+			    PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_get_gpmux);
+
+/**
+ * pruss_cfg_set_gpmux() - set the GPMUX value for a PRU device
+ * @pruss: pruss instance
+ * @pru_id: PRU identifier (0-1)
+ * @mux: new mux value for PRU
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+int pruss_cfg_set_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 mux)
+{
+	if (mux >= PRUSS_GP_MUX_SEL_MAX ||
+	    pru_id >= PRUSS_NUM_PRUS)
+		return -EINVAL;
+
+	return pruss_cfg_update(pruss, PRUSS_CFG_GPCFG(pru_id),
+				PRUSS_GPCFG_PRU_MUX_SEL_MASK,
+				(u32)mux << PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_set_gpmux);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
diff --git a/drivers/soc/ti/pruss.h b/drivers/soc/ti/pruss.h
new file mode 100644
index 000000000000..6c55987e0e55
--- /dev/null
+++ b/drivers/soc/ti/pruss.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * PRU-ICSS Subsystem user interfaces
+ *
+ * Copyright (C) 2015-2023 Texas Instruments Incorporated - http://www.ti.com
+ *	MD Danish Anwar <danishanwar@ti.com>
+ */
+
+#ifndef _SOC_TI_PRUSS_H_
+#define _SOC_TI_PRUSS_H_
+
+#include <linux/bits.h>
+#include <linux/regmap.h>
+
+/*
+ * PRU_ICSS_CFG registers
+ * SYSCFG, ISRP, ISP, IESP, IECP, SCRP applicable on AMxxxx devices only
+ */
+#define PRUSS_CFG_REVID         0x00
+#define PRUSS_CFG_SYSCFG        0x04
+#define PRUSS_CFG_GPCFG(x)      (0x08 + (x) * 4)
+#define PRUSS_CFG_CGR           0x10
+#define PRUSS_CFG_ISRP          0x14
+#define PRUSS_CFG_ISP           0x18
+#define PRUSS_CFG_IESP          0x1C
+#define PRUSS_CFG_IECP          0x20
+#define PRUSS_CFG_SCRP          0x24
+#define PRUSS_CFG_PMAO          0x28
+#define PRUSS_CFG_MII_RT        0x2C
+#define PRUSS_CFG_IEPCLK        0x30
+#define PRUSS_CFG_SPP           0x34
+#define PRUSS_CFG_PIN_MX        0x40
+
+/* PRUSS_GPCFG register bits */
+#define PRUSS_GPCFG_PRU_GPI_MODE_MASK           GENMASK(1, 0)
+#define PRUSS_GPCFG_PRU_GPI_MODE_SHIFT          0
+
+#define PRUSS_GPCFG_PRU_MUX_SEL_SHIFT           26
+#define PRUSS_GPCFG_PRU_MUX_SEL_MASK            GENMASK(29, 26)
+
+/* PRUSS_MII_RT register bits */
+#define PRUSS_MII_RT_EVENT_EN                   BIT(0)
+
+/* PRUSS_SPP register bits */
+#define PRUSS_SPP_XFER_SHIFT_EN                 BIT(1)
+#define PRUSS_SPP_PRU1_PAD_HP_EN                BIT(0)
+#define PRUSS_SPP_RTU_XFR_SHIFT_EN              BIT(3)
+
+/**
+ * pruss_cfg_read() - read a PRUSS CFG sub-module register
+ * @pruss: the pruss instance handle
+ * @reg: register offset within the CFG sub-module
+ * @val: pointer to return the value in
+ *
+ * Reads a given register within the PRUSS CFG sub-module and
+ * returns it through the passed-in @val pointer
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+static int pruss_cfg_read(struct pruss *pruss, unsigned int reg, unsigned int *val)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	return regmap_read(pruss->cfg_regmap, reg, val);
+}
+
+/**
+ * pruss_cfg_update() - configure a PRUSS CFG sub-module register
+ * @pruss: the pruss instance handle
+ * @reg: register offset within the CFG sub-module
+ * @mask: bit mask to use for programming the @val
+ * @val: value to write
+ *
+ * Programs a given register within the PRUSS CFG sub-module
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+static int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
+			    unsigned int mask, unsigned int val)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	return regmap_update_bits(pruss->cfg_regmap, reg, mask, val);
+}
+
+#endif  /* _SOC_TI_PRUSS_H_ */
diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index c8f2e53b911b..5bb8897724a9 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -14,6 +14,24 @@
 #include <linux/types.h>
 #include <linux/err.h>
 
+/*
+ * enum pruss_gp_mux_sel - PRUSS GPI/O Mux modes for the
+ * PRUSS_GPCFG0/1 registers
+ *
+ * NOTE: The below defines are the most common values, but there
+ * are some exceptions like on 66AK2G, where the RESERVED and MII2
+ * values are interchanged. Also, this bit-field does not exist on
+ * AM335x SoCs
+ */
+enum pruss_gp_mux_sel {
+	PRUSS_GP_MUX_SEL_GP,
+	PRUSS_GP_MUX_SEL_ENDAT,
+	PRUSS_GP_MUX_SEL_RESERVED,
+	PRUSS_GP_MUX_SEL_SD,
+	PRUSS_GP_MUX_SEL_MII2,
+	PRUSS_GP_MUX_SEL_MAX,
+};
+
 /*
  * enum pruss_mem - PRUSS memory range identifiers
  */
@@ -66,6 +84,8 @@ int pruss_request_mem_region(struct pruss *pruss, enum pruss_mem mem_id,
 			     struct pruss_mem_region *region);
 int pruss_release_mem_region(struct pruss *pruss,
 			     struct pruss_mem_region *region);
+int pruss_cfg_get_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 *mux);
+int pruss_cfg_set_gpmux(struct pruss *pruss, enum pruss_pru_id pru_id, u8 mux);
 
 #else
 
@@ -89,6 +109,18 @@ static inline int pruss_release_mem_region(struct pruss *pruss,
 	return -EOPNOTSUPP;
 }
 
+static inline int pruss_cfg_get_gpmux(struct pruss *pruss,
+				      enum pruss_pru_id pru_id, u8 *mux)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline int pruss_cfg_set_gpmux(struct pruss *pruss,
+				      enum pruss_pru_id pru_id, u8 mux)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 #endif /* CONFIG_TI_PRUSS */
 
 #endif	/* _PRUSS_DRIVER_H_ */
-- 
2.34.1

