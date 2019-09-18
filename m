Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8532EB68DD
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Sep 2019 19:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732120AbfIRRTZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Sep 2019 13:19:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41252 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732112AbfIRRTY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:24 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so211390pgg.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Sep 2019 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VwSAewYHioEBjS31iqIfRjVrZyDonRdWcj1Y+TfsqH4=;
        b=rO9i/cqLekYgyKdKCnFYjAL4R/QkPCECSyUyb7g2A+JKQKpKGHGHs2JQa91AMbG/2w
         1lED6OUbgkoFnKNsS8sAuVKoGcJ/HX7iMbXflFVJP+G0Eoh2jir2EAjBir/87kMiVIbH
         TGN86ho4VviITmkJju5fHnGtLVyX20eLopp2OR9zx/XrG+lbFUgF9ho8nWFvUVmMOosg
         ztCiiJk0oz5dDSW0jP1/X7SxOt1poyhGRX1OYbu824rVveyFMp8Afqmdm2rA7sVRW6qe
         yIIF8ArmWEbZl7z3D7gYV6yBb+uq9Yj6DuuVk/BKO+JoxTbwTZEfgolB3XIWu87dAOFJ
         5AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VwSAewYHioEBjS31iqIfRjVrZyDonRdWcj1Y+TfsqH4=;
        b=t85rJvUajuhbPykqOfaAo0+XqI/rQZZmfX+9zMDGMQvQPHMklxVzRYcPITeG1SdOZP
         pNc0/YoH8ENhk2sDGkMbMdvUleV6zYjUZl6fWdwakUUXzyECMow8HjR+mNC9xbfM2ce8
         9UwOmcbU5yMM+S7EwfVl/wHpZHOwCbO2VYuGtJm4wAOtJAAMqwr2rC7l1IeeyxlOtp+0
         ONTUQoliow3h/E93iirn7O0b2x4qtj1FmQ2xXRfJ0cS0WPHXxE2fIJr2CUcsC1ChKIX4
         XfGnpUPfMOjFcDkGDFMF5DVBuAfb+Mw3zZX636Qe7VIN87hKscvviHdqi1Nq35rzkNfI
         4tMA==
X-Gm-Message-State: APjAAAUAcpWuMfOsd5VPCh+8/gzoEByVRsUjtTdbH87M/sT+itF+s6K/
        GmmFjlA0MEj8iLXBLf+T3wJghw==
X-Google-Smtp-Source: APXvYqz6KBiLBnvTbiv1tlhJ561p18GEHMN8vVjD8bUsFTROEBscCpnd0MazHXczVzILrhpz3xg50g==
X-Received: by 2002:a65:6557:: with SMTP id a23mr4976164pgw.439.1568827163712;
        Wed, 18 Sep 2019 10:19:23 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 3/6] rpmsg: glink: Put an extra reference during cleanup
Date:   Wed, 18 Sep 2019 10:19:13 -0700
Message-Id: <20190918171916.4039-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

In a remote processor crash scenario, there is no guarantee the remote
processor sent close requests before it went into a bad state. Remove
the reference that is normally handled by the close command in the
so channel resources can be released.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Lew <clew@codeaurora.org>
Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 72ed671f5dcd..21fd2ae5f7f1 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1641,6 +1641,10 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 	idr_for_each_entry(&glink->lcids, channel, cid)
 		kref_put(&channel->refcount, qcom_glink_channel_release);
 
+	/* Release any defunct local channels, waiting for close-req */
+	idr_for_each_entry(&glink->rcids, channel, cid)
+		kref_put(&channel->refcount, qcom_glink_channel_release);
+
 	idr_destroy(&glink->lcids);
 	idr_destroy(&glink->rcids);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
-- 
2.18.0

