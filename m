Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0067B251D86
	for <lists+linux-remoteproc@lfdr.de>; Tue, 25 Aug 2020 18:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgHYQwa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 25 Aug 2020 12:52:30 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:14880 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726257AbgHYQwW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Aug 2020 12:52:22 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07PGma4t019638;
        Tue, 25 Aug 2020 18:52:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0GCBgslDZw0GYxmu1/0QyIojItqk9H/Ui6PIwaiTKBw=;
 b=mg8NEeHWeIDRhaYlBKOrdtT6jbEVUimzAHa2GzUgIJpxgEIndV1wt6cKtQrVEqgsrLQD
 Vc6WsdsxIidudWCXIb1HkomJPGPY9RRDEyfZvuKxcbGV6OyC6HimW6rkrE1z5seZxPBL
 gQQ7oIQ9wm4fGL2CCMKM4ptDCG4FxYgUGD3XDY4oENheEmk4+xnOIff7IMq2ivZZ15zk
 52lQWN300HuMf+FihCjHSf/5nz70OSn0Bmjx03tmvBRnPfaBC7mMl1jfm44g6tl8ncQ0
 uMwNJEhV5uGp3y+UFtHZg8gTrIeSZpx+Y2sswwiHfSr92tTS1ti4MEplGXVNjbyjEWim Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 333b6x405v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 18:52:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CDBB10002A;
        Tue, 25 Aug 2020 18:52:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E9872AE6AA;
        Tue, 25 Aug 2020 18:52:17 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug 2020 18:52:16
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@st.com>
Subject: [PATCH v2 4/8] rpmsg: define the name service announcement as reserved address
Date:   Tue, 25 Aug 2020 18:49:03 +0200
Message-ID: <20200825164907.3642-5-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825164907.3642-1-arnaud.pouliquen@st.com>
References: <20200825164907.3642-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_06:2020-08-25,2020-08-25 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The address 53 is reserved for the dynamic RPMsg device management
on name service announcement.
Define this address in a reserved enum list.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 3 ---
 include/linux/rpmsg.h            | 9 +++++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 910d30818901..b2927661868c 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -162,9 +162,6 @@ struct virtio_rpmsg_channel {
  */
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
-/* Address 53 is reserved for advertising remote services */
-#define RPMSG_NS_ADDR			(53)
-
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d1c018..5496d27c6f8c 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -20,6 +20,15 @@
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
 
+/**
+ * enum rpmsg_ns_flags - List of reserved RPMsg addresses
+ *
+ * @RPMSG_NS_ADDR: remote services advertising for dynamic allocation
+ */
+enum rpmsg_reserved_addr {
+	RPMSG_NS_ADDR		= 53,
+};
+
 struct rpmsg_device;
 struct rpmsg_endpoint;
 struct rpmsg_device_ops;
-- 
2.17.1

