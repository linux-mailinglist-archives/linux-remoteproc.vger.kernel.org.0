Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2AF21FDD5
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 21:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbgGNTu7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 15:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbgGNTuq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 15:50:46 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2129C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:46 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x9so7463351plr.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nMyi9G4SQ4whd75yWsK3XcIzJ3knuveu4wwY4ps0adQ=;
        b=bAhGruAwC8ofZckxr4Bc1z5NeDH/ZzOKiajCa4lg05QaBfUnVHPEWgYjSAsi7SqZhe
         CfujtZ4ErzL0fTYr5XlxD5jBxue3Gyim6FsVweK1WRNyCD9HzsA6MqMSeIuZSsMYUZiz
         xIUjqwBFLJjU00b4adosiyv3tC+2U8Imas6UCS924n4EC+9+MiOjolS//PBslNmxRGyP
         6TeKhORVNYhSx4DdWRoZFHlb/1KpNxq6A44epNhsPHbUcaf9DebdIsaR2GuGBQCYGu42
         99iHsvjghfqKBemizQkzN43tetUKz/DcVsaRuDlJoIb7uUsVC+5/hQ9gwTWzRjMDrnqZ
         Qe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nMyi9G4SQ4whd75yWsK3XcIzJ3knuveu4wwY4ps0adQ=;
        b=Q+Ys/s99ndFnwGmO+hWqAomB6P0hZae9ANOw9093BgZnWUfgxhCMVyN3KhymTZp3IT
         lV6mJOyqAUe4BfTp7Qg6pvkXI9qShfXZY68TNxUlo0wfYe+XjIFL0LHyllsheN9j42MQ
         tgwY8RLnzCinsC8vrGhCecD53bVAeMo9pbIzsVX0daAIMyVQvLevlnRX+2rgQ/Rp2zel
         7gePrEqGOrVYnF5ct9HE2WKbF82GROiapcYwFsI4O4tnRlJcIZ6VC9BxWKnfFCHhJyNW
         xcJ2pphClnha0MQlnGOJV6bONHOcCDGRzZ9CxroxmnovHSX7xmEQ1GaPaVga3gLeY3yZ
         eC0g==
X-Gm-Message-State: AOAM533/SM3F1TJHXIIXTIaX7iDiaMw9HnfrEyYwMs20MyS7nYkYkrS2
        zonqFkrYZ1dhsqauk2Z6kTpoKw==
X-Google-Smtp-Source: ABdhPJz2/oKVIa7YB+mIuN2swG7Ca/VMKtO0ZCgPjLyOHESdHDISHwd3fbG5yzu6V0bhvIMlNS7yKg==
X-Received: by 2002:a17:90a:e987:: with SMTP id v7mr6121530pjy.56.1594756246494;
        Tue, 14 Jul 2020 12:50:46 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g8sm16736689pgr.70.2020.07.14.12.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 12:50:46 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/9] remoteproc: Refactor function rproc_free_vring()
Date:   Tue, 14 Jul 2020 13:50:34 -0600
Message-Id: <20200714195035.1426873-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
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
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
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

