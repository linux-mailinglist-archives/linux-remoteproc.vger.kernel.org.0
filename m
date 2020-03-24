Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A085191C19
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgCXVqK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46964 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id s23so902910plq.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r/B04jVPNZTcs3aQnGZX3vp28LZDLa2t2zmjCbTooYI=;
        b=Eg2vGEA3BuijCKI7fh2trvPm8rXRmlL1oRcujHLaSN3plb0Wx0XJekyhtDbWOd+fp8
         +zlQayjEfkgF0Q3r2WlxXkvq8Q+fWZlwV0/eg0eb9jKfN72Q8rdOqLX20CoFVinchecF
         0Q0d5eqM7qgVMF1nVg/6H4LXq1p5GxfsJ6ePvTIviZtgQf50m007ha9PVR1VzVaQoEA/
         Vb0uAkI/6UE5WU9qLBZRXsMsb+hh0OFI4+aIwRhVzP7yMQ4cf886+m8WfaedNg6U/6UR
         gZPlfYKQfZHfF1WlXFGozhX2PUSvU3Y2lp25EF3N4DC6HPWWWer+1Tuh9Zikme1jCNf5
         7WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/B04jVPNZTcs3aQnGZX3vp28LZDLa2t2zmjCbTooYI=;
        b=SU1W7lU+yC2aw/BtvKa2H52cSu9RVcy+5CXKXGcb+q2di+JyvXvE1RmN0q2I15uWgk
         KPcmamKZSU9SWtR8E7YM35nhSD3YrFBVqW/DLO7ckSZBBHiGMBVUpY+BbzfZjZ+oRTTL
         v/fskXBvH3Fx6SwHc5YZvxDyasSQNsZw713loLlHVnvMB3Zw/S95YTkKikpESN0g28wP
         ifBwUVydw8R24C5/XlYtvRC07loFBusDCyDWTX/KWEl7JluJqozaE0glimQrqF7r6MZH
         gQlrXGZi3th+aM6afhWUuop/gZucLyihdRr5fHoX9jGxG0+YMqGlWcMKGgGogNCK/l1x
         lJKg==
X-Gm-Message-State: ANhLgQ14F6iCFsOGpqzj11ytgIi3AbzLG6VfLwqbJfzK6FloIvoEuuq/
        K1PRdI6zMwQakYaV6y7ex2Gfzg==
X-Google-Smtp-Source: ADFU+vuqWdebrsruwwTRck+Y9vXqdtRLcft+MI/d8jgAiAeFQFZHFo+grPHxB8nxydJZWqTeTmyzxQ==
X-Received: by 2002:a17:902:d204:: with SMTP id t4mr81824ply.228.1585086368457;
        Tue, 24 Mar 2020 14:46:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:08 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 03/17] remoteproc: Split firmware name allocation from rproc_alloc()
Date:   Tue, 24 Mar 2020 15:45:49 -0600
Message-Id: <20200324214603.14979-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..c0871f69929b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1962,6 +1962,36 @@ static const struct device_type rproc_type = {
 	.release	= rproc_type_release,
 };
 
+static int rproc_alloc_firmware(struct rproc *rproc,
+				const char *name, const char *firmware)
+{
+	char *p, *template = "rproc-%s-fw";
+	int name_len;
+
+	if (!rproc || !name)
+		return -EINVAL;
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
@@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
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
 	if (!rproc->ops) {
-		kfree(p);
+		kfree(rproc->firmware);
 		kfree(rproc);
 		return NULL;
 	}
 
-	rproc->firmware = p;
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
+
+free_rproc:
+	kfree(rproc);
+	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
 
-- 
2.20.1

