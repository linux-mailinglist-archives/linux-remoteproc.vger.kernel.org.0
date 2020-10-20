Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB25F28ECB6
	for <lists+linux-remoteproc@lfdr.de>; Thu, 15 Oct 2020 07:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgJOFf3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 15 Oct 2020 01:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgJOFf3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 01:35:29 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136BBC061755
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2020 22:35:29 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id e7so1282314pfn.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2020 22:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mj/7h/jnqQsPg5V/Oi7ltIn+wa4V3CFmmW5vYUXJo0o=;
        b=gfcChmmo50WMtwgcmMNG1exFOSWsdVpOkRsauXMZ7xWqcsQj/3ec/6gZTpZnwMurAj
         hGOWh6Zbj+/IczMnrHswKN5EFaVvSB55HTx3fnvn+FDSLBa6sUfsKstMiaW77D6kNEmR
         c7G51bjHFSeyVEGe2dM3e/oyK+ACyCO9UjQk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mj/7h/jnqQsPg5V/Oi7ltIn+wa4V3CFmmW5vYUXJo0o=;
        b=ZW7fQ6jy3tTU/r0kubCskZN+zg3U2/dE/hI3AwiDv/HV5nC2XAJZowMxcF2/+2Vm3r
         mjebYrWF3KEo2Ri5xsDowD52v7xt/LFYh3Y7vKYzbZyfFI7TnasUwGQ9Vqc5eyR8qR2X
         gwi1FljqDFtP7dbTUT9ozG5uU0Du4DCosaBxLRx7H9GmnLzLdTi5Nz+Uiuy4iPKxplz+
         QAKMF66c4AdWfhUVeNZXVeQk0gkfeZdBxqZm9DHAU0lyVIbwAwFthoWQbnkVEEQseGhV
         OvuDgFTAX+AxXIZtiG/irsx3wfaH/g7Eon6SxS8L1oIvoXRSe92NQBMTSXhE80qzX+3m
         mDbA==
X-Gm-Message-State: AOAM5319XOWoAtAhvpQ6RreevIGC62zSgCGrChhUn8+mOffNesV56ygk
        ViJ9r/SHegjeM+IAYBRofSLApg==
X-Google-Smtp-Source: ABdhPJyOpbUtz/26Bkt3a14UhirdlU6wjFc6qHZ5H0biXUgRBe/tiClokSkw25cFrlHMKOY/iPeSfg==
X-Received: by 2002:a62:2b8d:0:b029:151:d7b8:ad58 with SMTP id r135-20020a622b8d0000b0290151d7b8ad58mr2617644pfr.51.1602740127921;
        Wed, 14 Oct 2020 22:35:27 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
        by smtp.googlemail.com with ESMTPSA id x22sm1604554pfp.181.2020.10.14.22.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 22:35:27 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR
        (REMOTEPROC) SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] remoteproc/mediatek: Add support for mt8192 SCP
Date:   Thu, 15 Oct 2020 13:35:20 +0800
Message-Id: <20201015053520.2432062-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for mt8192 SCP.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

---

Change since v3:
* Remove unnecessary barrier and readl in mt8192_scp_before_load, which
  also fixes build failure on linux-next because of COMPILE_TEST trying
  to compile this on other platforms.

Change since v2:
* Inline scp_reset_assert / scp_reset_deassert.

Change since v1:
* Remove unused register definitions.

---
 drivers/remoteproc/mtk_common.h  |  32 +++++
 drivers/remoteproc/mtk_scp.c     | 200 +++++++++++++++++++++++++------
 drivers/remoteproc/mtk_scp_ipi.c |   6 +-
 3 files changed, 200 insertions(+), 38 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 0066c83636d0..47b4561443a9 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -32,6 +32,23 @@
 #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
 #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
 
