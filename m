Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E391E54B1
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 May 2020 05:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgE1DfN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 May 2020 23:35:13 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:64021 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726793AbgE1DfN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 May 2020 23:35:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590636912; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/1x1zy/A8SDtBlEw9Z+6IaVtjY/aex4rjqibXdLZ1NU=; b=jgCv1B8lir6JUXCgb37yUXRTxZtPCr1VFYCz0lU2f9kvhqz0LUk4Fpt75Lk/guiWbfgCR7r/
 L6+XiCB5aozt6JV+RDiJLoxPKFeXMjbWSM6HlHpK7ucnQhkfABHPzB/LsxTxeOvIdyGbE+cK
 G+A91NAGL6sPMjXLOwZ026bZ0Fs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ecf315c2738686126a7fdbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 03:34:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29A13C433CA; Thu, 28 May 2020 03:34:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5155CC433CB;
        Thu, 28 May 2020 03:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5155CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v4 2/2] remoteproc: qcom: Add notification types to SSR
Date:   Wed, 27 May 2020 20:34:43 -0700
Message-Id: <1590636883-30866-3-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590636883-30866-1-git-send-email-rishabhb@codeaurora.org>
References: <1590636883-30866-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Siddharth Gupta <sidgup@codeaurora.org>

The SSR subdevice only adds callback for the unprepare event. Add callbacks
for unprepare, start and prepare events. The client driver for a particular
remoteproc might be interested in knowing the status of the remoteproc
while undergoing SSR, not just when the remoteproc has finished shutting
down.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c      | 46 +++++++++++++++++++++++++++++++++--
 include/linux/remoteproc/qcom_rproc.h | 14 +++++++++++
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 61ff2dd..5c5a1eb 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -228,7 +228,7 @@ struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
  *
  * This registers the @nb notifier block as part the notifier chain for a
  * remoteproc associated with @name. The notifier block's callback
- * will be invoked when the particular remote processor is stopped.
+ * will be invoked when the particular remote processor is started/stopped.
  */
 void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
 {
@@ -258,6 +258,44 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
+static int ssr_notify_prepare(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+	struct qcom_ssr_notif_data data = {
+		.name = ssr->info->name,
+		.crashed = false,
+	};
+
+	srcu_notifier_call_chain(&ssr->info->notifier_list,
+				 QCOM_SSR_BEFORE_POWERUP, &data);
+	return 0;
+}
+
+static int ssr_notify_start(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+	struct qcom_ssr_notif_data data = {
+		.name = ssr->info->name,
+		.crashed = false,
+	};
+
+	srcu_notifier_call_chain(&ssr->info->notifier_list,
+				 QCOM_SSR_AFTER_POWERUP, &data);
+	return 0;
+}
+
+static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+	struct qcom_ssr_notif_data data = {
+		.name = ssr->info->name,
+		.crashed = crashed,
+	};
+
+	srcu_notifier_call_chain(&ssr->info->notifier_list,
+				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
+}
+
 static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
@@ -266,7 +304,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
-	srcu_notifier_call_chain(&ssr->info->notifier_list, 0, &data);
+	srcu_notifier_call_chain(&ssr->info->notifier_list,
+				 QCOM_SSR_AFTER_SHUTDOWN, &data);
 }
 
 
@@ -294,6 +333,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 
 	mutex_unlock(&qcom_ssr_subsys_lock);
 	ssr->info = info;
+	ssr->subdev.prepare = ssr_notify_prepare;
+	ssr->subdev.start = ssr_notify_start;
+	ssr->subdev.stop = ssr_notify_stop;
 	ssr->subdev.unprepare = ssr_notify_unprepare;
 
 	rproc_add_subdev(rproc, &ssr->subdev);
diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
index 58422b1..a558183 100644
--- a/include/linux/remoteproc/qcom_rproc.h
+++ b/include/linux/remoteproc/qcom_rproc.h
@@ -5,6 +5,20 @@
 
 #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
 
+/**
+ * enum qcom_ssr_notif_type - Different stages of remoteproc notifications
+ * @QCOM_SSR_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
+ * @QCOM_SSR_AFTER_SHUTDOWN:	stop stage of  remoteproc
+ * @QCOM_SSR_BEFORE_POWERUP:	prepare stage of  remoteproc
+ * @QCOM_SSR_AFTER_POWERUP:	start stage of  remoteproc
+ */
+enum qcom_ssr_notif_type {
+	QCOM_SSR_BEFORE_SHUTDOWN,
+	QCOM_SSR_AFTER_SHUTDOWN,
+	QCOM_SSR_BEFORE_POWERUP,
+	QCOM_SSR_AFTER_POWERUP,
+};
+
 struct qcom_ssr_notif_data {
 	const char *name;
 	bool crashed;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

