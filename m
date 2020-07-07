Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404862179E6
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgGGVAj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729066AbgGGVAW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:00:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80025C08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:00:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id l6so203889pjq.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bbYQfIqqJHKaf/AV7EAC2w0cpklnSxGXHmoxxnSA3xU=;
        b=lN1AXlS/JrrmRLIUyBjSFMpogicBURNVWYkAD5P93UAG2F9rf1AxJymtSUchh7oWxT
         iqxH+BkLEx0VrvI4qNWwaxsxMdv3F3cuzh6BC5p44DHLA6CC7SYOwfCNYdJBsZ0gduya
         XsGgA/b+6VCC8IO+8qy+U6VZkpTa3j3uRK+iMjKRBnii3wfTsO3xSNxyRsyIeOfeqRyq
         kRvN1uE5Qe3jB8i4yVBYtiYw9f4dRwzaZQHIAh2AlhwlNBUSXyE871ddBmJZryJ9Kf09
         fBsKmcy4HOyqjGeFhh8Y72NYm2HdUY6OxOFoQwEWXBGvl21P1qRhS13WUeuueM49eedv
         L5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bbYQfIqqJHKaf/AV7EAC2w0cpklnSxGXHmoxxnSA3xU=;
        b=j3hZLa59LwyohgeRRUAoY30meuJNlL8YKY5BZKKg8FjScZi4XKQ4R2ibMSeo/88N34
         DI9i5ZytX35mubzZJllO9z/XUEWUFiOpVz/RzOe7gZbZjgAYU/qyHVVhtWjso5UF+HDT
         egsBVAGQVu1LWoDqeafJTBlPSC8thahWHsQta9nkvFlJFFm4JgFPqoenK15waEJi/OK+
         83amTQ8bQHACOYq8HcbvNV1xaNKmWykVSos/KFq6JGPEVdmNxzcJ8EJIxjD0lvyfgfTp
         mFr2Q9PyIEx17RE8MyANZPfQaKRkK2TbJQob89jqjdzfiDT7tQzUS+TPcLfOEUl2CM1h
         gmdg==
X-Gm-Message-State: AOAM530tNsVDu3uWMgsHQ+FTlPapKOcqnCPbmOmuDQLbNd2K8YwJDEcI
        /yRup8btfti8vlYAqHEYQ/kJja4t+Ow=
X-Google-Smtp-Source: ABdhPJx3gwwwBEIT3dAT4JNWdPHKUJjmF3AXMNSxjdrwseqMA4lcVlcA7m+UcqoYaQFRhySIv9nB7A==
X-Received: by 2002:a17:902:bc82:: with SMTP id bb2mr45907161plb.225.1594155620894;
        Tue, 07 Jul 2020 14:00:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b21sm13738061pfb.45.2020.07.07.14.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:00:20 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/9] remoteproc: Introducing function rproc_actuate()
Date:   Tue,  7 Jul 2020 15:00:09 -0600
Message-Id: <20200707210014.927691-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210014.927691-1-mathieu.poirier@linaro.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function rproc_actuate() that provides the same
functionatlity as rproc_fw_boot(), but without the steps that
involve interaction with the firmware image.  That way we can
deal with scenarios where the remoteproc core is attaching
to a remote processor that has already been started by another
entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1e8e66a25bd6..fd424662801f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1369,7 +1369,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int __maybe_unused rproc_attach(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1490,6 +1490,63 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+/*
+ * Attach to remote processor - similar to rproc_fw_boot() but without
+ * the steps that deal with the firmware image.
+ */
+static int __maybe_unused rproc_actuate(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	/*
+	 * if enabling an IOMMU isn't relevant for this rproc, this is
+	 * just a nop
+	 */
+	ret = rproc_enable_iommu(rproc);
+	if (ret) {
+		dev_err(dev, "can't enable iommu: %d\n", ret);
+		return ret;
+	}
+
+	/* reset max_notifyid */
+	rproc->max_notifyid = -1;
+
+	/* reset handled vdev */
+	rproc->nb_vdev = 0;
+
+	/*
+	 * Handle firmware resources required to attach to a remote processor.
+	 * Because we are attaching rather than booting the remote processor,
+	 * we expect the platform driver to properly set rproc->table_ptr.
+	 */
+	ret = rproc_handle_resources(rproc, rproc_loading_handlers);
+	if (ret) {
+		dev_err(dev, "Failed to process resources: %d\n", ret);
+		goto disable_iommu;
+	}
+
+	/* Allocate carveout resources associated to rproc */
+	ret = rproc_alloc_registered_carveouts(rproc);
+	if (ret) {
+		dev_err(dev, "Failed to allocate associated carveouts: %d\n",
+			ret);
+		goto clean_up_resources;
+	}
+
+	ret = rproc_attach(rproc);
+	if (ret)
+		goto clean_up_resources;
+
+	return 0;
+
+clean_up_resources:
+	rproc_resource_cleanup(rproc);
+disable_iommu:
+	rproc_disable_iommu(rproc);
+	return ret;
+}
+
 /*
  * take a firmware and boot it up.
  *
-- 
2.25.1