+#define MT8192_L2TCM_SRAM_PD_0		0x210C0
+#define MT8192_L2TCM_SRAM_PD_1		0x210C4
+#define MT8192_L2TCM_SRAM_PD_2		0x210C8
+#define MT8192_L1TCM_SRAM_PDN		0x2102C
+#define MT8192_CPU0_SRAM_PD		0x21080
+
+#define MT8192_SCP2APMCU_IPC_SET	0x24080
+#define MT8192_SCP2APMCU_IPC_CLR	0x24084
+#define MT8192_SCP_IPC_INT_BIT		BIT(0)
+#define MT8192_SCP2SPM_IPC_CLR		0x24094
+#define MT8192_GIPC_IN_SET		0x24098
+#define MT8192_HOST_IPC_INT_BIT		BIT(0)
+
+#define MT8192_CORE0_SW_RSTN_CLR	0x30000
+#define MT8192_CORE0_SW_RSTN_SET	0x30004
+#define MT8192_CORE0_WDT_CFG		0x30034
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
@@ -50,6 +67,19 @@ struct scp_ipi_desc {
 	void *priv;
 };
 
+struct mtk_scp;
+
+struct mtk_scp_of_data {
+	int (*scp_before_load)(struct mtk_scp *scp);
+	void (*scp_irq_handler)(struct mtk_scp *scp);
+	void (*scp_reset_assert)(struct mtk_scp *scp);
+	void (*scp_reset_deassert)(struct mtk_scp *scp);
+	void (*scp_stop)(struct mtk_scp *scp);
+
+	u32 host_to_scp_reg;
+	u32 host_to_scp_int_bit;
+};
+
 struct mtk_scp {
 	struct device *dev;
 	struct rproc *rproc;
@@ -58,6 +88,8 @@ struct mtk_scp {
 	void __iomem *sram_base;
 	size_t sram_size;
 
+	const struct mtk_scp_of_data *data;
+
 	struct mtk_share_obj __iomem *recv_buf;
 	struct mtk_share_obj __iomem *send_buf;
 	struct scp_run run;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ac13e7b046a6..f8c54a0b33fc 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -2,7 +2,6 @@
 //
 // Copyright (c) 2019 MediaTek Inc.
 
-#include <asm/barrier.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -124,9 +123,6 @@ static int scp_ipi_init(struct mtk_scp *scp)
 	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
 	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
 
-	/* Disable SCP to host interrupt */
-	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
-
 	/* shared buffer initialization */
 	scp->recv_buf =
 		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
@@ -138,7 +134,7 @@ static int scp_ipi_init(struct mtk_scp *scp)
 	return 0;
 }
 
-static void scp_reset_assert(const struct mtk_scp *scp)
+static void mt8183_scp_reset_assert(struct mtk_scp *scp)
 {
 	u32 val;
 
@@ -147,7 +143,7 @@ static void scp_reset_assert(const struct mtk_scp *scp)
 	writel(val, scp->reg_base + MT8183_SW_RSTN);
 }
 
-static void scp_reset_deassert(const struct mtk_scp *scp)
+static void mt8183_scp_reset_deassert(struct mtk_scp *scp)
 {
 	u32 val;
 
@@ -156,17 +152,19 @@ static void scp_reset_deassert(const struct mtk_scp *scp)
 	writel(val, scp->reg_base + MT8183_SW_RSTN);
 }
 
-static irqreturn_t scp_irq_handler(int irq, void *priv)
+static void mt8192_scp_reset_assert(struct mtk_scp *scp)
 {
-	struct mtk_scp *scp = priv;
-	u32 scp_to_host;
-	int ret;
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+}
 
-	ret = clk_prepare_enable(scp->clk);
-	if (ret) {
-		dev_err(scp->dev, "failed to enable clocks\n");
-		return IRQ_NONE;
-	}
+static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
+{
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
+}
+
+static void mt8183_scp_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
 
 	scp_to_host = readl(scp->reg_base + MT8183_SCP_TO_HOST);
 	if (scp_to_host & MT8183_SCP_IPC_INT_BIT)
@@ -177,6 +175,40 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
 	/* SCP won't send another interrupt until we set SCP_TO_HOST to 0. */
 	writel(MT8183_SCP_IPC_INT_BIT | MT8183_SCP_WDT_INT_BIT,
 	       scp->reg_base + MT8183_SCP_TO_HOST);
+}
+
+static void mt8192_scp_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
+
+	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
+
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
+		scp_ipi_handler(scp);
+	else
+		scp_wdt_handler(scp, scp_to_host);
+
+	/*
+	 * SCP won't send another interrupt until we clear
+	 * MT8192_SCP2APMCU_IPC.
+	 */
+	writel(MT8192_SCP_IPC_INT_BIT,
+	       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+}
+
+static irqreturn_t scp_irq_handler(int irq, void *priv)
+{
+	struct mtk_scp *scp = priv;
+	int ret;
+
+	ret = clk_prepare_enable(scp->clk);
+	if (ret) {
+		dev_err(scp->dev, "failed to enable clocks\n");
+		return IRQ_NONE;
+	}
+
+	scp->data->scp_irq_handler(scp);
+
 	clk_disable_unprepare(scp->clk);
 
 	return IRQ_HANDLED;
@@ -238,20 +270,10 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int scp_load(struct rproc *rproc, const struct firmware *fw)
+static int mt8183_scp_before_load(struct mtk_scp *scp)
 {
-	const struct mtk_scp *scp = rproc->priv;
-	struct device *dev = scp->dev;
-	int ret;
-
-	ret = clk_prepare_enable(scp->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clocks\n");
-		return ret;
-	}
-
-	/* Hold SCP in reset while loading FW. */
-	scp_reset_assert(scp);
+	/* Clear SCP to host interrupt */
+	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
 
 	/* Reset clocks before loading FW */
 	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
@@ -272,6 +294,63 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 	       scp->reg_base + MT8183_SCP_CACHE_CON);
 	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
 
+	return 0;
+}
+
+static void mt8192_power_on_sram(void *addr)
+{
+	int i;
+
+	for (i = 31; i >= 0; i--)
+		writel(GENMASK(i, 0), addr);
+	writel(0, addr);
+}
+
+static void mt8192_power_off_sram(void *addr)
+{
+	int i;
+
+	writel(0, addr);
+	for (i = 0; i < 32; i++)
+		writel(GENMASK(i, 0), addr);
+}
+
+static int mt8192_scp_before_load(struct mtk_scp *scp)
+{
+	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
+	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+
+	/* enable SRAM clock */
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
+	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+
+	return 0;
+}
+
+static int scp_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct mtk_scp *scp = rproc->priv;
+	struct device *dev = scp->dev;
+	int ret;
+
+	ret = clk_prepare_enable(scp->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	/* Hold SCP in reset while loading FW. */
+	scp->data->scp_reset_assert(scp);
+
+	ret = scp->data->scp_before_load(scp);
+	if (ret < 0)
+		return ret;
+
 	ret = scp_elf_load_segments(rproc, fw);
 	clk_disable_unprepare(scp->clk);
 
@@ -293,7 +372,7 @@ static int scp_start(struct rproc *rproc)
 
 	run->signaled = false;
 
-	scp_reset_deassert(scp);
+	scp->data->scp_reset_deassert(scp);
 
 	ret = wait_event_interruptible_timeout(
 					run->wq,
@@ -309,13 +388,14 @@ static int scp_start(struct rproc *rproc)
 		dev_err(dev, "wait SCP interrupted by a signal!\n");
 		goto stop;
 	}
+
 	clk_disable_unprepare(scp->clk);
 	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
 
 	return 0;
 
 stop:
-	scp_reset_assert(scp);
+	scp->data->scp_reset_assert(scp);
 	clk_disable_unprepare(scp->clk);
 	return ret;
 }
