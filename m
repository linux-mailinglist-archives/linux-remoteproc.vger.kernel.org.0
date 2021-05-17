Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557C9383AF8
	for <lists+linux-remoteproc@lfdr.de>; Mon, 17 May 2021 19:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbhEQRRM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 17 May 2021 13:17:12 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39230 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236154AbhEQRRL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 May 2021 13:17:11 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HHFrU3027860;
        Mon, 17 May 2021 19:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=+F7Xr6qALoUxqaGq+sgbE7ucOObFrRnc+ROq2YE54Ps=;
 b=YPl5wR5s55za35JFay4p4jeW6guPH60OZ4Ng4vHNsIDZwhMdXkww8DL4DyEMtqo0N7Ew
 5wZdDMBDQ/rJMlDnkUtr3nCf27YibjVc2VdpCcgz9OYcVrOHYkguLdj9fTZgbKtb9tEO
 MW11401SDgBJM7yZD6qNQK4SfnlSlSEC2SupnTH1oMw2BlDwaqG1seUD7l2HkK+yz5A/
 1740EmfTO1wjJux9Lvayi9dZYHR4tquYjV9Arp9boWHUYj5Xgw2QE8BqvyZ/YA1zraEB
 ZJ5dDCssNFXZkEdxauIQR8g8keqFrfsoVQRqfrlkOQXsuG2Z8tPjsnrmu0mOtsCJpulC 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38k5dq63xn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 May 2021 19:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDEDF100039;
        Mon, 17 May 2021 19:15:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E39AD212FAB;
        Mon, 17 May 2021 19:15:45 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May 2021 19:15:45
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 4/4] rpmsg: Update rpmsg_chrdev_register_device function
Date:   Mon, 17 May 2021 19:15:31 +0200
Message-ID: <20210517171531.21205-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
References: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-17_08:2021-05-17,2021-05-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The rpmsg_chrdev driver has been replaced by the rpmsg_ctrl driver
for the /dev/rpmsg_ctrlX devices management. The reference for the
driver override is now the rpmsg_ctrl.

Update the rpmsg_chrdev_register_device function to reflect the update,
and rename the function to use the rpmsg_ctrldev prefix.

The platform drivers are updated accordingly.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

---
Update from V3:
- s/rpmsg_chrdev_register_device/rpmsg_ctrldev_register_device in
  header comment.
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 drivers/rpmsg/qcom_smd.c          | 2 +-
 drivers/rpmsg/rpmsg_ctrl.c        | 2 +-
 drivers/rpmsg/rpmsg_internal.h    | 8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c  | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 05533c71b10e..7d7e809800ec 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1642,7 +1642,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
 	rpdev->dev.parent = glink->dev;
 	rpdev->dev.release = qcom_glink_device_release;
 
-	return rpmsg_chrdev_register_device(rpdev);
+	return rpmsg_ctrldev_register_device(rpdev);
 }
 
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 8da1b5cb31b3..d223e438d17c 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1113,7 +1113,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
 	qsdev->rpdev.dev.parent = &edge->dev;
 	qsdev->rpdev.dev.release = qcom_smd_release_device;
 
-	return rpmsg_chrdev_register_device(&qsdev->rpdev);
+	return rpmsg_ctrldev_register_device(&qsdev->rpdev);
 }
 
 /*
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 87a1746367eb..eeb1708548c1 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -179,7 +179,7 @@ static struct rpmsg_driver rpmsg_ctrldev_driver = {
 	.probe = rpmsg_ctrldev_probe,
 	.remove = rpmsg_ctrldev_remove,
 	.drv = {
-		.name = "rpmsg_chrdev",
+		.name = "rpmsg_ctrl",
 	},
 };
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a76c344253bf..d6056f09bcd8 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -82,16 +82,16 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
 int rpmsg_release_channel(struct rpmsg_device *rpdev,
 			  struct rpmsg_channel_info *chinfo);
 /**
- * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
+ * rpmsg_ctrldev_register_device() - register a char device for control based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
  *
  * This function wraps rpmsg_register_device() preparing the rpdev for use as
  * basis for the rpmsg chrdev.
  */
-static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
+static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
 {
-	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
+	strcpy(rpdev->id.name, "rpmsg_ctrl");
+	rpdev->driver_override = "rpmsg_ctrl";
 
 	return rpmsg_register_device(rpdev);
 }
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 8e49a3bacfc7..e42234a3e2ab 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -840,7 +840,7 @@ static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev
 	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
 	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
 
-	err = rpmsg_chrdev_register_device(rpdev_ctrl);
+	err = rpmsg_ctrldev_register_device(rpdev_ctrl);
 	if (err) {
 		kfree(vch);
 		return ERR_PTR(err);
-- 
2.17.1

