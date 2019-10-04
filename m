Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975C0CC5C9
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 00:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbfJDW1L (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Oct 2019 18:27:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38560 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbfJDW1K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Oct 2019 18:27:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id w8so3770715plq.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DB10pg/WIJaO+aJTgK4OR+kGpHxX86yfhLw/UszwpCo=;
        b=F5uG1Agmj1h9uJUlUsYaVzT9Nk4sqGpyY9EGmbmREWfkyCLX2Jypf/Vry8EYBqlg6y
         +5mmeuhecQk1H+/FUJ58m8WKZSUIoDROJ8cXuO1cXJvn/DtQTX99y99UNqV/CUfGWq8C
         SLXTxvc6qPmiBMbAvEABZWldwZ1/NsRYGGkdCpPAC6bXZkrlGLpbaVIa2KJrd/ryeSUT
         XXIocsOg0tgXtlaZzEHywwXICMIe9YedFnHjO/H7IocH1cuUcRViUrK4sRCS4QF4iFGg
         WyQKekfWYrwKHwUU39tkpVTyLDxjY9zrGkI6vCGtwxbHZyG1TjIYCAIyJ/jk6sDNyRf9
         mTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DB10pg/WIJaO+aJTgK4OR+kGpHxX86yfhLw/UszwpCo=;
        b=gZPbwG/SPTFF1/z9lHXhJXGi59kcBX9xseGdad28f39erTWu5kiOQizfb6sWCexXBB
         ymH6FXxcStCXDi/GczXO3SZBa4vqEKJShCfo6Ng22yYclV13z8Abc6rcAO1b9jdwK61U
         wP5Mmt99oY2/mpUjqF78Jx0aU7S5O2eFeZnx8TnWAHMGqIMlYBSfgjuG3GbphQ82t9AU
         ieYKPifM2KNi+n/sJO80gQG79xUpNNjqm/km2BlLsi07OwfY3Fko5mW0s3Ua2JeIEA3s
         WJfnqs36rukjgP1DgZ9XLQKq/Q3EgJ2h+QIa/VQtcGMeks1rSL4L7IrOo+3zqqujUdLx
         bW5w==
X-Gm-Message-State: APjAAAUwlSyASWylMkq6rN6NIZ0s1KogV6BeGIU+yW6fuIWmHIVveeaj
        Apgv6bVXxPpT+7anksEy7NecgA==
X-Google-Smtp-Source: APXvYqzCVLSpk4OE/L2LUrTXd1xxgCf0fxLXYqqbD9oR0XvRr6RzlVdImC6SxgRlG2DIsUN1EbXjmQ==
X-Received: by 2002:a17:902:aa08:: with SMTP id be8mr3333013plb.317.1570228029737;
        Fri, 04 Oct 2019 15:27:09 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x37sm6328136pgl.18.2019.10.04.15.27.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:27:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 1/6] rpmsg: glink: Fix reuse intents memory leak issue
Date:   Fri,  4 Oct 2019 15:26:57 -0700
Message-Id: <20191004222702.8632-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191004222702.8632-1-bjorn.andersson@linaro.org>
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arun Kumar Neelakantam <aneela@codeaurora.org>

Memory allocated for re-usable intents are not freed during channel
cleanup which causes memory leak in system.

Check and free all re-usable memory to avoid memory leak.

Fixes: 933b45da5d1d ("rpmsg: glink: Add support for TX intents")
Cc: stable@vger.kernel.org
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/rpmsg/qcom_glink_native.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 621f1afd4d6b..9355ce26fd98 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -241,10 +241,19 @@ static void qcom_glink_channel_release(struct kref *ref)
 {
 	struct glink_channel *channel = container_of(ref, struct glink_channel,
 						     refcount);
+	struct glink_core_rx_intent *tmp;
 	unsigned long flags;
+	int iid;
 
 	spin_lock_irqsave(&channel->intent_lock, flags);
+	idr_for_each_entry(&channel->liids, tmp, iid) {
+		kfree(tmp->data);
+		kfree(tmp);
+	}
 	idr_destroy(&channel->liids);
+
+	idr_for_each_entry(&channel->riids, tmp, iid)
+		kfree(tmp);
 	idr_destroy(&channel->riids);
 	spin_unlock_irqrestore(&channel->intent_lock, flags);
 
-- 
2.18.0

