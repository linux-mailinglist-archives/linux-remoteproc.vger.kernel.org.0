Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44FA334991
	for <lists+linux-remoteproc@lfdr.de>; Wed, 10 Mar 2021 22:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhCJVK7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 10 Mar 2021 16:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbhCJVKn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:43 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAD5C061764
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:43 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id w7so5628698pll.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NgkcddZSW1dB4vPCVOhwPlo4SCp68OIJoV00vCCYdd8=;
        b=CGxpuji4f0tpmJ5rlyPbf44gVJKvkmK0ivXehl4MCnWBRFTgmgkBbCGGxjO4+0z5Yv
         0ynIAWfxSLM6asZxW9iLdx52OvWpnWBvHGiYIO3EbXRsXWFl8s1moHNTUmzL1id/uKwT
         wnaQkNpj03SVoF1N+fJ2Is8ElJYvQOIQHaKVH0Sp9ZRX2WTZwNH7te3IP13YBbDepFZK
         AzrK57ZikRP3h2d0/jS2SevbAmGnsmPZ/7WDzgldIw5C6HmzNuQkhkD7vHEpvFOGCZZj
         UGUapIU9NVEanhfe3PybaqcpyXtsUKbY1RvjqR8pNVSHcp/ndwcgGV8kw0CKYsgGYoZN
         3Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NgkcddZSW1dB4vPCVOhwPlo4SCp68OIJoV00vCCYdd8=;
        b=aaQlEhcIQGpctRDBjYVXB7zVpi+c8kP5Fp/yvJzHwnxdprrav4N3+HEmDeSxxtHl9Z
         yWeYawZeGP7xTjcldGwn/aTyb7wSJQ4Nx8s/ohgAOkQqrRiesBl8XxiXkDLydgxGWtft
         I2tsV3r9Vgm8CihOmYgnZ6vnF3YQQemQghqImVGCtU/7VuOdFukaKkhtE4RnitnufEff
         0on+LVHvz6SDDaBp82RrfNdZssb3oPVYomBbeXz1vMcJhmb+UDM7+Ywzu0PbA5/W8PRV
         odxxqWyo4Kn1Cdg6fJij73YBWiFdBp9QmD1mQFibBjPABGIvm9Jc0gMRGQ4ylFy2uiYm
         eC5w==
X-Gm-Message-State: AOAM532W7ZiGduEm3ac9gQUD6CLf0KpFpRKJTsh0YSV0LpKwLvNxNVJ+
        FvsuGu1yjuq08SEElAZs0QukrA==
X-Google-Smtp-Source: ABdhPJynKboIvbEIHwRWNjhMeBPiO5bDz8TYUQ4wPgPG0Nv5WvxMh9gXqNml1fe6rFyrYBm+FNKr4w==
X-Received: by 2002:a17:90a:4604:: with SMTP id w4mr5414724pjg.56.1615410643311;
        Wed, 10 Mar 2021 13:10:43 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:42 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 11/17] remoteproc: Properly deal with the resource table when detaching
Date:   Wed, 10 Mar 2021 14:10:19 -0700
Message-Id: <20210310211025.1084636-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If it is possible to detach the remote processor, keep an untouched
copy of the resource table.  That way we can start from the same
resource table without having to worry about original values or what
elements the startup code has changed when re-attaching to the remote
processor.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V7:
  New Patch, used to be part of 11/16 in V6.
---
 drivers/remoteproc/remoteproc_core.c | 77 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  3 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5eaa47c3ba92..e9ea2558432d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1556,6 +1556,24 @@ static int rproc_set_rsc_table(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * If it is possible to detach the remote processor, keep an untouched
+	 * copy of the resource table.  That way we can start fresh again when
+	 * the remote processor is re-attached, that is:
+	 *
+	 *      DETACHED -> ATTACHED -> DETACHED -> ATTACHED
+	 *
+	 * Free'd in rproc_reset_rsc_table_on_detach() and
+	 * rproc_reset_rsc_table_on_stop().
+	 */
+	if (rproc->ops->detach) {
+		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
+		if (!rproc->clean_table)
+			return -ENOMEM;
+	} else {
+		rproc->clean_table = NULL;
+	}
+
 	rproc->cached_table = NULL;
 	rproc->table_ptr = table_ptr;
 	rproc->table_sz = table_sz;
@@ -1563,6 +1581,59 @@ static int rproc_set_rsc_table(struct rproc *rproc)
 	return 0;
 }
 
+static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
+{
+	struct resource_table *table_ptr;
+
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If we made it to this point a clean_table _must_ have been
+	 * allocated in rproc_set_rsc_table().  If one isn't present
+	 * something went really wrong and we must complain.
+	 */
+	if (WARN_ON(!rproc->clean_table))
+		return -EINVAL;
+
+	/* Remember where the external entity installed the resource table */
+	table_ptr = rproc->table_ptr;
+
+	/*
+	 * If we made it here the remote processor was started by another
+	 * entity and a cache table doesn't exist.  As such make a copy of
+	 * the resource table currently used by the remote processor and
+	 * use that for the rest of the shutdown process.  The memory
+	 * allocated here is free'd in rproc_detach().
+	 */
+	rproc->cached_table = kmemdup(rproc->table_ptr,
+				      rproc->table_sz, GFP_KERNEL);
+	if (!rproc->cached_table)
+		return -ENOMEM;
+
+	/*
+	 * Use a copy of the resource table for the remainder of the
+	 * shutdown process.
+	 */
+	rproc->table_ptr = rproc->cached_table;
+
+	/*
+	 * Reset the memory area where the firmware loaded the resource table
+	 * to its original value.  That way when we re-attach the remote
+	 * processor the resource table is clean and ready to be used again.
+	 */
+	memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
+
+	/*
+	 * The clean resource table is no longer needed.  Allocated in
+	 * rproc_set_rsc_table().
+	 */
+	kfree(rproc->clean_table);
+
+	return 0;
+}
+
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1721,6 +1792,9 @@ static int __rproc_detach(struct rproc *rproc)
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, false);
 
+	/* the installed resource table is no longer accessible */
+	ret = rproc_reset_rsc_table_on_detach(rproc);
+
 	/* Tell the remote processor the core isn't available anymore */
 	ret = rproc->ops->detach(rproc);
 	if (ret) {
@@ -1997,6 +2071,9 @@ int rproc_detach(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e1c843c19cc6..e5f52a12a650 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -514,6 +514,8 @@ struct rproc_dump_segment {
  * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
  * @table_ptr: pointer to the resource table in effect
+ * @clean_table: copy of the resource table without modifications.  Used
+ *		 when a remote processor is attached or detached from the core
  * @cached_table: copy of the resource table
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
@@ -550,6 +552,7 @@ struct rproc {
 	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
+	struct resource_table *clean_table;
 	struct resource_table *cached_table;
 	size_t table_sz;
 	bool has_iommu;
-- 
2.25.1

