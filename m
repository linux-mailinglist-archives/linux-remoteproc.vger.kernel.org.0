Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9896A25354F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 26 Aug 2020 18:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgHZQsT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Aug 2020 12:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbgHZQpn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325C7C0617A1
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w186so1316695pgb.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dL9tfSUkFyPuvtiKmoHXxOSSKMmvouLhdaI7n7GXPMo=;
        b=nXRZ7wbXj6Yjj00jDZ4A8PJU7BVP76i8CVaoyZQ9eIBNGejqdVLMw/2FcEtskj4o8s
         uAc22g/QyUXcuwZj0/8uLoFXmOhJgaoNv/PnmWKksjMGMS/AcrBWR0cuucf+iIyunae/
         C3J0Vk1p54uOJglqvINLZdlNs7a5c1wkqSZxRhaIrx4RqRbFdrDbSdEcMH4Ebxo2q+QB
         UoqjTzVU8pXwf9tetqpqeL/p/1kulqSdFdAz7o4skGUxg6Z+hY5Dr7DjUZdTTWId4JYq
         jied080lnmYvxfszbWLJJw5h5dTtiC/EUgcz9SacdOSoDeN/hiVKrBIUhgn8aFEx3qFO
         S0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dL9tfSUkFyPuvtiKmoHXxOSSKMmvouLhdaI7n7GXPMo=;
        b=WhtamPEYddR0+ihHbzfnFaaR+YIC8j6XoO/1PDt0FNdhuOg4yyRLgDpzGgeoMjNGdY
         F35j/nzGKsVsaslF+sySrOI712vGeIT0jULiWIQQJrLuFOG4LLNRnezuqkP/zR5Zussx
         eHtyjJhxzwbQYNb6EIVpobUq2VHVs9fOPZILjhsq8CfZf85QygHe9K6QDetbZxxrTg6J
         +uKhipIcw+q+0FtNOsXlRsjtmwHmOVfjnNN3jPileDM06i9x0/vVOVqghKKrpdqUpqpY
         M2OHDr6M69Or5hnIMRPe6LHjtFpZ+8YB06K/7c4LnQVPgMmv5Y1j9bZPMCk8zypK8GQY
         RmTg==
X-Gm-Message-State: AOAM532RbIlObv1DbLHJTAbNE+zxa9ujtYrRDq1vgl7Drs9LY40JJdrJ
        QMRor4MSoam5drwM1gdxSp9j5lNhzRzutg==
X-Google-Smtp-Source: ABdhPJzuZQ1lIacAimgfc2XPYOHki9uGBagGms3yAZQ+2MT+AfhexnSds4k4Pz5q9j1hYN3kf9HRzw==
X-Received: by 2002:a62:cf85:: with SMTP id b127mr13145936pfg.89.1598460339728;
        Wed, 26 Aug 2020 09:45:39 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:39 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] remoteproc: Rename function rproc_actuate()
Date:   Wed, 26 Aug 2020 10:45:24 -0600
Message-Id: <20200826164529.224476-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Align what was done for rproc_detach() by renaming function
rproc_actuate().  That way it is easier to figure out the
opposite of each functions.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f3943a1e2754..c4b80ce6f22d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1393,7 +1393,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int rproc_attach(struct rproc *rproc)
+static int __rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1518,7 +1518,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
  */
-static int rproc_actuate(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1558,7 +1558,7 @@ static int rproc_actuate(struct rproc *rproc)
 		goto clean_up_resources;
 	}
 
-	ret = rproc_attach(rproc);
+	ret = __rproc_attach(rproc);
 	if (ret)
 		goto clean_up_resources;
 
@@ -1802,7 +1802,7 @@ int rproc_boot(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
 
-		ret = rproc_actuate(rproc);
+		ret = rproc_attach(rproc);
 	} else {
 		dev_info(dev, "powering up %s\n", rproc->name);
 
@@ -1893,7 +1893,7 @@ EXPORT_SYMBOL(rproc_shutdown);
  *
  * @rproc: the remote processor
  *
- * Detach a remote processor (previously attached to with rproc_actuate()).
+ * Detach a remote processor (previously attached to with rproc_attach()).
  *
  * In case @rproc is still being used by an additional user(s), then
  * this function will just decrement the power refcount and exit,
-- 
2.25.1