@@ -329,7 +409,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 		offset = da;
 		if (offset >= 0 && (offset + len) < scp->sram_size)
 			return (void __force *)scp->sram_base + offset;
-	} else {
+	} else if (scp->dram_size) {
 		offset = da - scp->dma_addr;
 		if (offset >= 0 && (offset + len) < scp->dram_size)
 			return (void __force *)scp->cpu_addr + offset;
@@ -338,6 +418,25 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return NULL;
 }
 
+static void mt8183_scp_stop(struct mtk_scp *scp)
+{
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8183_WDT_CFG);
+}
+
+static void mt8192_scp_stop(struct mtk_scp *scp)
+{
+	/* Disable SRAM clock */
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
+	mt8192_power_off_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
+}
+
 static int scp_stop(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
@@ -349,9 +448,8 @@ static int scp_stop(struct rproc *rproc)
 		return ret;
 	}
 
-	scp_reset_assert(scp);
-	/* Disable SCP watchdog */
-	writel(0, scp->reg_base + MT8183_WDT_CFG);
+	scp->data->scp_reset_assert(scp);
+	scp->data->scp_stop(scp);
 	clk_disable_unprepare(scp->clk);
 
 	return 0;
@@ -443,6 +541,13 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 
 	ret = of_reserved_mem_device_init(scp->dev);
