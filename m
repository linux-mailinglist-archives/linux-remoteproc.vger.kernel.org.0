Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD66253547
	for <lists+linux-remoteproc@lfdr.de>; Wed, 26 Aug 2020 18:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgHZQrv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Aug 2020 12:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgHZQps (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D847C0613ED
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:43 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s2so528120pjr.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vD2rRkpHQd7S7fgYM9UtluBQRAWNlF6cNXgHEuKBTDo=;
        b=u4MqR1kfjSxsFjxQ0PC6CVjxgQW0LN3TJ+f5D5WxPBbfYC7VvbcnbDe6a2bsjweMD0
         zqA0IvUIthS4sUphaqwCH0nFieEOcHnKksL0wv2C9jzLeZUP6R7/VnUoG5X0fDF/Zort
         O6tTF023b0+CKYMxv1qDpgPMNneIPHm8Js2tzpU7KU2SwgUqeSP8ZUBIryDQ/VD8kTcB
         Iah0xIR/R0yB9nB1NY/Ue3ZnarEhN+fkVgmGGKsVP7Yuw4/iSSTjTmCOLH1FpaASL3T5
         J9eD7F7tlXchyJQSE42YPgiBpdC7nM5HbjRZE5W/hKT32qW+jk36o9D9MI00tNeNGSSA
         5D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vD2rRkpHQd7S7fgYM9UtluBQRAWNlF6cNXgHEuKBTDo=;
        b=ReDpblDbrWMDjktQmOIEopKrFaHT73Aj7x7KPIe5AR06NZCjytKdd9yMEng+e8ogcI
         0UOsQ0EsXSu/4l4NF15VkXcbKWHGXGLNjrFbRQl3VqGye3zOT54RL3GloaF7Z1rYbZVg
         E7whpdM1ddYR3WVQxtxVa8QpiLmAnXrJUCyScwDh01c/5xxEZFEYL3feGJvGFuZxdlma
         MX3dEMVykdKkpHlOraiFvg91kZMi6ePzesLNlm8qLlerFryivtvddHjwIYO1Ct8sin7m
         BHzNsKqfEPjad4ROmXqZF6k6oTa0Gav33OSlUes2L0TqFaWO6ytxP+rNAbqTOznUdMuG
         4egA==
X-Gm-Message-State: AOAM531XVv4ISFjDQrkmmbwmvJxAAIwETMiEPzYDFpZk+b1dS16zS/a1
        AtMqkGc8tBVlUPfMJZk0P4WFGw==
X-Google-Smtp-Source: ABdhPJwLOPNkqm5e+DQ+X7A/oEpZmAGhLQhscSDhlh/mGOryZjdpE/jnG4AFfe2aiQaYUUcS6lZ34A==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id d2mr6797133pjw.112.1598460342752;
        Wed, 26 Aug 2020 09:45:42 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:42 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] remoteproc: Properly deal with detach request
Date:   Wed, 26 Aug 2020 10:45:27 -0600
Message-Id: <20200826164529.224476-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to detach a remote processor
that has been attached to or booted by the remoteproc core.  For
that to happen a rproc::ops::detach() operation need to be
available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_cdev.c  | 6 ++++++
 drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index d06f8d4919c7..3a3830e27050 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -42,6 +42,12 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 			return -EINVAL;
 
 		ret = rproc_shutdown(rproc);
+	} else if (!strncmp(cmd, "detach", len)) {
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
 		ret = -EINVAL;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 6134d2f083ce..013231f69837 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -118,6 +118,12 @@ static ssize_t state_store(struct device *dev,
 			return -EINVAL;
 
 		ret = rproc_shutdown(rproc);
+	} else if (sysfs_streq(buf, "detach")) {
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.25.1

