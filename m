Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AA7272B68
	for <lists+linux-remoteproc@lfdr.de>; Mon, 21 Sep 2020 18:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgIUQO2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 21 Sep 2020 12:14:28 -0400
Received: from mail-mw2nam10on2059.outbound.protection.outlook.com ([40.107.94.59]:65120
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728046AbgIUQOZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 12:14:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWBVf7xoiq6RsdQrHLKzfazsRYxCRcKG3LTHDQ6ZIHpUsnLB5/1h3cx4Ywl3jOVXJBdYIjTr98cBzu0Sd6lEkWmLdpoeEJ5s5mMfHHPfTAIAzLd0hnwxhEyYTS1V1vWK281VFT7EZjRghZMIEShHiGUwGIOHLHqmfzg/IRzdRP1petzsD8Vjhb0XT07f+4lafcQFVq4ehZPTM39mdRbAJ0pRrj1EnL/bLUVxWxbnmPbaImNdd75j3CRWoj44HtG+AT6ghUAMbxexa61GiKhEr47lwCHeVU+ygtaAsqIEx2GxkRzNQ3bGJgCpkI9oZbh6dVf+nyIJ471e2TyxwP+S7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kju7joE/WcdGk1gX8Jx9Iz5fRQby4z+Jpc4b5mvsi4E=;
 b=AkZ13SlHdsP6S9B8f7USJQNnEaYUN6ehKwbB3JUATue/dMLlb3OYYcziT6E46tu17K3+iKaKhtAWuAWGMo0CiBzw22SxEJPk+MGp74MjRgo1kDrBgp9C144uk1ZLvAp/ZHaIsCz/3Ss6R+MdM2/f+fFYpUqTaKZzHZNdLEnlLSomuoSGRItF9R3LIGEQz/B6KfT9AGVkQqhtHs093bvbn4fyMbRnX2qkU7nohvVwdIIR5LiuG8Ian8A0Aq1ABosGBm+Bm8NtwxCdpAFjOYAlqn+j/hvwhHTaWf0ht5dks/ePuaMyoGnAvG8VIr7fVfQT7aJiv/YjnA3kNKgeeIYQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=none action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kju7joE/WcdGk1gX8Jx9Iz5fRQby4z+Jpc4b5mvsi4E=;
 b=BMtVnbULWboPBpj0q6r6rKwwfGMZ/g6dJMyQcG4eKr6Ya2+eecLazSfurcuXN+kzOLeJ/39NI5usknPjQp2Hjzk179BuVsEDrfVwiSRvzjAspCn9yS6w7YbkyvEkb3VKRIV5GGIV4bOO8onNxTKgD86ptBNzf6hH7yhK0hIWx04=
Received: from CY4PR21CA0048.namprd21.prod.outlook.com (2603:10b6:903:12b::34)
 by BL0PR02MB5476.namprd02.prod.outlook.com (2603:10b6:208:83::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 16:14:16 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::20) by CY4PR21CA0048.outlook.office365.com
 (2603:10b6:903:12b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.6 via Frontend
 Transport; Mon, 21 Sep 2020 16:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 149.199.60.83) smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none
 (message not signed) header.d=none;lists.infradead.org; dmarc=none
 action=none header.from=xilinx.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of xilinx.com: DNS Timeout)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 16:14:15
 +0000
