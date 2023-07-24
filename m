Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715B9760237
	for <lists+linux-remoteproc@lfdr.de>; Tue, 25 Jul 2023 00:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjGXWYe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 24 Jul 2023 18:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGXWYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Jul 2023 18:24:34 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB15710CB;
        Mon, 24 Jul 2023 15:24:32 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6E83F8680B;
        Tue, 25 Jul 2023 00:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690237471;
        bh=NjHjTUmq5vcknHwE6RJuA0VOFaQl8AWtuqdOfy4SpoQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qJZ2TWOddZliK9Ima3ux01wk19LX8+W4gr6dqOTjE1YTad/rxAcRJ0G39npkCWHFq
         K0k03RV4nZvECjjwt/EQiQDEE7d9RdBnkXE0IeDX3qW9r0HLYjLYbCehw2h7DfKP2v
         B+XruLfCWWkcXSqk2NKIXTJ7JtyHClqA5PwCLSkrLryIlmJX9Fj71SAZ+gib0D6knV
         BZ7gTmpUTKhVwOWOeM73G7BlKIGILHA8uoKrneY4z8royccRACsWxEzNDEy+K4pd3X
         G38a7StikwpL1VssvsrWX+DwTMreluiYcpFuab0e7wV9KK9P5K26XscjlEkkx/j6eZ
         td16mbdYYKlHA==
From:   Marek Vasut <marex@denx.de>
To:     linux-remoteproc@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] remoteproc: imx_rproc: Switch iMX8MN/MP from SMCCC to MMIO
Date:   Tue, 25 Jul 2023 00:24:18 +0200
Message-Id: <20230724222418.163220-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230724222418.163220-1-marex@denx.de>
References: <20230724222418.163220-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The MX8M CM7 boot via SMC call is problematic, since not all versions
of ATF support this interface. Extend the MMIO support so it can boot
the CM7 on MX8MN/MP instead and discern the two alternatives using DT
compatible strings.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-remoteproc@vger.kernel.org
---
V2: Rename 'gpr' to 'fsl,iomuxc-gpr'
V3: No change
---
 drivers/remoteproc/imx_rproc.c | 58 ++++++++++++++++++++++++++++++++--
 drivers/remoteproc/imx_rproc.h |  2 ++
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 4ee2646ce62ad..8bb293b9f327c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -40,6 +40,12 @@
 #define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
 					 IMX7D_SW_M4C_NON_SCLR_RST)
 
+#define IMX8M_M7_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST)
+#define IMX8M_M7_POLL			IMX7D_ENABLE_M4
+
+#define IMX8M_GPR22			0x58
+#define IMX8M_GPR22_CM7_CPUWAIT		BIT(0)
+
 /* Address: 0x020D8000 */
 #define IMX6SX_SRC_SCR			0x00
 #define IMX6SX_ENABLE_M4		BIT(22)
@@ -91,6 +97,7 @@ static int imx_rproc_detach_pd(struct rproc *rproc);
 struct imx_rproc {
 	struct device			*dev;
 	struct regmap			*regmap;
+	struct regmap			*gpr;
 	struct rproc			*rproc;
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX_RPROC_MEM_MAX];
@@ -285,6 +292,18 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX8M_M7_STOP,
+	.gpr_reg	= IMX8M_GPR22,
+	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_MMIO,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
@@ -365,8 +384,14 @@ static int imx_rproc_start(struct rproc *rproc)
 
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_start);
+		if (priv->gpr) {
+			ret = regmap_clear_bits(priv->gpr, dcfg->gpr_reg,
+						dcfg->gpr_wait);
+		} else {
+			ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
+						 dcfg->src_mask,
+						 dcfg->src_start);
+		}
 		break;
 	case IMX_RPROC_SMC:
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
@@ -395,6 +420,16 @@ static int imx_rproc_stop(struct rproc *rproc)
 
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
+		if (priv->gpr) {
+			ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg,
+					      dcfg->gpr_wait);
+			if (ret) {
+				dev_err(priv->dev,
+					"Failed to quiescence M4 platform!\n");
+				return ret;
+			}
+		}
+
 		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
 					 dcfg->src_stop);
 		break;
@@ -992,6 +1027,10 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 		break;
 	}
 
+	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
+	if (IS_ERR(priv->gpr))
+		priv->gpr = NULL;
+
 	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "failed to find syscon\n");
@@ -1001,6 +1040,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	priv->regmap = regmap;
 	regmap_attach_dev(dev, regmap, &config);
 
+	if (priv->gpr) {
+		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
+		if (val & dcfg->gpr_wait) {
+			/*
+			 * After cold boot, the CM indicates its in wait
+			 * state, but not fully powered off. Power it off
+			 * fully so firmware can be loaded into it.
+			 */
+			imx_rproc_stop(priv->rproc);
+			return 0;
+		}
+	}
+
 	ret = regmap_read(regmap, dcfg->src_reg, &val);
 	if (ret) {
 		dev_err(dev, "Failed to read src\n");
@@ -1142,6 +1194,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
 	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
+	{ .compatible = "fsl,imx8mn-cm7-mmio", .data = &imx_rproc_cfg_imx8mn_mmio },
+	{ .compatible = "fsl,imx8mp-cm7-mmio", .data = &imx_rproc_cfg_imx8mn_mmio },
 	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 1c7e2127c7584..79a1b8956d142 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -31,6 +31,8 @@ struct imx_rproc_dcfg {
 	u32				src_mask;
 	u32				src_start;
 	u32				src_stop;
+	u32				gpr_reg;
+	u32				gpr_wait;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
 	enum imx_rproc_method		method;
-- 
2.40.1

