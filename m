Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD6A31F82B
	for <lists+linux-remoteproc@lfdr.de>; Fri, 19 Feb 2021 12:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhBSLT2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 19 Feb 2021 06:19:28 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52516 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230261AbhBSLSu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 19 Feb 2021 06:18:50 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBHl8q009458;
        Fri, 19 Feb 2021 12:18:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=URjj4/CWQEc1LE55J3NoeR+Ycg2bTdbvye7fVRYzsh0=;
 b=zAvyEVjIakpNDzahe/iuJcl8LWQEYRrFj991JDJrStLG4DaaIQk4jEIzd6GnIKf9kz5U
 hz4dFLwWTegqvG8bY3Q4x+H3A6088gpg5x4ViptIMk17vOyyxhZSDaO6FV6ENQJe9RKz
 taORj6gqPX1E2ixNBVyhdVAA86Z1GjoQBEAlM8KXgr3oKjBPK6dkk2G3GhbE3SHp0Lno
 TmLfOSUls5A9ak+mJceZCP5X7IIPL/DUH5s/5krAXfFgBg27Iqf9aa96e5Nspvrf4hRk
 oyAs44WXsAPXIjn9qBq3JUmkIbBItVOYmNua7xNsZPthT9gROxD6dhBxL50zz747n+PS Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p6hq550t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:18:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A581B10002A;
        Fri, 19 Feb 2021 12:18:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 994202266D7;
        Fri, 19 Feb 2021 12:18:04 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:18:04
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 07/16] rpmsg: update rpmsg_chrdev_register_device function
Date:   Fri, 19 Feb 2021 12:14:52 +0100
Message-ID: <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

As driver is now the rpmsg_ioctl, rename the function.
In addition, initialize the rpdev addresses to RPMSG_ADDR_ANY as not
defined.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c |  2 +-
 drivers/rpmsg/qcom_smd.c          |  2 +-
 drivers/rpmsg/rpmsg_ctrl.c        |  2 +-
 drivers/rpmsg/rpmsg_internal.h    | 10 ++++++----
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 27a05167c18c..d4e4dd482614 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1625,7 +1625,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
 	rpdev->dev.parent = glink->dev;
 	rpdev->dev.release = qcom_glink_device_release;
 
-	return rpmsg_chrdev_register_device(rpdev);
+	return rpmsg_ctrl_register_device(rpdev);
 }
 
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 19903de6268d..40a1c415c775 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1097,7 +1097,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
 	qsdev->rpdev.dev.parent = &edge->dev;
 	qsdev->rpdev.dev.release = qcom_smd_release_device;
 
-	return rpmsg_chrdev_register_device(&qsdev->rpdev);
+	return rpmsg_ctrl_register_device(&qsdev->rpdev);
 }
 
 /*
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index fa05b67d24da..2e43b4096aa8 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
 	.probe = rpmsg_ctrl_probe,
 	.remove = rpmsg_ctrl_remove,
 	.drv = {
-		.name = "rpmsg_chrdev",
+		.name = KBUILD_MODNAME,
 	},
 };
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a76c344253bf..7428f4465d17 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -82,16 +82,18 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
 int rpmsg_release_channel(struct rpmsg_device *rpdev,
 			  struct rpmsg_channel_info *chinfo);
 /**
- * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
+ * rpmsg_ctrl_register_device() - register a char device for control based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
  *
  * This function wraps rpmsg_register_device() preparing the rpdev for use as
  * basis for the rpmsg chrdev.
  */
-static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
+static inline int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev)
 {
-	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
+	strcpy(rpdev->id.name, "rpmsg_ctrl");
+	rpdev->driver_override = "rpmsg_ctrl";
+	rpdev->src = RPMSG_ADDR_ANY;
+	rpdev->dst = RPMSG_ADDR_ANY;
 
 	return rpmsg_register_device(rpdev);
 }
-- 
2.17.1

