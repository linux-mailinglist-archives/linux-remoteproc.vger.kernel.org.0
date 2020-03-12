Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C97183C0C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCLWMJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44657 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgCLWMI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:08 -0400
Received: by mail-pf1-f194.google.com with SMTP id b72so3938900pfb.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QbjBu0ATLM3BmpV8WHI5IEU2v4grscwwtqHk7fsIIQw=;
        b=IdJEe3MlLfHau72h39BVF1HFP4qncbdfY8qJ9CMM0GDfZWZjSLwF8Be76nWC996uY+
         9kwYU2RnhLwIIvh02jZ0PsY+ky/EEaUUkRAeboJ+yjPyM4y8pAcgtyJ7OyzvjwRsTghW
         C/MXPknl/a0NRbieh4OadIZAHMUZCIh2bclw+J8cAgAapx45NzYJczlk7zk1wu8DPYkH
         ThuSYVQxngtEuXyi2AQt7AeJpiV3lMkMcgBx9hhYC/JKgtCf9f+lrrJOt/OlagAYGdec
         7+A3Nl+5naNPuq++rvHiw5E/CH/GTSEFV7jK/KnNcPHEuVKdAGB7dN9Vn8vQ98sBgJoV
         7ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QbjBu0ATLM3BmpV8WHI5IEU2v4grscwwtqHk7fsIIQw=;
        b=SM+58xypzeRhqtwYDNphf3oWvhru0cgC/y5sPksBG6D0xcQRxiURFZtTM+9DI+nKr+
         9pNhvPgOF0etO94z2R27SD4xu9yebaHj8p5ahMm2cAAijwRulQFQUjseYeUVEbFyt+rr
         iaLyAziPjbRqmrJj8OozwSphhF0Ollu8cmsMXbo0oU8H++0GQ6To9EPtRXJjJeGBpyX8
         HZOaW36tamIyE5Bals9vXOLpvHI3/Hq++tKa0P/rlK7JqoLxp44TeGZt4grEHLd1fHcK
         8ycZ45JSkRrvob7k7fvZpI51+WFTLPN/dGYRHVTgMZasMB+GZ+G9AAF/cgecKZ4e7XpM
         0AqA==
X-Gm-Message-State: ANhLgQ0XzoGhDQwIvZNkTNhBwEyea6H8z9Xcppb3qrPa8o11mnkmNCb9
        GziGpQKoY/1kNaq4+56rIN4ouw==
X-Google-Smtp-Source: ADFU+vuDCAohmEgv24TynF+hS6+qXPyphFkRxvopMJJtA0LWYTFlQQWT5JIWAoc1NC47CT+5wA7q7Q==
X-Received: by 2002:a63:3d48:: with SMTP id k69mr9394734pga.395.1584051127711;
        Thu, 12 Mar 2020 15:12:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:07 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 07/18] remoteproc: Introduce function rproc_alloc_state_machine()
Date:   Thu, 12 Mar 2020 16:11:47 -0600
Message-Id: <20200312221158.3613-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introducing new function rproc_alloc_state_machine() to allocate
the MCU synchronisation operations and position it as the central
remoteproc core allocation function.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 84 +++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  5 ++
 2 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9da245734db6..02dbb826aa29 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1954,6 +1954,7 @@ static void rproc_type_release(struct device *dev)
 
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
+	kfree(rproc->sync_ops);
 	kfree(rproc);
 }
 
