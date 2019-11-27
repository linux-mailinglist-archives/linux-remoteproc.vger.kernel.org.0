Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF810B205
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Nov 2019 16:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfK0PNy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 Nov 2019 10:13:54 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:48549 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727079AbfK0PNf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Nov 2019 10:13:35 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 20:43:26 +0530
IronPort-SDR: lfQCWirvsd9qbiyo4PCQrqkqFfmAdeFMFP07hh+P241MjM4hdlee0/fZLgBAjDywJje3ZbrDoJ
 AJq7aMFbvc4cEGr0M7n1K5hvKV27v2/i/pSXnwZNmjzUWiRBNlTRznCPndLUiWDkbBc0TK9eNP
 2p6Sg/gX7rsOUxlJpqs1rbDpLIiudZvAPjJ41WDZvy8fJXi6TX6q1KRSzdzUwax8Art4WYt2F8
 tH3C4iS73Q6rIu3Mr36Vtrib49gpOvmuF5Skzp+E0ZwkQS4Te5xwoW3qM9Ri+dP43A9gkmcYKA
 GY+O2q2eYzg9E+9OZT1iP+wr
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Nov 2019 20:42:56 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id BB8653986; Wed, 27 Nov 2019 20:42:55 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V3 01/10] remoteproc: qcom: Add PRNG proxy clock
Date:   Wed, 27 Nov 2019 20:42:45 +0530
Message-Id: <1574867574-2216-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
References: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

PRNG clock is needed by the secure PIL, support for the same
is added in subsequent patches.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 69 ++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index a2671a1..e5cc064 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -91,19 +91,6 @@ enum {
 	WCSS_QCS404,
 };
 
-struct wcss_data {
-	const char *firmware_name;
-	int crash_reason_smem;
-	u32 version;
-	bool aon_reset_required;
-	bool wcss_q6_reset_required;
-	const char *ssr_name;
-	const char *sysmon_name;
-	int ssctl_id;
-	const struct rproc_ops *ops;
-	bool requires_force_stop;
-};
-
 struct q6v5_wcss {
 	struct device *dev;
 
@@ -128,6 +115,7 @@ struct q6v5_wcss {
 	struct clk *qdsp6ss_xo_cbcr;
 	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
+	struct clk *prng_clk;
 	struct regulator *cx_supply;
 
 	struct qcom_rproc_glink glink_subdev;
@@ -151,6 +139,21 @@ struct q6v5_wcss {
 	bool requires_force_stop;
 };
 
+struct wcss_data {
+	int (*init_clock)(struct q6v5_wcss *wcss);
+	int (*init_regulator)(struct q6v5_wcss *wcss);
+	const char *firmware_name;
+	int crash_reason_smem;
+	u32 version;
+	bool aon_reset_required;
+	bool wcss_q6_reset_required;
+	const char *ssr_name;
+	const char *sysmon_name;
+	int ssctl_id;
+	const struct rproc_ops *ops;
+	bool requires_force_stop;
+};
+
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
 {
 	int ret;
@@ -240,6 +243,12 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	ret = clk_prepare_enable(wcss->prng_clk);
+	if (ret) {
+		dev_err(wcss->dev, "prng clock enable failed\n");
+		return ret;
+	}
+
 	qcom_q6v5_prepare(&wcss->q6v5);
 
 	/* Release Q6 and WCSS reset */
@@ -732,6 +741,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 			return ret;
 	}
 
+	clk_disable_unprepare(wcss->prng_clk);
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
 	return 0;
@@ -889,7 +899,21 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
+static int ipq8074_init_clock(struct q6v5_wcss *wcss)
+{
+	int ret;
+
+	wcss->prng_clk = devm_clk_get(wcss->dev, "prng");
+	if (IS_ERR(wcss->prng_clk)) {
+		ret = PTR_ERR(wcss->prng_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "Failed to get prng clock\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int qcs404_init_clock(struct q6v5_wcss *wcss)
 {
 	int ret;
 
@@ -979,7 +1003,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
+static int qcs404_init_regulator(struct q6v5_wcss *wcss)
 {
 	wcss->cx_supply = devm_regulator_get(wcss->dev, "cx");
 	if (IS_ERR(wcss->cx_supply))
@@ -1023,14 +1047,16 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	if (wcss->version == WCSS_QCS404) {
-		ret = q6v5_wcss_init_clock(wcss);
+	if (desc->init_clock) {
+		ret = desc->init_clock(wcss);
 		if (ret)
 			goto free_rproc;
 
-		ret = q6v5_wcss_init_regulator(wcss);
-		if (ret)
-			goto free_rproc;
+		if (desc->init_regulator) {
+			ret = desc->init_regulator(wcss);
+			if (ret)
+				goto free_rproc;
+		}
 	}
 
 	ret = q6v5_wcss_init_reset(wcss, desc);
@@ -1073,6 +1099,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
+	.init_clock = ipq8074_init_clock,
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1082,6 +1109,8 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
+	.init_clock = qcs404_init_clock,
+	.init_regulator = qcs404_init_regulator,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
-- 
1.9.1

