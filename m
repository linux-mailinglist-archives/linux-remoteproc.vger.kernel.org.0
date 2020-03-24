Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159EF191C1B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgCXVqL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:11 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40070 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXVqL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so7960407plk.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8GchUXqImjod0MIPYLIdyQi94IM61hiNQIO0qzQ9Pt4=;
        b=gbCO4JLwY6TDXVCmIuMsusgmuR9aUXHMyKm9EkFu2hY3DqnfwghoaiV5NCVfkvx21a
         5wL9IkoZxYfS+vRqX1y4PbzVSD3nGXvLhrRXGUIBJvTP01tJXKFIuCGpTPBFDgPOEJ9x
         FMSo8/J7IFg9WSXSg89rNF7/X13K45snH55J/l7f6LcsD0/9d+MpLZRpnlFAvfa5qpCS
         RAVW0E3gmevoQD4XnfCLAJ/Bo3otuJRMAfNeYpcWMHu/eulNUwsvwlld9gZuaV5uyk4D
         piTqHuwlgKHzTayWeHKJwx+rvGpizGTBF77HZF1Yv+6KlD9zIsF4mZUMMGH7Y6Ty7dS8
         oNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8GchUXqImjod0MIPYLIdyQi94IM61hiNQIO0qzQ9Pt4=;
        b=fLOal5FVCw87H7J7kHrBoZZ0ervcLUaXgtamANCFZHZ/OjLZGadkGNKQ8iaZOth+Tj
         wbQK5UracKrPgM6QZvswpgSyqM0nC3u8b46qNnyvZfXxCkOVL8Vx5g23JFAq2kmMLpCX
         NzDb89FAszzT1PEPARxNLtIE1Y8K0OGQJ7YdJyFFb4nMl8Xpzg2hUoWRylMOGVMeXOxg
         d/UZC8Y64wn1OHRJOSB4El/3dU7rBsfMyPEY0aM5fqj/r+o8gtworuNM2BpG9NDHdYqn
         XVL4pBYluSgyJ2W8SuAZrVHgAMKqBB9bcLfhrFl09lK8LivGzZp34J/C5zctmaKrWUBQ
         ApqQ==
X-Gm-Message-State: ANhLgQ0BdsuCZYMmaOQYjGSBnYB2DudnIwYVG+zEzfcLjh46TFmCM4rS
        JIdc9veK93kwyg4Z9MWmr5vSKA==
X-Google-Smtp-Source: ADFU+vu1HNZVKwVfMqd+Tu9OrwbYLlrIWjibYKA9JsBl2ZRQ4ch4xpFbYLQni8BMYZZc5b9BzgXLEw==
X-Received: by 2002:a17:90a:db0e:: with SMTP id g14mr7154534pjv.186.1585086370615;
        Tue, 24 Mar 2020 14:46:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:10 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 05/17] remoteproc: Get rid of tedious error path
Date:   Tue, 24 Mar 2020 15:45:51 -0600
Message-Id: <20200324214603.14979-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Get rid of tedious error management by moving firmware and operation
allocation after calling device_initialize().  That way we take advantage
of the automatic call to rproc_type_release() to cleanup after ourselves
when put_device() is called.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d22e557f27ed..ee277bc5556c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2054,12 +2054,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (!rproc)
 		return NULL;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto free_rproc;
-
-	if (rproc_alloc_ops(rproc, ops))
-		goto free_firmware;
-
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2070,12 +2064,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto out;
+
+	if (rproc_alloc_ops(rproc, ops))
+		goto out;
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
 		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
-		put_device(&rproc->dev);
-		return NULL;
+		goto out;
 	}
 
 	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
@@ -2098,11 +2097,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
-
-free_firmware:
-	kfree(rproc->firmware);
-free_rproc:
-	kfree(rproc);
+out:
+	put_device(&rproc->dev);
 	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
-- 
2.20.1

