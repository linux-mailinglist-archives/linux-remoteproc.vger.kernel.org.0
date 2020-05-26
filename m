Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937291D063B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 07:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgEMFKc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 01:10:32 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58677 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728841AbgEMFKb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 01:10:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589346631; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QvCnssNRyOaZbTIUEafb9UtFFPJxVfsGVnlMsbWACNk=; b=rLsnImkGz8GgHvRqIw3kYxv2tuHzV93G4cJ6hH4nQ4DoJqHVbZYfJ1ys59DdrX7dFPMkqV0k
 lBRGEaqGVAjDwdhEBA+ia+6a1y2KDZBvtC3us5mVg1n5T7TuNCOr/eFxY1YY/lnvNjL93OLi
 PV13BnmG926BFxMskfs3vQ180Rs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb8146.7fa0ebf05570-smtp-out-n03;
 Wed, 13 May 2020 05:10:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A31C0C433F2; Wed, 13 May 2020 05:10:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9684CC432C2;
        Wed, 13 May 2020 05:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9684CC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V5 2/5] rpmsg: Guard against null endpoint ops in destroy
Date:   Wed, 13 May 2020 10:40:03 +0530
Message-Id: <1589346606-15046-3-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
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
@@ -81,7 +81,7 @@ EXPORT_SYMBOL(rpmsg_create_ept);
  */
 void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 {
-	if (ept)
+	if (ept && ept->ops)
 		ept->ops->destroy_ept(ept);
 }
 EXPORT_SYMBOL(rpmsg_destroy_ept);
-- 
2.7.4
