Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0E71A6C87
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Apr 2020 21:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387898AbgDMTeK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Apr 2020 15:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387888AbgDMTeH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 15:34:07 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBF6C008769
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:06 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n24so1029344plp.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tqni+LFQs2BXwijyWOQh2noe7z9qpa756mX5vhw58xA=;
        b=x1kxvMROr35jGt5EZzazsvuw305CbQ2XuoPGeMULTwrj2S7M8Yy6nZsu7OD2+HsGNl
         z4IYZJ0zOvV+Sbs+ux+1F7OLcSAOnTGQxZUM0pJ3EXOc1mX9Rd3XTICczieLy8v6i69z
         gRTKs1B/zrUfJQ1gnSdL5OifS4oPJJl+zgjYkc/qd9I1fPa7X9p/MpxzM0YFmctJ87rZ
         g+u4ao9yJVKn3o5NeL/jcHlR3I/6nhyLMNPrJqnoiv7P4wyr4Vd6OzSUiNK9ArZF6WYn
         oJ5MBJb7JbPFPg8MCcWCMDGRw47DYOfI7dyMlmhf4lECKeDItuxxOLeSDsmpAuPmF0j2
         MWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tqni+LFQs2BXwijyWOQh2noe7z9qpa756mX5vhw58xA=;
        b=r/9k08xgqp0Me27k+YFkwltqYvKNfREIPhDLO2QeD1rwEbrWZL/KxiuhGi/Mw6VCod
         1J5hCGH4kYomx29K/RcVWQXn5OduXdseGW/w8aPNL0qGvzXvENUaj9vZOfSrTF8xZJr6
         HdGmYJ5O9+RLA7fq/MkVKKeGHeoUdrLGhKYdEDCcSxxQZ5/CV7gAO7IjRxQTTMx1gUbF
         Mg+aFHgKWir54a0DIllS+7i25w6k/JskaAKiW71yI3Gqk7ujzj1uzsexlkjk3HOVphMl
         eu2VupXer1D1zKhkmB1vNQbXnrMT+CSTQbmqmww98XRTmTJQZyupxkbvBuO0HUoj4VNA
         COsA==
X-Gm-Message-State: AGi0PuZOf22cYM6snYh/hxJPRCrcv20hqU939AHhzOLBRDarAYwAEFuG
        82sy5f2kL1/cjRfJ9yomm9cBNw==
X-Google-Smtp-Source: APiQypKIdbsYGV+y3wifNha4p/A9VL7D+Ddu1Ii57HONkc2qTturVxQnH9/15QPKaFMKTjl3ihNbwg==
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr23112059pjb.143.1586806445703;
        Mon, 13 Apr 2020 12:34:05 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id ml24sm7032330pjb.48.2020.04.13.12.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 12:34:05 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] remoteproc: Split firmware name allocation from rproc_alloc()
Date:   Mon, 13 Apr 2020 13:33:59 -0600
Message-Id: <20200413193401.27234-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200413193401.27234-1-mathieu.poirier@linaro.org>
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make the firmware name allocation a function on its own in order to
introduce more flexibility to function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 80056513ae71..4dee63f319ba 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
 	.release	= rproc_type_release,
 };
 
+static int rproc_alloc_firmware(struct rproc *rproc,
+				const char *name, const char *firmware)
+{
+	char *p, *template = "rproc-%s-fw";
+	int name_len;
+
+	if (!firmware) {
+		/*
+		 * If the caller didn't pass in a firmware name then
+		 * construct a default name.
+		 */
+		name_len = strlen(name) + strlen(template) - 2 + 1;
+		p = kmalloc(name_len, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+		snprintf(p, name_len, template, name);
+	} else {
+		p = kstrdup(firmware, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+	}
+
+	rproc->firmware = p;
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const char *firmware, int len)
 {
 	struct rproc *rproc;
-	char *p, *template = "rproc-%s-fw";
-	int name_len;
 
 	if (!dev || !name || !ops)
 		return NULL;
 
-	if (!firmware) {
-		/*
-		 * If the caller didn't pass in a firmware name then
-		 * construct a default name.
-		 */
-		name_len = strlen(name) + strlen(template) - 2 + 1;
-		p = kmalloc(name_len, GFP_KERNEL);
-		if (!p)
-			return NULL;
-		snprintf(p, name_len, template, name);
-	} else {
-		p = kstrdup(firmware, GFP_KERNEL);
-		if (!p)
-			return NULL;
-	}
-
 	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
-	if (!rproc) {
-		kfree(p);
+	if (!rproc)
 		return NULL;
-	}
+
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto free_rproc;
 
 	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
-	if (!rproc->ops) {
-		kfree(p);
-		kfree(rproc);
-		return NULL;
-	}
+	if (!rproc->ops)
+		goto free_firmware;
 
-	rproc->firmware = p;
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
+
+free_firmware:
+	kfree(rproc->firmware);
+free_rproc:
+	kfree(rproc);
+	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
 
-- 
2.20.1

