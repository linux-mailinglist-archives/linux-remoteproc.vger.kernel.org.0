Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0064843E1
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2019 07:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfHGFjs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Aug 2019 01:39:48 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44366 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfHGFjs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:48 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so38912663plr.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Aug 2019 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VrnrHGkgnpRnail7FR0yXmhVfImCqH1AKJenb0HTXUk=;
        b=Ev0gn7hc6T6RQfu0MYvWNGkczGBxYOX2l3keLxAhbp/IkAeape8SKPwzf++pPc4NyO
         rNbfA/E67xIWJq8YxTaHEvFumAA2Zue/KgD2T3bxbYFTdhJZtMo63qeRVb4A+MDJlgWj
         l+OVYBfA70JtOtHPeXefuSTdZQda/vkdrgqv6JPHwi/u6OTkkQr8Rw0Cx33GlLybvr7Z
         ql44GsVlcF3Mmcwl4Fc96CRAIpLUDuXAML9DupedbLEDWaBcfKmbolVtfPSWnTjP5cLN
         zeYa0KZT2zmv/3Re3I97tweFQ/GPYgGBXGBb4UJtZEIpNbms0dFDhU9IwUHHJTH6g6Bv
         ATDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VrnrHGkgnpRnail7FR0yXmhVfImCqH1AKJenb0HTXUk=;
        b=rDwHZX9oyR6j/DRyQkhp+Iv2/SsZbP2wLiU0JWNNRyK3grGqyhm2mhiTwEpzxOngVo
         OtXS9p3k4lJl1AHA/JJBHJ5hFw4sjVgH3Ymk31/ODMXW1qPGSq47AQe8xzdwUq4Sr4Zx
         4aL/DWG8Zm7m2vd8Cgr8LYfg5UMTvTn3glP/0cgRWkcoyXHt7vli2SHewFpFcrCXw8Zm
         J9bwaGZO7URH9V/2MAbYvaq1kDyhoY0GyO1SpXqtczCTlWBWlYv6HRlZyxHtmPJjp/G7
         iBZjCA6+ORrKqmGtxTlaCHXWr9MixAzjkKBw1Zavjtbm9QsUd2zZXpRy4b5U4Hpvfpcn
         PsxA==
X-Gm-Message-State: APjAAAX+gBFP03Iw34JBLnvL1F2R89eDlwwd6eZ7cGenk75yExIp0PNW
        1cse236RmvJA/lADXgWlzRjA5g==
X-Google-Smtp-Source: APXvYqxO5Mdc9kifnW5FwNDwgTCwI4hDaC9MaKZPp9skC/H9/Pkz8fh1+4h5DM79ZWvXkx2aGxoLbQ==
X-Received: by 2002:a17:902:d890:: with SMTP id b16mr6445015plz.315.1565156387325;
        Tue, 06 Aug 2019 22:39:47 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/9] remoteproc: qcom: Introduce driver to store pil info in IMEM
Date:   Tue,  6 Aug 2019 22:39:34 -0700
Message-Id: <20190807053942.9836-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

A region in IMEM is used to communicate load addresses of remoteproc to
post mortem debug tools. Implement a driver that can be used to store
this information in order to enable these tools to process collected
ramdumps.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/Kconfig         |   3 +
 drivers/remoteproc/Makefile        |   1 +
 drivers/remoteproc/qcom_pil_info.c | 139 +++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h |   6 ++
 4 files changed, 149 insertions(+)
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 28ed306982f7..3984bd16e670 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -85,6 +85,9 @@ config KEYSTONE_REMOTEPROC
 	  It's safe to say N here if you're not interested in the Keystone
 	  DSPs or just want to use a bare minimum kernel.
 
+config QCOM_PIL_INFO
+	tristate
+
 config QCOM_RPROC_COMMON
 	tristate
 
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 00f09e658cb3..c1b46e9033cb 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
+obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
 obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
