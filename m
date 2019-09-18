Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5138B68F4
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Sep 2019 19:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732088AbfIRRTW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Sep 2019 13:19:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45312 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731703AbfIRRTW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so388042pfb.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Sep 2019 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KEWAXnlLjNC2nv8CVNynnjfMbw9zNY+Gb9tPaivirx0=;
        b=DrV6yqHPlQC+6968RW8zY7OfYQOEud2XhRgMxa0V/FestL0ujwS6mS1ef4P3er4CFx
         YhWMA+vNLvjFQ9iRqdji403DJ31sUwHdAgCrOSEwodwZ4HEtgNUhTGAS9pYSYV8TsKK0
         jX0niNN4fqvKG5a5c7wA5iv3Rq7IZrPBSkH7hHwIDgTMEZwsx73F0rBhsKqD2l9BGt4u
         FkEKnZs3m6FFnr/MH8qGU1wYzvI7h3XeonN6pg0R7tlNWSm6AndB+HnUKy2bw6F9aVcH
         qUKstThFhTPriRymtDqCK5s7H8ajExcPNAf7kUcTRQEW/LOdA7Q/T0i7oD3tOd1TPXC1
         wDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KEWAXnlLjNC2nv8CVNynnjfMbw9zNY+Gb9tPaivirx0=;
        b=lcTJgVJk3Qdgn25m95ZOqRYcukEf9dNZPNAHHtUn69qoggmggr3E5fcor2QhTnH52s
         WM5OixZi2vwmN0lMR2VpAf5+3Pvuo96l89G4R+f3jAJLEbJJMDdu/xEuKijmV0PAvWfF
         JKPJWdkcSGQ6ABJWOfEGr8AHFAkuSCe/9Ew6dsv/YlC8+yiPZzq2IWnavNmvOItvJpk+
         EGoU4pPndDmyM9frE3Ogs/FT/8Cz68XutndTov7ShUR/KXTlUivMyS0gumpfF3mfwbDM
         XK1SRvsxVm4Yqj3MKOrbdZxjkzm1orfT+x5Dej+HggPTLHixWl+bhjdGDPwynVqCZC3L
         7/gQ==
X-Gm-Message-State: APjAAAVV4SvwyJ3SqzT2akKTK4HrVn2fyDCLXXU0JLugnX7Y36om/MtC
        KE0SHFgzxKgcHk+TmHnt5eCGcw==
X-Google-Smtp-Source: APXvYqxp62gr99DDSE2MOj4Y2Ok56M4hOgsVDIdyiHw6ue4GqTbJWWYQL6fzuTiARGdgTA9+Pndcjg==
X-Received: by 2002:a62:2b4d:: with SMTP id r74mr5507565pfr.30.1568827161136;
        Wed, 18 Sep 2019 10:19:21 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/6] rpmsg: glink: Fix reuse intents memory leak issue
Date:   Wed, 18 Sep 2019 10:19:11 -0700
Message-Id: <20190918171916.4039-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
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
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
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

