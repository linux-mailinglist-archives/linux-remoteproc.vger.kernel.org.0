Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341B52D77E4
	for <lists+linux-remoteproc@lfdr.de>; Fri, 11 Dec 2020 15:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406252AbgLKOcJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 11 Dec 2020 09:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406243AbgLKOcE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Dec 2020 09:32:04 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDFBC06138C
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 06:30:46 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u18so13576332lfd.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 06:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C1SR8RrxOc74lsMmszdu5piQ6864h8pZBYqiJVBluj4=;
        b=cP5FweuWQW4jWJFUOEYzkaeaIE0uuS5uRoDi1M6DG/Z/A/wqXB1gW7LqwfjyH80kzN
         8l3ZMTxA6w9CyZiFmP8lyTMWjMRpQ/GxtRFZP7F9C+YczNRJtrZV3+pea50FxiOwTEkW
         KReElXdk4kgKObNkx7TYTHxevsOx8krJyweDA49nbNvUoUWDJwwtFlQGRaxM5tB7/PMh
         1o0vi/hbuR3oRIaDwUdIujKLzHLQBpjoYEhYUrkrgdeymoPrp3Bppf6MsAQm4Qv0qz/+
         LoXyUHgdrZa2TN0VFZ5cIByUn9Scc8L2U+YRqWIS0N2oABi3ksfMl3wRkKlm54jRuVV+
         ZucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1SR8RrxOc74lsMmszdu5piQ6864h8pZBYqiJVBluj4=;
        b=faBELbUhE9Ha7WKTvbb3y94yVrG+TE+Pdk07QfufQSkmMW/0jnKfkzy8TRzMKcNZow
         xq4lpxNcxjg4W7VxQM48VR27UsqYTixh6xVq5CWA2PMwoo1Y5vO0lbpW/LaEuiFZEoiE
         grl5JzCh9xy5BvYy4zUUdArHP17boDLUULZBD808Rr1rXy6b4N5IdyztCOqBqc7N3J5A
         QnwFpkWB/OlwDEmh0Ga4xpzVQET3c7c/4mroRvdDlO2835yCRKKtpWeQl83i0VSv+tnK
         gubsLKvi3KxQReDAkRvJWjKbG1Icj/nB0MTgYeO73AQW2EvpwpXIQjLNRYmFCmZNXpGl
         dMNA==
X-Gm-Message-State: AOAM530rxmwJ9g9Y9hr0dr8nY5gt8DrSzv0Jqhf+cmfaOw5JbGLR1N0j
        JNyzHrRFFCzkBiktCjD5Bat7wg==
X-Google-Smtp-Source: ABdhPJy7KEjywjpILVA4IXsjsu2zM3tu9mGBwhh3GfDtlrA83on9M8JTIe+5xtOPl6N44e8MLWYTCA==
X-Received: by 2002:a19:c8cc:: with SMTP id y195mr1120505lff.352.1607697044656;
        Fri, 11 Dec 2020 06:30:44 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:44 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 2/5] remoteproc: pru: Add APIs to get and put the PRU cores
Date:   Fri, 11 Dec 2020 15:29:30 +0100
Message-Id: <20201211142933.25784-3-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add two new APIs, pru_rproc_get() and pru_rproc_put(), to the PRU
driver to allow client drivers to acquire and release the remoteproc
device associated with a PRU core. The PRU cores are treated as
resources with only one client owning it at a time.

The pru_rproc_get() function returns the rproc handle corresponding
to a PRU core identified by the device tree "prus" property under
the client node. The pru_rproc_put() is the complementary function
to pru_rproc_get().

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 125 ++++++++++++++++++++++++++++++++-
 include/linux/pruss.h          |  56 +++++++++++++++
 2 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/pruss.h

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919d76b3..cc2e585778b1 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
+#include <linux/pruss.h>
 #include <linux/pruss_driver.h>
 #include <linux/remoteproc.h>
 
