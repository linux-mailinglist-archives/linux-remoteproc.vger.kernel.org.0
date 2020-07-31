Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B03234569
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 Jul 2020 14:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733100AbgGaMLS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jul 2020 08:11:18 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:64718 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732900AbgGaMLQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jul 2020 08:11:16 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VC85sD026417;
        Fri, 31 Jul 2020 14:11:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3bVmdSQZoibo9S9FlUXnSsJ3rzj/FWcrjccFH12J5Yo=;
 b=ojg+vD+bR8CDiIuZQZ/xJ6nm1cZkbjYCs08gaxKz5F82rtCGE+hBCrftvPUmuP2xJDmx
 iwg2cLhgFAh0v8VxxHKgU22yDqerocDUwCagqfRqPsC+0O4PUY4otSoJQJigCOL0lRBh
 FLu3BMc0b/aIQNBEo19WDgs986TyS3O8dPGFirXY/MCAI5B1BbIass7UKKUHanvQ+aGr
 zr5R4+hdiAT81ZU9lpOHVv5hd2oAfTjnly0kcIXXUCF5kVEueFmGqNytslaYVvO5/bGs
 fvyMKO+CQiEY8QDXvZGy1MOH3zBU/EpWF7wM2WU2EaNApZ9k7ZjKpNk7r5LDsJHNBLHG pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gagvnd1a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Jul 2020 14:11:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F8D110002A;
        Fri, 31 Jul 2020 14:11:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3587F2AE6DD;
        Fri, 31 Jul 2020 14:11:12 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:11:11
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@st.com>
Subject: [PATCH 11/13] rpmsg: virtio: use the driver_override in channel creation
Date:   Fri, 31 Jul 2020 14:10:41 +0200
Message-ID: <20200731121043.24199-12-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121043.24199-1-arnaud.pouliquen@st.com>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_04:2020-07-31,2020-07-31 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the override information from the channel info structure
to set the rpdev override and so link the channel to a specific
driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index eaeaefdabf18..dbf7a597ae74 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -352,6 +352,7 @@ __rpmsg_create_channel(struct virtproc_info *vrp,
 	rpdev = &vch->rpdev;
 	rpdev->src = chinfo->src;
 	rpdev->dst = chinfo->dst;
+	rpdev->driver_override = (char *)chinfo->driver_override;
 	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS))
 		rpdev->ops = &virtio_rpmsg_w_nsa_ops;
 	else
-- 
2.17.1

