Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F28566792
	for <lists+linux-remoteproc@lfdr.de>; Tue,  5 Jul 2022 12:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbiGEKOq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 Jul 2022 06:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbiGEKOp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jul 2022 06:14:45 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9208E13FB8;
        Tue,  5 Jul 2022 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657016082; x=1688552082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZcLSmiENv+Qn2Ni4ALAByedzuulyYpiLnm+kBY0HlKc=;
  b=adSPfST0L6nielm8DfodZucl21Ngxs6CoOOHszdIrO02q0MxdA8JaXZL
   umgPpOeQUCTIUueqN50A1U1DEb4aDPMrofpfoJmXP8xt0apzfp8Elh8a/
   NJDa+/+hoEmdmGBmw9Go9ruXqA6i9jadynkJ4EYQukxuAwR3dvFclmcp7
   c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Jul 2022 03:14:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 03:14:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 03:14:41 -0700
Received: from hu-ylal-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 03:14:38 -0700
From:   Yogesh Lal <quic_ylal@quicinc.com>
To:     <bjorn.andersson@linaro.org>, <quic_sibis@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Yogesh Lal <quic_ylal@quicinc.com>
Subject: [RESEND V3 2/2] remoteproc: qcom: Add full coredump fallback mechanism
Date:   Tue, 5 Jul 2022 15:44:17 +0530
Message-ID: <1657016057-22806-3-git-send-email-quic_ylal@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657016057-22806-1-git-send-email-quic_ylal@quicinc.com>
References: <1657016057-22806-1-git-send-email-quic_ylal@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Siddharth Gupta <sidgup@codeaurora.org>

If a remoteproc's firmware does not support minidump but the driver
adds an ID, the minidump driver does not collect any coredumps when
the remoteproc crashes. This hinders the purpose of coredump
collection. This change adds a fallback mechanism in the event of a
crash.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Yogesh Lal <quic_ylal@quicinc.com>
---
 drivers/remoteproc/qcom_common.c   | 14 ++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c..246e716 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -163,12 +163,22 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id)
 	 */
 	if (subsystem->regions_baseptr == 0 ||
 	    le32_to_cpu(subsystem->status) != 1 ||
-	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED ||
-	    le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
+	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED) {
+		return rproc_coredump(rproc);
+	}
+
+	if (le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
 		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
 		return;
 	}
 
+	/**
+	 * Clear out the dump segments populated by parse_fw before
+	 * re-populating them with minidump segments.
+	 */
+
+	rproc_coredump_cleanup(rproc);
+
 	ret = qcom_add_minidump_segments(rproc, subsystem);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 401b1ec..6e5cbca 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -274,6 +274,7 @@ static const struct rproc_ops adsp_minidump_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
+	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
 	.panic = adsp_panic,
 	.coredump = adsp_minidump,
-- 
2.7.4

