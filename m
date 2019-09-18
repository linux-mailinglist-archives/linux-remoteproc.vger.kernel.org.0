Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA8FB68F1
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Sep 2019 19:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732113AbfIRRTp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Sep 2019 13:19:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42162 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732122AbfIRRTZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id z12so208748pgp.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Sep 2019 10:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0Uy6bHHevUENAulkqSQtPk+BZ1l0ipc3uMDtQFYz2nQ=;
        b=fUltYfIHMIOjnGd1FS6BZiNa/6sr2uKEIzz7Km04e6IE93VkMueUYltt3JEHNNMed1
         GQRuxifsOhM9iy6QFfjHwj5jaUiX3QsJHwCb9hKSyT0mAeqdcDs9/ajmOcMrgjTnntfh
         MuRVkkBgPraBP+jhxCtecPZoou+N86UCV+33hwtlyvZfuoOtA0EbncL9o39XLbqVd6I9
         3Kg49BtFHgGwGEp4UMyN1ypdjImD87vMg/gWcEbN4c7Q86aX4C3vTbB5HbKi9hjaqPtq
         2h1Yj5ChS0HnM9jwMmeHYwddXhW14mb+g0jXmXjUb2lJQQov7Qcyp0X7vLD0dfDJ7xdN
         fnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0Uy6bHHevUENAulkqSQtPk+BZ1l0ipc3uMDtQFYz2nQ=;
        b=HmoIdXvSumJ+rEo67llnWtnysF5hjSsqkNGg+sjatWKwaBUDqhUgQR3tDOFJ8eW60q
         Ukm6EX51IP593K1tGhcS2DH8kke3Wc2xBdf2DUjApZRn03LQF3kU0jrYCX9+hhF6AkgG
         QCSerFcodzHDXPmL60n/iZcYMnoaRDiT20kj96Bt+vtFMKVnW4p0JxsUPZf1Nq5+VodV
         Y4uNkKBm2d0L98Y/DpSzmWPsPeZRThAiKttvzy/R/fFlGN8jEPhron1paNFir1d5Wl4A
         JP2Hel6K7KFV+kD/3/BYJeNQtT6uGgcDJJY4XXs+ILjux7cdsgHLutRXLSaNeXMfnLe+
         rjJQ==
X-Gm-Message-State: APjAAAUm8dJVR42fX/b24jTmn3lTUU+Cv/yNI5rpGr6UzU3ktdqAHntA
        Lgn3aysM9OlXu0m2YPfmxeN/vgje91s=
X-Google-Smtp-Source: APXvYqzUBAdLgS6iTt8bHDfY8QFjRB3LWD0ZA7+0XCI2Z/UvIRKaIlHhFvg+rPfjmsmeW771XqxKXg==
X-Received: by 2002:a62:db84:: with SMTP id f126mr5532642pfg.25.1568827165043;
        Wed, 18 Sep 2019 10:19:25 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 4/6] rpmsg: glink: Fix rpmsg_register_device err handling
Date:   Wed, 18 Sep 2019 10:19:14 -0700
Message-Id: <20190918171916.4039-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

The device release function is set before registering with rpmsg. If
rpmsg registration fails, the framework will call device_put(), which
invokes the release function. The channel create logic does not need to
free rpdev if rpmsg_register_device() fails and release is called.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 21fd2ae5f7f1..89e02baea2d0 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1423,15 +1423,13 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 
 		ret = rpmsg_register_device(rpdev);
 		if (ret)
-			goto free_rpdev;
+			goto rcid_remove;
 
 		channel->rpdev = rpdev;
 	}
 
 	return 0;
 
-free_rpdev:
-	kfree(rpdev);
 rcid_remove:
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_remove(&glink->rcids, channel->rcid);
-- 
2.18.0

