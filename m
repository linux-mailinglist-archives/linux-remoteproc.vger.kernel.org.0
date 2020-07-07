Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B192179DF
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgGGVAc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729135AbgGGVA0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:00:26 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC12CC08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:00:25 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 72so6662106ple.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=We64aO7YKIIjo14efasxM75BhUGKiURq6Zfe9ioCNz0=;
        b=C3Plflf4zDY0SRUHIW3sw1Di9srXzaWxPO4Tc2Y/LTr2431t/fTOEm9ks48kIuVK+C
         7Ivelw/NqewhMQMWEaQqTmBjSqNkjEN6yKQO+1PU0gsWHLZpg5N1H3QQHAr+6z9/CI/C
         hSBM52mLajXKVYqufiKodDv/WH4y7gg9BodQNQi7xiX2/YIC96kb9zRHis0cF0cHApGo
         r2EHcvQ56UKaWjrVgdyQ/2vCHWkOPI5wrCLNxFG2uHQ5DlaK8jTFUvsSnV65UfcGQ521
         /6jVBdr71eF57laK7IvYFHAQKDhU04JGrP4+ZfKgeRDyXco1ikjcFqQT+XP6zGSdQDRd
         KGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=We64aO7YKIIjo14efasxM75BhUGKiURq6Zfe9ioCNz0=;
        b=S85LsRKHwb+9wKXBmMCNbniLwQfnAnUnIaeSLZPLKH3nvwa5bF2zn/0VUCOTfrY6ne
         M6XVPoDeED9zL88olzE1pDVSY5KhCXBz53SBscIeQx5yEE4Vwx/qNVpSg4t7pbm4Qkqk
         yGkA4rv/kkPChJL3e7wqTERAk3K/p/fccrBI74XWNrMtH7H7DPZoN0zXjZ1C2lIa2RLy
         IZIiQUhXjJ6mvyd/yPeTQxVLN4to7pkpqYBrFNcfIfc6BVijermQMBjNeDyMQEGzYj76
         drrLp4k4vUn+1i48kFxIgOKiWhHp4N08AVK4jamZvP268h7KhPZiQvPbISXd1yk1WRh4
         c1Pw==
X-Gm-Message-State: AOAM532GirB7el4WLQ0ZurWVg5AlwsXhSgEpkhG0RU6Ae+vpcKG12YKw
        RqEE/0tMS1GCmgHyTei8s6wdHA==
X-Google-Smtp-Source: ABdhPJx2r2QLPIBuk24dxnit7yFc7cgFfC9vpIJBZrrTPUVl5biKWDknt+CevhUIDfxQczPGKKAobQ==
X-Received: by 2002:a17:902:7008:: with SMTP id y8mr14614952plk.85.1594155625491;
        Tue, 07 Jul 2020 14:00:25 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b21sm13738061pfb.45.2020.07.07.14.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:00:25 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] remoteproc: Refactor function rproc_free_vring()
Date:   Tue,  7 Jul 2020 15:00:13 -0600
Message-Id: <20200707210014.927691-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210014.927691-1-mathieu.poirier@linaro.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When function rproc_free_vring() clears the virtio device section
it does so on the cached resource table rather than the one
installed in the remote processor memory.  When a remote processor
has been booted by another entity there is no need to use a cached
table and as such, no need to clear the virtio device section in
it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 08de81828e4e..6b6e4ec8cf3a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -410,10 +410,22 @@ void rproc_free_vring(struct rproc_vring *rvring)
 
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
-	/* reset resource entry info */
-	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-	rsc->vring[idx].da = 0;
-	rsc->vring[idx].notifyid = -1;
+	/*
+	 * At this point rproc_stop() has been called and the installed resource
+	 * table in the remote processor memory may no longer be accessible. As
+	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
+	 * resource table (rproc->cached_table).  The cached resource table is
+	 * only available when a remote processor has been booted by the
+	 * remoteproc core, otherwise it is NULL.
+	 *
+	 * Based on the above, reset the virtio device section in the cached
+	 * resource table only if there is one to work with.
+	 */
+	if (rproc->table_ptr) {
+		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
+		rsc->vring[idx].da = 0;
+		rsc->vring[idx].notifyid = -1;
+	}
 }
 
 static int rproc_vdev_do_start(struct rproc_subdev *subdev)
-- 
2.25.1

