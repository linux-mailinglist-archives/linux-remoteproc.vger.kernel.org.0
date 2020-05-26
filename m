Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691161ACD61
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Apr 2020 18:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410746AbgDPQQG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 12:16:06 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47085 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438465AbgDPQOQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 12:14:16 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03GGCFLB010378;
        Thu, 16 Apr 2020 18:14:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=fjXKxPxzbyDDVi3DEAO1z1G4S222u7YWRmiegBuibKg=;
 b=QdU4LEVNSHbgtgFd4+R31NIe94HOR2k7qZEywHTvP0MEe2gFAcjHDT+It1wbyfsz8b9T
 Phk1HEJ7+5mB/UQhYZJJQB56Rh7ZYg4vdYfW9fE1WVufUZDgZ39+a083xmR1rTuCTw8f
 OVY78E4JkPQ/UA9PNJyCALj4G8KN9akaBge0GTwRd5CKIZcW2AFkctmpspwtXGnkaag+
 YUbd5O1uATKGyWc9FURS2JJzEVXMuLVqNpXkyEkbfby2Afa2yrdEJ7mtqGaPL/NOCiuu
 FWbhwEp02EolXqQcWVBBouqec9F3XmEAS1fcQPANBgObzw46yxfYirJ1XbHT3V1EJENf Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30dn94kmux-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Apr 2020 18:14:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C141E100034;
        Thu, 16 Apr 2020 18:14:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B278F2B2D2A;
        Thu, 16 Apr 2020 18:14:07 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:07
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@st.com>
Subject: [RFC 01/18] remoteproc: Store resource table address in rvdev
Date:   Thu, 16 Apr 2020 18:13:14 +0200
Message-ID: <20200416161331.7606-2-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-16_06:2020-04-14,2020-04-16 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Store the resource table address in rvdev struct to be able to
retrieve it from vdev device.
This patch prepares the migration of rdev management in rproc_virtio.
Indeed remoteproc virtio will have to complete the vdev and vrings
resource table structures.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 include/linux/remoteproc.h           | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..2a0425ab82a7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -504,6 +504,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	kref_init(&rvdev->refcount);
 
+	rvdev->rsc = rsc;
 	rvdev->id = rsc->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rproc->nb_vdev++;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..a78e28bda962 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -567,6 +567,7 @@ struct rproc_vring {
  * @rproc: the rproc handle
  * @vdev: the virio device
  * @vring: the vrings for this vdev
+ * @rsc: address of the resource table
  * @rsc_offset: offset of the vdev's resource entry
  * @index: vdev position versus other vdev declared in resource table
  */
@@ -580,6 +581,7 @@ struct rproc_vdev {
 	struct list_head node;
 	struct rproc *rproc;
 	struct rproc_vring vring[RVDEV_NUM_VRINGS];
+	struct fw_rsc_vdev *rsc;
 	u32 rsc_offset;
 	u32 index;
 };
-- 
2.17.1

