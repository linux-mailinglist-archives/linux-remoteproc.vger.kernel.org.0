Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2756FDAB9C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 17 Oct 2019 13:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502189AbfJQL75 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 17 Oct 2019 07:59:57 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:54449 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502168AbfJQL75 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Oct 2019 07:59:57 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL4Re-0004FF-2H; Thu, 17 Oct 2019 12:59:54 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iL4Rd-0003dW-6v; Thu, 17 Oct 2019 12:59:53 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: fix argument 2 of rproc_mem_entry_init
Date:   Thu, 17 Oct 2019 12:59:52 +0100
Message-Id: <20191017115952.13935-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The rproc_mem_entry_init() call takes a pointer to a vm
as the second argument. The code is currently using a
plain 0 as "NULL". Change to using NULL to fix the
following sparse warnings:

drivers/remoteproc/remoteproc_core.c:339:49: warning: Using plain integer as NULL pointer
drivers/remoteproc/remoteproc_core.c:916:46: warning: Using plain integer as NULL pointer

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/remoteproc/remoteproc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..943af836fa0f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -336,7 +336,8 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 			return -ENOMEM;
 	} else {
 		/* Register carveout in in list */
-		mem = rproc_mem_entry_init(dev, 0, 0, size, rsc->vring[i].da,
+		mem = rproc_mem_entry_init(dev, NULL, 0,
+					   size, rsc->vring[i].da,
 					   rproc_alloc_carveout,
 					   rproc_release_carveout,
 					   "vdev%dvring%d",
@@ -913,7 +914,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	}
 
 	/* Register carveout in in list */
-	carveout = rproc_mem_entry_init(dev, 0, 0, rsc->len, rsc->da,
+	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
 					rproc_alloc_carveout,
 					rproc_release_carveout, rsc->name);
 	if (!carveout) {
-- 
2.23.0

