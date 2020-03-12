Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FF3183C11
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgCLWMN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:13 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45347 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:12 -0400
Received: by mail-pf1-f193.google.com with SMTP id 2so3934637pfg.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FD0VTjAKokoI3E/7TSv80ZTX/OnmyOrZGmVSUVDTIJg=;
        b=AtzT6ed3RKo+TrBHWC/oRo/qy++U+kIyg8pEz/cAcAxFalTsfaNdcddt59hyBGMNEX
         98z9yUyFG9eUnVqaey0BfiviUAngHMxHU21vQddA50UDn1oQesci2jnws/tLmTQKuqB4
         rTL2jXB4JwlNU4EVGZN96IuPoDoki+B6xC0y16eiqSiNUM1k5W0bzbZH4/jJTt46OTfO
         wglG+BgrzMFltQBVUnbsLXa5zw6/uE003dJ25gpo4tRW/xQ260N/nfJfKv0hZ6Rse9NS
         m+PaVtH/Z+en8tP9A0aGfaYaIaL5O+X3vGx+enbSJyjSSaoAD7JdBkNDrq8G0uYkpFwI
         6biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FD0VTjAKokoI3E/7TSv80ZTX/OnmyOrZGmVSUVDTIJg=;
        b=RPVEq0yJjac9C5lR9JoTHD0fyd7VwvXFjVQUFfGJTYKKZdRSfp8jh8xvisMxs/Nrm6
         of3V/ebFnoSgwnE/n+YMh12Y3D/Dq/J/1rrH1iFg5dTna/pkfdGJdSJPUFv7VOKWiKTf
         Q17dhd05g5gjTWEefNuvW/o1JwogYqVUoneE65XlTfTc3XNE9vuQ8Ha+iLmYlJY90/bn
         jsohhB7HsSnyKdXfAoyIXZ2imjKnprunX+4NQdhg+orvohsGX+1Jj6SpxHPOp3EaJX/A
         ktrmUYmNGzDBbdfiP7ZMtlC7JeJ91GMXiA1vufZqpn73jBlM/GXwakS2PvrAuLAGwhmI
         t6lA==
X-Gm-Message-State: ANhLgQ1uICQdsw6+Bd8RtRrdKL0emlSG2bpg1ROmlVLthCuf9F4gpTzM
        e/IjSe0tsfg30Zl+EoQPIEjxAw==
X-Google-Smtp-Source: ADFU+vsNlTT9sk4Q7XMlGIB6bczoRUD+KopZ+EHzv7lRdNg8NnDkGjfii6ucP3dIao6OdeMgEXxNcQ==
X-Received: by 2002:aa7:96b2:: with SMTP id g18mr10558338pfk.221.1584051130996;
        Thu, 12 Mar 2020 15:12:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:10 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 10/18] remoteproc: Decouple firmware load and remoteproc booting
Date:   Thu, 12 Mar 2020 16:11:50 -0600
Message-Id: <20200312221158.3613-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In preparation to support scenarios where MCU firmware is loaded and
the MCU itself booted by another entity, split function rproc_boot()
to decouple the functions of loading the firwmare and starting the
initialisation process.  That way we can reuse the functionality
provided by the current implementation without invariably dealing
with firmware loading.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 63 +++++++++++++++++-----------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1578a9c70422..7faee1396ef7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1714,21 +1714,10 @@ static void rproc_crash_handler_work(struct work_struct *work)
 		rproc_trigger_recovery(rproc);
 }
 
-/**
- * rproc_boot() - boot a remote processor
- * @rproc: handle of a remote processor
- *
- * Boot a remote processor (i.e. load its firmware, power it on, ...).
- *
- * If the remote processor is already powered on, this function immediately
- * returns (successfully).
- *
- * Returns 0 on success, and an appropriate error value otherwise.
- */
-int rproc_boot(struct rproc *rproc)
+static int rproc_actuate(struct rproc *rproc,
+			 const struct firmware *firmware_p)
 {
-	const struct firmware *firmware_p;
-	struct device *dev;
+	struct device *dev = &rproc->dev;
 	int ret;
 
 	if (!rproc) {
@@ -1736,8 +1725,6 @@ int rproc_boot(struct rproc *rproc)
 		return -EINVAL;
 	}
 
-	dev = &rproc->dev;
-
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
@@ -1756,24 +1743,52 @@ int rproc_boot(struct rproc *rproc)
 		goto unlock_mutex;
 	}
 
-	dev_info(dev, "powering up %s\n", rproc->name);
+	dev_info(dev, "%s %s\n",
+		 firmware_p ? "powering up" : "syncing with",
+		 rproc->name);
+
+	ret = rproc_fw_boot(rproc, firmware_p);
+	if (ret)
+		atomic_dec(&rproc->power);
+
+unlock_mutex:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+
+/**
+ * rproc_boot() - boot a remote processor
+ * @rproc: handle of a remote processor
+ *
+ * Boot a remote processor (i.e. load its firmware, power it on, ...).
+ *
+ * If the remote processor is already powered on, this function immediately
+ * returns (successfully).
+ *
+ * Returns 0 on success, and an appropriate error value otherwise.
+ */
+int rproc_boot(struct rproc *rproc)
+{
+	const struct firmware *firmware_p;
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	if (!rproc) {
+		pr_err("invalid rproc handle\n");
+		return -EINVAL;
+	}
 
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
 		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto downref_rproc;
+		return ret;
 	}
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+	ret = rproc_actuate(rproc, firmware_p);
 
 	release_firmware(firmware_p);
 
-downref_rproc:
-	if (ret)
-		atomic_dec(&rproc->power);
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
 	return ret;
 }
 EXPORT_SYMBOL(rproc_boot);
-- 
2.20.1

