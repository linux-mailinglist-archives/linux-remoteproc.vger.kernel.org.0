Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5AB11888A5
	for <lists+linux-remoteproc@lfdr.de>; Tue, 17 Mar 2020 16:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCQPJg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 17 Mar 2020 11:09:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:54799 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726946AbgCQPJg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Mar 2020 11:09:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584457775; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Dpl+B/scWbZmo2gF6XnUI5Rycg75wr3H9pADUU/sGQI=; b=s5RykQSaZ6Tjgn7nNh5R3gK6e9ZHsMIq7Z79EAYt4TSnaF/MiEKSX/Rwkqgs8ujgHrcUk+e/
 jFfGrvPZNVJ19SHypLvNiY9pzj7qoFIBX/R8tD60uCaNTOvYWvPPwiFKOVPCsZ/WqtRdllCl
 ZGXyvt6xn99oKVXBZb1XfpH97JE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70e82e.7f47715cfed8-smtp-out-n02;
 Tue, 17 Mar 2020 15:09:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9C7BC433D2; Tue, 17 Mar 2020 15:09:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79D80C4478F;
        Tue, 17 Mar 2020 15:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79D80C4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org,
        robin.murphy@arm.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/3] remoteproc: qcom_q6v5_mss: Request direct mapping for modem device
Date:   Tue, 17 Mar 2020 20:39:09 +0530
Message-Id: <20200317150910.26053-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200317150910.26053-1-sibis@codeaurora.org>
References: <20200317150910.26053-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Request direct mapping for modem on platforms which don't have TrustZone
(which programs the modem SIDs) to prevent the following global faults seen
on Cheza/Trogdor:

arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000781, GFSYNR2 0x00000000

arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000461, GFSYNR2 0x00000000

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/iommu/arm-smmu-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index ff746acd1c816..5dd7a788f59e1 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -20,12 +20,18 @@ static const struct arm_smmu_client_match_data qcom_mdss = {
 	.direct_mapping = true,
 };
 
+static const struct arm_smmu_client_match_data qcom_mss = {
+	.direct_mapping = true,
+};
+
 static const struct of_device_id qcom_smmu_client_of_match[] = {
 	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
 	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
 	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
 	{ .compatible = "qcom,sc7180-mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sc7180-mss-pil", .data = &qcom_mss },
 	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sdm845-mss-pil", .data = &qcom_mss },
 	{},
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
