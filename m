Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B6D2A4EBE
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Nov 2020 19:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgKCSXs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 3 Nov 2020 13:23:48 -0500
Received: from mail-co1nam11on2046.outbound.protection.outlook.com ([40.107.220.46]:51012
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729233AbgKCSXr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:23:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JW6hMozbMcxvTGZVFfdq6NoAz2KlXxEZbT4quMP57gwGujkZ6//C2e0dlOn1ZRpZrh590Xs+WQc39nCW1FXHbyzuJDjoHZ09hQPFnfnv1GJ8qg346DWnHHg8Zf9PuE/ylo0Ho0TnLsXkJwj9gLpjG0CyR+X1Q+/wvazs+edsUYY+5/vVMm1N5fU1xZhRknlQiDhygZ5CIZyylIc9ZS1OoCwlYik4AeROjanTMTxMe5+vP4r4d05iKSBfQvLiXAR3VDCe6nHebx31U270XasClAdKh6YgCEvmNoKVBT0zTYBYlPn+gX0e80tbPszTozLQtwxviYlaDzlUJs8+AF8SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqQNJTTtqt7V8CZdrUvS45YwOIB1sjVIkewXKoCW3ow=;
 b=MbVTFGz08p2GlSPqXzAan37Lrwx+AckqfiYilKPQBIz6FnDA0pI2DUtHh46yEHX81RjJxvJbpt6nzriMYB7Rw5jLK9Pg4v0jQRWVkdW7nja/YaiUD1T4j59135bMnCRBJx/DAmrPfdftqiQcjk6rB9M7NuZajU2xMMWz8O74P39Zfxblf5g0VlRN2J+3fRCvM7zBsbfotvMMdZZnrJOSXUIUzmI3k3laZMnCQU4GQXnRccfdjWMilxQAPTmMxmEs2aNpGHYM8FPHPajmzaFTGvkhMHuNGLUrTt0XA1WU32I+8fWe33NCJAT/7+fjJeps7FJCedgek+YuqIcr85Fy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqQNJTTtqt7V8CZdrUvS45YwOIB1sjVIkewXKoCW3ow=;
 b=mCjyMMdjyFAtm1QDSX9SFzcPbv/OQ+MM7obT7cr+jSXiyujhKfOMyL38xe3O4A8KOVScBdtDNzGIrVL4YYxcHqZY8z+820r1OZQv3mLSmAMxh83yDx18EIwz94zcS96IGVfSmxb9cQMcEOQVIBKmykOb6hIvg8RtqTJZLhbThXc=
Received: from MN2PR01CA0023.prod.exchangelabs.com (2603:10b6:208:10c::36) by
 BYAPR02MB5175.namprd02.prod.outlook.com (2603:10b6:a03:6f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.29; Tue, 3 Nov 2020 18:23:41 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:10c:cafe::36) by MN2PR01CA0023.outlook.office365.com
 (2603:10b6:208:10c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 18:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 18:23:40 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 3 Nov 2020 10:23:40 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 3 Nov 2020 10:23:40 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58698 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1ka0y4-0002gB-2I; Tue, 03 Nov 2020 10:23:40 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v22 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
Date:   Tue, 3 Nov 2020 10:23:39 -0800
Message-ID: <20201103182339.14286-6-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103182339.14286-1-ben.levinsky@xilinx.com>
References: <20201103182339.14286-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54e9e4ce-ea8d-4269-9296-08d8802596ff
X-MS-TrafficTypeDiagnostic: BYAPR02MB5175:
X-Microsoft-Antispam-PRVS: <BYAPR02MB51754E22C50AB602D4DC730FB5110@BYAPR02MB5175.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqdmmtvkwuA+QG/fDLuXiOPXLFQD0zmkkfy7vCY+nV2zglDUP7H0DDb0pxC3H2XTNBuNhSD14dxAS5C/zRUP1zvbULztOCumgavQpy9Q8y12wJzhrG4azO6rwMriibUsAZGMteY37mhy/GSUvknsg9ZErUFWslPvkClR8j58+tWexbWf3nONP4zTjGli9kZJcpw6CIM3ZfwI0DKClVBfsVf0BaX34lTmFPj5fi+d+DHDFtbLLd3LwTYUfWhAfxX4kPw62tJZm6FdOqSmWecjnzNfznnRC7BjhIfje9N6U3kRXqOfg9TYdC4znovrXa0o8JMMvRFM3b0wWLrgwT63ujPSWPNaS3TFXAopkRqOFMZyr/SQOvvDhQzq0Xtc2CiQd6hg6aCR7U/f5lKzVU9ZTguldzitEtHb881QK564kDg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(83380400001)(8676002)(2616005)(478600001)(2906002)(186003)(7696005)(70586007)(336012)(70206006)(110136005)(4326008)(8936002)(54906003)(36756003)(316002)(26005)(356005)(82740400003)(426003)(30864003)(1076003)(44832011)(36906005)(47076004)(5660300002)(9786002)(7636003)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 18:23:40.6992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e9e4ce-ea8d-4269-9296-08d8802596ff
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5175
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
remotproc driver, we can boot the R5 sub-system in different 2
configurations -
	* split
	* lock-step

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
- update documented param list for zynqmp_r5_probe
- remove use-after-free lines in zynqmp_r5_probe,
  zynqmp_r5_remoteproc_probe, and zynqmp_r5_remoteproc_remove
- update path for error handling in zynqmp_r5_probe and
  zynqmp_r5_remoteproc_probe
- as the mbox properties are optional, update zynqmp_r5_rproc_kick
  so that the mailbox functionality only occurs if these
  properties are provided
---
 drivers/remoteproc/Kconfig                |   8 +
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c | 778 ++++++++++++++++++++++
 3 files changed, 787 insertions(+)
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
index 000000000000..48bffa91bc00
--- /dev/null
+++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
@@ -0,0 +1,779 @@
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
+#define BANK_LIST_PROP	"meta-memory-regions"
+#define DDR_LIST_PROP	"memory-regions"
+
+/* IPI buffer MAX length */
+#define IPI_BUF_LEN_MAX	32U
+/* RX mailbox client buffer max length */
+#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
+				 sizeof(struct zynqmp_ipi_message))
+
+/**
+ * struct zynqmp_r5_mem - zynqmp rpu memory data
+ * @pnode_id: TCM power domain ids
+ * @res: memory resource
+ * @node: list node
+ */
+struct zynqmp_r5_mem {
+	u32 pnode_id[MAX_MEM_PNODES];
+	struct resource res;
+	struct list_head node;
+};
+
+/**
+ * struct zynqmp_r5_rproc - zynqmp rpu remote processor state
+ *			    this is for each individual R5 core's state
+ *
+ * @rx_mc_buf: rx mailbox client buffer to save the rx message
+ * @tx_mc: tx mailbox client
+ * @rx_mc: rx mailbox client * @dev: device of RPU instance
+ * @mbox_work: mbox_work for the RPU remoteproc
+ * @tx_mc_skbs: socket buffers for tx mailbox client
+ * @dev: device of RPU instance
+ * @rproc: rproc handle
+ * @tx_chan: tx mailbox channel
+ * @rx_chan: rx mailbox channel
+ * @pnode_id: RPU CPU power domain id
+ * @elem: linked list item
+ * @dt_node: device tree node that holds information for 1 R5 core.
+ */
+struct zynqmp_r5_rproc {
+	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
+	struct mbox_client tx_mc;
+	struct mbox_client rx_mc;
+	struct work_struct mbox_work;
+	struct sk_buff_head tx_mc_skbs;
+	struct device *dev;
+	struct rproc *rproc;
+	struct mbox_chan *tx_chan;
+	struct mbox_chan *rx_chan;
+	u32 pnode_id;
+	struct list_head elem;
+};
+
+/*
+ * r5_set_mode - set RPU operation mode
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
+		ret = zynqmp_pm_set_rpu_mode(z_rproc->pnode_id,
+					     rpu_mode);
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
+ * release TCM banks when powering down R5 core
+ */
+static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	u32 pnode_id = (u64)mem->priv;
+
+	iounmap(mem->va);
+	return zynqmp_pm_release_node(pnode_id);
+}
+
+/*
+ * given ID corresponding to R5 core in Xilinx Platform management (xpm) API,
+ * try to use xpm wake call to wake R5 core
+ */
+static int zynqmp_r5_rproc_start(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	enum rpu_boot_mem bootmem;
+
+	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
+		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+
+	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
+		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+
+	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
+				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+}
+
+/*
+ * given ID corresponding to R5 core in Xilinx Platform management (xpm) API,
+ * try to use xpm power down call to power off R5 core
+ */
+static int zynqmp_r5_rproc_stop(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+
+	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+}
+
+/*
+ * map in physical addr for  DDR mem carveout in rproc
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
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+/* unmap rproc_mem_entry virtual addr */
+static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
+				       struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+	return 0;
+}
+
+/* construct rproc mem carveouts for DDR regions specified in device tree */
+static int parse_mem_regions(struct rproc *rproc)
+{
+	int num_mems, i;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = &rproc->dev;
+	struct device_node *np = z_rproc->dev->of_node;
+	struct rproc_mem_entry *mem;
+
+	num_mems = of_count_phandle_with_args(np, DDR_LIST_PROP, NULL);
+	if (num_mems <= 0)
+		return 0;
+
+	for (i = 0; i < num_mems; i++) {
+		struct device_node *node;
+		struct reserved_mem *rmem;
+
+		node = of_parse_phandle(np, DDR_LIST_PROP, i);
+		if (!node)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(node);
+		if (!rmem)
+			return -EINVAL;
+
+		if (strstr(node->name, "vdev0vring")) {
+			int vring_id;
+			char name[16];
+
+			/*
+			 * expecting form of "rpuXvdev0vringX as documented
+			 * in xilinx remoteproc device tree binding
+			 */
+			if (strlen(node->name) < 15) {
+				dev_err(dev, "%pOF is less than 14 chars",
+					node);
+				return -EINVAL;
+			}
+
+			/*
+			 * can be 1 of multiple vring IDs per IPC channel
+			 * e.g. 'vdev0vring0' and 'vdev0vring1'
+			 */
+			vring_id = node->name[14] - '0';
+			snprintf(name, sizeof(name), "vdev0vring%d", vring_id);
+			/* Register vring */
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   zynqmp_r5_rproc_mem_alloc,
+						   zynqmp_r5_rproc_mem_release,
+						   name);
+		} else {
+			/* Register DMA region */
+			int (*alloc)(struct rproc *r,
+				     struct rproc_mem_entry *rme);
+			int (*release)(struct rproc *r,
+				       struct rproc_mem_entry *rme);
+			char name[20];
+
+			if (strstr(node->name, "vdev0buffer")) {
+				alloc = NULL;
+				release = NULL;
+				strcpy(name, "vdev0buffer");
+			} else {
+				alloc = zynqmp_r5_rproc_mem_alloc;
+				release = zynqmp_r5_rproc_mem_release;
+				strcpy(name, node->name);
+			}
+
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   alloc, release, name);
+		}
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
+/* call Xilinx Platform manager to request access to TCM bank */
+static int zynqmp_r5_pm_request_tcm(struct device_node *tcm_node,
+				    struct device *dev, u32 *pnode_id)
+{
+	int ret;
+
+	ret = of_property_read_u32(tcm_node, "pnode-id", pnode_id);
+	if (ret)
+		return ret;
+
+	return zynqmp_pm_request_node(*pnode_id, ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+}
+
+/*
+ * Given TCM bank entry,
+ * this callback will set device address for R5 running on TCM
+ * and also setup virtual address for TCM bank remoteproc carveout
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
+	va = devm_ioremap_wc(dev, mem->da, mem->len);
+	if (!va)
+		return -ENOMEM;
+	/* As R5 is 32 bit, wipe out extra high bits */
+	mem->da &= 0x000fffff;
+	/*
+	 * TCM Banks 0A and 0B (0xffe00000 and 0xffe20000)
+	 * are handled with the above line of code so do nothing
+	 * for this 2 banks
+	 */
+
+	/*
+	 * TCM Banks 1A and 1B (0xffe90000 and 0xffeb0000) still
+	 * need to be translated to 0x0 and 0x20000
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
+ * Given R5 node in remoteproc instance
+ * allocate remoteproc carveout for TCM memory
+ * needed for firmware to be loaded
+ */
+static int parse_tcm_banks(struct rproc *rproc)
+{
+	int i, num_banks;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = &rproc->dev;
+	struct device_node *r5_node = z_rproc->dev->of_node;
+
+	/* go through TCM banks for r5 node */
+	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
+	if (num_banks <= 0) {
+		dev_err(dev, "need to specify TCM banks\n");
+		return -EINVAL;
+	}
+	for (i = 0; i < num_banks; i++) {
+		struct resource rsc;
+		resource_size_t size;
+		struct device_node *dt_node;
+		struct rproc_mem_entry *mem;
+		int ret;
+		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
+
+		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
+		if (!dt_node)
+			return -EINVAL;
+
+		if (of_device_is_available(dt_node)) {
+			ret = of_address_to_resource(dt_node, 0, &rsc);
+			if (ret < 0)
+				return ret;
+
+			ret = zynqmp_r5_pm_request_tcm(dt_node, dev, &pnode_id);
+			if (ret < 0)
+				return ret;
+
+			/* add carveout */
+			size = resource_size(&rsc);
+			mem = rproc_mem_entry_init(dev, NULL, rsc.start,
+						   (int)size, rsc.start,
+						   tcm_mem_alloc,
+						   tcm_mem_release,
+						   rsc.name);
+			if (!mem)
+				return -ENOMEM;
+
+			mem->priv = (void *)(u64)pnode_id;
+			rproc_add_carveout(rproc, mem);
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * when loading firmware, load in needed DDR, TCM memory regions and wire
+ * these into remoteproc core's carveouts
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
+/* kick a firmware */
+static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct sk_buff *skb;
+	unsigned int skb_len;
+	struct zynqmp_ipi_message *mb_msg;
+	int ret;
+
+	struct device *dev = rproc->dev.parent;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+
+	if (of_property_read_bool(dev->of_node, "mboxes")) {
+		skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
+		skb = alloc_skb(skb_len, GFP_ATOMIC);
+		if (!skb)
+			return;
+
+		mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
+		mb_msg->len = sizeof(vqid);
+		memcpy(mb_msg->data, &vqid, sizeof(vqid));
+
+		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
+		ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
+		if (ret < 0) {
+			dev_warn(dev, "Failed to kick remote.\n");
+			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
+			kfree_skb(skb);
+		}
+	} else {
+		(void)skb;
+		(void)skb_len;
+		(void)mb_msg;
+		(void)ret;
+		(void)vqid;
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
+};
+
+/**
+ * event_notified_idr_cb() - event notified idr callback
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
+	(void)rproc_vq_interrupt(rproc, id);
+	return 0;
+}
+
+/**
+ * handle_event_notified() - remoteproc notification work funciton
+ * @work: pointer to the work structure
+ *
+ * It checks each registered remoteproc notify IDs.
+ */
+static void handle_event_notified(struct work_struct *work)
+{
+	struct rproc *rproc;
+	struct zynqmp_r5_rproc *z_rproc;
+
+	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
+
+	(void)mbox_send_message(z_rproc->rx_chan, NULL);
+	rproc = z_rproc->rproc;
+	/*
+	 * We only use IPI for interrupt. The firmware side may or may
+	 * not write the notifyid when it trigger IPI.
+	 * And thus, we scan through all the registered notifyids.
+	 */
+	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
+}
+
+/**
+ * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
+ * @cl: mailbox client
+ * @mssg: message pointer
+ *
+ * It will schedule the R5 notification work.
+ */
+static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *mssg)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
+	if (mssg) {
+		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+		size_t len;
+
+		ipi_msg = (struct zynqmp_ipi_message *)mssg;
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
+ * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
+ * @cl: mailbox client
+ * @mssg: pointer to the message which has been sent
+ * @r: status of last TX - OK or error
+ *
+ * It will be called by the mailbox framework when the last TX has done.
+ */
+static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *mssg, int r)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+	struct sk_buff *skb;
+
+	if (!mssg)
+		return;
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
+	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
+	kfree_skb(skb);
+}
+
+/**
+ * zynqmp_r5_setup_mbox() - Setup mailboxes
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
+	mclient = &z_rproc->tx_mc;
+	mclient->rx_callback = NULL;
+	mclient->tx_block = false;
+	mclient->knows_txdone = false;
+	mclient->tx_done = zynqmp_r5_mb_tx_done;
+	mclient->dev = z_rproc->dev;
+
+	/* Setup TX mailbox channel client */
+	mclient = &z_rproc->rx_mc;
+	mclient->dev = z_rproc->dev;
+	mclient->rx_callback = zynqmp_r5_mb_rx_cb;
+	mclient->tx_block = false;
+	mclient->knows_txdone = false;
+
+	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
+
+	/* Request TX and RX channels */
+	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc->tx_mc, "tx");
+	if (IS_ERR(z_rproc->tx_chan)) {
+		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
+		z_rproc->tx_chan = NULL;
+		return -EINVAL;
+	}
+
+	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc->rx_mc, "rx");
+	if (IS_ERR(z_rproc->rx_chan)) {
+		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
+		z_rproc->rx_chan = NULL;
+		return -EINVAL;
+	}
+	skb_queue_head_init(&z_rproc->tx_mc_skbs);
+
+	return 0;
+}
+
+/**
+ * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
+ *		       this is called for each individual R5 core to
+ *		       set up mailbox, Xilinx platform manager unique ID,
+ *		       add to rproc core
+ *
+ * @pdev: domain platform device for current R5 core
+ * @node: pointer of the device node for current R5 core
+ * @rpu_mode: mode to configure RPU, split or lockstep
+ * @core: Xilinx specific remoteproc structure used later to link
+ *           in to cluster of cores
+ *
+ * Function to retrieve the information of the ZynqMP R5 device node.
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_probe(struct platform_device *pdev,
+			   struct device_node *node,
+			   enum rpu_oper_mode rpu_mode,
+			   struct zynqmp_r5_rproc **core)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct rproc *rproc_ptr;
+	struct zynqmp_r5_rproc *z_rproc;
+
+	/* Allocate remoteproc instance */
+	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
+				     NULL, sizeof(struct zynqmp_r5_rproc));
+	if (!rproc_ptr)
+		return -ENOMEM;
+	rproc_ptr->auto_boot = false;
+	z_rproc = rproc_ptr->priv;
+	z_rproc->rproc = rproc_ptr;
+	z_rproc->dev = dev;
+	/* Set up DMA mask */
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto error;
+	/* Get R5 power domain node */
+	ret = of_property_read_u32(node, "pnode-id", &z_rproc->pnode_id);
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
+	/* Add R5 remoteproc */
+	ret = devm_rproc_add(dev, rproc_ptr);
+	if (ret)
+		goto error;
+	*core = z_rproc;
+
+error:
+	return ret;
+}
+
+/*
+ * called when driver is probed, for each R5 core specified in DT,
+ * setup as needed to do remoteproc-related operations
+ */
+static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
+{
+	int ret, i;
+	struct device *dev = &pdev->dev;
+	struct device_node *nc;
+	enum rpu_oper_mode rpu_mode;
+	struct list_head *cluster; /* list to track each core's rproc */
+	struct zynqmp_r5_rproc *z_rproc;
+	struct platform_device *child_pdev;
+	struct list_head *pos;
+
+	rpu_mode = of_property_read_bool(dev->of_node, "lockstep-mode") ?
+		   PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
+	dev_dbg(dev, "RPU configuration: %s\n",
+		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
+
+	/*
+	 * if 2 RPUs provided but one is lockstep, then we have an
+	 * invalid configuration.
+	 */
+	i = of_get_available_child_count(dev->of_node);
+	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && i != 1) || i > MAX_RPROCS)
+		return -EINVAL;
+
+	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
+	if (!cluster)
+		return -ENOMEM;
+	INIT_LIST_HEAD(cluster);
+
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n",
+			ret);
+		return ret;
+	}
+
+	/* probe each individual r5 core's remoteproc-related info */
+	i = 0;
+	for_each_available_child_of_node(dev->of_node, nc) {
+		child_pdev = of_find_device_by_node(nc);
+		if (!child_pdev) {
+			dev_err(dev, "could not get R5 core platform device\n");
+			ret = -ENODEV;
+			goto out;
+		}
+		ret = zynqmp_r5_probe(child_pdev, nc, rpu_mode, &z_rproc);
+		dev_dbg(dev, "%s to probe rpu %pOF\n",
+			ret ? "Failed" : "Able",
+			nc);
+		if (!z_rproc)
+			ret = -EINVAL;
+		if (ret)
+			goto out;
+
+		put_device(&child_pdev->dev);
+		list_add_tail(&z_rproc->elem, cluster);
+		i++;
+	}
+	/* wire in so each core can be cleaned up at drive remove */
+	platform_set_drvdata(pdev, cluster);
+	return 0;
+out:
+	/* undo core0 upon any failures on core1 in split-mode */
+	if (rpu_mode == PM_RPU_MODE_SPLIT && i == 1 && ret != 0) {
+		list_for_each(pos, cluster) {
+			z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
+			if (of_property_read_bool(z_rproc->dev->of_node, "mboxes")) {
+				mbox_free_channel(z_rproc->tx_chan);
+				mbox_free_channel(z_rproc->rx_chan);
+			}
+		}
+	}
+	return ret;
+}
+
+/*
+ * for each core, clean up the following:
+ *	single rproc entry
+ *	mailbox tx, rx
+ */
+static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
+{
+	struct list_head *pos, *cluster = (struct list_head *)
+					  platform_get_drvdata(pdev);
+	struct zynqmp_r5_rproc *z_rproc = NULL;
+
+	list_for_each(pos, cluster) {
+		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
+
+		mbox_free_channel(z_rproc->tx_chan);
+		mbox_free_channel(z_rproc->rx_chan);
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

