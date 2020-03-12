Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C74A183C0A
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgCLWMH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40659 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id l184so3945615pfl.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8GchUXqImjod0MIPYLIdyQi94IM61hiNQIO0qzQ9Pt4=;
        b=Hnj0kiHHeDdK70HeJ2FaEBL5P6+5hWSQi24OtjNa2Gj/0KneIObuCq0NbjFe35u9U4
         vmeG60xWh2r5vWq9eyPYGjEF9EADTdGGXy05nAgmnoA4J5rEh0IpHSKgIGZmneS74W/1
         bRJLZheIM7YH45l2O5uNSnBzrB7dcqXPkvozPNXHls3bXmhM3M7zhT/t9/u5CeAq0PrV
         cPbJrHvSeSygSsZJf40ed1ZS7wV84HjCX27RihmlQCq9qZPvyAuHwoBiJhvldGvJ5dfo
         oPmODqGho1yZsynuUlO3HJDGkqJUmdDyR0OkdCs8KTt6zPFgDiPIchGKy/OqXgI0oY+j
         ubag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8GchUXqImjod0MIPYLIdyQi94IM61hiNQIO0qzQ9Pt4=;
        b=lULRha1sHgI63UktKKt7grc2QachZhMD2B/MdIO8JC29K8Dyt2z9uNQMSFlwHPXAKw
         33sDNzW6Lbunbgl7MA6F/GkT2ElUuT6/NJAu40MUGn/gHtv0j/E7wgrszJh1SUbVGptd
         QixQoFDoIFQnBLpcT5NkCeJETfMaZ8i1p6t/1IzMsZ0KSxEmN5PTAPBnBQfZlDucBsZN
         +QSW47TxD7Xlnb6amtDCcCbU6X0RCFSYo05XkHOZ4L/Rd32hLbx1yPVohYv27Y/LT/jF
         0Mn+T+X04awpAGbJipJ8T1a4BlNQBtsv+W4MkZf0ytxWavRYCzDRYp1jcsr8sRKa5k2D
         1BDA==
X-Gm-Message-State: ANhLgQ01CuYwmtndFRpcUIY340MgUlaC/a+9s1V0sGEu6B0mJsDHeAJI
        4ocAkkTJPVwK11xqS5yMy13ZBA==
X-Google-Smtp-Source: ADFU+vu2EEs/qkth4QtFjVd8T3iiMjJPQ4G9gKL/d7sh2fiagCdve7ICh7sOZBpVaSpdrdDb6SRr7g==
X-Received: by 2002:a63:7f05:: with SMTP id a5mr9851385pgd.327.1584051125521;
        Thu, 12 Mar 2020 15:12:05 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:05 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 05/18] remoteproc: Get rid of tedious error path
Date:   Thu, 12 Mar 2020 16:11:45 -0600
Message-Id: <20200312221158.3613-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
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

