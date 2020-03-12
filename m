Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91BB183C12
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgCLWMN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:13 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37594 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:13 -0400
Received: by mail-pf1-f195.google.com with SMTP id p14so3959230pfn.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vEoXsLC+v8mX4Vj+t+8zprwRGYdue84ZJZhMv1TU7d4=;
        b=SCVgI5XtVuEAaxg45te/VTYpHWW864jeuIp4KtBoTO0VM++HlKKMQ6DGyjW0f1D9dE
         prII1dfHfBmiKXI3qAeuYYW8I/cNyxW8O2XOrTMJoHw6YPfBJdsL+jEdbpg+ZuE75Dw+
         UH2nGYJRUzJMZ5g/4F48q6sCipF2ZF3wZsJmYCZWO/3TbyS30soNDtWVK1hsaY626VmE
         AplJFKkkEtKIYq134wpLxaFp3lt36SkUeeQCotNbguCK37DATHIyVMlLFBvN8HjN08ox
         wbv/Ar+gnHI+J7p36ymcqTW+6wWUz88krY9t486xMELO0Vak4V0UxOukALZmkcuDjwWl
         4CjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEoXsLC+v8mX4Vj+t+8zprwRGYdue84ZJZhMv1TU7d4=;
        b=hU9F8VEBpTlMCCeGw00UOSmzhF35qJ8ZvIq2G5IcfNKitpv9EDEFIO7Yo8tMQeb1Lc
         Atdpo8kyuYhP3ed1CQzRt/QYPxApfVQPXgR9SUy2G+OzNbpWXWZnmLm4DeEXX1kzqEsf
         8tYax/eBYT2pgXBhAGRz4f4+Xiz5xcTq7E8qacvElli7u2qrOMqqPdyLOSFxvUUi6mqq
         LjNlmM8CLvjBfBsXYgy07VeQqVMj40mZZT0A3i3kcJZFuZSaetAZWMi0x5CROg1blaY1
         6bqAVc57bOfwgvW1mc0Fmm1ywln2zhfvuLexlFPI+oFw/TNAOi4Qm9+Wb70xBQJOD2g2
         qK8Q==
X-Gm-Message-State: ANhLgQ0xpm+8S/U4qKJeyyihiIgHYT4NA0sm2tKH2y/ATjd4W7Kbjmtm
        5HpY9Fh1pbcXfVOLwAOQpdbVJg==
X-Google-Smtp-Source: ADFU+vvA1I4Lz9JWSZlABTRE9oXfu8PPIMhcQXdAwmtq1XDXEuKqM7yXOBhIXnywvfB0wLdWD/Gl3Q==
X-Received: by 2002:a65:63ca:: with SMTP id n10mr9509453pgv.19.1584051132153;
        Thu, 12 Mar 2020 15:12:12 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:11 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 11/18] remoteproc: Repurpose function rproc_trigger_auto_boot()
Date:   Thu, 12 Mar 2020 16:11:51 -0600
Message-Id: <20200312221158.3613-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
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

