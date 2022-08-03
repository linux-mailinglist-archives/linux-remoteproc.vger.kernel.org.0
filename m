Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8508D588E85
	for <lists+linux-remoteproc@lfdr.de>; Wed,  3 Aug 2022 16:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbiHCOWZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 3 Aug 2022 10:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238740AbiHCOWM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Aug 2022 10:22:12 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD0320192;
        Wed,  3 Aug 2022 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659536530; x=1691072530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=uubreQVPW+nKm+C5bpwgjd/56EiTH4beoxN3z2PHa9c=;
  b=YH7l5aj9JZ4wcLCofHD8Vrh/hhjvTwr9VGrcUj0QvFBGgs3xr25L+Iae
   gpIzYMUY3IcPq9BlaHedAeXHVuU/zKqaRJ8j/ma3JmyU2Q9/ySa9/+P8p
   ++KUXrnusfVunQqG237cFtVbPeJz/wutkhWhUSm/jDlUmJB83tzlZjQi4
   c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 07:22:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:22:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 07:22:09 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 07:22:03 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <linux-remoteproc@vger.kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH 5/8] remoteproc: qcom: Add efuse evb selection control
Date:   Wed, 3 Aug 2022 19:51:17 +0530
Message-ID: <1659536480-5176-6-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
References: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add efuse evb selection control and enable it for starting ADSP.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index a9fcb5c..201cc21 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -56,6 +56,7 @@
 
 #define LPASS_BOOT_CORE_START	BIT(0)
 #define LPASS_BOOT_CMD_START	BIT(0)
+#define LPASS_EFUSE_Q6SS_EVB_SEL 0x0
 
 struct adsp_pil_data {
 	int crash_reason_smem;
@@ -85,6 +86,7 @@ struct qcom_adsp {
 	struct clk_bulk_data *clks;
 
 	void __iomem *qdsp6ss_base;
+	void __iomem *lpass_efuse;
 
 	struct reset_control *pdc_sync_reset;
 	struct reset_control *restart;
@@ -366,6 +368,9 @@ static int adsp_start(struct rproc *rproc)
 	/* Program boot address */
 	writel(adsp->mem_phys >> 4, adsp->qdsp6ss_base + RST_EVB_REG);
 
+	if (adsp->lpass_efuse)
+		writel(LPASS_EFUSE_Q6SS_EVB_SEL, adsp->lpass_efuse);
+
 	/* De-assert QDSP6 stop core. QDSP6 will execute after out of reset */
 	writel(LPASS_BOOT_CORE_START, adsp->qdsp6ss_base + CORE_START_REG);
 
@@ -520,6 +525,11 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
 		return PTR_ERR(adsp->qdsp6ss_base);
 	}
 
+	adsp->lpass_efuse =  devm_platform_ioremap_resource_byname(pdev, "lpass_efuse");
+	if (IS_ERR(adsp->lpass_efuse)) {
+		adsp->lpass_efuse = NULL;
+		dev_dbg(adsp->dev, "failed to map LPASS efuse registers\n");
+	}
 	syscon = of_parse_phandle(pdev->dev.of_node, "qcom,halt-regs", 0);
 	if (!syscon) {
 		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
-- 
2.7.4

