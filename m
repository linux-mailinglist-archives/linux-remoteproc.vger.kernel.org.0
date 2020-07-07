Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7D62179DD
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgGGVA1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbgGGVA1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:00:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065E4C08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:00:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e18so20564612pgn.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXihWIxuNvTRnDoqQ/WGQ+3cWsaukK63XK7MoneTKGE=;
        b=wCtNGckKVZFCFAuUdZsUw9mSFizW/062kFnHcpDSKKzrt9wS+WWMTqcBQpPV31HmQs
         CRGM3WKA+gCXwrspMDYMYoeeKfPU6sVhpycFx4Hk2EQ6aQ+fGEGqVNrFboBiPwH9C//S
         niLoEyMvn1HAvphxxck3y7z/VcDKLIr53k5uyjqVFSR174th6lKWNOnKDrSsAGuCIVHZ
         I8BNJB5hnS+WiI2pDNMMro3t9z467k2JiraNB+kceNkiYcfSSuaQeBA50zIhwgkzO7r5
         Nb/3UN/zTKgEP5O2fdvellFQ/bTAxfQBd2VOH/SU27mBK13FCuXy1NPGJ10rYjt4o+/C
         AGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXihWIxuNvTRnDoqQ/WGQ+3cWsaukK63XK7MoneTKGE=;
        b=NldKiwzUy+J9EC/wnCLw4KNQlBQKPH4D4qXbxHXjmyQeiE3dmnR0n6ofUnJDqpPC9z
         Xs6KqZ8FwyOVAEz8hLdbP8HLZpT9fAwWh5Koo4FIyiletpXTDLq/U7u3oZ3YiFOfciwd
         yRM/hNERZKIMczfug+a82uI3lJZ4tyguiTU7dOlFXm8XMsz7FQT+NHFOOatnyZbHAA14
         kCcACXqdi8pJISZ77X2/S6IGOMMICfeaGdLdQpnvBm/0jed1OelXFY8m8a7i7uJDBGl1
         Lrz178Uo9FNqxzuAiIqVJW45w9veYmJJ07uORLE3UelsvGgDhFO43nN0+CcSKUoq/jD8
         j2Ug==
X-Gm-Message-State: AOAM530aVBvbJVmm9osigiFMQJj6xucrWJswY0Tze2/1XN/14zSLZind
        XZcdk1sVCZM9u3lHPtfpXz7snW05pfY=
X-Google-Smtp-Source: ABdhPJw8VONUyHkapEOJN8eJzw+l3h8xertsjk/QdIylkXYno8uLy5Snd1L7vKjOLDF4ip3FnrSBJg==
X-Received: by 2002:a62:ea03:: with SMTP id t3mr50358791pfh.57.1594155626491;
        Tue, 07 Jul 2020 14:00:26 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b21sm13738061pfb.45.2020.07.07.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:00:26 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] remoteproc: Properly handle firmware name when attaching
Date:   Tue,  7 Jul 2020 15:00:14 -0600
Message-Id: <20200707210014.927691-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210014.927691-1-mathieu.poirier@linaro.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch prevents the firmware image name from being displayed when
the remoteproc core is attaching to a remote processor. This is needed
needed since there is no guarantee about the nature of the firmware
image that is loaded by the external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c  | 18 ++++++++++++++++++
 drivers/remoteproc/remoteproc_sysfs.c | 16 ++++++++++++++--
 include/linux/remoteproc.h            |  2 ++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6b6e4ec8cf3a..099c76ab198f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1624,6 +1624,14 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
+	/*
+	 * The remote processor has been stopped and is now offline, which means
+	 * that the next time it is brought back online the remoteproc core will
+	 * be responsible to load its firmware.  As such it is no longer
+	 * autonomous.
+	 */
+	rproc->autonomous = false;
+
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
@@ -2142,6 +2150,16 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
+	/*
+	 * Remind ourselves the remote processor has been attached to rather
+	 * than booted by the remoteproc core.  This is important because the
+	 * RPROC_DETACHED state will be lost as soon as the remote processor
+	 * has been attached to.  Used in firmware_show() and reset in
+	 * rproc_stop().
+	 */
+	if (rproc->state == RPROC_DETACHED)
+		rproc->autonomous = true;
+
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 264759713934..eea514cec50e 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -15,8 +15,20 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	struct rproc *rproc = to_rproc(dev);
-
-	return sprintf(buf, "%s\n", rproc->firmware);
+	const char *firmware = rproc->firmware;
+
+	/*
+	 * If the remote processor has been started by an external
+	 * entity we have no idea of what image it is running.  As such
+	 * simply display a generic string rather then rproc->firmware.
+	 *
+	 * Here we rely on the autonomous flag because a remote processor
+	 * may have been attached to and currently in a running state.
+	 */
+	if (rproc->autonomous)
+		firmware = "unknown";
+
+	return sprintf(buf, "%s\n", firmware);
 }
 
 /* Change firmware name via sysfs */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index bf6a310ba870..cf5e31556780 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -491,6 +491,7 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  */
@@ -524,6 +525,7 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
+	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

