Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC4923322C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Jul 2020 14:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgG3M3S (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Jul 2020 08:29:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43483 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbgG3M2r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jul 2020 08:28:47 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 30 Jul 2020 05:28:46 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Jul 2020 05:28:44 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jul 2020 17:58:13 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 072B2218A1; Thu, 30 Jul 2020 17:58:11 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        nprakash@codeaurora.org, ohad@wizery.com, robh+dt@kernel.org,
        sboyd@kernel.org, sricharan@codeaurora.org
Subject: [PATCH v7 2/9] remoteproc: qcom: Add secure PIL support
Date:   Thu, 30 Jul 2020 17:56:36 +0530
Message-Id: <1596112003-31663-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596112003-31663-1-git-send-email-gokulsri@codeaurora.org>
References: <1596112003-31663-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

IPQ8074 uses secure PIL. Hence, adding the support for the same.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 43 ++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e13d1c6..ba932e6 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/qcom_scm.h>
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
@@ -86,6 +87,9 @@
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
 #define MAX_HALT_REG		3
+
+#define WCNSS_PAS_ID		6
+
 enum {
 	WCSS_IPQ8074,
 	WCSS_QCS404,
@@ -134,6 +138,7 @@ struct q6v5_wcss {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	bool need_mem_protection;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
@@ -152,6 +157,7 @@ struct wcss_data {
 	int ssctl_id;
 	const struct rproc_ops *ops;
 	bool requires_force_stop;
+	bool need_mem_protection;
 };
 
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
@@ -251,6 +257,15 @@ static int q6v5_wcss_start(struct rproc *rproc)
 
 	qcom_q6v5_prepare(&wcss->q6v5);
 
+	if (wcss->need_mem_protection) {
+		ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
+		if (ret) {
+			dev_err(wcss->dev, "wcss_reset failed\n");
+			return ret;
+		}
+		goto wait_for_reset;
+	}
+
 	/* Release Q6 and WCSS reset */
 	ret = reset_control_deassert(wcss->wcss_reset);
 	if (ret) {
@@ -285,6 +300,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	if (ret)
 		goto wcss_q6_reset;
 
+wait_for_reset:
 	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
 	if (ret == -ETIMEDOUT)
 		dev_err(wcss->dev, "start timed out\n");
@@ -717,6 +733,15 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	if (wcss->need_mem_protection) {
+		ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
+		if (ret) {
+			dev_err(wcss->dev, "not able to shutdown\n");
+			return ret;
+		}
+		goto pas_done;
+	}
+
 	/* WCSS powerdown */
 	if (wcss->requires_force_stop) {
 		ret = qcom_q6v5_request_stop(&wcss->q6v5);
@@ -741,6 +766,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 			return ret;
 	}
 
+pas_done:
 	clk_disable_unprepare(wcss->prng_clk);
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
@@ -764,9 +790,15 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				    0, wcss->mem_region, wcss->mem_phys,
-				    wcss->mem_size, &wcss->mem_reloc);
+	if (wcss->need_mem_protection)
+		ret = qcom_mdt_load(wcss->dev, fw, rproc->firmware,
+				    WCNSS_PAS_ID, wcss->mem_region,
+				    wcss->mem_phys, wcss->mem_size,
+				    &wcss->mem_reloc);
+	else
+		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
+					    0, wcss->mem_region, wcss->mem_phys,
+					    wcss->mem_size, &wcss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -1032,6 +1064,9 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	if (desc->need_mem_protection && !qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
 			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
@@ -1045,6 +1080,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->need_mem_protection = desc->need_mem_protection;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1113,6 +1149,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.wcss_q6_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
+	.need_mem_protection = true,
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
-- 
2.7.4

