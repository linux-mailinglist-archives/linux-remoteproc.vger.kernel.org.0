Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0BBCC5DF
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 00:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388752AbfJDW1a (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Oct 2019 18:27:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45313 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388358AbfJDW1Q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Oct 2019 18:27:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id q7so4507594pgi.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eTUNCaOOSGwA+ig+a2CKta3BFk73Lmp2ve0uszPOGFc=;
        b=br7cGTb8FH/qLzSnTzorqurt95SrUFywuFB5Jl8nSZ7AiRZhJKECx1dlOZkzMPQ2de
         TI1tjqQbCkW9EHXKfKG7xkzTJMC/7Qy6nJJL98/o+m//yicGc2lAl7axy70kmOlCuoAi
         8y0cNXf8U+jYYxIync3074I2CzZAIS81DVyhRRzRBsFn4cqEQxUnAphdR9CKenTeBiKE
         Da76fC7/0+PavmPZSpvRvz7wGQHMcf15iQfAoREnVjNpN2syvrWojYJvp8kReVwph+HW
         wpiCnrI0daqKIORVVW6qp8rF8XZy1UwRNwB8jlmE2X4H7Yt3Ek4Z0i7WEHj6VSswUeki
         7FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eTUNCaOOSGwA+ig+a2CKta3BFk73Lmp2ve0uszPOGFc=;
        b=cvXXeVKibTXY9xh20UxSvb/p/rA5hMLB1ZvmqXq4+gKeUEAQP/2arcJCjTXGCe+211
         YlIl6YnrCI9rGJVF6qW7mXzpbWDKwXPHiGGL8JoJ3JSm0KDmisiTwhanpE53BI6kUzzd
         yWzEetY9nMy/Ttm4dvhkLGZZKaWbGpz4XVYLqO8v4fExXGxDcDLxC1N7S3BjSaFgJDxU
         spkAF0XTXK475qlmCwer0JW1VfbYD4LSim3xc+8drW8zPkoMWKYX2WBjqeUjfyiMs/fO
         8JCVnJJSVC6hCHQZOhpXg39LvxN5+1w6XcS4Uc4wB4kcHXREIQpSy2q/+i/IFCk1t257
         nDQw==
X-Gm-Message-State: APjAAAVLEf5dlH+sbIAz3igo0pBhtqfUD2+skP7eU6aue70rVcog9RPR
        JXtmIloDYjMXYpA90JFvqvKfQQ==
X-Google-Smtp-Source: APXvYqztxqw61a4Nv7hxanL7+0PPCWg7dFcRWKaXzKZi+YVENH+DI3r7XNAlz+VlWXgVpUqJ9ACV5A==
X-Received: by 2002:a17:90a:3847:: with SMTP id l7mr19708014pjf.118.1570228033776;
        Fri, 04 Oct 2019 15:27:13 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x37sm6328136pgl.18.2019.10.04.15.27.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:27:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 4/6] rpmsg: glink: Fix rpmsg_register_device err handling
Date:   Fri,  4 Oct 2019 15:27:00 -0700
Message-Id: <20191004222702.8632-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191004222702.8632-1-bjorn.andersson@linaro.org>
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
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
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

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

