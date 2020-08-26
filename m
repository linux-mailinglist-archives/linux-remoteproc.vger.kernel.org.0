Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89079253555
	for <lists+linux-remoteproc@lfdr.de>; Wed, 26 Aug 2020 18:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgHZQsp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Aug 2020 12:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgHZQpl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:41 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC2FC061574
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:36 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i13so1150894pjv.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lxIye1BxXlig0joxvfV3TjTIbmhtulHfHUSFeSKXwpg=;
        b=LSXlMfoos36WBF/fpaBmObLrfS1kz0HZZI2Qgav75AsUjAKat8LuytVTlC0tyS0ayL
         RmAE0lhS8q1WNT0AnpU1kPZ4ydgT6kTymvspcSOCHCDEXUeamTtWMnPpQTB67chGltwO
         oPP1bSkN5CCVyDqotivlmwRE5n9N0GRhpMWtF2V994hRuEBNPzgxHA7ZtI8AaBNIU+os
         fxeN2gTVacLnlgxmWfJYN7t1tAVx4t3LlgSfN3B7lmf13hh206NOXwHNMvrV+wRfvoV3
         MdMPZsAfM+hvLddQn61WosUesty0T8QDlAT8TaoYf9k7/o4kmxjq0j5aXMjQTxQUN7my
         FOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxIye1BxXlig0joxvfV3TjTIbmhtulHfHUSFeSKXwpg=;
        b=XX9Q1XK970VY01OqykrooYfvU03s06Mx0UZEQHOzWOiXPnKfyG0r8V1F5CQ+Hpv7mQ
         9kO1ysOpnU0up2qTs8d2Xr1XkCo3VxIqN/UriWinzoDzbnJs5okdBcc5Xq4kkzNvpBGL
         r4sqIIAotSoGQQNDjcGJG3t2kGGz9LH5Qzrf4z1qySyVVmTb1RY/n/r+e98picV9GmNV
         n9EKZzofShl5lX2d6zrcbQmjYjyjj3PeuvFbvMvG1EZGLmGMkBy+nfohr8p8PymYvZAz
         zvhSp1L+gyJVkKY3Q0mR2ECG8GROEjfw5ZE9fdvsfySslXDlgbDgW0KhunzDnE/gx8wB
         KWWw==
X-Gm-Message-State: AOAM532PG2cFpWx1HFB0LAUXU2u/0TjHq/UgG4fAC4MnFz/hWem2dAXM
        Ci4bHnOSYOWJzk3N2KlqrVAhzg==
X-Google-Smtp-Source: ABdhPJy7qksIbBbnDIJyu4KWGBE7pRUmbDYs2d7RkCBEnoXMIwUj0YzTJsrjyyZjXZAGIvc9BSbi8Q==
X-Received: by 2002:a17:902:8208:: with SMTP id x8mr1135726pln.65.1598460335543;
        Wed, 26 Aug 2020 09:45:35 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:35 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] remoteproc: Properly represent the attached state
Date:   Wed, 26 Aug 2020 10:45:20 -0600
Message-Id: <20200826164529.224476-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There is a need to know when a remote processor has been attached
to rather than booted by the remoteproc core.  In order to avoid
manipulating two variables, i.e rproc::autonomous and
rproc::state, get rid of the former and simply use the newly
introduced RPROC_ATTACHED state.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c  | 20 +-------------------
 drivers/remoteproc/remoteproc_sysfs.c |  5 +----
 include/linux/remoteproc.h            |  2 --
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7d78c9a9d88f..bffaa9ea7c8f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1421,7 +1421,7 @@ static int rproc_attach(struct rproc *rproc)
 		goto stop_rproc;
 	}
 
-	rproc->state = RPROC_RUNNING;
+	rproc->state = RPROC_ATTACHED;
 
 	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
 
@@ -1636,14 +1636,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
-	/*
-	 * The remote processor has been stopped and is now offline, which means
-	 * that the next time it is brought back online the remoteproc core will
-	 * be responsible to load its firmware.  As such it is no longer
-	 * autonomous.
-	 */
-	rproc->autonomous = false;
-
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
@@ -1994,16 +1986,6 @@ int rproc_add(struct rproc *rproc)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Remind ourselves the remote processor has been attached to rather
-	 * than booted by the remoteproc core.  This is important because the
-	 * RPROC_DETACHED state will be lost as soon as the remote processor
-	 * has been attached to.  Used in firmware_show() and reset in
-	 * rproc_stop().
-	 */
-	if (rproc->state == RPROC_DETACHED)
-		rproc->autonomous = true;
-
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 2d575e6c9eb8..c152d11a4d3c 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -21,11 +21,8 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 	 * If the remote processor has been started by an external
 	 * entity we have no idea of what image it is running.  As such
 	 * simply display a generic string rather then rproc->firmware.
-	 *
-	 * Here we rely on the autonomous flag because a remote processor
-	 * may have been attached to and currently in a running state.
 	 */
-	if (rproc->autonomous)
+	if (rproc->state == RPROC_ATTACHED)
 		firmware = "unknown";
 
 	return sprintf(buf, "%s\n", firmware);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 4e107615121a..fe383392a821 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -510,7 +510,6 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
- * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -547,7 +546,6 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
-	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

