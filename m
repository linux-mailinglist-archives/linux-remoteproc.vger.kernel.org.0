Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FBE30EEE1
	for <lists+linux-remoteproc@lfdr.de>; Thu,  4 Feb 2021 09:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhBDIrS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 4 Feb 2021 03:47:18 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:50579 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235143AbhBDIrR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Feb 2021 03:47:17 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148fv1Y005348;
        Thu, 4 Feb 2021 09:46:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9otI8hBeC46Slwkg9Iec+E1E6ulCMz/xpbQrJjFhILA=;
 b=ZyJka2/WCfy9WL4LOxuaeiHlRjoJqhS8+0lLN6CTZo39YKu8jxAZTrrPRO4rjcKmQNBt
 HvjAkZ5Sfz+3eA+PIJjeE2iNTw3EtyG8t/LRQIdbDbL9Gp6qyDG8vuO0TO5YstQN9dUm
 yohaiSkl9SeKSBzpjlVPoiwnUVHGk0s2pRH3Kx73imfOgQ3Ic75zNsmyNs1XcxpOWhBU
 fOLhfdL+n6Etjm2kCROSE43NLDof06Eu5NkUVAWjM4hliJdWYdiQaUOi1//awXBAotBT
 gh+aIAyu0NEnX6wy86DzCFs6fKux512ndtTm2PUi/aCpLR8v4cj2xUQusIPHmqowUM7i /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0fs5xu3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:46:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFF7910002A;
        Thu,  4 Feb 2021 09:46:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E9C722AE4F;
        Thu,  4 Feb 2021 09:46:29 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:29
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 10/15] rpmsg: char: use sendto to specify the message destination address
Date:   Thu, 4 Feb 2021 09:45:29 +0100
Message-ID: <20210204084534.10516-11-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When the endpoint device is created by the application a destination
address as been specified in the rpmsg_channel_info structure.
Send the message to this address instead of the default one.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 83c10b39b139..09ae1304837c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -225,9 +225,9 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 	}
 
 	if (filp->f_flags & O_NONBLOCK)
-		ret = rpmsg_trysend(eptdev->ept, kbuf, len);
+		ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 	else
-		ret = rpmsg_send(eptdev->ept, kbuf, len);
+		ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 
 unlock_eptdev:
 	mutex_unlock(&eptdev->ept_lock);
-- 
2.17.1

