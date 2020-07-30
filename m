Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A42233207
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Jul 2020 14:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgG3M2n (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Jul 2020 08:28:43 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26713 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgG3M2m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jul 2020 08:28:42 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Jul 2020 05:28:42 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Jul 2020 05:28:40 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jul 2020 17:58:15 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 902C6218A5; Thu, 30 Jul 2020 17:58:12 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        nprakash@codeaurora.org, ohad@wizery.com, robh+dt@kernel.org,
        sboyd@kernel.org, sricharan@codeaurora.org
Subject: [PATCH v7 7/9] clk: qcom: Add WCSSAON reset
Date:   Thu, 30 Jul 2020 17:56:41 +0530
Message-Id: <1596112003-31663-8-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596112003-31663-1-git-send-email-gokulsri@codeaurora.org>
References: <1596112003-31663-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add WCSSAON reset required for Q6v5 on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index ef2c9c4..d080e6f 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -4745,6 +4745,7 @@ static const struct qcom_reset_map gcc_ipq8074_resets[] = {
 	[GCC_PCIE1_AXI_SLAVE_ARES] = { 0x76040, 4 },
 	[GCC_PCIE1_AHB_ARES] = { 0x76040, 5 },
 	[GCC_PCIE1_AXI_MASTER_STICKY_ARES] = { 0x76040, 6 },
+	[GCC_WCSSAON_RESET] = { 0x59010, 0 },
 };
 
 static const struct of_device_id gcc_ipq8074_match_table[] = {
-- 
2.7.4

