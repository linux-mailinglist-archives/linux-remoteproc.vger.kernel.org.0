Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B267923410F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 Jul 2020 10:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731947AbgGaITZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jul 2020 04:19:25 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:24226 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731875AbgGaITY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jul 2020 04:19:24 -0400
X-Greylist: delayed 1816 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 Jul 2020 04:19:23 EDT
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06V7md51021645;
        Fri, 31 Jul 2020 09:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1+U+fnjITJVBDho/9pxc8EjH2jCC5Fv7LCPjvJFXy28=;
 b=XQrP/KIhunJR/9sCAfCl9PFOop+aF7KNHlAxGcyhNritGL+2sWt3a0PlCN8PR3tPVBuX
 r6TPGvDaRmSTtLWXuS1R4KhUjvbAPohuS9q4rUr6y69MmDOL2mm1CQLTcm9sDtlLLC7q
 QnmC5z/nTR5vvH9Z45kFOUY86HGMoqET6cT9WpbLeEP2BWO6VIZYploVU/qSOuX3lsI0
 RFl9j9z5motnwkrJufIcjmAPYbyY9Lzhe/PWAwpx2rgsPn9odpSExJfWoGaephT0oC2w
 6MYKQIk4JUhEnYHLDt/2Vr2pFKsMkQKtTJ+wbLEhtJAcocOB4eZRDzrzYRcY0EtMXLEX Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32ga72cag9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Jul 2020 09:49:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A09B910002A;
        Fri, 31 Jul 2020 09:49:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DD4622108B;
        Fri, 31 Jul 2020 09:49:03 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 09:49:02
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@st.com>
Subject: [PATCH] rpmsg: virtio: fix compilation warning for virtio_rpmsg_channel description
Date:   Fri, 31 Jul 2020 09:48:50 +0200
Message-ID: <20200731074850.3262-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_02:2020-07-31,2020-07-31 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Complete the virtio_rpmsg_channel structure description to fix a
compilation warning with W=1 option:

drivers/rpmsg/virtio_rpmsg_bus.c:95: warning: Cannot understand
 * @vrp: the remote processor this channel belongs to

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9006fc7f73d0..7d7ed4e5cce7 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -123,7 +123,12 @@ enum rpmsg_ns_flags {
 };
 
 /**
- * @vrp: the remote processor this channel belongs to
+ * struct virtio_rpmsg_channel - rpmsg channel descriptor
+ * @rpdev: the rpmsg channel device
+ * @vrp: the virtio remote processor device this channel belongs to
+ *
+ * This structure stores the channel that links the rpmsg device to the virtio
+ * remote processor device.
  */
 struct virtio_rpmsg_channel {
 	struct rpmsg_device rpdev;
-- 
2.17.1

