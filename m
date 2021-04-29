Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4F36EBB2
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Apr 2021 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238780AbhD2N4c (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 29 Apr 2021 09:56:32 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7136 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237385AbhD2N42 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Apr 2021 09:56:28 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TDqoBh016942;
        Thu, 29 Apr 2021 15:55:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=znudQlfS5PDiJZ59RvZ8YQ+jjVF5/hp4/M3cw5xvrR4=;
 b=VFK1pXQByRU8Gp782E+HSWiB2Ix1GRI6qMOPSqQGtC6uU06afQFQuLWVwj0t5/daY+QN
 1kY5PbK1DMbqnccMtZqxbwj5iPsObJT8Re4d0XosTgLTf3xuMwaWCRtCdjzftfGk1i/K
 TpwkNVSHRrTKu0vK/p+1XWHJHNEFH/CxJ34rjKfaAKzkAtIOArZpaWM6RkFDpBcZtRRT
 +0DmeiVQiJXlxzjwQ3RMizmbSFj0L6y7qsFF2qWG8FzB0M5624++ns7EYNTeRg3Tq+0U
 OkEAURYUG6HUUAReUjC27RmWPRXRGpZl5uvZHgu1HwnusFkUUt3OA+/GYSeqsB8Un18P YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38735wt32q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 15:55:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 216DA100034;
        Thu, 29 Apr 2021 15:55:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 167C62178F3;
        Thu, 29 Apr 2021 15:55:37 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 15:55:36
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
Date:   Thu, 29 Apr 2021 15:55:06 +0200
Message-ID: <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_07:2021-04-28,2021-04-29 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

A rpmsg char device allows to probe the endpoint device on a remote name
service announcement.

With this patch the /dev/rpmsgX interface is created either by a user
application or by the remote firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
update from V1:

 - add missing unregister_rpmsg_driver call on module exit.
---
 drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 5c6a7da6e4d7..9166454c1310 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -18,6 +18,8 @@
 
 #include "rpmsg_char.h"
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
@@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+
+	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
+}
+
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
+{
+	int ret;
+
+	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
+}
+
+static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
+	{ .name	= RPMSG_CHAR_DEVNAME },
+	{ },
+};
+
+static struct rpmsg_driver rpmsg_chrdev_driver = {
+	.probe = rpmsg_chrdev_probe,
+	.remove = rpmsg_chrdev_remove,
+	.id_table = rpmsg_chrdev_id_table,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
@@ -427,15 +463,30 @@ static int rpmsg_chrdev_init(void)
 	if (IS_ERR(rpmsg_class)) {
 		pr_err("failed to create rpmsg class\n");
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
+		ret = PTR_ERR(rpmsg_class);
+		goto free_region;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		goto free_class;
 	}
 
 	return 0;
+
+free_class:
+	class_destroy(rpmsg_class);
+free_region:
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+
+	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
-- 
2.17.1

