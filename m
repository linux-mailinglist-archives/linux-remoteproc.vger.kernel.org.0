Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 555AB13399B
	for <lists+linux-remoteproc@lfdr.de>; Wed,  8 Jan 2020 04:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgAHDYR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jan 2020 22:24:17 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33204 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgAHDYO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jan 2020 22:24:14 -0500
Received: by mail-pj1-f65.google.com with SMTP id u63so5839670pjb.0;
        Tue, 07 Jan 2020 19:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=lK0hzpi7lOKx/+vwwnIUmfL08coFZ79d+GQbKJpzbuw=;
        b=kCaReHFA/2m4OEHT4jLNp5pVtd/t9O5G9JwqiJ9+UasprWNPIFZUCmMOvsTtwblCZy
         BLFANaRq6BoJXO5M9gMEMwZE9QeERUxmzCV4qePVIyDEpeI6rq/wKc1JndkKLkHdQyz7
         hEWRhfORw2kWqCwEPOoxoE87VSxmB9c1PBOmwOjKTUlXcaTZErdZEKImufCRM1rMYjw1
         242c6PO2wGpRhUz4RFm+B5mp6KEjdzG/3LVq49PTdSSISIczQ99tN122UCiW8EhJux8D
         FVsDzdwYQE3IIgBXx+Qaul/MeyXhAOjtKWroaViiEZ3emMHIlnf8YZDLqhNjK25uPJp7
         M+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=lK0hzpi7lOKx/+vwwnIUmfL08coFZ79d+GQbKJpzbuw=;
        b=ZFnMAiVFZfxyPtvBe6T22q6NrvqGCy45y6H29eN20/2a2wQNVQbp9kpwynlbt/kjbc
         TN3r2gMaEYwBC4064F3gwqCK7HnQDLAiSrRYwB+WtBukWor7R/J1OiArcu7hVgDn9eo9
         7k9GPhWIUXorB02cxTIEo0g5Q9byly+/mtVmMAJhhwsR7qtEs4DP5waYqct/mxq0LeU5
         TeGjsp+W9kyaUtlBJrqLtoylFEiHHb0xNBcsTYdODQxxzHTTRCtcxjRcMDek8JzMiqj1
         DMYKyr5q+krf7xb/YQSiL5GuomOa8TAudjQGK71K9SjY2HV4ej5ZO8wxSTKnT2PJnvKP
         TElQ==
X-Gm-Message-State: APjAAAW7DYXJ9mvay4TJHoADDFbgB7qwy61oVwJ3qKrF24rq0dCmnkcf
        Fs/6aQ8BLVouGPHCUzBooLE=
X-Google-Smtp-Source: APXvYqyf1gLmB4hhnarUAfaBLruqzaaorl1nD7HJculUE1wIQqdTMKqw2LGQwDmGsTse2kht9lXJvQ==
X-Received: by 2002:a17:90a:8a12:: with SMTP id w18mr2028423pjn.68.1578453854183;
        Tue, 07 Jan 2020 19:24:14 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id g7sm1077875pfq.33.2020.01.07.19.24.10
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:24:13 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, baohua@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, baolin.wang7@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/3] hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Wed,  8 Jan 2020 11:23:46 +0800
Message-Id: <8f94e67b5f9af20a93418a2fc9cc71b194f1285c.1578453662.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1578453662.git.baolin.wang7@gmail.com>
References: <cover.1578453662.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453662.git.baolin.wang7@gmail.com>
References: <cover.1578453662.git.baolin.wang7@gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/sirf_hwspinlock.c |   21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/hwspinlock/sirf_hwspinlock.c b/drivers/hwspinlock/sirf_hwspinlock.c
index d62462e..823d3c4 100644
--- a/drivers/hwspinlock/sirf_hwspinlock.c
+++ b/drivers/hwspinlock/sirf_hwspinlock.c
@@ -79,23 +79,9 @@ static int sirf_hwspinlock_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, hwspin);
 
-	return hwspin_lock_register(&hwspin->bank, &pdev->dev,
-				    &sirf_hwspinlock_ops, 0,
-				    HW_SPINLOCK_NUMBER);
-}
-
-static int sirf_hwspinlock_remove(struct platform_device *pdev)
-{
-	struct sirf_hwspinlock *hwspin = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = hwspin_lock_unregister(&hwspin->bank);
-	if (ret) {
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_hwspin_lock_register(&pdev->dev, &hwspin->bank,
+					 &sirf_hwspinlock_ops, 0,
+					 HW_SPINLOCK_NUMBER);
 }
 
 static const struct of_device_id sirf_hwpinlock_ids[] = {
@@ -106,7 +92,6 @@ static int sirf_hwspinlock_remove(struct platform_device *pdev)
 
 static struct platform_driver sirf_hwspinlock_driver = {
 	.probe = sirf_hwspinlock_probe,
-	.remove = sirf_hwspinlock_remove,
 	.driver = {
 		.name = "atlas7_hwspinlock",
 		.of_match_table = of_match_ptr(sirf_hwpinlock_ids),
-- 
1.7.9.5

