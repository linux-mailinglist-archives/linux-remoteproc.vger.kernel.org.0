Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5762344B7
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 Jul 2020 13:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732638AbgGaLrp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jul 2020 07:47:45 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:15010 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732104AbgGaLro (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jul 2020 07:47:44 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VBbakM031318;
        Fri, 31 Jul 2020 13:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PWq2Fd9CmuFDcof5DhJA8swylSAL/EhvY4+9u/ySbmQ=;
 b=POYwCXb8D+MWQpLE9R/g3Dcac6M1OhhuZGG136fn9lgRp1LREP3ELThPrMALLaf9EGQv
 VCwe8p4xXAj3FIDhbUcnetIfrdrEKwjK1ANcuy01Q+XyRnHWoiB5FJAYIKB6/Vo7XY4d
 A0sonuHJEuBT1JoUTUpEz7P4rqeWHpxpvDRrqxXswatzEISzKtEYvuNO6JZf5kvlEn40
 xPUwtv+hTmMXMhccUty8BDKGlfVApSZxYb86hX4apZWCXbDc2BPuwPtAsobvabB0kbTa
 bYnJWdtkfkEfsN2TYp3aZGw0xO7dZhzXXS39JpO5Ne2eVX3+jfmffxK2FiG2mxgVp3mi Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32g9v9xgrr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Jul 2020 13:47:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EF7110002A;
        Fri, 31 Jul 2020 13:47:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70EA5221061;
        Fri, 31 Jul 2020 13:47:41 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 13:47:40
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@st.com>
Subject: [PATCH 1/9] rpmsg: virtio: rename rpmsg_create_channel
Date:   Fri, 31 Jul 2020 13:47:24 +0200
Message-ID: <20200731114732.12815-2-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731114732.12815-1-arnaud.pouliquen@st.com>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_04:2020-07-31,2020-07-31 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Rename the internal function as it is internal, and as
the name will be used in rpmsg_core.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9006fc7f73d0..736bc7b9dea8 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -390,8 +390,9 @@ static void virtio_rpmsg_release_device(struct device *dev)
  * this function will be used to create both static and dynamic
  * channels.
  */
-static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
-						 struct rpmsg_channel_info *chinfo)
+static struct rpmsg_device *
+__rpmsg_create_channel(struct virtproc_info *vrp,
+		       struct rpmsg_channel_info *chinfo)
 {
 	struct virtio_rpmsg_channel *vch;
 	struct rpmsg_device *rpdev;
@@ -864,7 +865,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
 	} else {
-		newch = rpmsg_create_channel(vrp, &chinfo);
+		newch = __rpmsg_create_channel(vrp, &chinfo);
 		if (!newch)
 			dev_err(dev, "rpmsg_create_channel failed\n");
 	}
-- 
2.17.1

