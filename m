Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21853190BD0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 12:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgCXLCB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 07:02:01 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41628 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgCXLCB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 07:02:01 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OB20jD032499;
        Tue, 24 Mar 2020 06:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585047720;
        bh=omzZI3AO+qHxjlny3hNKY9Cug1UYCjHkgUg6fddXDfM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vp0lVwxCMWOQsGrFVhYVqn2utSdmi7Ebm0g+aaWWvEcAY6Mj7TWgEaX38XkycEZxu
         Lf3DIwz5Gmpa0LEV5h9PBBsNMqec/S5ByRgVS23yEnKiMNLX4ZA/TdElbIT2Ivpy8p
         +R/7RTwNSWDZAbPpdQfHJZgE0g6UE2LetzQx+D0Y=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02OB20Pf038476
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Mar 2020 06:02:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 06:01:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 06:01:24 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OB0rAx008648;
        Tue, 24 Mar 2020 06:01:22 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <afd@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv9 13/15] remoteproc/omap: Report device exceptions and trigger recovery
Date:   Tue, 24 Mar 2020 13:00:33 +0200
Message-ID: <20200324110035.29907-14-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324110035.29907-1-t-kristo@ti.com>
References: <20200324110035.29907-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The OMAP remote processors send a special mailbox message
(RP_MBOX_CRASH) when they crash and detect an internal device
exception.

Add support to the mailbox handling function upon detection of
this special message to report this crash to the remoteproc core.
The remoteproc core can trigger a recovery using the prevailing
recovery mechanism, already in use for MMU Fault recovery.

Co-developed-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Andrew F. Davis <afd@ti.com>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v9:
  * no changes

 drivers/remoteproc/omap_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index b784f48e63d1..cee6c33869b3 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -383,8 +383,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 
 	switch (msg) {
 	case RP_MBOX_CRASH:
-		/* just log this for now. later, we'll also do recovery */
+		/*
+		 * remoteproc detected an exception, notify the rproc core.
+		 * The remoteproc core will handle the recovery.
+		 */
 		dev_err(dev, "omap rproc %s crashed\n", name);
+		rproc_report_crash(oproc->rproc, RPROC_FATAL_ERROR);
 		break;
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", name);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
