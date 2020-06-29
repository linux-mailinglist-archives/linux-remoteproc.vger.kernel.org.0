Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E23C20DB29
	for <lists+linux-remoteproc@lfdr.de>; Mon, 29 Jun 2020 22:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732735AbgF2UD6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 29 Jun 2020 16:03:58 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:47737 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732443AbgF2UD5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 29 Jun 2020 16:03:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593461037; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=r5Ps0ckSVMP7RdDIdPCozlpA1Q6xNvrvfOb891tsolA=; b=q18yvraBWxH5Ad1L4UX21EkoGXVSZJoSs2oaxb55dzzFHfcToE+ZPqzpGzDn1U7ZHSSTV0tb
 9amCF/gF8FDA1JTUAJNlu4E+GOLp1R50gkqnpuDD4BRhmBUtihNFBs9anStHftqu8H9y4ulM
 XyzORNfqqfLnPgrugHVPU0hVnyg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5efa49133a8a8b20b80cbe17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 20:03:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D693AC433AF; Mon, 29 Jun 2020 20:03:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10804C433AD;
        Mon, 29 Jun 2020 20:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10804C433AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v6 3/3] remoteproc: Add coredump debugfs entry
Date:   Mon, 29 Jun 2020 13:02:13 -0700
Message-Id: <1593460933-4262-4-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593460933-4262-1-git-send-email-rishabhb@codeaurora.org>
References: <1593460933-4262-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add coredump debugfs entry to configure the type of dump that will
be collected during recovery. User can select between default or
inline coredump functionality. Also coredump collection can be
disabled through this interface.
This functionality can be configured differently for different
remote processors.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 86 +++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 732770e..cca0a91 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -28,6 +28,90 @@
 static struct dentry *rproc_dbg;
 
 /*
+ * A coredump-configuration-to-string lookup table, for exposing a
+ * human readable configuration via debugfs. Always keep in sync with
+ * enum rproc_coredump_mechanism
+ */
+static const char * const rproc_coredump_str[] = {
+	[RPROC_COREDUMP_DEFAULT]	= "default",
+	[RPROC_COREDUMP_INLINE]	= "inline",
+	[RPROC_COREDUMP_DISABLED]	= "disabled",
+};
+
+/* Expose the current coredump configuration via debugfs */
+static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
+				   size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	const char *buf = rproc_coredump_str[rproc->dump_conf];
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
+}
+
+/*
+ * By writing to the 'coredump' debugfs entry, we control the behavior of the
+ * coredump mechanism dynamically. The default value of this entry is "default".
+ *
+ * The 'coredump' debugfs entry supports these commands:
+ *
+ * default:	This is the default coredump mechanism. When the remoteproc
+ *		crashes the entire coredump will be copied to a separate buffer
+ *		and exposed to userspace.
+ *
+ * inline:	The coredump will not be copied to a separate buffer and the
+ *		recovery process will have to wait until data is read by
+ *		userspace. But this avoid usage of extra memory.
+ *
+ * disabled:	This will disable coredump. Recovery will proceed without
+ *		collecting any dump.
+ */
+static ssize_t rproc_coredump_write(struct file *filp,
+				    const char __user *user_buf, size_t count,
+				    loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	int ret, err = 0;
+	char buf[20];
+
+	if (count > sizeof(buf))
+		return -EINVAL;
+
+	ret = copy_from_user(buf, user_buf, count);
+	if (ret)
+		return -EFAULT;
+
+	/* remove end of line */
+	if (buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+
+	if (rproc->state == RPROC_CRASHED) {
+		dev_err(&rproc->dev, "can't change coredump configuration\n");
+		err = -EBUSY;
+		goto out;
+	}
+
+	if (!strncmp(buf, "disable", count)) {
+		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
+	} else if (!strncmp(buf, "inline", count)) {
+		rproc->dump_conf = RPROC_COREDUMP_INLINE;
+	} else if (!strncmp(buf, "default", count)) {
+		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
+	} else {
+		dev_err(&rproc->dev, "Invalid coredump configuration\n");
+		err = -EINVAL;
+	}
+out:
+	return err ? err : count;
+}
+
+static const struct file_operations rproc_coredump_fops = {
+	.read = rproc_coredump_read,
+	.write = rproc_coredump_write,
+	.open = simple_open,
+	.llseek = generic_file_llseek,
+};
+
+/*
  * Some remote processors may support dumping trace logs into a shared
  * memory buffer. We expose this trace buffer using debugfs, so users
  * can easily tell what's going on remotely.
@@ -337,6 +421,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
 			    rproc, &rproc_rsc_table_fops);
 	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
 			    rproc, &rproc_carveouts_fops);
+	debugfs_create_file("coredump", 0600, rproc->dbg_dir,
+			    rproc, &rproc_coredump_fops);
 }
 
 void __init rproc_init_debugfs(void)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

