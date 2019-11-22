Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B37106987
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 Nov 2019 11:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfKVKFP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 22 Nov 2019 05:05:15 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:33220
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726962AbfKVKFO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Nov 2019 05:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574417113;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=HAuNMeqjWS4WkcZq7z4HS0XiwGbvDr9cTk0wIm9acyI=;
        b=IeoLNrOSBs07awo4KRHYb9IkKSCdPUVnnHVONxgKzv1PQ+2fGxiclmbOIFEKlB7y
        Ru2V0X4Rgx2+q5gwz1E0PMcA8oY3cY25ZlM1ZDaWJmf49Kkv3EllreV5Rdp6TOCNfY2
        cnqehZxC6TFrSsDkvAdTqLxzOlE/hEBn3PiST7QM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574417113;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=HAuNMeqjWS4WkcZq7z4HS0XiwGbvDr9cTk0wIm9acyI=;
        b=BVqnydYSXCNOYA0E2g/ycNe5AkMtsw7kYftoTgLaXJ3VjGzhxgxGJjIFQUkiOUve
        4kEMQLrx8VqQl9zf/06meD72+6/cmiCSLHDKzGZvfM7GbY2nMRoH5XYg2Bv6upf/Pp4
        J9Fo02zUtuI94Kgm8aa8XKijkNw3Rvrh44aQ8DIo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AEDA2C48B02
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V5 2/5] rpmsg: Guard against null endpoint ops in destroy
Date:   Fri, 22 Nov 2019 10:05:13 +0000
Message-ID: <0101016e9292a1af-f408df27-58cd-44b1-8258-a7090ec77c30-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
References: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

In RPMSG GLINK the chrdev device will allocate an ept as part of the
rpdev creation. This device will not register endpoint ops even though
it has an allocated ept. Protect against the case where the device is
being destroyed.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/rpmsg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e330ec4..d6c3275 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -81,7 +81,7 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
  */
 void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 {
-	if (ept)
+	if (ept && ept->ops)
 		ept->ops->destroy_ept(ept);
 }
 EXPORT_SYMBOL(rpmsg_destroy_ept);
-- 
1.9.1

