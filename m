Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363E9BFFD4
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 09:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfI0HLZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 03:11:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43484 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfI0HLY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 03:11:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id f21so697602plj.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 00:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=JWJl6+k678lNhoIwgPT24JSdOgdcYLv3dPpKZNuhawQ=;
        b=e8jqNvEbhvr0kgtsFK625isW2I3jDhZSNomDeSga2oSYqTtT6RV+dW3pDm6Z3HXJ+9
         VwZc7ZzddAyp7VGQZ+t1szym8TCRuLxnvAT0WHpHyEZCyeekVFH/IFh3d9QbSVCzMEGW
         LTiZ1DuLVoVKGGC7tfWmtZc3H06WK4Fq36Dnt0ef98J49H8bvgehZ3rjL8hJuVE6F6Nh
         zA7Kj0j0nGE7B4kkI0By8EjHSSIp5pz9GqxNXTd2OKQbEQNO0XjYZ2Abcu2K2Ma1Mjf5
         fPo05WdTHPdOW4PC3PX+pawyJZq6F9nXCfhckU7KfbjS+u5Dg3A1+e//XI4nKGUYJn8L
         ZbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=JWJl6+k678lNhoIwgPT24JSdOgdcYLv3dPpKZNuhawQ=;
        b=Z3tOYT+2RN0lWJb2p1jABqycU6iO5Ay6YYSg4zLe5sX6m9mqsFPj6sO93fy8MCNAdN
         9+5qtde6yyeehI1TZXjpS7IFwLkUtxAdbg1Dbf16B3Ku2idobONCM35OooHfq822kY6N
         xz5tvaqRiYH8Zfa/ITdKddXwuStPu91itTFyM9HWBnOSoUEpQBpfSGVnlAE3xaYI9L17
         mPmvnzpSGi1gEQ2gznrlVg5GhexcUsxb1PKHnkOOqM5V1lEeVaW1CsnCcfsThvtW9OG2
         31tVzE3Grjye9CWEqJsJPcMxXch5NixaDLJ9CnfuSnt3vE7CyIZ3JEn6OfX6fkb+v5Lr
         HdIQ==
X-Gm-Message-State: APjAAAXshvT9eHYQjq1TbeQcZbIa1P4+pFlYqnsHxXn5S+8VrlmTibmy
        I4POMSig3QVpu/g5RkMY7cYq6Q==
X-Google-Smtp-Source: APXvYqxdG3QqJXUbaky7WFyX4U95Cc00q0ixYEdLQ8wit0Qg1YQtygKQhRah3390SPIfZZk6fJeZ8w==
X-Received: by 2002:a17:902:9346:: with SMTP id g6mr3045391plp.0.1569568284057;
        Fri, 27 Sep 2019 00:11:24 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f74sm1733288pfa.34.2019.09.27.00.11.21
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 00:11:23 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] hwspinlock: sprd: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Fri, 27 Sep 2019 15:10:47 +0800
Message-Id: <e8f1db04571f62298c7a4f72be803b9b9974d12d.1569567749.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index e76c702..44d69db 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -135,8 +135,9 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sprd_hwlock);
 	pm_runtime_enable(&pdev->dev);
 
-	ret = hwspin_lock_register(&sprd_hwlock->bank, &pdev->dev,
-				   &sprd_hwspinlock_ops, 0, SPRD_HWLOCKS_NUM);
+	ret = devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
+					&sprd_hwspinlock_ops, 0,
+					SPRD_HWLOCKS_NUM);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
 		return ret;
@@ -147,9 +148,6 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 
 static int sprd_hwspinlock_remove(struct platform_device *pdev)
 {
-	struct sprd_hwspinlock_dev *sprd_hwlock = platform_get_drvdata(pdev);
-
-	hwspin_lock_unregister(&sprd_hwlock->bank);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
-- 
1.7.9.5

