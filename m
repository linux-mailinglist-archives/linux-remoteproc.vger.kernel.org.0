Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 941F1CC5DD
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 00:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388673AbfJDW1a (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Oct 2019 18:27:30 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37048 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388462AbfJDW1R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Oct 2019 18:27:17 -0400
Received: by mail-pl1-f193.google.com with SMTP id u20so3766118plq.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 15:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GFLy/0NyLkAXTIQiU1ce2NkpxRNc39jMeEi2th9+Q/o=;
        b=eMDlZ5C4geR0qxdtOA7FQXHpGKcU764pJI+ckB/wRPRbnEdzquTg+GeL1UgEUsmnk0
         jeSsXMD1cn1W6BUxFWgqVS9IbdqQe/yRGbtgFA5kPzZh/c09SFslyvmFKvlSFAtnJUJK
         yQ/O1ntAwl4AxLX/8GBUDX3qSznBkuf9hy9852LB2Bt34HdrHe1RPEMpTbLBJztA2Rwq
         Bhkg8N5Ma4UtUDVaOJhBdTy/ZL+CSAMS0Vc4pJggWaKhY/7ZFA229MdQnDpH/vwvWnxs
         5BIrmixZiqVBMO3Hcu29/Akw1P2MiGQvNo08ChJ61GndxQw8ivpAbbaUl7S5kVAuMM2a
         gU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GFLy/0NyLkAXTIQiU1ce2NkpxRNc39jMeEi2th9+Q/o=;
        b=XeDUnxBplELt3SukTJaLw77wfm1qYFBPiaJhKEbJQKNTobcC7pJw1onvSDOchIqhbI
         FU2vKwIizXkrvSjnOxu4lUkxUZTQFc1yiOUdg17tMc5ncl4k9LTnNGMmCG8zQ/z7t2gk
         g55Dxe3rvonXp4E2CP85lmmyiCQ0jMxxIiFFdzydAVNzuvPJGKHdCmK+5N2SxcfZPS+s
         4/5K5dLluKSIZil+qJh4f2ZVryH58iS4NXDy+4kXpidyIVRkUqRyOLWc+IapllZLOGnf
         QIbMnKL3q9PtHPDNkfmbZC2hi868YaF7/gQbRZXc2k/oHOC+KW6vTjihzwLxO3Dh4WkT
         b65w==
X-Gm-Message-State: APjAAAXqgut5+ze5Z/CYc7KPkvHeUlYrlxHnjs5iFYNRQUJL36qpINhO
        upVB+QpzhU6aiRrcojnVKY+NCA==
X-Google-Smtp-Source: APXvYqw1y1k1dQjfISY8Rlcv8/TXflrZEIvSua9hRpUEkHIzv5roMO4L0pRE+8eTT3CbNrOsb8lBCA==
X-Received: by 2002:a17:902:d916:: with SMTP id c22mr17525848plz.101.1570228036266;
        Fri, 04 Oct 2019 15:27:16 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x37sm6328136pgl.18.2019.10.04.15.27.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:27:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 6/6] rpmsg: glink: Free pending deferred work on remove
Date:   Fri,  4 Oct 2019 15:27:02 -0700
Message-Id: <20191004222702.8632-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191004222702.8632-1-bjorn.andersson@linaro.org>
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

By just cancelling the deferred rx worker during GLINK instance teardown
any pending deferred commands are leaked, so free them.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/rpmsg/qcom_glink_native.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 4117818db6a1..862f89c128a0 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1562,6 +1562,18 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static void qcom_glink_cancel_rx_work(struct qcom_glink *glink)
+{
+	struct glink_defer_cmd *dcmd;
+	struct glink_defer_cmd *tmp;
+
+	/* cancel any pending deferred rx_work */
+	cancel_work_sync(&glink->rx_work);
+
+	list_for_each_entry_safe(dcmd, tmp, &glink->rx_queue, node)
+		kfree(dcmd);
+}
+
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
@@ -1640,7 +1652,7 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 	unsigned long flags;
 
 	disable_irq(glink->irq);
-	cancel_work_sync(&glink->rx_work);
+	qcom_glink_cancel_rx_work(glink);
 
 	ret = device_for_each_child(glink->dev, NULL, qcom_glink_remove_device);
 	if (ret)
-- 
2.18.0

