Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7589D5BEC
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Oct 2019 09:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbfJNHIc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Oct 2019 03:08:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42255 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730275AbfJNHIa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Oct 2019 03:08:30 -0400
Received: by mail-pg1-f195.google.com with SMTP id f14so4424718pgi.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2019 00:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=QVF1cJTCILzDHlkGsXg4UxA1J9tfvByKemIbWK8sDEY=;
        b=oqpNrl0mbjGUAPBsMnHKssFCENhw6p9XyyTe1THcu7aRYEX6fDTxHdYq3L+6KzbVZM
         /l0l00OgT0xQasYWB0AHs1LyF2Oc62e8+Ubv0kgPiVn6Ty76LDL/DB35TG574+9bwgjX
         fOPQpweoxiY0NM05qhIdLrQwKqhjsXqy2cfKNuSB31PP/ocBFno3b6eyv4XvIRidk5Cr
         i/qgTlGz88oN1obZAV28TQLJnineJ5nmAyu6ZHITA8d6lnvc4zfhsnefK3ST+AVlzcKz
         eOR+a03El82sa0Ts7kEdaOU0oTP74f4DOoQAhgMsk0IEcW+RppsOZPIwE+PLrJOwCyv8
         Qchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=QVF1cJTCILzDHlkGsXg4UxA1J9tfvByKemIbWK8sDEY=;
        b=MRc6zGsGErO6eGxOkcFNN25N8XZEQP2TvUQTSWuy45P88fVKLbzpB2LXrmjFYoXFKd
         gneRqMqBuyFKGIPT/cnhVIxVS5a4kWTjIInVyvrU85hN8iwDP4w8cMmUlM0HirT0d0dc
         042t7/P3J1UWw8sjtxBAOgzpeEYMNlPX7qgTKM6X3vSjEuHxlSPTJJVIpBhlzFJIzjXY
         OjE1ocCgN9M7OJA0lD8KXf+j5/COCGUgbcVxflCOxHItcpQD25RWCTkd/wIuz1XIfrZn
         gnj5Z5hd7+MZ7JTATNFI0RLzMv/ds1m/xTlonjejyrqql4x6wIVEWCYv/tBBQYRbZXsd
         CC1g==
X-Gm-Message-State: APjAAAWVpw3/Xir8zGsh8AATfeKAB4jRCRfNVu6nQFOWNfdhMsWrn2/8
        b1BQgi7+03oaMDoSxaWHmyteUw==
X-Google-Smtp-Source: APXvYqxcuOTybNC+LB4pwT8Vl/JKVRoXEjg7hdTh0uwB1jVIOIm1Ty8Cmrl2mLTyWsYXiMu/HdTXkQ==
X-Received: by 2002:a17:90a:ab0e:: with SMTP id m14mr33282231pjq.78.1571036909732;
        Mon, 14 Oct 2019 00:08:29 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id p190sm20619948pfb.160.2019.10.14.00.08.26
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 14 Oct 2019 00:08:29 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linus.walleij@linaro.org, orsonzhai@gmail.com,
        zhang.lyra@gmail.com, baolin.wang@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] hwspinlock: u8500_hsem: Remove redundant PM runtime implementation
Date:   Mon, 14 Oct 2019 15:07:46 +0800
Message-Id: <45600b3601cbfe3685f4c9e088be9a30ae3eb8f2.1571036463.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Since the hwspinlock core has changed the PM runtime to be optional, thus
remove the redundant PM runtime implementation in the u8500 HWSEM driver.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index b31141a..67845c0 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/hwspinlock.h>
@@ -89,7 +88,7 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
 	void __iomem *io_base;
-	int i, ret, num_locks = U8500_MAX_SEMAPHORE;
+	int i, num_locks = U8500_MAX_SEMAPHORE;
 	ulong val;
 
 	if (!pdata)
@@ -116,17 +115,9 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
 		hwlock->priv = io_base + HSEM_REGISTER_OFFSET + sizeof(u32) * i;
 
-	/* no pm needed for HSem but required to comply with hwspilock core */
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_hwspin_lock_register(&pdev->dev, bank, &u8500_hwspinlock_ops,
-					pdata->base_id, num_locks);
-	if (ret) {
-		pm_runtime_disable(&pdev->dev);
-		return ret;
-	}
-
-	return 0;
+	return devm_hwspin_lock_register(&pdev->dev, bank,
+					 &u8500_hwspinlock_ops,
+					 pdata->base_id, num_locks);
 }
 
 static int u8500_hsem_remove(struct platform_device *pdev)
@@ -137,8 +128,6 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 	/* clear all interrupts */
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
-- 
1.7.9.5

