Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3EC4B771E
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Sep 2019 12:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389161AbfISKF7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 19 Sep 2019 06:05:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52252 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389096AbfISKF7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Sep 2019 06:05:59 -0400
Received: by mail-wm1-f66.google.com with SMTP id x2so3725010wmj.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2019 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qCMMPkPMs7VBfcvx3JaPL0V56C94XiExPoi5TYfUdo=;
        b=YJ3anWqkz3yfMdDXZlWvfwd2aRSX1GEWmuiEvzP4HnRI/QUu14biCE0o0kKjREXsCf
         KuW4986tQaHaCZuqMpurrkj8rK6Txizw1DhqQIJ4AWTDSZ9yeaLNKdWapvPAu+a1e0Wy
         0NKhkRAFN1BL+Fro8CrV82lsXppSNdtTsQJBE1IVuxoJfBHtHV0Ve6IKj8vqag92lSBl
         6fHu8EODi8AyrZZvYOiJJa6KyqEiyjkvyJH8Hg6zgKhSxat7GGzDkPtc1y9q0pGjD6ZO
         JZI34ycmL8mzIKssv01a5fULUS5KbRJnJUBPhdgzDG+SPSdDnQJYtuJplCrc7J5SExLd
         xijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qCMMPkPMs7VBfcvx3JaPL0V56C94XiExPoi5TYfUdo=;
        b=GI1VIzauEzSk4F/R68z9HaqrMNOHUjAJX5oaOOBWTycE6ltM5VTgUiT28DEU2vyfIy
         Og5lr1qe55cNmf1nikM3QsPsEWnZ0c8CdvjJgckAywYHQoIFMmbhbC79QjzQ/7lBsQk+
         +Qu2Yxl+a0SGHhrDQQ2LTqMWwpPH0b7iLeYVfoC1OjDbWimDbIMx5s05gUcO0vJeGVcI
         cyE5gEXSemSFEJu3iIT4Ijlt4OT9Ytn4fVRJ1DwODXjaEIXhwrSeiIkY2K9jFO9q5XDj
         h32GaX8akx0QcZO/wAESMO3qVTR8uBZDsnt7abT+8T8vwxNq6Vrw9ENPDOOP4hHQVUtS
         wFWA==
X-Gm-Message-State: APjAAAWrYWov+Dqmx2XLWhBkfn3ilugRqbEiN+0KdliOBpdDzSbSN0Di
        0o2R7+a6hsH0Jr0uTU54bYRTsg==
X-Google-Smtp-Source: APXvYqxgniKjpSqUKCq3LuuJ49giEyIk2zZbAqW994p+uQN2HoctohFog3xIGNP6T7hvGty7R9NUXQ==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr2081077wmk.21.1568887556601;
        Thu, 19 Sep 2019 03:05:56 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id s10sm8590175wmf.48.2019.09.19.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 03:05:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] rpmsg: glink: Fix channel memory leak
Date:   Thu, 19 Sep 2019 11:05:40 +0100
Message-Id: <20190919100540.28159-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If we stop and start the dsp while channel is open then there is a leak
in the driver as the refcount is not accounted for the open.

This patch checks if the channel is open while running cleanup code
and does an extra kref_put to account for open which would ensure
that channel does not leak.

Originally detected by kmemleak:
  backtrace:
    [<ffffff80088b74d8>] kmemleak_alloc+0x50/0x84
    [<ffffff80081ddbc8>] kmem_cache_alloc_trace+0xd4/0x178
    [<ffffff80086b8bd0>] qcom_glink_alloc_channel+0x34/0x148
    [<ffffff80086b8038>] qcom_glink_work+0x3b0/0x664
    [<ffffff80080c3da8>] process_one_work+0x160/0x2f8
    [<ffffff80080c4198>] worker_thread+0x1e8/0x2d4
    [<ffffff80080c8b24>] kthread+0x128/0x138
    [<ffffff80080845b4>] ret_from_fork+0x10/0x18
    [<ffffffffffffffff>] 0xffffffffffffffff
unreferenced object 0xffffffc02cf5ed80 (size 128):

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index dc7d3d098fd3..38a10dcc2029 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1660,8 +1660,13 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	/* Release any defunct local channels, waiting for close-ack */
-	idr_for_each_entry(&glink->lcids, channel, cid)
+	idr_for_each_entry(&glink->lcids, channel, cid) {
+		if (channel->rcid)
+			kref_put(&channel->refcount,
+				 qcom_glink_channel_release);
+
 		kref_put(&channel->refcount, qcom_glink_channel_release);
+	}
 
 	/* Release any defunct local channels, waiting for close-req */
 	idr_for_each_entry(&glink->rcids, channel, cid)
-- 
2.21.0