new file mode 100644
index 000000000000..aa42732016f3
--- /dev/null
+++ b/drivers/remoteproc/qcom_pil_info.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019 Linaro Ltd.
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <linux/slab.h>
+
+struct pil_reloc_entry {
+	char name[8];
+	__le64 base;
+	__le32 size;
+} __packed;
+
+#define PIL_INFO_SIZE	200
+#define PIL_INFO_ENTRIES (PIL_INFO_SIZE / sizeof(struct pil_reloc_entry))
+
+struct pil_reloc {
+	struct device *dev;
+	struct regmap *map;
+	u32 offset;
+	int val_bytes;
+
+	struct pil_reloc_entry entries[PIL_INFO_ENTRIES];
+};
+
+static struct pil_reloc *_reloc;
+static DEFINE_MUTEX(reloc_mutex);
+
+/**
+ * qcom_pil_info_store() - store PIL information of image in IMEM
+ * @image:	name of the image
+ * @base:	base address of the loaded image
+ * @size:	size of the loaded image
+ */
+void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
+{
+	struct pil_reloc_entry *entry;
+	int idx = -1;
+	int i;
+
+	mutex_lock(&reloc_mutex);
+	if (!_reloc)
+		goto unlock;
+
+	for (i = 0; i < PIL_INFO_ENTRIES; i++) {
+		if (!_reloc->entries[i].name[0]) {
+			if (idx == -1)
+				idx = i;
+			continue;
+		}
+
+		if (!strncmp(_reloc->entries[i].name, image, 8)) {
+			idx = i;
+			goto found;
+		}
+	}
+
+	if (idx) {
+		dev_warn(_reloc->dev, "insufficient PIL info slots\n");
+		goto unlock;
+	}
+
+found:
+	entry = &_reloc->entries[idx];
+	stracpy(entry->name, image);
+	entry->base = base;
+	entry->size = size;
+
+	regmap_bulk_write(_reloc->map, _reloc->offset + idx * sizeof(*entry),
+			  entry, sizeof(*entry) / _reloc->val_bytes);
+
+unlock:
+	mutex_unlock(&reloc_mutex);
+}
+EXPORT_SYMBOL_GPL(qcom_pil_info_store);
+
+static int pil_reloc_probe(struct platform_device *pdev)
+{
+	struct pil_reloc *reloc;
+
+	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
+	if (!reloc)
+		return -ENOMEM;
+
+	reloc->dev = &pdev->dev;
+	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(reloc->map))
+		return PTR_ERR(reloc->map);
+
+	if (of_property_read_u32(pdev->dev.of_node, "offset", &reloc->offset))
+		return -EINVAL;
+
+	reloc->val_bytes = regmap_get_val_bytes(reloc->map);
+	if (reloc->val_bytes < 0)
+		return -EINVAL;
+
+	regmap_bulk_write(reloc->map, reloc->offset, reloc->entries,
+			  sizeof(reloc->entries) / reloc->val_bytes);
+
+	mutex_lock(&reloc_mutex);
+	_reloc = reloc;
+	mutex_unlock(&reloc_mutex);
+
+	return 0;
+}
+
+static int pil_reloc_remove(struct platform_device *pdev)
+{
+	mutex_lock(&reloc_mutex);
+	_reloc = NULL;
+	mutex_unlock(&reloc_mutex);
+
+	return 0;
+}
+
+static const struct of_device_id pil_reloc_of_match[] = {
+	{ .compatible = "qcom,pil-reloc-info" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, pil_reloc_of_match);
+
+static struct platform_driver pil_reloc_driver = {
+	.probe = pil_reloc_probe,
+	.remove = pil_reloc_remove,
+	.driver = {
+		.name = "qcom-pil-reloc-info",
+		.of_match_table = pil_reloc_of_match,
+	},
+};
+module_platform_driver(pil_reloc_driver);
+
+MODULE_DESCRIPTION("Qualcomm PIL relocation info");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_pil_info.h b/drivers/remoteproc/qcom_pil_info.h
new file mode 100644
index 000000000000..c30c186b665d
--- /dev/null
+++ b/drivers/remoteproc/qcom_pil_info.h
@@ -0,0 +1,6 @@
+#ifndef __QCOM_PIL_INFO_H__
+#define __QCOM_PIL_INFO_H__
+
+void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
+
+#endif
-- 
2.18.0

