Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC3E308B1A
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 Jan 2021 18:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbhA2RLh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 29 Jan 2021 12:11:37 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:24279 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhA2RLg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Jan 2021 12:11:36 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 09:10:16 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 09:10:14 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jan 2021 22:39:38 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id DFEB1219FC; Fri, 29 Jan 2021 22:39:38 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, nprakash@codeaurora.org,
        gokulsri@codeaurora.org
Subject: [PATCH 2/3] remoteproc: qcom: wcss: populate driver data for IPQ6018
Date:   Fri, 29 Jan 2021 22:39:37 +0530
Message-Id: <1611940178-24546-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611940178-24546-1-git-send-email-gokulsri@codeaurora.org>
References: <1611940178-24546-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Populate hardcoded param using driver data for IPQ6018 SoCs.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 7c64bfc..bc9531c 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -965,7 +965,7 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int ipq8074_init_clock(struct q6v5_wcss *wcss)
+static int ipq_init_clock(struct q6v5_wcss *wcss)
 {
 	int ret;
 
@@ -1172,7 +1172,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
-	.init_clock = ipq8074_init_clock,
+	.init_clock = ipq_init_clock,
 	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
 	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
@@ -1185,6 +1185,20 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.need_mem_protection = true,
 };
 
+static const struct wcss_data wcss_ipq6018_res_init = {
+	.init_clock = ipq_init_clock,
+	.q6_firmware_name = "IPQ6018/q6_fw.mdt",
+	.m3_firmware_name = "IPQ6018/m3_fw.mdt",
+	.crash_reason_smem = WCSS_CRASH_REASON,
+	.aon_reset_required = true,
+	.wcss_q6_reset_required = true,
+	.bcr_reset_required = false,
+	.ssr_name = "q6wcss",
+	.ops = &q6v5_wcss_ipq8074_ops,
+	.requires_force_stop = true,
+	.need_mem_protection = true,
+};
+
 static const struct wcss_data wcss_qcs404_res_init = {
 	.init_clock = qcs404_init_clock,
 	.init_regulator = qcs404_init_regulator,
@@ -1203,6 +1217,7 @@ static const struct wcss_data wcss_qcs404_res_init = {
 
 static const struct of_device_id q6v5_wcss_of_match[] = {
 	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+	{ .compatible = "qcom,ipq6018-wcss-pil", .data = &wcss_ipq6018_res_init },
 	{ .compatible = "qcom,qcs404-wcss-pil", .data = &wcss_qcs404_res_init },
 	{ },
 };
-- 
2.7.4

