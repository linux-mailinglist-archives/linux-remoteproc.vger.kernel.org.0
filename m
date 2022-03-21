Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C54F4E2067
	for <lists+linux-remoteproc@lfdr.de>; Mon, 21 Mar 2022 07:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiCUGFR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 21 Mar 2022 02:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344486AbiCUGFQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Mar 2022 02:05:16 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84944B865;
        Sun, 20 Mar 2022 23:03:50 -0700 (PDT)
X-UUID: 0dfaf9dfe0534777a0c7e501be2722de-20220321
X-UUID: 0dfaf9dfe0534777a0c7e501be2722de-20220321
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1947819968; Mon, 21 Mar 2022 14:03:43 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 14:03:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Mar
 2022 14:03:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 14:03:42 +0800
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
Subject: [PATCH v6] remoteproc: mediatek: Fix side effect of mt8195 sram power on
Date:   Mon, 21 Mar 2022 14:03:40 +0800
Message-ID: <20220321060340.10975-1-tinghan.shen@mediatek.com>
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
v6: fix build error
v5: rebased on rproc-next
v4: add Fixes and Reviewed-by tags
v3: fix build error
v2: apply comments about macro definition and function calls
---
 drivers/remoteproc/mtk_common.h |  2 +
 drivers/remoteproc/mtk_scp.c    | 69 +++++++++++++++++++++++++--------
 2 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 71ce4977cb0b..ea6fa1100a00 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -54,6 +54,8 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 38609153bf64..ee6c4009586e 100644
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
 
 static int mt8186_scp_before_load(struct mtk_scp *scp)
@@ -393,7 +393,7 @@ static int mt8186_scp_before_load(struct mtk_scp *scp)
 	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
 
 	/* Turn on the power of SCP's SRAM before using it. Enable 1 block per time*/
-	mt8192_power_on_sram(scp->reg_base + MT8183_SCP_SRAM_PDN);
+	scp_sram_power_on(scp->reg_base + MT8183_SCP_SRAM_PDN, 0);
 
 	/* Initialize TCM before loading FW. */
 	writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
@@ -412,11 +412,32 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
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
@@ -572,11 +593,25 @@ static void mt8183_scp_stop(struct mtk_scp *scp)
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
@@ -922,11 +957,11 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 
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
2.18.0

