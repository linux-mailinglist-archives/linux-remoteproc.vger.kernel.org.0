Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400BC217A6C
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729248AbgGGVbR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgGGVbQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:16 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445D6C061755
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f16so238827pjt.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
        b=tcnXdAvzX03mqCigv8Jy421RijVdkg0ecDvQfyDHz2jEEBlnhbfGivOaU/+2s0Pgmn
         3tsdKfEC8PhWGEvoDo/I6w9YedSWGtghsgyLEVpOKCtaBncu3pYmX1Z5yYuxYCYNOtSL
         uQEGUnCE3qyhanG0SciQRhdQq+J8NodcGwvE9gKvYIkPy7sfRa7Mo1p+NV6V0WtJJN4F
         /Wq/2FO5r114g1JCNjdWfNjqp40FwSjTf1wX7uNznIqmQeEvtY1IxdeFAjJo7TBSI1Tn
         dIDBHMmf7HY3He0o/5ZMIImkvc/Hv5tJdOlpu8GoHrW0rg/ctMq11cGahf7RfgFLai3Q
         WKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
        b=n4N49TaJXe1sRWk1IiKiuo6D9K4mzTOhOhoOV7v2uw38NpedMkqgWBf2tK5de0yQAS
         H5zwK0eIVjp2C8rzwDLz4w1Md3ruPDjRVhzw0hS3WwV/fsMJmUrYZ6oHWENL6R/B5DKR
         YEUHf+3kHV4gtLmZT5/9cldb6llCjC4oe2JERoyafmqqImD7hXb7R32pII982OO+YRhy
         JlB9C/KK5wZqJZ8OrTDOZidNgSxDxxwU1BAWjYSuHtWabpepknLF3KNXJMMB0FesQHkN
         t193pfXqSgwQfl60hr3qRZjggZr4OzZ07411MclrPjCiiIkY1ytGArbUGluZB+0xJuKa
         JFcw==
X-Gm-Message-State: AOAM533dMXzQlk+8SLkz5ph1B3m2TZ978BTHucqj7LMR6VniSEPJWadD
        TBaoBkOWVld27a6Q0iHTt3NCnQ==
X-Google-Smtp-Source: ABdhPJzxps+cB0xsIwcYtX4mckhbPISXHLhDLBza/r3J8rLtrIUt/l/0xypzOFeCzqE7blRJ7NQWVw==
X-Received: by 2002:a17:90a:6948:: with SMTP id j8mr5811255pjm.45.1594157475841;
        Tue, 07 Jul 2020 14:31:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:15 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 01/11] remoteproc: stm32: Decouple rproc from memory translation
Date:   Tue,  7 Jul 2020 15:31:02 -0600
Message-Id: <20200707213112.928383-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove the remote processor from the process of parsing the memory
ranges since there is no correlation between them.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 062797a447c6..2973ba201c1d 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -128,10 +128,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
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
@@ -607,7 +607,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
-- 
2.25.1

