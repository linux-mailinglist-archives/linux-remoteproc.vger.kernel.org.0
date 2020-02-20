Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71A316554C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 20 Feb 2020 03:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgBTC6A (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 19 Feb 2020 21:58:00 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:53654 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727476AbgBTC6A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Feb 2020 21:58:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582167479; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5ceaaMSCCm3YPAR+D5NLBko4BNHYVXjbzI5l1pQJZTg=; b=JpQP8b2vurjBjc51/HOFCcms4WYoWInuBKQdY8XMGlNynsSwui4si5rozwLwkHIECLu/loPA
 U5snd7Z4d3w0nIwWdXExOdbmEVA8dPRHrVKXmiB5d+vt+MKKoqhNqLU+J9YP746abbRxxlmL
 shaKO/DVda6a4dtmerfk5NHmIok=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4df5b3.7f90feb313b0-smtp-out-n03;
 Thu, 20 Feb 2020 02:57:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08A5CC4479D; Thu, 20 Feb 2020 02:57:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A719C4479F;
        Thu, 20 Feb 2020 02:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A719C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH 3/6] remoteproc: sysmon: Inform current rproc about all active rprocs
Date:   Wed, 19 Feb 2020 18:57:42 -0800
Message-Id: <1582167465-2549-4-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

A remoteproc that has just recovered from a crash will not be aware of the
state of other remoteprocs. Send sysmon notifications on behalf of all the
active/online remoteprocs to the one that just booted up.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_sysmon.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 851664e..d0d59d5 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -457,6 +457,7 @@ static int sysmon_start(struct rproc_subdev *subdev)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
 						  subdev);
+	struct qcom_sysmon *target;
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
 		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
@@ -464,6 +465,17 @@ static int sysmon_start(struct rproc_subdev *subdev)
 
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 
+	mutex_lock(&sysmon_lock);
+	list_for_each_entry(target, &sysmon_list, node) {
+		if (target == sysmon ||
+		    target->rproc->state != RPROC_RUNNING)
+			continue;
+
+		event.subsys_name = target->name;
+		ssctl_send_event(sysmon, &event);
+	}
+	mutex_unlock(&sysmon_lock);
+
 	return 0;
 }
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
