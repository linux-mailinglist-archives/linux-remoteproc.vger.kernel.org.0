Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1581B1A06
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Apr 2020 01:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgDTXQF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Apr 2020 19:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726089AbgDTXQE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 19:16:04 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0ABC061A0F
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 16:16:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so4523436plr.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 16:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NTEL7VXRuB9x3J7iFIoyLEPVb//XmBZtBUO3PJZONRE=;
        b=Blmo1t2hNA5Nhl8IZ6xC6kLN7I+lNYYXK0HfbLRhutS5ju4VODLBg0UBXqvwCqX+qk
         pog+se1krB7PNztpQiESXBRCogbWO0NNGRWLsxxJvrLf33lYfVw6W9ERJaOIL4fah1md
         B3OHfkrX8m/AeD6MfDWpheDC335+pDKdx0NdbPnvHESilF86+NimM1sMe0GQoHrp+blg
         JwIoMAVJtoykdRTYkJQO/orU9cSZOoxmHUxbt/aGIyiPX8MqXjIhrwg9Zt7CZK6BRaQH
         S2V7lCYD+RouKjUyWyosTcXPI4IiOjcUJpVF/GjNecvg5j0dcYYv0n14ey5PsruVJnCY
         6TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTEL7VXRuB9x3J7iFIoyLEPVb//XmBZtBUO3PJZONRE=;
        b=WS/7ZKlPjDX6w6s4bFzUtYxDrE2yE5jLmNLc9GYhyt8W5d1tzkM0VUFFmlleqq3i3g
         SnMrpySQr+4+Qx5WabxnjbfdLXyDYZ2GwumRlmZou+ohVbStul9h6c0KN4Ttkp/T1i90
         w9aMrbeHrVeBL/vjnDpP7FD2vhnu1cWOB4Qf5p4d3JvCruV+z2MBT+Z5FYLWyMkiC4cA
         8s6NWwS430PVZVh71LxX9IJ1gRiaGQL2STcuSVHCs5OiPiy6jVmZA0h1IYwnYEIRiWzJ
         kDkJY9lkeZS3y2jp2iSKvD2nSgxoayX7b7LRV0XqqXODObOSUkxCfVebRrPuIENHW2Qq
         W+JQ==
X-Gm-Message-State: AGi0PuakgoAGr5yklqbh73jkc1L7kGTb4f2ryOOfirlFUrnj/LWDzF+G
        nY+8OuBKeI+4RJ5dAMSKVGIb4w==
X-Google-Smtp-Source: APiQypKTEDjpn7IQlVgv8ilHeqpZZwQjxIX0T8CCeJO73IN9hTAqrePdijKOsMIjIyyMhF9c9n6dkg==
X-Received: by 2002:a17:902:d303:: with SMTP id b3mr3324441plc.12.1587424564335;
        Mon, 20 Apr 2020 16:16:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l15sm435354pgk.59.2020.04.20.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 16:16:03 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] remoteproc: Use kstrdup_const() rather than kstrdup()
Date:   Mon, 20 Apr 2020 17:15:58 -0600
Message-Id: <20200420231601.16781-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200420231601.16781-1-mathieu.poirier@linaro.org>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

For cases where @firmware is declared "const char *", use function
kstrdup_const() to avoid needlessly creating another copy on the
heap.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++----
 include/linux/remoteproc.h           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d9e6949e4ac1..db8a15fc1e4a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1996,7 +1996,7 @@ static void rproc_type_release(struct device *dev)
 	if (rproc->index >= 0)
 		ida_simple_remove(&rproc_dev_index, rproc->index);
 
-	kfree(rproc->firmware);
+	kfree_const(rproc->firmware);
 	kfree(rproc->ops);
 	kfree(rproc);
 }
@@ -2009,7 +2009,7 @@ static const struct device_type rproc_type = {
 static int rproc_alloc_firmware(struct rproc *rproc,
 				const char *name, const char *firmware)
 {
-	char *p;
+	const char *p;
 
 	if (!firmware)
 		/*
@@ -2018,7 +2018,7 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 		 */
 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
 	else
-		p = kstrdup(firmware, GFP_KERNEL);
+		p = kstrdup_const(firmware, GFP_KERNEL);
 
 	if (!p)
 		return -ENOMEM;
@@ -2122,7 +2122,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	return rproc;
 
 free_firmware:
-	kfree(rproc->firmware);
+	kfree_const(rproc->firmware);
 free_rproc:
 	kfree(rproc);
 	return NULL;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 0547676479d3..800b4f09dc98 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -489,7 +489,7 @@ struct rproc {
 	struct list_head node;
 	struct iommu_domain *domain;
 	const char *name;
-	char *firmware;
+	const char *firmware;
 	void *priv;
 	struct rproc_ops *ops;
 	struct device dev;
-- 
2.20.1

