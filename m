Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC610191C23
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgCXVqU (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:20 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51835 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbgCXVqU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:20 -0400
Received: by mail-pj1-f68.google.com with SMTP id w9so120490pjh.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9b1+nNVbR3sCyMduzopiYh9Dkhm8/+7NJkp3fZXzhTU=;
        b=qhK1pmGESXCBcbwtx8gy6DGEPSkCDqNfNU7GDFfza/8+V0ckw+Oda4/p/ZICr0qt6G
         8m+8fKuzcH//MNCVLjmORbF0frVmBAdBcI0aFUNLZZhxFvpyYSrlGrdm7+K3KHhp+p62
         vHZOYEwueAaK9msnttS9umiLHJ5aWDnDYHLm40DIpFbedTztkr8UAllcpEgPTQPouBhs
         jyMjcCiqMkPiT4U8e3YeRsBJfDtznf8OOPNC80YCfmElsuau9S3oxP4+OjbkFx+P+B/L
         hWnewTpXRf5BDPeCy8lv9ue7I6O9MxtLjreijf/WSU6/QYjZ+jvrs5u3rxmYrCL91gfe
         sRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9b1+nNVbR3sCyMduzopiYh9Dkhm8/+7NJkp3fZXzhTU=;
        b=BcL6IxDj3c8Vojz0kt3hE+UR5g0UoOh1PCoD7lo9UWHy7QElCcT4UrEsUnIf5cBqjv
         B1qW9rnxl/ivV4Lc55GVa3iQHaVCU1AMh7O0/94sPIQR7gGtQtBOCr2ZW+cF7eBVNPn3
         7jQ5gxJTV1nOQXSVc08Iv5GXztyp5jtwanDwH2+veKrlNueL6ndvipH4/3L65oB3aZB3
         5WAX0kTyq0dRZaEzvXU250e6G59vBDBo7QldVGX0alTCtve+0w8v0URvGGq8uzxFsoKH
         IUuXnUfh8/6OlCRmkFv+hzF7dpB/yc88VRa//ugcN27Nx0dVQvNpnwSXzUmoF5VEoIlJ
         c2qw==
X-Gm-Message-State: ANhLgQ2vN5Pmk9WSCGQzV2iqdMZgYpR4YRpB3xB/XSmgQRD6dpZzD4cg
        riPM9wvckGLPOjCJt+NPpRbpeg==
X-Google-Smtp-Source: ADFU+vuabZXdchfF8VWJJvUtTWkf8e4E0tGVizmq3qyPuLbqozcSBx4REc/mHqHtURwCIxPNIkTssA==
X-Received: by 2002:a17:90a:252b:: with SMTP id j40mr7719175pje.189.1585086379462;
        Tue, 24 Mar 2020 14:46:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 13/17] remoteproc: Introducting new functions to start and stop an MCU
Date:   Tue, 24 Mar 2020 15:45:59 -0600
Message-Id: <20200324214603.14979-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add new functions to replace direct calling of rproc->ops->start() and
rproc->ops->stop().  That way different behaviour can be played out
when booting an MCU or synchronising with it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     |  6 +++---
 drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 488723fcb142..d3c4d7e6ca25 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1330,7 +1330,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	}
 
 	/* power up the remote processor */
-	ret = rproc->ops->start(rproc);
+	ret = rproc_start_hw(rproc);
 	if (ret) {
 		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
 		goto unprepare_subdevices;
@@ -1351,7 +1351,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 stop_rproc:
-	rproc->ops->stop(rproc);
+	rproc_stop_hw(rproc);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
@@ -1485,7 +1485,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc->table_ptr = rproc->cached_table;
 
 	/* power off the remote processor */
-	ret = rproc->ops->stop(rproc);
+	ret = rproc_stop_hw(rproc);
 	if (ret) {
 		dev_err(dev, "can't stop rproc: %d\n", ret);
 		return ret;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 5f711ceb97ba..7ca23d46dfd4 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -160,4 +160,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 	return NULL;
 }
 
+static inline int rproc_start_hw(struct rproc *rproc)
+{
+	RPROC_OPS_HELPER(start, rproc);
+	return -EINVAL;
+}
+
+static inline int rproc_stop_hw(struct rproc *rproc)
+{
+	RPROC_OPS_HELPER(stop, rproc);
+	return -EINVAL;
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
-- 
2.20.1