Received: from [149.199.38.66] (port=36684 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS2-00058h-8l; Mon, 21 Sep 2020 09:14:02 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOSF-0004ec-H1; Mon, 21 Sep 2020 09:14:15 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08LGE6Y3008440;
        Mon, 21 Sep 2020 09:14:06 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS6-0004bU-Lg; Mon, 21 Sep 2020 09:14:06 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wendy Liang <wendy.liang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Subject: [PATCH v15 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
Date:   Mon, 21 Sep 2020 09:14:06 -0700
Message-Id: <20200921161406.11929-6-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921161406.11929-1-ben.levinsky@xilinx.com>
References: <20200921161406.11929-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0a549cf-3b9b-4736-eaed-08d85e4962e6
X-MS-TrafficTypeDiagnostic: BL0PR02MB5476:
X-Microsoft-Antispam-PRVS: <BL0PR02MB5476F4EE6D49E602EC6E4DCCB53A0@BL0PR02MB5476.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8WbBGdcvzGUOSO9MUd0KNW4uRK0ej1kAtFP64Yaa9vMxcYhSesgz4bspX5cWtz6Xpbjk2rY1a7Ax4MFOKjIYRWuqxz307skWKAPT7gZekLH8r/EJ29ZybUzDHSCxnXXxhvb5BTjRfg9ZKk+qHUYz4fO8G+Lb1/w8L1zJQw29n82aozKFbCo0JklWdCmtB5XifNhYnmM8MwLBTsLPoPe646N6JhjsqcIByGRvxPKortiu/keMLmExK/evlmzJY4blJ4ePT7ars4UrdLPYx0xbk8OiXPYC5yhynMu0ARNGRwn6RNtRutIMrghN0hiaj3mKH+lynWkXyGLHiFrGR7EfBW9v8jR0gka8kJGRw5PPUCaQ4BNM/n00Q0KK3y372MFg+35xptqz+KDbY/U+EiweA==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(396003)(39860400002)(346002)(376002)(136003)(46966005)(44832011)(4326008)(316002)(186003)(426003)(36756003)(63350400001)(356005)(81166007)(82310400003)(54906003)(336012)(26005)(107886003)(2906002)(70586007)(7696005)(70206006)(83380400001)(30864003)(8936002)(8676002)(5660300002)(47076004)(82740400003)(1076003)(9786002)(2616005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 16:14:15.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a549cf-3b9b-4736-eaed-08d85e4962e6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5476
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
v2:
 - remove domain struct as per review from Mathieu
 v3:
 - add xilinx-related platform mgmt fn's instead of wrapping around
   function pointer in xilinx eemi ops struct
 v4:
 - add default values for enums
 - fix formatting as per checkpatch.pl --strict. Note that 1 warning and 1 check
   are still raised as each is due to fixing the warning results in that
 particular line going over 80 characters.
 v5:
 - parse_fw change from use of rproc_of_resm_mem_entry_init to
 rproc_mem_entry_init and use of alloc/release
 - var's of type zynqmp_r5_pdata all have same local variable name
 - use dev_dbg instead of dev_info
 v6:
 - adding memory carveouts is handled much more similarly. All mem
 carveouts are
   now described in reserved memory as needed. That is, TCM nodes are not
   coupled to remoteproc anymore. This is reflected in the remoteproc R5
 driver
   and the device tree binding.
 - remove mailbox from device tree binding as it is not necessary for elf
   loading
 - use lockstep-mode property for configuring RPU
 v7:
 - remove unused headers
 - change  u32 *lockstep_mode ->  u32 lockstep_mode;
 - change device-tree binding "lockstep-mode"  to xlnx,cluster-mode
 - remove zynqmp_r5_mem_probe and loop to Probe R5 memory devices at
   remoteproc-probe time
 - remove is_r5_mode_set from  zynqmp rpu remote processor private data
 - do not error out if no mailbox is provided
 - remove zynqmp_r5_remoteproc_probe call of platform_set_drvdata as
 pdata is
   handled in zynqmp_r5_remoteproc_remove
v8:
 - remove old acks, reviewed-by's in commit message
v9:
- as mboxes are now optional, if pdata->tx_mc_skbs not initialized then
  do not call skb_queue_empty
- update usage for zynqmp_pm_set_rpu_mode, zynqmp_pm_set_tcm_config and
  zynqmp_pm_get_rpu_mode
- update 5/5 patch commit message to document supported configurations
  and how they are booted by the driver.
- remove copyrights other than SPDX from zynqmp_r5_remoteproc.c
- compilation warnings no longer raised
- remove unused includes from zynqmp_r5_remoteproc.c
- remove unused  var autoboot from zynqmp_r5_remoteproc.c
- reorder zynqmp_r5_pdata fpr small mem savings due to alignment
- use of zynqmp_pm_set_tcm_config now does not have
  output arg
- in tcm handling, unconditionally use &= 0x000fffff mask since all nodes
  in this fn are for tcm
- update comments for translating dma field in tcm handling to device
  address
- update calls to rproc_mem_entry_init in parse_mem_regions so that there
  are only 2 cases for types of carveouts instead of 3
- in parse_mem_regions, check if device tree node is null before using it
- add example device tree nodes used in parse_mem_regions and tcm parsing
- add comment for vring id node length
- add check for string length so that vring id is at least min length
- move tcm nodes from reserved mem to instead own device tree nodes
   and only use them if enabled in device tree
- add comment for explaining handling of rproc_elf_load_rsc_table
- remove obsolete check for "if (vqid < 0)" in zynqmp_r5_rproc_kick
- remove unused field mems in struct zynqmp_r5_pdata
- remove call to zynqmp_r5_mem_probe and the fn itself as tcm handling
  is done by zyqmp_r5_pm_request_tcm
- remove obsolete setting of dma_ops and parent device dma_mask
- remove obsolete use of of_dma_configure
- add comment for call to r5_set_mode fn
- make mbox usage optional and gracefully inform user via dev_dbg if not
  present
- change var lockstep_mode from u32* to u32
v11:
- use enums instead of u32 where possible in zynqmp_r5_remoteproc
- update usage of zynqmp_pm_set/get_rpu_mode and zynqmp_pm_set_tcm_config
- update prints to not use carriage return, just newline
- look up tcm banks via property in r5 node instead of string name
- print device tree nodes with %pOF instead of %s with node name field
- update tcm release to unmap VA
- handle r5-1 use case
v12:
- update signed off by so that latest developer name is last
- do not cast enums to u32s for zynqmp_pm* functions
v14:
- change zynqmp_r5_remoteproc::rpus and rpu_mode to static
- fix typo
- zynqmp_r5_remoteproc::r5_set_mode set rpu mode from
  property specified in device tree
- use u32 instead of u32* to store in remoteproc memory entry private data
  for pnode_id information
- always call r5_set_mode on probe
- remove alloc of zynqmp_r5_pdata in
  zynqmp_r5_remoteproc::zynqmp_r5_remoteproc_probe as there is static
  allocation already
- error at probe time if lockstep-mode property not present in device tree
- update commit message as per review
- remove dependency on MAILBOX in makefile as ZYNQMP_IPI_MBOX is present
- remove unused macros
- update comment ordering of zynqmp_r5_pdata to match struct definition
- zynqmp_r5_remoteproc::tcm_mem_release error if pnode id is invalid
- remove obsolete TODOs
- only call zynqmp_r5_remoteproc::zynqmp_r5_probe if the index is valid
- remove uneven dev_dbg/dev_err fn calls
v15:
- if lockstep mode prop is present, then RPU cluster is in lockstep mode.
  if not present, cluster is in split mode.
- if 2 RPUs provided but one is lockstep then error out as this is invalid
  configuration
---
 drivers/remoteproc/Kconfig                |   8 +
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c | 769 ++++++++++++++++++++++
 3 files changed, 778 insertions(+)
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfea7c7..68e567c5375c 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
 	  It's safe to say N here if you're not interested in utilizing
 	  the DSP slave processors.
 
+config ZYNQMP_R5_REMOTEPROC
+	tristate "ZynqMP_R5 remoteproc support"
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
index 000000000000..da74fa621810
--- /dev/null
+++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
@@ -0,0 +1,769 @@
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
+#define BANK_LIST_PROP "meta-memory-regions"
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
+ * struct zynqmp_r5_pdata - zynqmp rpu remote processor private data
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
+ */
+struct zynqmp_r5_pdata {
+	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
+	struct mbox_client tx_mc;
+	struct mbox_client rx_mc;
+	struct work_struct mbox_work;
+	struct sk_buff_head tx_mc_skbs;
+	struct device dev;
+	struct rproc *rproc;
+	struct mbox_chan *tx_chan;
+	struct mbox_chan *rx_chan;
+	u32 pnode_id;
+};
+
+/**
+ * table of RPUs
+ */
+static struct zynqmp_r5_pdata rpus[MAX_RPROCS];
+/**
+ * RPU core configuration
+ */
+static enum rpu_oper_mode rpu_mode;
+
+/*
+ * r5_set_mode - set RPU operation mode
+ * @pdata: Remote processor private data
+ *
+ * set RPU operation mode
+ *
+ * Return: 0 for success, negative value for failure
+ */
+static int r5_set_mode(struct zynqmp_r5_pdata *pdata)
+{
+	enum rpu_tcm_comb tcm_mode;
+	enum rpu_oper_mode cur_rpu_mode;
+	int ret;
+
+	ret = zynqmp_pm_get_rpu_mode(pdata->pnode_id, &cur_rpu_mode);
+	if (ret < 0)
+		return ret;
+
+	if (rpu_mode != cur_rpu_mode) {
+		ret = zynqmp_pm_set_rpu_mode(pdata->pnode_id,
+					     rpu_mode);
+		if (ret < 0)
+			return ret;
+	}
+
+	tcm_mode = (rpu_mode == PM_RPU_MODE_LOCKSTEP) ?
+		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
+	return zynqmp_pm_set_tcm_config(pdata->pnode_id, tcm_mode);
+}
+
+/*
+ * ZynqMP R5 remoteproc memory release function
+ */
+static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	u32 pnode_id = (u64)mem->priv;
+
+	if (pnode_id <= 0)
+		return -EINVAL;
+
+	iounmap(mem->va);
+	return zynqmp_pm_release_node(pnode_id);
+}
+
+/*
+ * ZynqMP R5 remoteproc operations
+ */
+static int zynqmp_r5_rproc_start(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct zynqmp_r5_pdata *pdata = rproc->priv;
+	enum rpu_boot_mem bootmem;
+
+	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
+		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+
+	dev_dbg(dev, "RPU boot from %s.",
+		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+
+	return zynqmp_pm_request_wake(pdata->pnode_id, 1,
+				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+}
+
+static int zynqmp_r5_rproc_stop(struct rproc *rproc)
+{
+	struct zynqmp_r5_pdata *pdata = rproc->priv;
+
+	return zynqmp_pm_force_pwrdwn(pdata->pnode_id,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+}
+
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
+static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
+				       struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+	return 0;
+}
+
+static int parse_mem_regions(struct rproc *rproc)
+{
+	int num_mems, i;
+	struct zynqmp_r5_pdata *pdata = rproc->priv;
+	struct device *dev =  &pdata->dev;
+	struct device_node *np = dev->of_node;
+	struct rproc_mem_entry *mem;
+
+	num_mems = of_count_phandle_with_args(np, "memory-region", NULL);
+	if (num_mems <= 0)
+		return 0;
+
+	for (i = 0; i < num_mems; i++) {
+		struct device_node *node;
+		struct reserved_mem *rmem;
+
+		node = of_parse_phandle(np, "memory-region", i);
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
+			if (strlen(node->name) < 14) {
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
+/* call Xilix Platform manager to request access to TCM bank */
+static int zyqmp_r5_pm_request_tcm(struct device_node *tcm_node,
+				   struct device *dev,
+				   u32 *pnode_id)
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
+/* Given tcm bank entry,
+ * this callback will set device address for R5 running on TCM
+ * and also setup virtual address for tcm bank remoteproc carveout
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
+	 * handle tcm banks 1 a and b (0xffe90000 and oxffeb0000)
+	 * As both of these the only common bit found not in tcm bank0 a or b
+	 * is at 0x80000 use this mask to suss it out
+	 */
+	if (mem->da & 0x80000)
+		/*
+		 * need to do more to further translate
+		 * tcm banks 1a and 1b at 0xffe90000 and oxffeb0000
+		 * respectively to 0x0 and 0x20000
+		 */
+		mem->da -= 0x90000;
+
+	return 0;
+}
+
+/*
+ * Given R5 node in remoteproc instance,
+ * allocate remoteproc carveout for TCM memory
+ * needed for firmware to be loaded
+ */
+static int parse_tcm_banks(struct rproc *rproc)
+{
+	int i, num_banks;
+	struct zynqmp_r5_pdata *pdata = rproc->priv;
+	struct device *dev = &pdata->dev;
+	struct device_node *r5_node = dev->of_node;
+
+	/* go through tcm banks for r5 node */
+	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
+	if (num_banks <= 0) {
+		dev_err(dev, "need to specify TCM banks\n");
+		return -EINVAL;
+	}
+
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
+			ret = zyqmp_r5_pm_request_tcm(dt_node, dev, &pnode_id);
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
+static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+	struct zynqmp_r5_pdata *pdata = rproc->priv;
+	struct device *dev = &pdata->dev;
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
+		dev_info(dev, "no resource table found.\n");
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
+	struct zynqmp_r5_pdata *pdata = rproc->priv;
+
+	skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
+	skb = alloc_skb(skb_len, GFP_ATOMIC);
+	if (!skb)
+		return;
+
+	mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
+	mb_msg->len = sizeof(vqid);
+	memcpy(mb_msg->data, &vqid, sizeof(vqid));
+	skb_queue_tail(&pdata->tx_mc_skbs, skb);
+	ret = mbox_send_message(pdata->tx_chan, mb_msg);
+	if (ret < 0) {
+		dev_warn(dev, "Failed to kick remote.\n");
+		skb_dequeue_tail(&pdata->tx_mc_skbs);
+		kfree_skb(skb);
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
+ * zynqmp_r5_release() - ZynqMP R5 device release function
+ * @dev: pointer to the device struct of ZynqMP R5
+ *
+ * Function to release ZynqMP R5 device.
+ */
+static void zynqmp_r5_release(struct device *dev)
+{
+	struct zynqmp_r5_pdata *pdata;
+	struct rproc *rproc;
+	struct sk_buff *skb;
+
+	pdata = dev_get_drvdata(dev);
+	rproc = pdata->rproc;
+	if (rproc) {
+		rproc_del(rproc);
+		rproc_free(rproc);
+	}
+	if (pdata->tx_chan)
+		mbox_free_channel(pdata->tx_chan);
+	if (pdata->rx_chan)
+		mbox_free_channel(pdata->rx_chan);
+
+	/* Discard all SKBs if tx_mc_skbs is initialized */
+	if (&pdata->tx_mc_skbs.prev) {
+		while (!skb_queue_empty(&pdata->tx_mc_skbs)) {
+			skb = skb_dequeue(&pdata->tx_mc_skbs);
+			kfree_skb(skb);
+		}
+	}
+
+	put_device(dev->parent);
+}
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
+	struct zynqmp_r5_pdata *pdata;
+
+	pdata = container_of(work, struct zynqmp_r5_pdata, mbox_work);
+
+	(void)mbox_send_message(pdata->rx_chan, NULL);
+	rproc = pdata->rproc;
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
+	struct zynqmp_r5_pdata *pdata;
+
+	pdata = container_of(cl, struct zynqmp_r5_pdata, rx_mc);
+	if (mssg) {
+		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+		size_t len;
+
+		ipi_msg = (struct zynqmp_ipi_message *)mssg;
+		buf_msg = (struct zynqmp_ipi_message *)pdata->rx_mc_buf;
+		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
+		      IPI_BUF_LEN_MAX : ipi_msg->len;
+		buf_msg->len = len;
+		memcpy(buf_msg->data, ipi_msg->data, len);
+	}
+	schedule_work(&pdata->mbox_work);
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
+	struct zynqmp_r5_pdata *pdata;
+	struct sk_buff *skb;
+
+	if (!mssg)
+		return;
+	pdata = container_of(cl, struct zynqmp_r5_pdata, tx_mc);
+	skb = skb_dequeue(&pdata->tx_mc_skbs);
+	kfree_skb(skb);
+}
+
+/**
+ * zynqmp_r5_setup_mbox() - Setup mailboxes
+ *
+ * @pdata: pointer to the ZynqMP R5 processor platform data
+ * @node: pointer of the device node
+ *
+ * Function to setup mailboxes to talk to RPU.
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_setup_mbox(struct zynqmp_r5_pdata *pdata,
+				struct device_node *node)
+{
+	struct device *dev = &pdata->dev;
+	struct mbox_client *mclient;
+
+	/* Setup TX mailbox channel client */
+	mclient = &pdata->tx_mc;
+	mclient->dev = dev;
+	mclient->rx_callback = NULL;
+	mclient->tx_block = false;
+	mclient->knows_txdone = false;
+	mclient->tx_done = zynqmp_r5_mb_tx_done;
+
+	/* Setup TX mailbox channel client */
+	mclient = &pdata->rx_mc;
+	mclient->dev = dev;
+	mclient->rx_callback = zynqmp_r5_mb_rx_cb;
+	mclient->tx_block = false;
+	mclient->knows_txdone = false;
+
+	INIT_WORK(&pdata->mbox_work, handle_event_notified);
+
+	/* Request TX and RX channels */
+	pdata->tx_chan = mbox_request_channel_byname(&pdata->tx_mc, "tx");
+	if (IS_ERR(pdata->tx_chan)) {
+		dev_err(dev, "failed to request mbox tx channel.\n");
+		pdata->tx_chan = NULL;
+		return -EINVAL;
+	}
+	pdata->rx_chan = mbox_request_channel_byname(&pdata->rx_mc, "rx");
+	if (IS_ERR(pdata->rx_chan)) {
+		dev_err(dev, "failed to request mbox rx channel.\n");
+		pdata->rx_chan = NULL;
+		return -EINVAL;
+	}
+	skb_queue_head_init(&pdata->tx_mc_skbs);
+
+	return 0;
+}
+
+/**
+ * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
+ * @pdata: pointer to the ZynqMP R5 processor platform data
+ * @pdev: parent RPU domain platform device
+ * @node: pointer of the device node
+ *
+ * Function to retrieve the information of the ZynqMP R5 device node.
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_probe(struct zynqmp_r5_pdata *pdata,
+			   struct platform_device *pdev,
+			   struct device_node *node)
+{
+	struct device *dev = &pdata->dev;
+	struct rproc *rproc;
+	int ret;
+
+	/* Create device for ZynqMP R5 device */
+	dev->parent = &pdev->dev;
+	dev->release = zynqmp_r5_release;
+	dev->of_node = node;
+	dev_set_name(dev, "%pOF", node);
+	dev_set_drvdata(dev, pdata);
+	ret = device_register(dev);
+	if (ret)
+		return ret;
+	get_device(&pdev->dev);
+
+	/* Allocate remoteproc instance */
+	rproc = rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops, NULL, 0);
+	if (!rproc) {
+		ret = -ENOMEM;
+		goto error;
+	}
+	pdata->rproc = rproc;
+	rproc->priv = pdata;
+
+	/* Set up DMA mask */
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto error;
+
+	/* Get R5 power domain node */
+	ret = of_property_read_u32(node, "pnode-id", &pdata->pnode_id);
+	if (ret)
+		goto error;
+
+	ret = r5_set_mode(pdata);
+	if (ret)
+		goto error;
+
+	ret = zynqmp_r5_setup_mbox(pdata, node);
+	if (ret)
+		goto error;
+
+	/* Add R5 remoteproc */
+	ret = rproc_add(rproc);
+	if (ret)
+		goto error;
+
+	return 0;
+error:
+	if (pdata->rproc)
+		rproc_free(pdata->rproc);
+	pdata->rproc = NULL;
+	device_unregister(dev);
+	put_device(&pdev->dev);
+	return ret;
+}
+
+static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
+{
+	int ret, i = 0;
+	struct device *dev = &pdev->dev;
+	struct device_node *nc;
+
+	rpu_mode =  of_get_property(dev->of_node, "lockstep-mode", NULL) ?
+		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
+
+	dev_dbg(dev, "RPU configuration: %s\n",
+		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
+
+	for_each_available_child_of_node(dev->of_node, nc) {
+		/*
+		 * if 2 RPUs provided but one is lockstep, then we have an
+		 * invalid configuration.
+		 */
+		if (i > 0 && rpu_mode == PM_RPU_MODE_LOCKSTEP)
+			return -EINVAL;
+
+		/* only call zynqmp_r5_probe if proper # of rpu's */
+		ret = (i < MAX_RPROCS) ? zynqmp_r5_probe(&rpus[i], pdev, nc) :
+					 -EINVAL;
+		dev_dbg(dev, "%s to probe rpu %pOF\n",
+			ret ? "Failed" : "Able",
+			nc);
+
+		if (ret)
+			return ret;
+
+		i++;
+	}
+
+	return 0;
+}
+
+static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
+{
+	int i;
+
+	for (i = 0; i < MAX_RPROCS; i++) {
+		struct zynqmp_r5_pdata *pdata = &rpus[i];
+		struct rproc *rproc;
+
+		/* only do clean up for pdata with active rpu */
+		if (pdata->pnode_id == 0)
+			continue;
+
+		rproc = pdata->rproc;
+		if (rproc) {
+			rproc_del(rproc);
+			rproc_free(rproc);
+			pdata->rproc = NULL;
+		}
+		if (pdata->tx_chan) {
+			mbox_free_channel(pdata->tx_chan);
+			pdata->tx_chan = NULL;
+		}
+		if (pdata->rx_chan) {
+			mbox_free_channel(pdata->rx_chan);
+			pdata->rx_chan = NULL;
+		}
+		if (&(&pdata->dev)->dma_pools)
+			device_unregister(&pdata->dev);
+	}
+
+	return 0;
+}
+
+/* Match table for OF platform binding */
+static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
+	{ .compatible = "xlnx,zynqmp-r5-remoteproc-1.0", },
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

