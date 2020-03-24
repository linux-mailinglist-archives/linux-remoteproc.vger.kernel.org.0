Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FB2191C6B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgCXWDi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33680 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbgCXWDi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id j1so7687pfe.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9sGi2cvVt9XWEoI9j8B7I22a41zUaQ7iMJOCZgIJecU=;
        b=Krh9y5zhPbizuaUZ2brUYxBZOcZY6JyhvHMM+sPGOUNnSdDEtAZlblkgC4WGFCqclM
         /SKQjmDJsxYwNoFfCC9PbUTL/tcMAi8wgjADu95Ip3a5nriX243soerjCOkRmc+N6/A1
         nlRWhQBeEXjYQeHOnMoYe5VC2kAR73uSY7m5nrp7Ft5oNE0LpR8kGLJuJA/fpUWnIgDU
         bCMgNsnKKPm86POMPjjmpcZsuFsv0szYWwNQnpPQz4wdRpnEcKgzjuJ3x5+FwebNKSz0
         ZJHvcYJLJF2wb7ZPtDG8a2scyEa2Rgk3WpnrGINHrwB2BkfPByhTgF/eKm+NNdugy57m
         GsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9sGi2cvVt9XWEoI9j8B7I22a41zUaQ7iMJOCZgIJecU=;
        b=JtjZcR7PU81auqhrmk4/alJ/u7bK22UuNrit1oAOlMSDaKVGn6E7W6Dc0nRK5BX2Pk
         e+u/ViTQJaR+xdgC4rsY22M1G1cqbhDdIuMHluE7VrN9bJ0HKTNqmYMT0RRSswwMkArv
         N7URDH9LODE+EOiAR72YnTGfXcjOOVoaw8lRX1IqOnimrcTYnjAzMVduzYRBtFE2bDhb
         Sk0V6rdFqzUXMghMY6ITbnEO4rC2wG1eWwRM5a34kjGJabCdgXBpJ0NGXRVhwcf4f9Rc
         PnGsaY83C36V3z1b1mpqUWGDHtSo0cRkfZL73fOhW1k3l5GCt/G8Bw+BJ3FrBMV+0HcQ
         gKww==
X-Gm-Message-State: ANhLgQ3CI4eyXV4qGDzZhrTEXdk/9Rl6KLfC0JjzNeJtin0+r4SMgYyp
        TcA2/QKKb9E2zYQAz6dRl1CKcw==
X-Google-Smtp-Source: ADFU+vsP3EF1jMVMtSXr/qTlQ4qVQCPIyQ+gdetAqDfqQk0+R39hx4XXxcDTa6hx38R+jPzUnP6b8A==
X-Received: by 2002:a63:a351:: with SMTP id v17mr28737870pgn.319.1585087416862;
        Tue, 24 Mar 2020 15:03:36 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:36 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 03/11] remoteproc: stm32: Decouple rproc from DT parsing
Date:   Tue, 24 Mar 2020 16:03:21 -0600
Message-Id: <20200324220329.15523-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove the remote processor from the process of parsing the device tree
since (1) there is no correlation between them and (2) to use the
information that was gathered to make a decision on whether to
synchronise with the MCU or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 38 +++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0c1f0b84e057..ca60c917e218 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
 	return err;
 }
 
-static int stm32_rproc_parse_dt(struct platform_device *pdev)
+static int stm32_rproc_parse_dt(struct platform_device *pdev,
+				struct stm32_rproc *ddata, bool *auto_boot)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct stm32_rproc *ddata = rproc->priv;
 	struct stm32_syscon tz;
 	unsigned int tzen;
 	int err, irq;
@@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	err = regmap_read(tz.map, tz.reg, &tzen);
 	if (err) {
-		dev_err(&rproc->dev, "failed to read tzen\n");
+		dev_err(dev, "failed to read tzen\n");
 		return err;
 	}
 	ddata->secured_soc = tzen & tz.mask;
@@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 	if (err)
 		dev_warn(dev, "failed to get pdds\n");
 
-	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
+	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
 	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
@@ -616,18 +615,29 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	bool auto_boot = false;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
-	if (!rproc)
+	ddata = kzalloc(sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
 		return -ENOMEM;
 
+	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
+	if (ret)
+		goto free_ddata;
+
+	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
+	if (!rproc) {
+		ret = -ENOMEM;
+		goto free_ddata;
+	}
+
+	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
-	ddata = rproc->priv;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
@@ -635,20 +645,20 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
-	platform_set_drvdata(pdev, rproc);
+	memcpy(rproc->priv, ddata, sizeof(*ddata));
 
-	ret = stm32_rproc_parse_dt(pdev);
-	if (ret)
-		goto free_wkq;
+	platform_set_drvdata(pdev, rproc);
 
 	ret = stm32_rproc_request_mbox(rproc);
 	if (ret)
-		goto free_rproc;
+		goto free_wkq;
 
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_mb;
 
+	kfree(ddata);
+
 	return 0;
 
 free_mb:
@@ -661,6 +671,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		device_init_wakeup(dev, false);
 	}
 	rproc_free(rproc);
+free_ddata:
+	kfree(ddata);
 	return ret;
 }
 
-- 
2.20.1

