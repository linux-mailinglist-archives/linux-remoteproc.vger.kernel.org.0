Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE312DD32A
	for <lists+linux-remoteproc@lfdr.de>; Thu, 17 Dec 2020 15:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgLQOmQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 17 Dec 2020 09:42:16 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51818 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728108AbgLQOmP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Dec 2020 09:42:15 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BHEegCH023778;
        Thu, 17 Dec 2020 15:41:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=8m8mYEes2J8kYxF4eUx0X/Pu3OmdiHEDiupcs5rNmbA=;
 b=frFb+oP4zjA6gvh9qZhTju2io/FmFELs8a1ftJaR8QxRZ/ILTS73ZpivWgMHLv/UHOVw
 /G+SmuZQfX4vG/91UuIfDWVGTBneTJtvkHnGrkWdXRcddM9Wnv1tAdKfK/ng8x3rkrFy
 WJwVk0e6y4AHwKRlMkdwUWh+l5rRIHc6d+ePjbZsQxa6K+tRBThS8C9x4PcC/NcfI4/i
 CpwyE0xnLace+dl9mc9nlhRAqpVcMPlXpwnBwY/fOyD+hdg0trVlaCy2MQEIIRbHgqlR
 cYr9zbqzJXnXiet19jCpVUHTrDixb1Iv43ds0JgWJYZgu+55PCcG/WY3SVHCqFMbDnSz pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35cpt9m1k5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Dec 2020 15:41:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 307A310002A;
        Thu, 17 Dec 2020 15:41:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EC2122BF3D;
        Thu, 17 Dec 2020 15:41:31 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Dec 2020 15:41:30
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2] remoteproc: stm32: improve debug using dev_err_probe
Date:   Thu, 17 Dec 2020 15:41:25 +0100
Message-ID: <20201217144125.12903-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-17_09:2020-12-15,2020-12-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error.
The benefit is that DEFER issue will be logged in the devices_deferred
debugfs file.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
---
V1 to V2: As suggested by Ahmad Fatoum use dev_err_probe to deal with
          deferred cases

V1: https://www.spinics.net/lists/kernel/msg3765884.html
---

 drivers/remoteproc/stm32_rproc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a180aeae9675..ccb3c14a0023 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -370,8 +370,13 @@ static int stm32_rproc_request_mbox(struct rproc *rproc)
 
 		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
 		if (IS_ERR(ddata->mb[i].chan)) {
-			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
+			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER) {
+				dev_err_probe(dev->parent,
+					      PTR_ERR(ddata->mb[i].chan),
+					      "failed to request mailbox %s\n",
+					      name);
 				goto err_probe;
+			}
 			dev_warn(dev, "cannot get %s mbox\n", name);
 			ddata->mb[i].chan = NULL;
 		}
@@ -592,15 +597,14 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, irq, "failed to get interrupt\n");
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
 				       dev_name(dev), pdev);
-		if (err) {
-			dev_err(dev, "failed to request wdg irq\n");
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err,
+					     "failed to request wdg irq\n");
 
 		ddata->wdg_irq = irq;
 
@@ -613,10 +617,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	}
 
 	ddata->rst = devm_reset_control_get_by_index(dev, 0);
-	if (IS_ERR(ddata->rst)) {
-		dev_err(dev, "failed to get mcu reset\n");
-		return PTR_ERR(ddata->rst);
-	}
+	if (IS_ERR(ddata->rst))
+		return dev_err_probe(dev, PTR_ERR(ddata->rst),
+				     "failed to get mcu_reset\n");
 
 	/*
 	 * if platform is secured the hold boot bit must be written by
-- 
2.17.1