@@ -111,6 +112,8 @@ struct pru_private_data {
  * @rproc: remoteproc pointer for this PRU core
  * @data: PRU core specific data
  * @mem_regions: data for each of the PRU memory regions
+ * @client_np: client device node
+ * @lock: mutex to protect client usage
  * @fw_name: name of firmware image used during loading
  * @mapped_irq: virtual interrupt numbers of created fw specific mapping
  * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
@@ -126,6 +129,8 @@ struct pru_rproc {
 	struct rproc *rproc;
 	const struct pru_private_data *data;
 	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
+	struct device_node *client_np;
+	struct mutex lock; /* client access lock */
 	const char *fw_name;
 	unsigned int *mapped_irq;
 	struct pru_irq_rsc *pru_interrupt_map;
@@ -146,6 +151,119 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
 	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
 }
 
+static struct rproc *__pru_rproc_get(struct device_node *np, int index)
+{
+	struct device_node *rproc_np = NULL;
+	struct platform_device *pdev;
+	struct rproc *rproc;
+
+	rproc_np = of_parse_phandle(np, "prus", index);
+	if (!rproc_np || !of_device_is_available(rproc_np))
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(rproc_np);
+	of_node_put(rproc_np);
+
+	if (!pdev)
+		/* probably PRU not yet probed */
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* make sure it is PRU rproc */
+	if (!is_pru_rproc(&pdev->dev)) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	rproc = platform_get_drvdata(pdev);
+	put_device(&pdev->dev);
+	if (!rproc)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(&rproc->dev);
+
+	return rproc;
+}
+
+/**
+ * pru_rproc_get() - get the PRU rproc instance from a device node
+ * @np: the user/client device node
+ * @index: index to use for the prus property
+ * @pru_id: optional pointer to return the PRU remoteproc processor id
+ *
+ * This function looks through a client device node's "prus" property at index
+ * @index and returns the rproc handle for a valid PRU remote processor if
+ * found. The function allows only one user to own the PRU rproc resource at
+ * a time. Caller must call pru_rproc_put() when done with using the rproc,
+ * not required if the function returns a failure.
+ *
+ * When optional @pru_id pointer is passed the PRU remoteproc processor id is
+ * returned.
+ *
+ * Return: rproc handle on success, and an ERR_PTR on failure using one
+ * of the following error values
+ *    -ENODEV if device is not found
+ *    -EBUSY if PRU is already acquired by anyone
+ *    -EPROBE_DEFER is PRU device is not probed yet
+ */
+struct rproc *pru_rproc_get(struct device_node *np, int index,
+			    enum pruss_pru_id *pru_id)
+{
+	struct rproc *rproc;
+	struct pru_rproc *pru;
+	struct device *dev;
+
+	rproc = __pru_rproc_get(np, index);
+	if (IS_ERR(rproc))
+		return rproc;
+
+	pru = rproc->priv;
+	dev = &rproc->dev;
+
+	mutex_lock(&pru->lock);
+
+	if (pru->client_np) {
+		mutex_unlock(&pru->lock);
+		put_device(dev);
+		return ERR_PTR(-EBUSY);
+	}
+
+	pru->client_np = np;
+
+	mutex_unlock(&pru->lock);
+
+	if (pru_id)
+		*pru_id = pru->id;
+
+	return rproc;
+}
+EXPORT_SYMBOL_GPL(pru_rproc_get);
+
+/**
+ * pru_rproc_put() - release the PRU rproc resource
+ * @rproc: the rproc resource to release
+ *
+ * Releases the PRU rproc resource and makes it available to other
+ * users.
+ */
+void pru_rproc_put(struct rproc *rproc)
+{
+	struct pru_rproc *pru;
+
+	if (IS_ERR_OR_NULL(rproc) || !is_pru_rproc(rproc->dev.parent))
+		return;
+
+	pru = rproc->priv;
+	if (!pru->client_np)
+		return;
+
+	mutex_lock(&pru->lock);
+	pru->client_np = NULL;
+	mutex_unlock(&pru->lock);
+
+	put_device(&rproc->dev);
+}
+EXPORT_SYMBOL_GPL(pru_rproc_put);
+
 static inline u32 pru_debug_read_reg(struct pru_rproc *pru, unsigned int reg)
 {
 	return readl_relaxed(pru->mem_regions[PRU_IOMEM_DEBUG].va + reg);
@@ -706,14 +824,14 @@ static int pru_rproc_set_id(struct pru_rproc *pru)
 	case RTU0_IRAM_ADDR_MASK:
 		fallthrough;
 	case PRU0_IRAM_ADDR_MASK:
-		pru->id = 0;
+		pru->id = PRUSS_PRU0;
 		break;
 	case TX_PRU1_IRAM_ADDR_MASK:
 		fallthrough;
 	case RTU1_IRAM_ADDR_MASK:
 		fallthrough;
 	case PRU1_IRAM_ADDR_MASK:
-		pru->id = 1;
+		pru->id = PRUSS_PRU1;
 		break;
 	default:
 		ret = -EINVAL;
@@ -775,6 +893,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	pru->pruss = platform_get_drvdata(ppdev);
 	pru->rproc = rproc;
 	pru->fw_name = fw_name;
+	mutex_init(&pru->lock);
 
 	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
@@ -859,7 +978,7 @@ MODULE_DEVICE_TABLE(of, pru_rproc_match);
 
 static struct platform_driver pru_rproc_driver = {
 	.driver = {
-		.name   = "pru-rproc",
+		.name = PRU_RPROC_DRVNAME,
 		.of_match_table = pru_rproc_match,
 		.suppress_bind_attrs = true,
 	},
diff --git a/include/linux/pruss.h b/include/linux/pruss.h
new file mode 100644
index 000000000000..43cb5c2eed08
--- /dev/null
+++ b/include/linux/pruss.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/**
+ * PRU-ICSS Subsystem user interfaces
+ *
+ * Copyright (C) 2015-2020 Texas Instruments Incorporated - http://www.ti.com
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#ifndef __LINUX_PRUSS_H
+#define __LINUX_PRUSS_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#define PRU_RPROC_DRVNAME "pru-rproc"
+
+/*
+ * enum pruss_pru_id - PRU core identifiers
+ */
+enum pruss_pru_id {
+	PRUSS_PRU0 = 0,
+	PRUSS_PRU1,
+	PRUSS_NUM_PRUS,
+};
+
+struct device_node;
+
+#if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
+
+struct rproc *pru_rproc_get(struct device_node *np, int index,
+			    enum pruss_pru_id *pru_id);
+void pru_rproc_put(struct rproc *rproc);
+
+#else
+
+static inline struct rproc *
+pru_rproc_get(struct device_node *np, int index, enum pruss_pru_id *pru_id)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline void pru_rproc_put(struct rproc *rproc) { }
+
+#endif /* CONFIG_PRU_REMOTEPROC */
+
+static inline bool is_pru_rproc(struct device *dev)
+{
+	const char *drv_name = dev_driver_string(dev);
+
+	if (strncmp(drv_name, PRU_RPROC_DRVNAME, sizeof(PRU_RPROC_DRVNAME)))
+		return false;
+
+	return true;
+}
+
+#endif /* __LINUX_PRUSS_H */
-- 
2.29.0

