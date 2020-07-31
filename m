Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1A823456E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 Jul 2020 14:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732860AbgGaMLb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jul 2020 08:11:31 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38550 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733081AbgGaMLR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jul 2020 08:11:17 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VC6YNX009379;
        Fri, 31 Jul 2020 14:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7rSky8J/GLIf+EHvfA+pSMdQZv7hy7gixNL5RCvSGqs=;
 b=08LbaMDnfDx0Uc9V7+QkFjCyL6T6mxE6tTMRGik1yuiaMSpH4unF348V3+HN006hp1Yl
 p9eVM4ox4BpWQrpdXOWvzJvQTLi2qU4taHK4ddmZR/mTjcVQqNKy5CTWYXAAxOAc3KpX
 zvs3wzSZImh+b852IxJGh7s4ZXes0YZPnr54190n4a6BwsU1hvZMdrogvKg9KioTawtR
 EaActcYEwwTcZeAWag4pvZynacW55Npg7QFjG5IWppJlXTbEZkrDVFFNohzG5Tyf021f
 y9ly15vJq9uIFdeAQmnFZyeavarAK97vsoL26ClXwFSdmnMVszJDwdKMBq8EQhLGRgIJ jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gbmgp98w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Jul 2020 14:11:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7389B10002A;
        Fri, 31 Jul 2020 14:11:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68FA32AE6DD;
        Fri, 31 Jul 2020 14:11:13 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:12
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@st.com>
Subject: [PATCH 12/13] rpmsg: control: implement the ioctrl function to create device
Date:   Fri, 31 Jul 2020 14:10:42 +0200
Message-ID: <20200731121043.24199-13-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_04:2020-07-31,2020-07-31 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Implement the ioctrl function that parses the list of
rpmsg drivers registered to create an associated device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 39 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 8773c8395401..d2a6dbb8798f 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -55,12 +55,47 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static const char *rpmsg_ctrl_get_drv_name(u32 service)
+{
+	struct rpmsg_ctl_info *drv_info;
+
+	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
+		if (drv_info->ctrl->service == service)
+			return drv_info->ctrl->drv_name;
+	}
+
+	return NULL;
+}
+
 static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
 				 unsigned long arg)
 {
 	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
-
-	dev_info(&ctrldev->dev, "Control not yet implemented\n");
+	void __user *argp = (void __user *)arg;
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_endpoint_info eptinfo;
+	struct rpmsg_device *newch;
+
+	if (cmd != RPMSG_CREATE_EPT_IOCTL)
+		return -EINVAL;
+
+	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
+		return -EFAULT;
+
+	chinfo.driver_override = rpmsg_ctrl_get_drv_name(eptinfo.service);
+	if (!chinfo.driver_override)
+		return -ENODEV;
+
+	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
+	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
+	chinfo.src = eptinfo.src;
+	chinfo.dst = eptinfo.dst;
+
+	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
+	if (!newch) {
+		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
+		return -ENXIO;
+	}
 
 	return 0;
 };
-- 
2.17.1

