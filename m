Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AAF4DA8C9
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Mar 2022 04:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244454AbiCPDNG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 15 Mar 2022 23:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237407AbiCPDNF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Mar 2022 23:13:05 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168875C352;
        Tue, 15 Mar 2022 20:11:50 -0700 (PDT)
X-UUID: 059c8ae7a8bb4e5e835b1a30499283f2-20220316
X-UUID: 059c8ae7a8bb4e5e835b1a30499283f2-20220316
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2061592986; Wed, 16 Mar 2022 11:11:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Mar 2022 11:11:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 11:11:20 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v4] remoteproc: mediatek: Fix side effect of mt8195 sram power on
Date:   Wed, 16 Mar 2022 11:11:17 +0800
Message-ID: <20220316031117.7311-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The definition of L1TCM_SRAM_PDN bits on mt8195 is different to mt8192.

L1TCM_SRAM_PDN bits[3:0] control the power of mt8195 L1TCM SRAM.

L1TCM_SRAM_PDN bits[7:4] control the access path to EMI for SCP.
These bits have to be powered on to allow EMI access for SCP.

Bits[7:4] also affect audio DSP because audio DSP and SCP are
placed on the same hardware bus. If SCP cannot access EMI, audio DSP is
blocked too.

L1TCM_SRAM_PDN bits[31:8] are not used.

This fix removes modification of bits[7:4] when power on/off mt8195 SCP
L1TCM. It's because the modification introduces a short period of time
blocking audio DSP to access EMI. This was not a problem until we have
to load both SCP module and audio DSP module. audio DSP needs to access
EMI because it has source/data on DRAM. Audio DSP will have unexpected
behavior when it accesses EMI and the SCP driver blocks the EMI path at
the same time.

Fixes: 79111df414fc ("remoteproc: mediatek: Support mt8195 scp")
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v4: add Fixes and Reviewed-by tags
v3: fix build error
v2: apply comments about macro definition and function calls
---
 drivers/remoteproc/mtk_common.h |  2 ++
 drivers/remoteproc/mtk_scp.c    | 67 +++++++++++++++++++++++++++++++----------
 2 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 5ff3867c72f3..ff954a06637c 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -51,6 +51,8 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 36e48cf58ed6..5f686fe09203 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -365,22 +365,22 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static void mt8192_power_on_sram(void __iomem *addr)
+static void scp_sram_power_on(void __iomem *addr, u32 reserved_mask)
 {
 	int i;
 
 	for (i = 31; i >= 0; i--)
-		writel(GENMASK(i, 0), addr);
+		writel(GENMASK(i, 0) & ~reserved_mask, addr);
 	writel(0, addr);
 }
 
-static void mt8192_power_off_sram(void __iomem *addr)
+static void scp_sram_power_off(void __iomem *addr, u32 reserved_mask)
 {
 	int i;
 
 	writel(0, addr);
 	for (i = 0; i < 32; i++)
-		writel(GENMASK(i, 0), addr);
+		writel(GENMASK(i, 0) & ~reserved_mask, addr);
 }
 
 static int mt8192_scp_before_load(struct mtk_scp *scp)
@@ -391,11 +391,32 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
 	/* enable SRAM clock */
-	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
-	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
-	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
-	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
-	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
+	return 0;
+}
+
+static int mt8195_scp_before_load(struct mtk_scp *scp)
+{
+	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
+	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+
+	/* enable SRAM clock */
+	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+			  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
@@ -551,11 +572,25 @@ static void mt8183_scp_stop(struct mtk_scp *scp)
 static void mt8192_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SRAM clock */
-	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
-	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
-	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
-	mt8192_power_off_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
-	mt8192_power_off_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
+}
+
+static void mt8195_scp_stop(struct mtk_scp *scp)
+{
+	/* Disable SRAM clock */
+	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+			   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* Disable SCP watchdog */
 	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
@@ -901,11 +936,11 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 
 static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_clk_get = mt8195_scp_clk_get,
-	.scp_before_load = mt8192_scp_before_load,
+	.scp_before_load = mt8195_scp_before_load,
 	.scp_irq_handler = mt8192_scp_irq_handler,
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
-	.scp_stop = mt8192_scp_stop,
+	.scp_stop = mt8195_scp_stop,
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
-- 
2.15.GIT

