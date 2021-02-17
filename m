Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8E231DAA9
	for <lists+linux-remoteproc@lfdr.de>; Wed, 17 Feb 2021 14:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbhBQNdr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 Feb 2021 08:33:47 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:30436 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233088AbhBQNcl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 08:32:41 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDS2AR026029;
        Wed, 17 Feb 2021 14:31:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5/5ztwEi6vNBYmfGVztdGKdMNwulPVy/4Aq1/ukOfu0=;
 b=PAFaE01CCLIglFdIgKiP0C1jbK1Kg2Wr5bxsgfqqyaE/RroOU4littqGNlFK0yAtLMNl
 CJBsOrk1he2ZZpqqszx6Tnbc9s0mSs7NZ6xmDF08ztLzVEQ7fkbuNhLFEREK66vkb7g9
 ul4ID1S23zx4Bo1cRBQIh50rsUBrr1VGz2sQsCCeuPSohfJgV+A9c7feGOZODmA+OtX1
 z3332Blqd5dpZMXV8ZPQLyXR3t9b5ie5Z0L+TxOSFZka8XaEQxoDFnZQyiZW2xeGamjx
 qr6Q73pBkv0KOmv1jFSIJcakCLq7J9ZNK3KZ0lH69ePqqUsR0ZH/8//mJhqB9O/nKP6x Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p547p3w8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:31:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14CA0100038;
        Wed, 17 Feb 2021 14:31:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0683F2370CE;
        Wed, 17 Feb 2021 14:31:56 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:31:55
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 12/16] rpmsg: ctrl: introduce RPMSG_CREATE_DEV_IOCTL
Date:   Wed, 17 Feb 2021 14:29:01 +0100
Message-ID: <20210217132905.1485-13-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Implement the RPMSG_CREATE_DEV_IOCTL to allow the user application to
initiate a communication through a new RPMsg channel.
This Ioctl can be used to instantiate a local RPMsg device.
Depending on the back-end implementation, a NS announcement can be sent
to the remote processor.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 21 +++++++++++++++++----
 include/uapi/linux/rpmsg.h |  5 +++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 2e43b4096aa8..78c13816bfc6 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -70,9 +70,7 @@ static long rpmsg_ctrl_ioctl(struct file *fp, unsigned int cmd, unsigned long ar
 	void __user *argp = (void __user *)arg;
 	struct rpmsg_endpoint_info eptinfo;
 	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
+	struct rpmsg_device *newch;
 
 	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
 		return -EFAULT;
@@ -82,7 +80,22 @@ static long rpmsg_ctrl_ioctl(struct file *fp, unsigned int cmd, unsigned long ar
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
+	switch (cmd) {
+	case RPMSG_CREATE_EPT_IOCTL:
+		return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
+
+	case RPMSG_CREATE_DEV_IOCTL:
+		newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
+		if (!newch) {
+			dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
+			return -ENXIO;
+		}
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+
 };
 
 static const struct file_operations rpmsg_ctrl_fops = {
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index f5ca8740f3fb..f9d5a74e7801 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -33,4 +33,9 @@ struct rpmsg_endpoint_info {
  */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
+/**
+ * Instantiate a rpmsg service device.
+ */
+#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
+
 #endif
-- 
2.17.1

