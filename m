Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD02253530
	for <lists+linux-remoteproc@lfdr.de>; Wed, 26 Aug 2020 18:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgHZQp4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Aug 2020 12:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbgHZQpn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC51C0617A3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:41 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b11so1153872pld.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YL/Sg/ido3nRXf9+K+B0ZGztjS76f+wRUkN5ABypJJk=;
        b=llSh/MRQjoPCkFBUmv+ZHdNFCA9rxTof14asW/mqtl3PbCW0jhUZmFnVCB8kF1AX1x
         0h8OMb88w4G9oqHicx/VgeqPNyllOsMxcGY7YMM9g3JYCWHqpfmM0goIE/wiJsus9cNc
         58ufuaIggowlZopT9LCbePIDt1IP4A6MoXseqEKqbXv0xympsV3/pU1m9mr+U6+V7k38
         BJxlygn/eRUsMIQn0YmRbWCZ+tvYKaAcwFVqRi9rLUniTHbyCk+qSm27Lkb8ECzOW/wE
         oAMLp2VBQjDZcjrsgLQjc1K557kNeIr4cW8Sn+FAtDMYdFiAuOJhmh3TZrWdeeID46gP
         frcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YL/Sg/ido3nRXf9+K+B0ZGztjS76f+wRUkN5ABypJJk=;
        b=K9KxTuLHEXsS3EqBPZihjiUykEpRjGDWvpWfCf1j7jWu/GxOadBYeoMg0t4oile/U8
         +1bjPhgVa3cxImc6NQeyTTuPPduhv/lQNuEZDTqorY+ZaZrlTzVGBgTW93QAz/cLvUkl
         05gqcq5jKuSHYK8vlAHLogQMi1mjiKIH8GIG39cpkv2XYOk65itpZqla2HNAZ/ZPJ+DU
         aKXz6NjQOs7cRHqllxpcqpiGIJMqwY96W4Hh/iXXSYMhDuNbfGi/kK8PMBI5dXgJ35W+
         veD0Te0u2GLpPZpoUusRGUIsP1l7hwH6i8qgnbyhgDFGo4ATJyn7izb8PSA8DtWm2vJD
         +XWA==
X-Gm-Message-State: AOAM5336ia7nN7oiR70VjSHdG/yY7tYw1CjKZGKr+d722Ftjfhe62WM9
        BnhKrVZQ9yIN7/o9ZIT7GItihw==
X-Google-Smtp-Source: ABdhPJz4bgJ9Qs3HN3AeYmZDXALGjdQsejVr1bJ0QB/xxzkWFOR1280yNygLNcyehVIf7qJEfvii5A==
X-Received: by 2002:a17:90b:3688:: with SMTP id mj8mr1724768pjb.141.1598460340708;
        Wed, 26 Aug 2020 09:45:40 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:40 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] remoteproc: Add return value to function rproc_shutdown()
Date:   Wed, 26 Aug 2020 10:45:25 -0600
Message-Id: <20200826164529.224476-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a return value to function rproc_shutdown() in order to
properly deal with error conditions that may occur.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 13 +++++++++----
 include/linux/remoteproc.h           |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c4b80ce6f22d..c6c6aba66098 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1846,7 +1846,7 @@ EXPORT_SYMBOL(rproc_boot);
  *   returns, and users can still use it with a subsequent rproc_boot(), if
  *   needed.
  */
-void rproc_shutdown(struct rproc *rproc)
+int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1854,15 +1854,19 @@ void rproc_shutdown(struct rproc *rproc)
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
-		return;
+		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING)
+	if (rproc->state != RPROC_RUNNING) {
+		ret = -EPERM;
 		goto out;
+	}
 
 	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power))
+	if (!atomic_dec_and_test(&rproc->power)) {
+		ret = -EBUSY;
 		goto out;
+	}
 
 	ret = rproc_stop(rproc, false);
 	if (ret) {
@@ -1884,6 +1888,7 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
+	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 6250491ee851..40eccfbc1357 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 			     u32 da, const char *name, ...);
 
 int rproc_boot(struct rproc *rproc);
-void rproc_shutdown(struct rproc *rproc);
+int rproc_shutdown(struct rproc *rproc);
 int rproc_detach(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
-- 
2.25.1

