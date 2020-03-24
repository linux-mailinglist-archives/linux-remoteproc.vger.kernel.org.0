Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BCA191C20
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgCXVqR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:17 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37178 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgCXVqR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:17 -0400
Received: by mail-pj1-f65.google.com with SMTP id o12so117384pjs.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FD0VTjAKokoI3E/7TSv80ZTX/OnmyOrZGmVSUVDTIJg=;
        b=X0si4UzpveZE387HE3xqIDbdVehuh3/sYahGvdsSSBnSmagI0JJUgIo1QKMfVB9rLV
         X1G5NVHk9gs/GLx8LFbUoM3atL+sJ/AWTJ4lpjkNjSV7/wHRGojGiWSRtIxHQvFJK0pz
         JmUSFAS3jTvm5JEEDoe9zQvXsWfB82vOwxyq3YjL9zPKVgeVpwhJSK+3Epf8kn1GP/SQ
         w4KtEMWCJYmhTCJvx2z06DqpsIFe3fZ5CQfJfG7Xk5Kxdlu58s4noqAwtBDO9J/Jqa1h
         Q6+zjK3OSOG2G7d48g4hW2uOqZEpmRHol6s9wZvotpKUirXacDPx51sZorqXj1PD6AFJ
         U9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FD0VTjAKokoI3E/7TSv80ZTX/OnmyOrZGmVSUVDTIJg=;
        b=Hg14hV/4drMp2v5GGQbbRzclar+eacCa2gopSu4BdyuoCabE7l+SM6AIsSSj4k8mJh
         008ia4gQ/Qi9s44tdaYrWNenivf5sS/L4b3ngR2UN+WOW/A8d5NoVvy8skIx/Ssm/pef
         y59QFiHaxLcPtL+N/HsDKcvFO0Z4BJu9LBVgB4zCw+3AgB1Ji8pTFYkQjH8QI4nqT1TY
         7cgGxPLglITWwr9wEokYrosCPIA1N9dE8eJ3BNJe0kJDwPL3G/hKZPMmyOTVW7lCNEpe
         mQ6fdjRB5sCdMf9JFUA54msQ2f/99xWSXCLk2NMtjUg+PHR8OLE4DZHGfoRIJAxkEE2T
         Z6mg==
X-Gm-Message-State: ANhLgQ2TlEuoA/Uf1J4mLY/FRkJ4SD10lq9+kIoetJqGeEolzy5hpxSY
        aDXXDlXxtS9Pnopg+7GMWvwgTg==
X-Google-Smtp-Source: ADFU+vuyVFYR0Q6ERF2hIjW9e6Rbjir8qpoxJZL/Zj/O/58q5uqcZ2nvBOv25NLwYkNmtHlzXs8lRw==
X-Received: by 2002:a17:90a:36e5:: with SMTP id t92mr8029774pjb.51.1585086376044;
        Tue, 24 Mar 2020 14:46:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:15 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 10/17] remoteproc: Decouple firmware load and remoteproc booting
Date:   Tue, 24 Mar 2020 15:45:56 -0600
Message-Id: <20200324214603.14979-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
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

