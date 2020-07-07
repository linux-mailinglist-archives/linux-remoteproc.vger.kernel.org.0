Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5925421779B
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 21:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgGGTI3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 15:08:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44714 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728709AbgGGTI2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 15:08:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594148907; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VncLh8c1/5Bxa/RO8s4GPWFHixwOVBKMpVhCQLo0Vfw=; b=gsejiEfKp77vG/Jkc+GlxRCsxwJIs41Ek+asFYAN3sCZBYvw9kFpRtsj7hDl53wHL6A3I7uC
 eS80e8Y3jUNpJmEXuaeGvELeY8yA7gwBa/5cFHg4WyIuyxRECAKhpenFHWy+auLGoh0Wden3
 Dwi30p/OA+G0xlJNOriPj1RNQc8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f04c816d8ca07a57313be32 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 19:08:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97088C43395; Tue,  7 Jul 2020 19:08:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37CA2C433CA;
        Tue,  7 Jul 2020 19:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37CA2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        corbet@lwn.net
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v4 2/2] remoteproc: core: Register the character device interface
Date:   Tue,  7 Jul 2020 12:07:50 -0700
Message-Id: <1594148870-27276-3-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
References: <1594148870-27276-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the character device during rproc_add. This would create
a character device node at /dev/remoteproc<index>. Userspace
applications can interact with the remote processor using this
interface.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0f95e02..ec7fb49 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1966,6 +1966,13 @@ int rproc_add(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* add char device for this remoteproc */
+	ret = rproc_char_device_add(rproc);
+	if (ret) {
+		dev_err(dev, "Failed to add char dev for %s\n", rproc->name);
+		return ret;
+	}
+
 	ret = device_add(dev);
 	if (ret < 0)
 		return ret;
@@ -2241,6 +2248,7 @@ int rproc_del(struct rproc *rproc)
 	mutex_unlock(&rproc->lock);
 
 	rproc_delete_debug_dir(rproc);
+	rproc_char_device_remove(rproc);
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
@@ -2409,6 +2417,7 @@ static int __init remoteproc_init(void)
 {
 	rproc_init_sysfs();
 	rproc_init_debugfs();
+	rproc_init_cdev();
 	rproc_init_panic();
 
 	return 0;
@@ -2420,6 +2429,7 @@ static void __exit remoteproc_exit(void)
 	ida_destroy(&rproc_dev_index);
 
 	rproc_exit_panic();
+	rproc_exit_cdev();
 	rproc_exit_debugfs();
 	rproc_exit_sysfs();
 }
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

