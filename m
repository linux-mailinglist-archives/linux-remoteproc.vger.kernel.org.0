Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795391EA898
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jun 2020 19:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgFARvr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jun 2020 13:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgFARvq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D61C08C5C0
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 185so3832887pgb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=95EWc68nYSQ/9MObgW9pgJNxpvrSjDNtZ8lwnmoabNI=;
        b=efnU2p08BqycqkIC+/it/z8qsI4D9aw7hkyuo9zzFXED+ybHh99HDWDw94cqh+v4vS
         krELd4kmJ7hhpMsAkY4zHemblrWZVSEDSds6JLHWkic8k1mG5YBMtwEj8DITFkaopGcT
         QRjvlKvFmc5DCV02ynFCokL6DPKP6v+yiGBkJrUdfm1pLaup0mrvnV+FbHsIjF0INsU+
         IitAagIxRMdfi1ND0oRHpfgMgpJ9cUT+Fmk55Qs5vTMxFis728kV+4lbantjqfG3sRQj
         RwnIwtojv+TqGsLrSHrs9QdSR8GAeAExdMm6tYckRsz7UXyg7igpQ5uGN8Ld4UuM3SJE
         tepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=95EWc68nYSQ/9MObgW9pgJNxpvrSjDNtZ8lwnmoabNI=;
        b=C01dx7sal7OBteLJWkpV++5l8kYxmqWmVQV/v3KXds69LXgfaxW/Sk4vX17aZIenBn
         sEjqkLmX30zJMd4NJf2Y+6AjD1ho+oPrijWW5d4TeYcrrj3M2Q5TuS5iMX26NB6kZpX6
         5yZ2yiNvrso/yKMipFGEcokJrgIYOaPxODwoOiPNaJ/LEbn5kjiwoaZjkO4kZ+Uu7OFw
         0rCfiGLAqRKQ75YwbioYN5nCbapxbqHvCu7wynrF36t5/UwE70uKYaZRPQk7y240Nayb
         TqN6T98yek36QhFNSeg2Kkj2ZtzfmTjcmFSpMI8mnDZQ4xYGi3b+NLUzQYZTiCU33BZf
         dwJg==
X-Gm-Message-State: AOAM532Oq40Niw3XM6U3MhVXKT6p5XYWtQjqhFFq7tFWO+M5CCLLHeNo
        FGo4GMw15GGem0cs3c1+qBzL7Q==
X-Google-Smtp-Source: ABdhPJzO9KDg1cvTMWlJ7X3FLWugqoAab26LXHV5AeczKSEmLVpsQI1Q3xgOrMrZ9SS7uubJ8I8xQQ==
X-Received: by 2002:aa7:9488:: with SMTP id z8mr10280347pfk.157.1591033905381;
        Mon, 01 Jun 2020 10:51:45 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:44 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 4/9] remoteproc: Introducing function rproc_actuate()
Date:   Mon,  1 Jun 2020 11:51:34 -0600
Message-Id: <20200601175139.22097-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_core.c | 68 +++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0b323f6b554b..c70fa0372d07 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1370,7 +1370,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int __maybe_unused rproc_attach(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1499,6 +1499,72 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
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
+	/* Tell the PM runtime core we need to keep this device powered */
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * if enabling an IOMMU isn't relevant for this rproc, this is
+	 * just a nop
+	 */
+	ret = rproc_enable_iommu(rproc);
+	if (ret) {
+		dev_err(dev, "can't enable iommu: %d\n", ret);
+		goto put_pm_runtime;
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
+put_pm_runtime:
+	pm_runtime_put(dev);
+	return ret;
+}
+
 /*
  * take a firmware and boot it up.
  *
-- 
2.20.1

