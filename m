Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E627E8017
	for <lists+linux-remoteproc@lfdr.de>; Tue, 29 Oct 2019 07:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbfJ2GJ0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 29 Oct 2019 02:09:26 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:25669 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730661AbfJ2GJ0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Oct 2019 02:09:26 -0400
Received: from localhost.localdomain ([93.22.151.170])
        by mwinf5d72 with ME
        id KJ9N210043gq7t103J9N2i; Tue, 29 Oct 2019 07:09:23 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Oct 2019 07:09:23 +0100
X-ME-IP: 93.22.151.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] rpmsg: char: Simplify 'rpmsg_eptdev_release()'
Date:   Tue, 29 Oct 2019 07:09:14 +0100
Message-Id: <20191029060915.3650-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use 'skb_queue_purge()' instead of re-implementing it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rpmsg/rpmsg_char.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 507bfe163883..0c3a340db7d1 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -146,7 +146,6 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
 	struct device *dev = &eptdev->dev;
-	struct sk_buff *skb;
 
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
@@ -157,10 +156,7 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	mutex_unlock(&eptdev->ept_lock);
 
 	/* Discard all SKBs */
-	while (!skb_queue_empty(&eptdev->queue)) {
-		skb = skb_dequeue(&eptdev->queue);
-		kfree_skb(skb);
-	}
+	skb_queue_purge(&eptdev->queue);
 
 	put_device(dev);
 
-- 
2.20.1

