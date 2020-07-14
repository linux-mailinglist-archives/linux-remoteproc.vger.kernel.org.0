Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920D321FE03
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 22:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgGNUEu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 16:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729383AbgGNUEt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 16:04:49 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878B2C061794
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:04:49 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x72so8045080pfc.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
        b=ZEGVgZAw1WowmoNs4YtaxMkX8J3P+N+cEDsqj2D/XXL3ERgqiuUzqEElWdgsEZ8j36
         zHiG2HGWu2JXaLB2A3xNpmyRyfw9+5DVk5xkuFncPHh6GsecjkGYzKDfoCvsr7NzvB6h
         AhWrjIM3vSmnTLXNiwYgH/HgZ4wI2CKFwMcHeck9ekgqt0DwiG6WhEof9haEdg+XSFw2
         0Rr4G9EehYJ+TH3AYiZg+AnU3lSoARmcMnC4mVbSI0QSu4BzFs7rUQhXe8AVmElKIIKs
         /JNNwqja46P/E1NAbtbiJ06pPbhDQ+wB0xLBjU3yChF2DeQpQ/So9otApPKrYdSceMxq
         bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
        b=WNnZdSezLjzrjjhuYxgq/hp35fa7DGbW/FsojWXy8kJBwylpGsfuBAZuOYIRElXqbn
         V9kC1IPdfVXtV8r3ENh6eZfw1/52BwXtIBqiZUcg0ThcMgJwsw/VMEDdvGNgKjomeUrH
         +0ZkuJcjU0rx6x+diXBLhEbl+KgM339aZYQO7QWNF+MsML8ERNSh0A2EKZZT27sWrIxa
         kApB7S3v7nGG8EtgUqVclFz5O8pvMMpeD+rMKWyBkhewcVmXFbzRytQ7DiIampiJDvYe
         8xyqclErRiR+z1m625D6O01TUGzHd0e6ayXYbk0EIKEzXTH743olTTu9X1QQLaBIusNH
         KQ0Q==
X-Gm-Message-State: AOAM531WSM0rmQpUV+Orj3uN+WTTgnnkFJQ9al3naXRNpiKZqpgPxjCI
        OYjj4MKdXJj8XJwFyWggB2JRFQ==
X-Google-Smtp-Source: ABdhPJz4I703eNXUyqpSyP9X2805DzU2nM9L+TbgHrqWROsz+GKA0ZlPW9Yew1EIKYBdjAzccbF2Sw==
X-Received: by 2002:a63:c447:: with SMTP id m7mr4654907pgg.118.1594757089129;
        Tue, 14 Jul 2020 13:04:49 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:04:48 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 01/11] remoteproc: stm32: Decouple rproc from memory translation
Date:   Tue, 14 Jul 2020 14:04:35 -0600
Message-Id: <20200714200445.1427257-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
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

