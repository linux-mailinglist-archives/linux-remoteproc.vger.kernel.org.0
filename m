Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A159A183C0B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgCLWMI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37797 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id f16so3229298plj.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFxiWY+kpD9874R08QypyBmwovyVbSqxX8VrEMv/frg=;
        b=fiBTipyRr08lPmdwYLAMi4kzK49oaPHip+yqgjtKO3PdaY14QQejruX7kDWDeXHFDm
         IIA3UlY6GGSqfBfWAWPFPieqFWxA7sOynQBjzUeNBP3dQKOcfDjcV7gYbQle9MHlaH0/
         RMYRtXmBEO+GFazN5lwxUScDivBYJ4yu+nNVw537CqYdo7hcoJrGYfHLA7Geze0+yvy7
         w1MrW9oSEXYVltlKf2UiYjR4A3B26F0UqT/vCO7wBRKXj11uUUuh/EwUxthQmjlkU0vd
         gwSHS3A4Zs+k6V210LTYk9V+BxTjO1Jq7gtF27A5paQwD3udZ0RinzzsWavyO3PIdtU9
         uXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFxiWY+kpD9874R08QypyBmwovyVbSqxX8VrEMv/frg=;
        b=M8mghrktwKuMUaUrCLzuUoYjcCizV8qH5P5flv/650fLd5Oob9wpEppyT83XjNwN4G
         FrDzGhQEXEEMQRfEyVPn1X/iBkq4g/w8PvHZToz9usvK4qwYzqKY0yNuqyruMCrOMqk2
         1FVgapSrgYtaxNw960OMLlUN2rpo3Q8QyhNeOIH5+yPkoWHOhz35a9s6dKBi8fIezLas
         sjLs8zOZkTSKMeCMvZEm9P9ar7zXFqXRHt58xJ2YBctzGt3UI9nnhobtJ7SlmwObgNO1
         jJ3/+VuU//bv15qs0i/PVwxUGQUm1tuEB6YlAMYo/gOU/lscajiGiSgBCSsE8L8p/M0c
         b/Dg==
X-Gm-Message-State: ANhLgQ2sD1/bmwWpphKSJZJ1C76Ys1K8A8qMfPUbCXC3vO0co47eN++a
        A12/hi3Vo//BRZBlSj51MeG5jb/QXl4=
X-Google-Smtp-Source: ADFU+vsFTAPctg3t9oifDveiFQdECzEDzAm0IJNid/QduFnntZe/yd/3D/nvoxuOzSrXUYtuKxM23A==
X-Received: by 2002:a17:90a:2489:: with SMTP id i9mr5996242pje.183.1584051126579;
        Thu, 12 Mar 2020 15:12:06 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:06 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 06/18] remoteproc: Introduce function rproc_alloc_internals()
Date:   Thu, 12 Mar 2020 16:11:46 -0600
Message-Id: <20200312221158.3613-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In preparation to allocate the synchronisation operation and state
machine, spin off a new function in order to keep rproc_alloc() as
clean as possible.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ee277bc5556c..9da245734db6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static int rproc_alloc_internals(struct rproc *rproc, const char *name,
+				 const struct rproc_ops *boot_ops,
+				 const char *firmware, int len)
+{
+	int ret;
+
+	/* We have a boot_ops so allocate firmware name and operations */
+	if (boot_ops) {
+		ret = rproc_alloc_firmware(rproc, name, firmware);
+		if (ret)
+			return ret;
+
+		ret = rproc_alloc_ops(rproc, boot_ops);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto out;
-
-	if (rproc_alloc_ops(rproc, ops))
+	if (rproc_alloc_internals(rproc, name, ops,
+				  firmware, len))
 		goto out;
 
 	/* Assign a unique device index and name */
-- 
2.20.1

