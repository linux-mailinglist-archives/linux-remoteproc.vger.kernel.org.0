Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE13322DDC
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Feb 2021 16:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhBWPqa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 23 Feb 2021 10:46:30 -0500
Received: from mail-dm6nam11on2078.outbound.protection.outlook.com ([40.107.223.78]:60576
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233314AbhBWPpy (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 10:45:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXVBUmVt7E1SSDZCwAj6yTS+ZB+JSJP6V7PAjq/dFO6PINq+SyjZHtStuhGSAql88LlRRmfOrOyi3VbAnl9sIZDVGiGVN5e+hbo4dP6E+hCBvjjyUN6LX2J7AmQt7fBx9Ht1ESBkJtFfzarix27shYKOcpAYWBJkgEAOl9FP4WwqT1tQEc8uC9MH345ipA0VYoTa/0hB8Tyx0sG+jtvmEbHF2L+AYYjV7XYGPal8Tc56TtfBPepQG7N395gSBci9u5Ub3j6cRkLhoSAHTi9ZaRQu6zjoTCVkztoR4dF1LQSBlbc/Us02JgPZgVlYJCeaT27c8C+5XRYbgpKAvAl2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlbRUKp5jgpT0bfskoLhAHcYQDPzjvcJjZkzbEsPAW4=;
 b=lDA6tYLCoyfDZlb1y04T19m2cAnQIBwYbDFMYMHsXCGv5ZC4mzIthx3j34MiH/VCH8qnT2rAAVEQhh/BomVc8QmZdBAdTgDAQkN3DpMUH2F4ONTtU5e86wGagXLcoOsld2t3FnfJqFF25sp7x0k4APjXCHbDjDA/O1rgWQCImliKeCxfam+5ZgD1ZeuPqMKU1DhEjg2yJH4AY7SoIvaFeb3vrYeUYMhx4kx89DkiUqS0+4xYR2PgUPaWjmevCF6ajw5Eq0qUqxxq0E/RDiYy28f2trFKzoGlGd0/B2I4FKI/Aj7jb42cH0TzPB0+yZ2qjjS9gswZarO3eYWgsSYIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlbRUKp5jgpT0bfskoLhAHcYQDPzjvcJjZkzbEsPAW4=;
 b=ZhNru5edt1MDBnX4gXkEOFKyj92KPyXQdlGIn1zbFd8QsLS3Is1Y1iun1YIqfDDXtnkWhKvavwVcJ19HRbdNGMBenKncrY/g5Q2SBltgR8HeDXBXj/F5pGnsfishhZvcRpF0ehaGINutqZhroMRmJZWmoj4w3kmOxlOF9hTkRq0=
Received: from BL1PR13CA0069.namprd13.prod.outlook.com (2603:10b6:208:2b8::14)
 by BYAPR02MB5432.namprd02.prod.outlook.com (2603:10b6:a03:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 23 Feb
 2021 15:44:54 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b8:cafe::76) by BL1PR13CA0069.outlook.office365.com
 (2603:10b6:208:2b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend
 Transport; Tue, 23 Feb 2021 15:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:44:53 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 23 Feb 2021 07:44:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 23 Feb 2021 07:44:47 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=40282 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1lEZrj-0006uk-Af; Tue, 23 Feb 2021 07:44:47 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v26 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
Date:   Tue, 23 Feb 2021 07:44:47 -0800
Message-ID: <20210223154447.13247-6-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223154447.13247-1-ben.levinsky@xilinx.com>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 416e5243-0dae-4db7-dc4b-08d8d811f6ba
X-MS-TrafficTypeDiagnostic: BYAPR02MB5432:
X-Microsoft-Antispam-PRVS: <BYAPR02MB54326E8CCFADDE5FA1FB684BB5809@BYAPR02MB5432.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ct1yACSP5SIGGOzsw+6pTQTsm5JhlpTdueTRurIvNzvwV97E0P2z7jWlGWhFqr1dxljkVxh+4/5jvG31JH2QF1T5V5lbwixvK6chO4VFOGnR7z2lcHF/t41Z0atPBV0rsb+yg3tzXBP11kcqQ+gqJ0bPybLqz1G3FvM0p397KCGV4CtaRD5ZjS3+7qGegXyqp+M/918nEdUOrCm851M5H+fQrL2eQwMOBtnXTmlRSkTQoN5TDevvTkXnaww6kfg7LnD3UypK/oxO+JH4/oF/M/Pdo+Ab8Bp1cUtBANI3b/vyPCP24H3NiOHppqZs8o5K84oxlEaa4IpTVvPEJHEtvJNRY4d3DVjDHhHWtzg2AH5gbSdp77+jGn9h6UQNEhkKxm5aj7G2/+6acqW5nAnKkHtgXWPOoKakFvUGAs4GEEmqr+gKczp34jUjsx1cWGjV9yp5a/woy4iLcAGIBeiNOcHLO2uEoxQe9WSsjAyuY3EDYnWYKILBCjRN2Cl9TJr7Dm4oO8ZyU5Brh4QtxEjjVv8llBhJVOWg3eBbYVCGnYlWMrHiGtoDh1mbKD1H/IMUCrgMUxNyMKKJlGloCWVnVr73fQE7XpE0FUaFue9JF1iaiVjQIlrfXRL1bGtyEatQd0LiJFpdy0RKhsytyqR+iv05ArscPGjssMRM3kHTOSbqSPfYqmv0oOY8uXX5n/hP
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(70586007)(70206006)(8676002)(6916009)(83380400001)(107886003)(30864003)(426003)(1076003)(2616005)(4326008)(9786002)(186003)(44832011)(2906002)(5660300002)(8936002)(336012)(82310400003)(82740400003)(26005)(47076005)(36860700001)(478600001)(7636003)(36756003)(316002)(356005)(7696005)(54906003)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:44:53.6980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 416e5243-0dae-4db7-dc4b-08d8d811f6ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5432
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
remoteproc driver, we can boot the R5 sub-system in two different
configurations -
	* Split
	* Lockstep

The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
Platform Management Unit that handles the R5 configuration, memory access
and R5 lifecycle management. The interface to this manager is done in this
driver via zynqmp_pm_* function calls.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
Signed-off-by: Jason Wu <j.wu@xilinx.com>
Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/remoteproc/Kconfig                |   8 +
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c | 954 ++++++++++++++++++++++
 3 files changed, 963 insertions(+)
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfea7c7..c2fe54b1d94f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
 	  It's safe to say N here if you're not interested in utilizing
 	  the DSP slave processors.
 
+config ZYNQMP_R5_REMOTEPROC
+	tristate "ZynqMP R5 remoteproc support"
+	depends on PM && ARCH_ZYNQMP
+	select RPMSG_VIRTIO
+	select ZYNQMP_IPI_MBOX
+	help
+	  Say y or m here to support ZynqMP R5 remote processors via the remote
+	  processor framework.
 endif # REMOTEPROC
 
 endmenu
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 3dfa28e6c701..ef1abff654c2 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
 obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
+obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+= zynqmp_r5_remoteproc.o
diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c b/drivers/remoteproc/zynqmp_r5_remoteproc.c
new file mode 100644
index 000000000000..4bcff2daceaf
--- /dev/null
+++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
@@ -0,0 +1,954 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Zynq R5 Remote Processor driver
+ *
+ * Based on origin OMAP and Zynq Remote Processor driver
+ *
+ */
+
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/zynqmp-ipi-message.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/skbuff.h>
+#include <linux/sysfs.h>
+
+#include "remoteproc_internal.h"
+
+#define MAX_RPROCS	2 /* Support up to 2 RPU */
+#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory instance */
+
+#define BANK_LIST_PROP	"sram"
+#define DDR_LIST_PROP	"memory-region"
+
+/* IPI buffer MAX length */
+#define IPI_BUF_LEN_MAX	32U
+/* RX mailbox client buffer max length */
+#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
+				 sizeof(struct zynqmp_ipi_message))
+
+/*
+ * Map each Xilinx on-chip SRAM  Bank address to their own respective
+ * pm_node_id.
+ *
+ * size can differ based on R5 cluster configuration so record from
+ * device tree in zynqmp_r5_probe.
+ */
+struct sram_addr_data {
+	phys_addr_t addr;
+	enum pm_node_id id;
+	resource_size_t size;
+};
+
+#define NUM_SRAMS 4U
+static const struct sram_addr_data zynqmp_banks[NUM_SRAMS] = {
+	{0xffe00000UL, NODE_TCM_0_A, 0},
+	{0xffe20000UL, NODE_TCM_0_B, 0},
+	{0xffe90000UL, NODE_TCM_1_A, 0},
+	{0xffeb0000UL, NODE_TCM_1_B, 0},
+};
+
+/**
+ * struct zynqmp_r5_rproc - ZynqMP R5 core structure
+ *
+ * @rx_mc_buf: rx mailbox client buffer to save the rx message
+ * @srams : srams Xilinx mgmt IDs for srams that will be used by R5 core.
+ * @tx_mc: tx mailbox client
+ * @rx_mc: rx mailbox client
+ * @mbox_work: mbox_work for the RPU remoteproc
+ * @tx_mc_skbs: socket buffers for tx mailbox client
+ * @rproc: rproc handle
+ * @tx_chan: tx mailbox channel
+ * @rx_chan: rx mailbox channel
+ * @pnode_id: RPU CPU power domain id
+ * @elem: linked list item
+ */
+struct zynqmp_r5_rproc {
+	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
+	struct sram_addr_data srams[NUM_SRAMS];
+	struct mbox_client tx_mc;
+	struct mbox_client rx_mc;
+	struct work_struct mbox_work;
+	struct sk_buff_head tx_mc_skbs;
+	struct rproc *rproc;
+	struct mbox_chan *tx_chan;
+	struct mbox_chan *rx_chan;
+	u32 pnode_id;
+	struct list_head elem;
+};
+
+/*
+ * r5_set_mode
+ * @z_rproc: Remote processor private data
+ * @rpu_mode: mode specified by device tree to configure the RPU to
+ *
+ * set RPU operation mode
+ *
+ * Return: 0 for success, negative value for failure
+ */
+static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
+		       enum rpu_oper_mode rpu_mode)
+{
+	enum rpu_tcm_comb tcm_mode;
+	enum rpu_oper_mode cur_rpu_mode;
+	int ret;
+
+	ret = zynqmp_pm_get_rpu_mode(z_rproc->pnode_id, &cur_rpu_mode);
+	if (ret < 0)
+		return ret;
+
+	if (rpu_mode != cur_rpu_mode) {
+		ret = zynqmp_pm_set_rpu_mode(z_rproc->pnode_id, rpu_mode);
+		if (ret < 0)
+			return ret;
+	}
+
+	tcm_mode = (rpu_mode == PM_RPU_MODE_LOCKSTEP) ?
+		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
+	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
+}
+
+/*
+ * r5_rproc_prepare
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * The Xilinx Versal and ZU+ SoC's require devices (in this case srams) to be
+ * requested for a given device to be used. As the R5's TCM banks may be used
+ * by the cores, each of these banks has to be requested before they can be
+ * used.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int r5_rproc_prepare(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	int ret, i;
+
+	for (i = 0; i < NUM_SRAMS; i++) {
+		if (!z_rproc->srams[i].id)
+			continue;
+
+		ret = zynqmp_pm_request_node(z_rproc->srams[i].id,
+					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
+/*
+ * r5_rproc_unprepare
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * This function implements the .unprepare() ops and performs the complementary
+ * operations to that of the .prepare() ops. This instructs the power
+ * management controller that the node is no longer needed by that cluster,
+ * allowing the node to be placed into an inactive state. The cores
+ * themselves are only halted in the .stop() callback. The .unprepare() ops are
+ * invoked by the remoteproc core after the remoteproc is stopped.
+ *
+ * Return on first error seen as whatever causes the first error
+ * may cause subsequent iterations to fail with a different error.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int r5_rproc_unprepare(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	int ret, i;
+
+	for (i = 0; i < NUM_SRAMS; i++) {
+		if (!z_rproc->srams[i].id)
+			continue;
+
+		ret = zynqmp_pm_release_node(z_rproc->srams[i].id);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
+/*
+ * zynqmp_r5_rproc_start
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Start R5 Core from designated boot address.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_start(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	enum rpu_boot_mem bootmem;
+
+	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
+		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+
+	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
+		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+
+	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
+				      bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+}
+
+/*
+ * zynqmp_r5_rproc_stop
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Power down  R5 Core.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_stop(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+
+	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
+				      ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+}
+
+/*
+ * zynqmp_r5_rproc_mem_alloc
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to map
+ *
+ * Callback to map va for memory-region's carveout.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
+				     struct rproc_mem_entry *mem)
+{
+	void *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va))
+		return -ENOMEM;
+
+	mem->va = va;
+
+	return 0;
+}
+
+/*
+ * zynqmp_r5_rproc_mem_release
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to unmap
+ *
+ * Unmap memory-region carveout
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
+				       struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+	return 0;
+}
+
+/*
+ * parse_mem_regions
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Construct rproc mem carveouts from carveout provided in
+ * memory-region property
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int parse_mem_regions(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device_node *np = z_rproc->rproc->dev.parent->of_node;
+	struct device *dev = &rproc->dev;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	int index = 0;
+
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, DDR_LIST_PROP, NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire %s\n", DDR_LIST_PROP);
+			return -EINVAL;
+		}
+
+		if (strstr(it.node->name, "vdev0buffer")) {
+			mem = rproc_of_resm_mem_entry_init(dev, index,
+							   rmem->size,
+							   rmem->base,
+							   "vdev0buffer");
+		} else {
+			/*
+			 * The ensuing carveout is either for vring, which has
+			 * device tree node name of length 15 characters, or
+			 * firmware mem, where name is not used by remoteproc
+			 * core later on. So default to vring length of 15.
+			 *
+			 * Extra char for null-terminated string.
+			 *
+			 * only allocate in negative case as strstr returns
+			 * pointer + offset to string in positive case.
+			 */
+			char *name;
+
+			name = strstr(it.node->name, "vdev0vring");
+			if (name) {
+				/*
+				 * Expect "rpuXvdev0vringX" as documented
+				 * in xilinx remoteproc device tree binding
+				 */
+				if (strlen(it.node->name) < 15) {
+					dev_err(dev, "%pOF is less than 15 chars",
+						it.node);
+					return -EINVAL;
+				}
+			} else {
+				name = devm_kzalloc(dev, 16 * sizeof(char),
+						    GFP_KERNEL);
+				if (!name)
+					return -ENOMEM;
+				strncpy(name, it.node->name, 16);
+			}
+
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   zynqmp_r5_rproc_mem_alloc,
+						   zynqmp_r5_rproc_mem_release,
+						   name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+		index++;
+	}
+
+	return 0;
+}
+
+/*
+ * tcm_mem_alloc
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to initialize the va and da fields of
+ *
+ * Given TCM bank entry, this callback will set device address for R5
+ * running on TCM and also setup virtual address for TCM bank
+ * remoteproc carveout.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int tcm_mem_alloc(struct rproc *rproc,
+			 struct rproc_mem_entry *mem)
+{
+	void *va;
+	struct device *dev = rproc->dev.parent;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va))
+		return -ENOMEM;
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	/*
+	 * The R5s expect their TCM banks to be at address 0x0 and 0x2000,
+	 * while on the Linux side they are at 0xffexxxxx.
+	 *
+	 * Zero out the high 12 bits of the address. This will give
+	 * expected values for TCM Banks 0A and 0B (0x0 and 0x20000).
+	 */
+	mem->da &= 0x000fffff;
+
+	/*
+	 * TCM Banks 1A and 1B still have to be translated.
+	 *
+	 * Below handle these two banks' absolute addresses (0xffe90000 and
+	 * 0xffeb0000) and convert to the expected relative addresses
+	 * (0x0 and 0x20000).
+	 */
+	if (mem->da == 0x90000 || mem->da == 0xB0000)
+		mem->da -= 0x90000;
+
+	/* if translated TCM bank address is not valid report error */
+	if (mem->da != 0x0 && mem->da != 0x20000) {
+		dev_err(dev, "invalid TCM bank address: %x\n", mem->da);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * tcm_mem_release
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to unmap
+ *
+ * Unmap TCM banks when powering down R5 core.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+	return 0;
+}
+
+/*
+ * parse_tcm_banks
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Given R5 node in remoteproc instance
+ * allocate remoteproc carveout for TCM memory
+ * needed for firmware to be loaded
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int parse_tcm_banks(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct rproc_mem_entry *mem;
+	int i;
+
+	for (i = 0; i < NUM_SRAMS; i++) {
+		if (!z_rproc->srams[i].id)
+			continue;
+
+		mem = rproc_mem_entry_init(&rproc->dev, NULL,
+					   z_rproc->srams[i].addr,
+					   (size_t)z_rproc->srams[i].size,
+					   z_rproc->srams[i].addr,
+					   tcm_mem_alloc,
+					   tcm_mem_release, "sram");
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
+/*
+ * zynqmp_r5_parse_fw
+ * @rproc: single R5 core's corresponding rproc instance
+ * @fw: ptr to firmware to be loaded onto r5 core
+ *
+ * When loading firmware, ensure the necessary carveouts are in remoteproc
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = parse_tcm_banks(rproc);
+	if (ret)
+		return ret;
+
+	ret = parse_mem_regions(rproc);
+	if (ret)
+		return ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret == -EINVAL) {
+		/*
+		 * resource table only required for IPC.
+		 * if not present, this is not necessarily an error;
+		 * for example, loading r5 hello world application
+		 * so simply inform user and keep going.
+		 */
+		dev_info(&rproc->dev, "no resource table found.\n");
+		ret = 0;
+	}
+	return ret;
+}
+
+/*
+ * zynqmp_r5_rproc_kick - kick a firmware if mbox is provided
+ * @rproc: r5 core's corresponding rproc structure
+ * @vqid: virtqueue ID
+ */
+static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct zynqmp_ipi_message *mb_msg = NULL;
+	unsigned int skb_len;
+	struct sk_buff *skb;
+	int ret;
+
+	/* If vqid is negative, do not pass the vqid to
+	 * mailbox as vqid is supposed to be 0 or positive.
+	 * It also gives a way to just kick instead but
+	 * not use the IPI buffer.
+	 *
+	 * For now use negative vqid to assume no message will be
+	 * passed with IPI buffer, but just raise interrupt.
+	 * This will be faster as it doesn't need to copy the
+	 * message to the ZynqMP/Versal IPI message buffer.
+	 */
+	if (vqid >= 0) {
+		skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
+		skb = alloc_skb(skb_len, GFP_KERNEL);
+		if (!skb)
+			return;
+
+		mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
+		mb_msg->len = sizeof(vqid);
+		memcpy(mb_msg->data, &vqid, sizeof(vqid));
+
+		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
+	}
+
+	ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
+	if (ret < 0) {
+		dev_warn(dev, "Failed to kick remote.\n");
+		if (mb_msg) {
+			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
+			kfree_skb(skb);
+		}
+	}
+}
+
+static struct rproc_ops zynqmp_r5_rproc_ops = {
+	.start		= zynqmp_r5_rproc_start,
+	.stop		= zynqmp_r5_rproc_stop,
+	.load		= rproc_elf_load_segments,
+	.parse_fw	= zynqmp_r5_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check	= rproc_elf_sanity_check,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.kick		= zynqmp_r5_rproc_kick,
+	.prepare	= r5_rproc_prepare,
+	.unprepare	= r5_rproc_unprepare,
+};
+
+/**
+ * event_notified_idr_cb - event notified idr callback
+ * @id: idr id
+ * @ptr: pointer to idr private data
+ * @data: data passed to idr_for_each callback
+ *
+ * Pass notification to remoteproc virtio
+ *
+ * Return: 0. having return is to satisfy the idr_for_each() function
+ *          pointer input argument requirement.
+ **/
+static int event_notified_idr_cb(int id, void *ptr, void *data)
+{
+	struct rproc *rproc = data;
+
+	if (rproc_vq_interrupt(rproc, id) == IRQ_NONE)
+		dev_dbg(&rproc->dev, "no message was found in idr with id: %d\n", id);
+	return 0;
+}
+
+/**
+ * handle_event_notified - remoteproc notification work function
+ * @work: pointer to the work structure
+ *
+ * It checks each registered remoteproc notify IDs.
+ */
+static void handle_event_notified(struct work_struct *work)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+	struct rproc *rproc;
+
+	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
+	rproc = z_rproc->rproc;
+
+	/*
+	 * This is to simply raise interrupt as ACK for remote.
+	 *
+	 * Xilinx mailbox, ATF and SoC specific IPI mapping will handle
+	 * mapping to remote processor.
+	 */
+	if (mbox_send_message(z_rproc->rx_chan, NULL) < 0)
+		dev_warn(rproc->dev.parent, "Failed to kick remote.\n");
+
+	/*
+	 * We only use IPI for interrupt. The firmware side may or may
+	 * not write the notifyid when it trigger IPI.
+	 * And thus, we scan through all the registered notifyids.
+	 */
+	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
+}
+
+/**
+ * zynqmp_r5_mb_rx_cb - Receive channel mailbox callback
+ * @cl: mailbox client
+ * @msg: message pointer
+ *
+ * It will schedule the R5 notification work.
+ */
+static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
+	/*
+	 * Notification can be received with message payload.
+	 * To handle this, check for message contents.
+	 * If there are contents, copy to ipi message buffer payload location.
+	 *
+	 * If message is empty, then that means that was simple raising
+	 * of interrupt. no payload to process.
+	 *
+	 * Note: enqueue work regardless of msg as kick may imply that remote
+	 * is waiting for ack.
+	 */
+	if (msg) {
+		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+		size_t len;
+
+		ipi_msg = (struct zynqmp_ipi_message *)msg;
+		buf_msg = (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
+		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
+		      IPI_BUF_LEN_MAX : ipi_msg->len;
+		buf_msg->len = len;
+		memcpy(buf_msg->data, ipi_msg->data, len);
+	}
+	schedule_work(&z_rproc->mbox_work);
+}
+
+/**
+ * zynqmp_r5_mb_tx_done - Request has been sent to the remote
+ * @cl: mailbox client
+ * @msg: pointer to the message which has been sent
+ * @r: status of last TX - OK or error
+ *
+ * It will be called by the mailbox framework when the last TX has done.
+ */
+static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *msg, int r)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+	struct sk_buff *skb;
+
+	if (!msg)
+		return;
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
+	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
+	kfree_skb(skb);
+}
+
+/**
+ * zynqmp_r5_setup_mbox - Setup mailboxes
+ *			    this is used for each individual R5 core
+ *
+ * @z_rproc: pointer to the ZynqMP R5 processor platform data
+ * @node: pointer of the device node
+ *
+ * Function to setup mailboxes to talk to RPU.
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
+				struct device_node *node)
+{
+	struct mbox_client *mclient;
+
+	/* Setup TX mailbox channel client */
+	mclient			= &z_rproc->tx_mc;
+	mclient->dev		= z_rproc->rproc->dev.parent;
+	mclient->tx_done	= zynqmp_r5_mb_tx_done;
+	mclient->tx_block	= false;
+	mclient->knows_txdone	= false;
+	mclient->rx_callback	= NULL;
+
+	/* Setup RX mailbox channel client */
+	mclient			= &z_rproc->rx_mc;
+	mclient->dev		= z_rproc->rproc->dev.parent;
+	mclient->tx_done	= NULL;
+	mclient->tx_block	= false;
+	mclient->knows_txdone	= false;
+	mclient->rx_callback	= zynqmp_r5_mb_rx_cb;
+
+	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
+
+	/* Request TX and RX channels */
+	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc->tx_mc, "tx");
+	if (IS_ERR(z_rproc->tx_chan)) {
+		dev_err(z_rproc->rproc->dev.parent,
+			"failed to request mbox tx channel.\n");
+		return PTR_ERR(z_rproc->tx_chan);
+	}
+
+	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc->rx_mc, "rx");
+	if (IS_ERR(z_rproc->rx_chan)) {
+		dev_err(z_rproc->rproc->dev.parent,
+			"failed to request mbox rx channel.\n");
+		return PTR_ERR(z_rproc->rx_chan);
+	}
+	skb_queue_head_init(&z_rproc->tx_mc_skbs);
+
+	return 0;
+}
+
+static void zynqmp_r5_cleanup_mbox(struct zynqmp_r5_rproc *z_rproc)
+{
+	mbox_free_channel(z_rproc->tx_chan);
+	mbox_free_channel(z_rproc->rx_chan);
+}
+
+/**
+ * zynqmp_r5_probe - Probes ZynqMP R5 processor device node
+ *		       this is called for each individual R5 core to
+ *		       set up mailbox, Xilinx platform manager unique ID,
+ *		       add to rproc core
+ *
+ * @pdev: domain platform device for current R5 core
+ * @node: pointer of the device node for current R5 core
+ * @rpu_mode: mode to configure RPU, split or lockstep
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct platform_device *pdev,
+					       struct device_node *node,
+					       enum rpu_oper_mode rpu_mode)
+{
+	int ret, num_banks;
+	struct device *dev = &pdev->dev;
+	struct rproc *rproc_ptr;
+	struct zynqmp_r5_rproc *z_rproc;
+	struct device_node *r5_node;
+
+	/* Allocate remoteproc instance */
+	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
+				     NULL, sizeof(struct zynqmp_r5_rproc));
+	if (!rproc_ptr) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	rproc_ptr->auto_boot = false;
+	z_rproc = rproc_ptr->priv;
+	z_rproc->rproc = rproc_ptr;
+	r5_node = z_rproc->rproc->dev.parent->of_node;
+
+	/* Set up DMA mask */
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto error;
+
+	/* Get R5 power domain node */
+	ret = of_property_read_u32(node, "power-domain", &z_rproc->pnode_id);
+	if (ret)
+		goto error;
+
+	ret = r5_set_mode(z_rproc, rpu_mode);
+	if (ret)
+		goto error;
+
+	if (of_property_read_bool(node, "mboxes")) {
+		ret = zynqmp_r5_setup_mbox(z_rproc, node);
+		if (ret)
+			goto error;
+	}
+
+	/* go through TCM banks for r5 node */
+	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
+	if (num_banks <= 0) {
+		dev_err(dev, "need to specify TCM banks\n");
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (num_banks > NUM_SRAMS) {
+		dev_err(dev, "max number of srams is %d. given: %d \r\n",
+			NUM_SRAMS, num_banks);
+		ret = -EINVAL;
+		goto error;
+	}
+
+	/* construct collection of srams used by the current R5 core */
+	for (; num_banks; num_banks--) {
+		struct resource rsc;
+		struct device_node *dt_node;
+		resource_size_t size;
+		int i;
+
+		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
+		if (!dt_node) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		ret = of_address_to_resource(dt_node, 0, &rsc);
+		if (ret < 0) {
+			of_node_put(dt_node);
+			goto error;
+		}
+
+		of_node_put(dt_node);
+		size = resource_size(&rsc);
+
+		/*
+		 * Find corresponding Xilinx platform management ID.
+		 * The bank information is used in prepare/unprepare and
+		 * parse_fw.
+		 */
+		for (i = 0; i < NUM_SRAMS; i++) {
+			if (rsc.start == zynqmp_banks[i].addr) {
+				z_rproc->srams[i].addr = rsc.start;
+				z_rproc->srams[i].size = size;
+				z_rproc->srams[i].id = zynqmp_banks[i].id;
+				break;
+			}
+		}
+
+		if (i == NUM_SRAMS) {
+			dev_err(dev, "sram %llx is not valid.\n", rsc.start);
+			ret = -EINVAL;
+			goto error;
+		}
+	}
+
+	/* Add R5 remoteproc */
+	ret = devm_rproc_add(dev, rproc_ptr);
+	if (ret) {
+		zynqmp_r5_cleanup_mbox(z_rproc);
+		goto error;
+	}
+
+	return z_rproc;
+error:
+	return ERR_PTR(ret);
+}
+
+/*
+ * zynqmp_r5_remoteproc_probe
+ *
+ * @pdev: domain platform device for R5 cluster
+ *
+ * called when driver is probed, for each R5 core specified in DT,
+ * setup as needed to do remoteproc-related operations
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
+{
+	int ret, core_count;
+	struct device *dev = &pdev->dev;
+	struct device_node *nc;
+	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
+	struct list_head *cluster; /* list to track each core's rproc */
+	struct zynqmp_r5_rproc *z_rproc;
+	struct platform_device *child_pdev;
+	struct list_head *pos;
+
+	ret = of_property_read_u32(dev->of_node, "xlnx,cluster-mode", &rpu_mode);
+	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
+			rpu_mode != PM_RPU_MODE_SPLIT)) {
+		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
+			ret, rpu_mode);
+		return ret;
+	}
+
+	dev_dbg(dev, "RPU configuration: %s\n",
+		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
+
+	/*
+	 * if 2 RPUs provided but one is lockstep, then we have an
+	 * invalid configuration.
+	 */
+
+	core_count = of_get_available_child_count(dev->of_node);
+	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
+	    core_count > MAX_RPROCS)
+		return -EINVAL;
+
+	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
+	if (!cluster)
+		return -ENOMEM;
+	INIT_LIST_HEAD(cluster);
+
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	/* probe each individual r5 core's remoteproc-related info */
+	for_each_available_child_of_node(dev->of_node, nc) {
+		child_pdev = of_find_device_by_node(nc);
+		if (!child_pdev) {
+			dev_err(dev, "could not get R5 core platform device\n");
+			ret = -ENODEV;
+			goto out;
+		}
+
+		z_rproc = zynqmp_r5_probe(child_pdev, nc, rpu_mode);
+		dev_dbg(dev, "%s to probe rpu %pOF\n",
+			ret ? "Failed" : "Able", nc);
+		if (IS_ERR(z_rproc)) {
+			ret = PTR_ERR(z_rproc);
+			goto out;
+		}
+		list_add_tail(&z_rproc->elem, cluster);
+	}
+	/* wire in so each core can be cleaned up at driver remove */
+	platform_set_drvdata(pdev, cluster);
+	return 0;
+out:
+	list_for_each(pos, cluster) {
+		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
+		zynqmp_r5_cleanup_mbox(z_rproc);
+	}
+	return ret;
+}
+
+/*
+ * zynqmp_r5_remoteproc_remove
+ *
+ * @pdev: domain platform device for R5 cluster
+ *
+ * When the driver is unloaded, clean up the mailboxes for each
+ * remoteproc that was initially probed.
+ */
+static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
+{
+	struct list_head *pos, *temp, *cluster = (struct list_head *)
+						 platform_get_drvdata(pdev);
+	struct zynqmp_r5_rproc *z_rproc = NULL;
+
+	list_for_each_safe(pos, temp, cluster) {
+		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
+		zynqmp_r5_cleanup_mbox(z_rproc);
+	}
+	return 0;
+}
+
+/* Match table for OF platform binding */
+static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
+	{ .compatible = "xlnx,zynqmp-r5-remoteproc", },
+	{ /* end of list */ },
+};
+MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
+
+static struct platform_driver zynqmp_r5_remoteproc_driver = {
+	.probe = zynqmp_r5_remoteproc_probe,
+	.remove = zynqmp_r5_remoteproc_remove,
+	.driver = {
+		.name = "zynqmp_r5_remoteproc",
+		.of_match_table = zynqmp_r5_remoteproc_match,
+	},
+};
+module_platform_driver(zynqmp_r5_remoteproc_driver);
+
+MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

