Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D40191C21
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgCXVqS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:18 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44405 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgCXVqS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so7955157plr.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vEoXsLC+v8mX4Vj+t+8zprwRGYdue84ZJZhMv1TU7d4=;
        b=HLAM0/Bx26njNKfeBfBtvRElPK5DtfXEjhAQKwOYTh+JBw9YpyvdJKK6CcoWapyaUE
         fhJGwc9KDFVTJ+CztiE1O8KmwyQO/yPfhzzGLhIwK57Dq2aDnCSbP9iQwNDCTcvcEuth
         RkoPWxvUQTogHLfihMHl0wv1xgUKyMryOhBNifRWhSriWMACvoaZaRTkI+IQksNP6Siz
         UxXC38nQntl9rMSjBX3QjS/xiPGtXK952IydgrDpKnmk83xYGQUPbAIz///8FYbIOrXp
         ttHBPgfsAl06eja9XIJ9wWT8rZTJYm9mYmkWnXevnI7+IPSLXbCB3bE4tABqTuPIgzze
         BkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEoXsLC+v8mX4Vj+t+8zprwRGYdue84ZJZhMv1TU7d4=;
        b=nwbOY7SJIhz5GkkfW5Df7Sx58TqEJGjvhwL2GFO0aTWCpSj6E5NzZnp8AWdJofPZsK
         W2Xi4N5wKtqw/wiUcavBjO3IZ3EtohHAdHzBa0LlPwR8Bsy1A3jG5lGUSWsgr7Q4FtrV
         0/i8t1VbPRaNUcxCvhnTuDDMkOpWbC6ZURjpHndDlaYYVg5szjoBw29X6iRN6daAeh8q
         Mun5/mzX+zGx7rxwzLqXs6BOF3+Xk89B0GEfmcy+MDTm+Ym3bLwhFtcyTLLBshvtaGb+
         DbylOn8GOAVPfn99U7TVHovPXHrhMzBTbvXc8HDMRnPd7xonJ23c6cE7xH763hK/OJnN
         2HBQ==
X-Gm-Message-State: ANhLgQ3j2V6HudbrLrv9i8sO0q9pmZKhpP39pLEGwOBvq5Yq2Q5DS6Z0
        6YtGlD7w28+xyfTPCKLGz+U17Q==
X-Google-Smtp-Source: ADFU+vsOYwi8bVRo9kg/aK7gW7d2BueKmOGms04upVPkNkRvXY5sHpOZC06IaUqpgvo8ZG3YUDONWw==
X-Received: by 2002:a17:90a:868b:: with SMTP id p11mr6768pjn.34.1585086377348;
        Tue, 24 Mar 2020 14:46:17 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:16 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 11/17] remoteproc: Repurpose function rproc_trigger_auto_boot()
Date:   Tue, 24 Mar 2020 15:45:57 -0600
Message-Id: <20200324214603.14979-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Repurpose function rproc_trigger_auto_boot() so that it can deal with
scenarios where the MCU is already running.  As such give it a new name
to better represent the capabilities and add a call to rproc_actuate()
if instructed by the platform code to synchronise with the MCU rather
than boot it from scratch.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7faee1396ef7..d57b47b0d6be 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -51,6 +51,8 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 				struct rproc_mem_entry *mem);
 static int rproc_release_carveout(struct rproc *rproc,
 				  struct rproc_mem_entry *mem);
+static int rproc_actuate(struct rproc *rproc,
+			 const struct firmware *firmware_p);
 
 /* Unique indices for remoteproc devices */
 static DEFINE_IDA(rproc_dev_index);
@@ -1444,10 +1446,17 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
-static int rproc_trigger_auto_boot(struct rproc *rproc)
+static int rproc_trigger_auto_initiate(struct rproc *rproc)
 {
 	int ret;
 
+	/*
+	 * The MCU is already booted, all we need to do is synchronise with it.
+	 * No point dealing with a firmware image.
+	 */
+	if (rproc_sync_with_mcu(rproc))
+		return rproc_actuate(rproc, NULL);
+
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
 	 * be built-in kernel code, without hanging the boot process.
@@ -1931,9 +1940,12 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
-	/* if rproc is marked always-on, request it to boot */
+	/*
+	 * if rproc is marked always-on, request it to boot or synchronise
+	 * with it.
+	 */
 	if (rproc->auto_boot) {
-		ret = rproc_trigger_auto_boot(rproc);
+		ret = rproc_trigger_auto_initiate(rproc);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.20.1

