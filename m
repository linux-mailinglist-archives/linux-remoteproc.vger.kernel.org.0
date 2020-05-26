Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684041BE5CF
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2020 20:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2SE6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 29 Apr 2020 14:04:58 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21134 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726511AbgD2SE5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Apr 2020 14:04:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588183497; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2FALkhGpM2HPL37dTrh6ykdf3xZBris2h6ZDdsxWFkQ=; b=VMFnhPuyUazrpRt/Z5idmoNM+DsVGosIMWhKcBo5CSIVjou0MNka4aKg4bWP00FEjX7yBApr
 F+P4AArGhNnZKIeNgmEmMhh5Sm25iIZgIhG4liv+eeyJMiYBPKt2sALKBy9EBe7Eu7MreKMr
 yXhU3PovOVpg0vbXAKz4mThEM+8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9c1c2.7f19aea4b148-smtp-out-n02;
 Wed, 29 Apr 2020 18:04:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D73E1C433BA; Wed, 29 Apr 2020 18:04:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBC25C433CB;
        Wed, 29 Apr 2020 18:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CBC25C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH] remoteproc: core: Prevent system suspend during remoteproc recovery
Date:   Wed, 29 Apr 2020 11:04:42 -0700
Message-Id: <1588183482-21146-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The system might go into suspend during recovery of any remoteproc.
This will interrupt the recovery process in between increasing the
recovery time. Make the platform device as wakeup capable and
use pm_stay_wake/pm_relax APIs to avoid system from going into
suspend during recovery.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c   | 2 ++
 drivers/remoteproc/remoteproc_core.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index edf9d0e..e608578 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -398,6 +398,8 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->has_aggre2_clk = desc->has_aggre2_clk;
 	platform_set_drvdata(pdev, adsp);
 
+	device_wakeup_enable(adsp->dev);
+
 	ret = adsp_alloc_memory_region(adsp);
 	if (ret)
 		goto free_rproc;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e..6a1cb98 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	if (!rproc->recovery_disabled)
 		rproc_trigger_recovery(rproc);
+
+	pm_relax(rproc->dev.parent);
 }
 
 /**
@@ -2208,6 +2210,9 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 		return;
 	}
 
+	/* Prevent suspend while the remoteproc is being recovered */
+	pm_stay_awake(rproc->dev.parent);
+
 	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
 		rproc->name, rproc_crash_to_string(type));
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