+
+	/* reserved memory is optional. */
+	if (ret == -ENODEV) {
+		dev_info(scp->dev, "skipping reserved memory initialization.");
+		return 0;
+	}
+
 	if (ret) {
 		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
 		return -ENOMEM;
@@ -460,6 +565,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 
 static void scp_unmap_memory_region(struct mtk_scp *scp)
 {
+	if (scp->dram_size == 0)
+		return;
+
 	dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
 			  scp->dma_addr);
 	of_reserved_mem_device_release(scp->dev);
@@ -536,6 +644,7 @@ static int scp_probe(struct platform_device *pdev)
 	scp = (struct mtk_scp *)rproc->priv;
 	scp->rproc = rproc;
 	scp->dev = dev;
+	scp->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, scp);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
@@ -642,8 +751,29 @@ static int scp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_scp_of_data mt8183_of_data = {
+	.scp_before_load = mt8183_scp_before_load,
+	.scp_irq_handler = mt8183_scp_irq_handler,
+	.scp_reset_assert = mt8183_scp_reset_assert,
+	.scp_reset_deassert = mt8183_scp_reset_deassert,
+	.scp_stop = mt8183_scp_stop,
+	.host_to_scp_reg = MT8183_HOST_TO_SCP,
+	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
+};
+
+static const struct mtk_scp_of_data mt8192_of_data = {
+	.scp_before_load = mt8192_scp_before_load,
+	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_reset_assert = mt8192_scp_reset_assert,
+	.scp_reset_deassert = mt8192_scp_reset_deassert,
+	.scp_stop = mt8192_scp_stop,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+};
+
 static const struct of_device_id mtk_scp_of_match[] = {
-	{ .compatible = "mediatek,mt8183-scp"},
+	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
+	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 3d3d87210ef2..f645d8bc9f7c 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -2,7 +2,6 @@
 //
 // Copyright (c) 2019 MediaTek Inc.
 
-#include <asm/barrier.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -182,7 +181,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 			ret = -ETIMEDOUT;
 			goto clock_disable;
 		}
-	} while (readl(scp->reg_base + MT8183_HOST_TO_SCP));
+	} while (readl(scp->reg_base + scp->data->host_to_scp_reg));
 
 	scp_memcpy_aligned(send_obj->share_buf, buf, len);
 
@@ -191,7 +190,8 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 
 	scp->ipi_id_ack[id] = false;
 	/* send the command to SCP */
-	writel(MT8183_HOST_IPC_INT_BIT, scp->reg_base + MT8183_HOST_TO_SCP);
+	writel(scp->data->host_to_scp_int_bit,
+	       scp->reg_base + scp->data->host_to_scp_reg);
 
 	if (wait) {
 		/* wait for SCP's ACK */

base-commit: 3e4fb4346c781068610d03c12b16c0cfb0fd24a3
-- 
2.28.0.1011.ga647a8990f-goog