@@ -2018,12 +2019,34 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static int rproc_alloc_sync_ops(struct rproc *rproc,
+				const struct rproc_ops *sync_ops)
+{
+	/*
+	 * Given the unlimited amount of possibilities when
+	 * synchronising with an MCU, no constraints are imposed
+	 * on sync_ops.
+	 */
+	rproc->sync_ops = kmemdup(sync_ops,
+				  sizeof(*sync_ops), GFP_KERNEL);
+	if (!rproc->sync_ops)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 				 const struct rproc_ops *boot_ops,
+				 const struct rproc_ops *sync_ops,
+				 struct rproc_sync_states *sync_states,
 				 const char *firmware, int len)
 {
 	int ret;
 
+	/* We need at least a boot or a sync ops. */
+	if (!boot_ops && !sync_ops)
+		return -EINVAL;
+
 	/* We have a boot_ops so allocate firmware name and operations */
 	if (boot_ops) {
 		ret = rproc_alloc_firmware(rproc, name, firmware);
@@ -2035,14 +2058,23 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 			return ret;
 	}
 
+	/* Allocate a sync_ops if need be */
+	if (sync_ops) {
+		ret = rproc_alloc_sync_ops(rproc, sync_ops);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 /**
- * rproc_alloc() - allocate a remote processor handle
+ * rproc_alloc_state_machine() - allocate a remote processor handle
  * @dev: the underlying device
  * @name: name of this remote processor
  * @ops: platform-specific handlers (mainly start/stop)
+ * @sync_ops: platform-specific handlers for synchronising with MCU
+ * @sync_states: states in which @ops and @sync_ops are to be used
  * @firmware: name of firmware file to load, can be NULL
  * @len: length of private data needed by the rproc driver (in bytes)
  *
@@ -2061,13 +2093,15 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
  * Note: _never_ directly deallocate @rproc, even if it was not registered
  * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
  */
-struct rproc *rproc_alloc(struct device *dev, const char *name,
-			  const struct rproc_ops *ops,
-			  const char *firmware, int len)
+struct rproc *rproc_alloc_state_machine(struct device *dev, const char *name,
+					const struct rproc_ops *ops,
+					const struct rproc_ops *sync_ops,
+					struct rproc_sync_states *sync_states,
+					const char *firmware, int len)
 {
 	struct rproc *rproc;
 
-	if (!dev || !name || !ops)
+	if (!dev || !name)
 		return NULL;
 
 	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
@@ -2084,8 +2118,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
-	if (rproc_alloc_internals(rproc, name, ops,
-				  firmware, len))
+	if (rproc_alloc_internals(rproc, name, ops, sync_ops,
+				  sync_states, firmware, len))
 		goto out;
 
 	/* Assign a unique device index and name */
@@ -2119,7 +2153,41 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	put_device(&rproc->dev);
 	return NULL;
 }
-EXPORT_SYMBOL(rproc_alloc);
+EXPORT_SYMBOL(rproc_alloc_state_machine);
+
+/**
+ * rproc_alloc() - allocate a remote processor handle
+ * @dev: the underlying device
+ * @name: name of this remote processor
+ * @ops: platform-specific handlers (mainly start/stop)
+ * @firmware: name of firmware file to load, can be NULL
+ * @len: length of private data needed by the rproc driver (in bytes)
+ *
+ * Allocates a new remote processor handle, but does not register
+ * it yet. if @firmware is NULL, a default name is used.
+ *
+ * This function should be used by rproc implementations during initialization
+ * of the remote processor.
+ *
+ * After creating an rproc handle using this function, and when ready,
+ * implementations should then call rproc_add() to complete
+ * the registration of the remote processor.
+ *
+ * On success the new rproc is returned, and on failure, NULL.
+ *
+ * Note: _never_ directly deallocate @rproc, even if it was not registered
+ * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
+ */
+struct rproc *rproc_alloc(struct device *dev, const char *name,
+			  const struct rproc_ops *ops,
+			  const char *firmware, int len)
+{
+	if (!name && !firmware)
+		return NULL;
+
+	return rproc_alloc_state_machine(dev, name, ops, NULL, NULL,
+					 firmware, len);
+}
 
 /**
  * rproc_free() - unroll rproc_alloc()
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d115e47d702d..d1214487daac 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -611,6 +611,11 @@ struct rproc *rproc_get_by_child(struct device *dev);
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
 			  const char *firmware, int len);
+struct rproc *rproc_alloc_state_machine(struct device *dev, const char *name,
+					const struct rproc_ops *ops,
+					const struct rproc_ops *sync_ops,
+					struct rproc_sync_states *sync_states,
+					const char *firmware, int len);
 void rproc_put(struct rproc *rproc);
 int rproc_add(struct rproc *rproc);
 int rproc_del(struct rproc *rproc);
-- 
2.20.1

