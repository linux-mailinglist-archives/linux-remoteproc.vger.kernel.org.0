Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F243B191C69
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgCXWDg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41706 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXWDg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id b1so118808pgm.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YreXIxKLQt7lYPztJKiRLUpPxJWYbnz56N0G5fHSxA0=;
        b=dOy8dEbSsYr6tJapR3emTDhwQQGVP6sPYKuCLhsoxdiSOWXfMmj5P0tSOA5RDuImDQ
         N76Mx/QnIH21hXidv0iCFeaterM4mpb+vux9IS7s3uXHFxztX/nbqr9HcPZPAJsS8eZS
         qmK2DZZ7ev2M3iSkRAZ/M0xY3a48kbydBpBnAXtE22v9ghBu8QCGje6bTYX1kPWbm1+P
         R1iRagz02dLFOvGxaLOQXwLJW6ml7m6jL1DhRrOtf5Vzkcqf7PCcyKbg8fbOxY11QwX6
         0NLq0Ohdgyb7sc4qOWNjGhHHVdCYIV8irRpBaDv1BlkCCBKJpJTy4BVgzoxZ/keN1tV0
         VM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YreXIxKLQt7lYPztJKiRLUpPxJWYbnz56N0G5fHSxA0=;
        b=bv79bTlTIOTacL04Q2H6hJ6Usj4CluKF0GlxNJpOYpDz9zff+/E6NVZeOqzgRoDJDp
         vnx9HU1ykvFVbJ75kdXXER3guIfdJ9OZm5JregUK54YJ9GVQ6iXQLpcuTAgpcGHr2xfe
         LnK5fhfwRf8As1BzVUDi6aH12GEgorbquVd6L4VXiosUBFLMJUN0XxKgkWHVqkq9DPAn
         qEt/PMpczGKfyFf6yGeFeS3W6+iaPrfbL6f445DEFeYJjvHpPmOFhbpuLVyd5kfcAaRZ
         i7otahDFvGSJVU/eApMNbQfmYOFPPohQ4j2nEo/0kNlfzXN69rSS1TLCWVZHzW7LyfOh
         f81g==
X-Gm-Message-State: ANhLgQ3p4NopkBXDkejNQwaT8OlbpGwPqWe6uXG4uNflhq6r5Z66z5SC
        f2oYe7ql/SOp28T1KMkZ44jA7w==
X-Google-Smtp-Source: ADFU+vvaf+l/TTu1M9f72f5grbtLyaxHMuFlxlNV7LWHBnvnsdJxmX4WxrWjI9hiUIff7ZJSqpZ9jw==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr28737773pgd.357.1585087414269;
        Tue, 24 Mar 2020 15:03:34 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:33 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 01/11] remoteproc: stm32: Decouple rproc from memory translation
Date:   Tue, 24 Mar 2020 16:03:19 -0600
Message-Id: <20200324220329.15523-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove the remote processor from the process of parsing the memory
ranges since there is no correlation between them.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a18f88044111..cde4b1a56381 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_of_memory_translations(struct rproc *rproc)
+static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
+					      struct stm32_rproc *ddata)
 {
-	struct device *parent, *dev = rproc->dev.parent;
-	struct stm32_rproc *ddata = rproc->priv;
+	struct device *parent, *dev = &pdev->dev;
 	struct device_node *np;
 	struct stm32_rproc_mem *p_mems;
 	struct stm32_rproc_mem_ranges *mem_range;
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
-- 
2.20.1

