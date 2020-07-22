Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC9F22A089
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jul 2020 22:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732812AbgGVULP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Jul 2020 16:11:15 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:41483 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732755AbgGVULO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jul 2020 16:11:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595448673; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=REoXVWQbHijBuNKTFEkR7jVwMDFykpE2PFboAKq4xoI=; b=paJ+8JMLtppbiWg6yuvjaYftW3+izvjPwVK3mcqmZerrAc0w5MMXGziLceCt8RIsnIo9inrm
 tLwk3JGEX2OJrWbmfWgenM0xSflug25EuRfL57K0NddNyQ25d2EJX9pqMq0mwtNR0M1xK9e0
 hfe6HhBeDDkix7QTeScFN9NeEQ0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f189d6165270fa5953aeb2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 20:11:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3B65C433A0; Wed, 22 Jul 2020 20:11:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1D69C43391;
        Wed, 22 Jul 2020 20:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1D69C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 3/3] remoteproc: qcom_q6v5_mss: Add modem debug policy support
Date:   Thu, 23 Jul 2020 01:40:47 +0530
Message-Id: <20200722201047.12975-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722201047.12975-1-sibis@codeaurora.org>
References: <20200722201047.12975-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add modem debug policy support which will enable coredumps and live
debug support when the msadp firmware is present on secure devices.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v3:
 * Fix dp_fw leak and create a separate func for dp load [Bjorn]
 * Reset dp_size on mba_reclaim

v2:
 * Use request_firmware_direct [Bjorn]
 * Use Bjorn's template to show if debug policy is present
 * Add size check to prevent memcpy out of bounds [Bjorn]

 drivers/remoteproc/qcom_q6v5_mss.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index f4aa61ba220dc..da99c8504a346 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -191,6 +191,7 @@ struct q6v5 {
 	phys_addr_t mba_phys;
 	void *mba_region;
 	size_t mba_size;
+	size_t dp_size;
 
 	phys_addr_t mpss_phys;
 	phys_addr_t mpss_reloc;
@@ -408,6 +409,21 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
 				   current_perm, next, perms);
 }
 
+static void q6v5_debug_policy_load(struct q6v5 *qproc)
+{
+	const struct firmware *dp_fw;
+
+	if (request_firmware_direct(&dp_fw, "msadp", qproc->dev))
+		return;
+
+	if (SZ_1M + dp_fw->size <= qproc->mba_size) {
+		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
+		qproc->dp_size = dp_fw->size;
+	}
+
+	release_firmware(dp_fw);
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -419,6 +435,7 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 	}
 
 	memcpy(qproc->mba_region, fw->data, fw->size);
+	q6v5_debug_policy_load(qproc);
 
 	return 0;
 }
@@ -928,6 +945,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	}
 
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
+	if (qproc->dp_size) {
+		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+	}
 
 	ret = q6v5proc_reset(qproc);
 	if (ret)
@@ -996,6 +1017,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 	u32 val;
 
 	qproc->dump_mba_loaded = false;
+	qproc->dp_size = 0;
 
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
@@ -1290,7 +1312,8 @@ static int q6v5_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	dev_info(qproc->dev, "MBA booted, loading mpss\n");
+	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
+		 qproc->dp_size ? "" : "out");
 
 	ret = q6v5_mpss_load(qproc);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

