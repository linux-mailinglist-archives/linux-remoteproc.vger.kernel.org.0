Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54091253542
	for <lists+linux-remoteproc@lfdr.de>; Wed, 26 Aug 2020 18:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgHZQrk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Aug 2020 12:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgHZQpt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42451C061795
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id nv17so1144838pjb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxBIu0NnSAiLhfjGgDwxzLw/4/EIRT2u79pWVsdwMLg=;
        b=k+qNTns/opkjJEZ2Dfhp3nSo+/gW/l2mqzUB7ZbUnn1SNzUJkPTwH85YhOHspy5Vzm
         8C9wf8/Fd1RmmE1VOJ6mzWgbzVHJJxiF/O6nCczbJWfkB8iAkjc0ABmO2n4fWC38V+3s
         BzxF3qvJtruDwI6eBJMgLFBei+5H23OQsItgXm5BhM/wP5PU0e13zhErdowD2rtvN01U
         YwtSnXT8idDk1mrJl/WS+YHu/eq/oYezZMR5Tr8PCDtJTA0j5Mh/rG5Cr9FSUtztzxyj
         yZRvbD2PyEjw7yGVLtIh4QWTABpdtvrsR7SWP2Xl3oJZbgV+uWPqgTS+BUXIz8hrN2S+
         imdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxBIu0NnSAiLhfjGgDwxzLw/4/EIRT2u79pWVsdwMLg=;
        b=b8ka65x8HuKqKSzRk0r2aar9dC5MPoseLaTBpek1bZD7wUd6EUlzfOONhh2W355rC4
         prtpGJsZ2ixV+sezoM2cV75ambVJLQ6Ub4tZoSFEIZCj1QhUuOV3bQCTrn9RTDoMb/9w
         ocrDQ7JJnekpEY8nwiGHS464IkD5QT821q2mP08k3Qb7QzdaJyvNYeP6WB0s24XW0vZY
         ED0QCb6qmq+Xd+rcroWsqPuFxCJkav+Fwn6Y/odBKufu73nm6iDO/Yn5fyZH9CcZU/lx
         M2+WGQXVtzobXHYIVdhcDeyGSXvcfwM9wKHfPKKvjVL6HmtraxrcL+jtRuqNJdFiALAm
         FOXA==
X-Gm-Message-State: AOAM532QH83UeFQ/hr+5zj9aiwvBqAhQadeQXmhxysM7paMSUKeklcY3
        oixpeogf7ChQfuATU8MzUpinMO3gOo95CA==
X-Google-Smtp-Source: ABdhPJw1FGuVfhmWkCr4RLXbFoDk8hnd4hktva/TxRidLNKsDXaL4s5yS4kF0snQuBUj1uaNtUJeMA==
X-Received: by 2002:a17:902:7603:: with SMTP id k3mr12394135pll.113.1598460343792;
        Wed, 26 Aug 2020 09:45:43 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:43 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] remoteproc: Refactor rproc delete and cdev release path
Date:   Wed, 26 Aug 2020 10:45:28 -0600
Message-Id: <20200826164529.224476-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_del() and rproc_cdev_release() to take
into account scenarios where the remote processor has been
attached to.  If the remote processor has been started by the
remoteproc core then switch it off, and if it was attached to
detach from it. This heuristic is simple and can be enhanced
easily if there is a need to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_cdev.c | 7 ++++++-
 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 3a3830e27050..18cffbe588c1 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -87,8 +87,13 @@ static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+	if (!rproc->cdev_put_on_release)
+		return 0;
+
+	if (rproc->state == RPROC_RUNNING)
 		rproc_shutdown(rproc);
+	else if (rproc->state == RPROC_ATTACHED)
+		rproc_detach(rproc);
 
 	return 0;
 }
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 95bb40b4ebb3..5586582f54c5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2346,7 +2346,10 @@ int rproc_del(struct rproc *rproc)
 		return -EINVAL;
 
 	/* TODO: make sure this works with rproc->power > 1 */
-	rproc_shutdown(rproc);
+	if (rproc->state == RPROC_RUNNING)
+		rproc_shutdown(rproc);
+	else if (rproc->state == RPROC_ATTACHED)
+		rproc_detach(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
-- 
2.25.1

