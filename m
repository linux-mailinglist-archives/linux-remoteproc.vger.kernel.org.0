Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240701EAF5E
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jun 2020 21:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgFARz4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jun 2020 13:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbgFARz4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:55:56 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E6DC05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:55:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so172299pjd.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aiaQOah0tkVij5o2XB19f+57g9nxyi9Dr0rKn4GNNWo=;
        b=JAL0xv+J0eDQvIWE9P08dNSkHM11snhLNWBIKigP5OWrAyaQOl2aH7kIY4OQZ65Itw
         txVqAp3KExHzk+qIz30vM58NovUzH03bOLTvfdSdeZlodE/khP02rrMkEZV/eLl56XP0
         1NmD1KVXjuzjkrg/5zNfF9BUTz9vJVkkIJcRJ5XVGjMtsm7XbrBbP/3YKn+m3N++ZtM3
         6yuvhHwsQm8LyueSGhn9P6nyA9bjiWn+eLsYNJUy7rGTqTRKPZ2zV+RMt02baecdKX9m
         KJtzqPdFRzaB/xlrbKEl8YVhHRy1h+XuYLzDOLBNycDzgSiN/BJE7J8TWnyJCGWzuX7p
         TIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aiaQOah0tkVij5o2XB19f+57g9nxyi9Dr0rKn4GNNWo=;
        b=eiTmBUGtxGiSQkq8KkyQs/YfC8VEUSogthKuqjiNlU+INwbC+kYcvCrdmaZHmMzSOk
         K2FlPBy0K+gLjywZ0AnAwj4kkWhFtgfbMEm+WVczv+4qabDRss8IJfCy4sicMYUwBQdI
         F2K4fDOXgZtaLit/qiHLZza5/mNjxYZe43+styjQuBj8psMKpM2Xuve+2OrXLKer7ikn
         wzHmMG7dmZNPd7S64EYOUJw+Yvl5TghDPN+gJJ/3S5bwA6Y3aE3JsCd490DM7DUgFSMg
         4UJZFhLR51SCF290s/GrvvrfhOuxgaItPElypxoxJvize7zCNA/ipsy12Z01FIclvua7
         a+lw==
X-Gm-Message-State: AOAM531MB/wG73a/5QZr+mg8zLz1O77bYW5lhQaUQFpiVvIZz/eZlZFu
        NAu0i2p5enj48hOieZQOKpGhzw==
X-Google-Smtp-Source: ABdhPJwCeQOCr89X+QwuX83o1+B8wMZb1kqOYTtx1WnyqkdzZeWW1Be4A4m7ZXhsCX7hyj9yIQeS8w==
X-Received: by 2002:a17:90a:6706:: with SMTP id n6mr621042pjj.13.1591034155457;
        Mon, 01 Jun 2020 10:55:55 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:55:55 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 01/11] remoteproc: stm32: Decouple rproc from memory translation
Date:   Mon,  1 Jun 2020 11:55:42 -0600
Message-Id: <20200601175552.22286-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
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
index f45b8d597da0..a80733fb08e7 100644
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

