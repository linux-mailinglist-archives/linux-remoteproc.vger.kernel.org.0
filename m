Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4A750521C
	for <lists+linux-remoteproc@lfdr.de>; Mon, 18 Apr 2022 14:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbiDRMka (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 18 Apr 2022 08:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240755AbiDRMjg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Apr 2022 08:39:36 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083A325C40;
        Mon, 18 Apr 2022 05:30:23 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23ICUJoo077263;
        Mon, 18 Apr 2022 07:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1650285019;
        bh=dioqlznUhZ8FwC/kd2gBBFAF1AtsoOMmOZ21zfMtO0w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Cv6iF6t5A2GQPwmeq75HGxpHcr1gHHgE/IG2W9LE2crsOBxFyA7oBrSqQnGqSiGa6
         9cOfiFD95FR2C0B8sdlq4kdxPVSnXr37nMUBAweGTrsZAFwGWQrl7rkfDXC8Q7v6qN
         zRlK4E0q4ODhxwrk0V9NVvddeRhBAVOScfzxBnDI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23ICUJPR060857
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Apr 2022 07:30:19 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 07:30:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 07:30:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23ICUHXa011404;
        Mon, 18 Apr 2022 07:30:18 -0500
From:   Puranjay Mohan <p-mohan@ti.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <s-anna@ti.com>,
        <p-mohan@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <rogerq@kernel.org>, <grygorii.strashko@ti.com>, <vigneshr@ti.com>,
        <kishon@ti.com>
Subject: [PATCH v2 5/6] soc: ti: pruss: Add helper function to enable OCP master ports
Date:   Mon, 18 Apr 2022 18:00:03 +0530
Message-ID: <20220418123004.9332-6-p-mohan@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220418123004.9332-1-p-mohan@ti.com>
References: <20220418123004.9332-1-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The PRU-ICSS subsystem on OMAP-architecture based SoCS (AM33xx, AM437x
and AM57xx SoCs) has a control bit STANDBY_INIT in the PRUSS_CFG register
to initiate a Standby sequence (when set) and trigger a MStandby request
to the SoC's PRCM module. This same bit is also used to enable the OCP
master ports (when cleared). The clearing of the STANDBY_INIT bit requires
an acknowledgment from PRCM and is done through the monitoring of the
PRUSS_SYSCFG.SUB_MWAIT bit.

Add a helper function pruss_cfg_ocp_master_ports() to allow the PRU
client drivers to control this bit and enable or disable the firmware
running on PRU cores access to any peripherals or memory to achieve
desired functionality. The access is disabled by default on power-up
and on any suspend (context is not maintained).

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
---
 drivers/soc/ti/pruss.c | 81 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/pruss.h  |  6 ++++
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index bf5471c4fa33..a2faa672a036 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -22,14 +22,19 @@
 #include <linux/remoteproc.h>
 #include <linux/slab.h>
 
+#define SYSCFG_STANDBY_INIT	BIT(4)
+#define SYSCFG_SUB_MWAIT_READY	BIT(5)
+
 /**
  * struct pruss_private_data - PRUSS driver private data
  * @has_no_sharedram: flag to indicate the absence of PRUSS Shared Data RAM
  * @has_core_mux_clock: flag to indicate the presence of PRUSS core clock
+ * @has_ocp_syscfg: flag to indicate if OCP SYSCFG is present
  */
 struct pruss_private_data {
 	bool has_no_sharedram;
 	bool has_core_mux_clock;
+	bool has_ocp_syscfg;
 };
 
 /**
@@ -205,6 +210,72 @@ int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
 }
 EXPORT_SYMBOL_GPL(pruss_cfg_update);
 
+/**
+ * pruss_cfg_ocp_master_ports() - configure PRUSS OCP master ports
+ * @pruss: the pruss instance handle
+ * @enable: set to true for enabling or false for disabling the OCP master ports
+ *
+ * This function programs the PRUSS_SYSCFG.STANDBY_INIT bit either to enable or
+ * disable the OCP master ports (applicable only on SoCs using OCP interconnect
+ * like the OMAP family). Clearing the bit achieves dual functionalities - one
+ * is to deassert the MStandby signal to the device PRCM, and the other is to
+ * enable OCP master ports to allow accesses outside of the PRU-ICSS. The
+ * function has to wait for the PRCM to acknowledge through the monitoring of
+ * the PRUSS_SYSCFG.SUB_MWAIT bit when enabling master ports. Setting the bit
+ * disables the master access, and also signals the PRCM that the PRUSS is ready
+ * for Standby.
+ *
+ * Return: 0 on success, or an error code otherwise. ETIMEDOUT is returned
+ * when the ready-state fails.
+ */
+int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable)
+{
+	int ret;
+	u32 syscfg_val, i;
+	const struct pruss_private_data *data;
+
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	data = of_device_get_match_data(pruss->dev);
+
+	/* nothing to do on non OMAP-SoCs */
+	if (!data || !data->has_ocp_syscfg)
+		return 0;
+
+	/* assert the MStandby signal during disable path */
+	if (!enable)
+		return pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG,
+					SYSCFG_STANDBY_INIT,
+					SYSCFG_STANDBY_INIT);
+
+	/* enable the OCP master ports and disable MStandby */
+	ret = pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG, SYSCFG_STANDBY_INIT, 0);
+	if (ret)
+		return ret;
+
+	/* wait till we are ready for transactions - delay is arbitrary */
+	for (i = 0; i < 10; i++) {
+		ret = pruss_cfg_read(pruss, PRUSS_CFG_SYSCFG, &syscfg_val);
+		if (ret)
+			goto disable;
+
+		if (!(syscfg_val & SYSCFG_SUB_MWAIT_READY))
+			return 0;
+
+		udelay(5);
+	}
+
+	dev_err(pruss->dev, "timeout waiting for SUB_MWAIT_READY\n");
+	ret = -ETIMEDOUT;
+
+disable:
+	pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG, SYSCFG_STANDBY_INIT,
+			 SYSCFG_STANDBY_INIT);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_ocp_master_ports);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
@@ -495,10 +566,16 @@ static int pruss_remove(struct platform_device *pdev)
 /* instance-specific driver private data */
 static const struct pruss_private_data am437x_pruss1_data = {
 	.has_no_sharedram = false,
+	.has_ocp_syscfg = true,
 };
 
 static const struct pruss_private_data am437x_pruss0_data = {
 	.has_no_sharedram = true,
+	.has_ocp_syscfg = false,
+};
+
+static const struct pruss_private_data am33xx_am57xx_data = {
+	.has_ocp_syscfg = true,
 };
 
 static const struct pruss_private_data am65x_j721e_pruss_data = {
@@ -506,10 +583,10 @@ static const struct pruss_private_data am65x_j721e_pruss_data = {
 };
 
 static const struct of_device_id pruss_of_match[] = {
-	{ .compatible = "ti,am3356-pruss" },
+	{ .compatible = "ti,am3356-pruss", .data = &am33xx_am57xx_data },
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
-	{ .compatible = "ti,am5728-pruss" },
+	{ .compatible = "ti,am5728-pruss", .data = &am33xx_am57xx_data },
 	{ .compatible = "ti,k2g-pruss" },
 	{ .compatible = "ti,am654-icssg", .data = &am65x_j721e_pruss_data, },
 	{ .compatible = "ti,j721e-icssg", .data = &am65x_j721e_pruss_data, },
diff --git a/include/linux/pruss.h b/include/linux/pruss.h
index 84e95eb884e9..7e5e904521ac 100644
--- a/include/linux/pruss.h
+++ b/include/linux/pruss.h
@@ -163,6 +163,7 @@ int pruss_release_mem_region(struct pruss *pruss,
 int pruss_cfg_read(struct pruss *pruss, unsigned int reg, unsigned int *val);
 int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
 		     unsigned int mask, unsigned int val);
+int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable);
 
 #else
 
@@ -198,6 +199,11 @@ static inline int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
 	return -EOPNOTSUPP;
 }
 
+static inline int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_TI_PRUSS */
 
 #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
-- 
2.17.1

