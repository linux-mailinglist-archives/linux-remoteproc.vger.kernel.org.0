Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4FA222EDB
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Jul 2020 01:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgGPXPt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Jul 2020 19:15:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39870 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbgGPXPt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Jul 2020 19:15:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594941348; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yVFhqYf6S+LqM5MCX7zG8HUHhA6kdtso70taiaLJkTg=; b=wTAc/6dFqRr/MkYqc4wGStOXwxIa7GSXQ3RpMthSulPbwQMHtMergtdSaZJF75RqiI+TQSg9
 BSSnjkOaANh1ZXnjyiGeNU7Ia1cYJPASrWrn0xngkVDEqCkZETFVjA+YM+0CAdhSMKZQLxGD
 jksYuuHRuCynlQ+R6WFG1U1UjJo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f10d320512812c070d20136 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 22:22:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1FBB1C433C9; Thu, 16 Jul 2020 22:22:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 552B6C43449;
        Thu, 16 Jul 2020 22:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 552B6C43449
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sibis@codearora.org, tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v8 5/5] remoteproc: Add coredump debugfs entry
Date:   Thu, 16 Jul 2020 15:20:35 -0700
Message-Id: <1594938035-7327-6-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
References: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
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
Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 732770e..2e3b3e2 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -28,6 +28,94 @@
 static struct dentry *rproc_dbg;
 
 /*
+ * A coredump-configuration-to-string lookup table, for exposing a
+ * human readable configuration via debugfs. Always keep in sync with
+ * enum rproc_coredump_mechanism
+ */
+static const char * const rproc_coredump_str[] = {
+	[RPROC_COREDUMP_DEFAULT]	= "default",
+	[RPROC_COREDUMP_INLINE]		= "inline",
+	[RPROC_COREDUMP_DISABLED]	= "disabled",
+};
+
+/* Expose the current coredump configuration via debugfs */
+static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
+				   size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	char buf[20];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%s\n",
+			rproc_coredump_str[rproc->dump_conf]);
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
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
@@ -337,6 +425,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
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

