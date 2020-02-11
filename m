Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5F21586FE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Feb 2020 01:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgBKAwO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 10 Feb 2020 19:52:14 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44783 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbgBKAwM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:12 -0500
Received: by mail-pl1-f193.google.com with SMTP id d9so3512895plo.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Feb 2020 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ydVhHnWQ0HLgMTFUIhwtCaw9X4iLwegWCzrRdrC4PNM=;
        b=PZDbyeYwSRrVYyQgLk9W66oGcfWhJofwkWszGstL1FDQWe9K2WvtQxQZeNsaoTkS7i
         WwrjzIyFdnpbxs0XidqutKEGXBIDo+6h4LkGXVGgrOUiTs/3qhNEA7V/j5IpGmsjzQF2
         iOd5uESII0B+orQiQToYaFkSU6a4UtelaUpp82xUCG27bQJaL0LpJ5slk/Tleg5+MyqU
         9UEDYLQ8C5TcQG+k3Dr4EwZHXVfmy9nmLqjDKVhxsXMeh+7zE6rPj5CdB6QWqSirWwe2
         faV0P8cOt+8qa22hTe8pai+iSR7hIrRURWEwRi2a66vPCYNmMg6tIXZTz2yu3V/1CF11
         piqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ydVhHnWQ0HLgMTFUIhwtCaw9X4iLwegWCzrRdrC4PNM=;
        b=QeKUrKBUwCQNhNvuzb7iXYl03ZpEX4ZEXE/YxK/HpD+sTxsIRAt8VKf0hMDNeKKCg/
         gkPC30O+huo4AXQdy6G8CQrfI0ZVjWnNCgPNC6IlMnDrQERbYa2QXbQRSIrdVG2o2VBn
         Ux2/Cc4dtTLKwdG/mwD/uop1yj4IoR7rkPYLN9F1lIhvUPbchiZI/XJ6qkwIBsK22CaS
         hJasuNiTMzfEjHioRb+g8L5voOexZgjpGhDWe4lVHkRACV9QTpsO1v2+BTpunK0iWjnw
         QO9mONoYbtC4q+iCHjfnVJoDSg7yN3E1rXerNRedLqaecKoA1EjZwvrtGSoi89MistB4
         iYPQ==
X-Gm-Message-State: APjAAAU7BHFLubF5V4uNIvO3MuOnqYiL9OfKBoh2pAd68LwEAk0PFvEr
        Er7xLs3a2K4TgWr89zF3+IrUSec9UcU=
X-Google-Smtp-Source: APXvYqyc/Wm2ayFujRaoGE0dqwxi+qHtT6AuZTye4NzuVOryX+KpHk0XmuPp6EsMK+2lrCdXnJGwtg==
X-Received: by 2002:a17:902:b682:: with SMTP id c2mr625237pls.127.1581382331559;
        Mon, 10 Feb 2020 16:52:11 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:10 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 2/8] remoteproc: qcom: Introduce driver to store pil info in IMEM
Date:   Mon, 10 Feb 2020 16:50:53 -0800
Message-Id: <20200211005059.1377279-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes since v2:
- Sorted includes
- Replace use of stracpy (still not landed upstream)
- Fixed error handling in probe
- Return error from store, to allow clients to decide action
- Replace hard coded size with value read from reg property

 drivers/remoteproc/Kconfig         |   3 +
 drivers/remoteproc/Makefile        |   1 +
 drivers/remoteproc/qcom_pil_info.c | 168 +++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h |   8 ++
 4 files changed, 180 insertions(+)
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index de3862c15fcc..20c8194e610e 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -95,6 +95,9 @@ config KEYSTONE_REMOTEPROC
 	  It's safe to say N here if you're not interested in the Keystone
 	  DSPs or just want to use a bare minimum kernel.
 
+config QCOM_PIL_INFO
+	tristate
+
 config QCOM_RPROC_COMMON
 	tristate
 
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index e30a1b15fbac..2ab32bd41b44 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
+obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
 obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
new file mode 100644
index 000000000000..398aeb957f3c
--- /dev/null
+++ b/drivers/remoteproc/qcom_pil_info.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019-2020 Linaro Ltd.
+ */
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define PIL_RELOC_NAME_LEN	8
+
+struct pil_reloc_entry {
+	char name[PIL_RELOC_NAME_LEN];
+	__le64 base;
+	__le32 size;
+} __packed;
+
+struct pil_reloc {
+	struct device *dev;
+	struct regmap *map;
+	size_t offset;
+	size_t num_entries;
+	int val_bytes;
+
+	struct pil_reloc_entry entries[];
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
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
+{
+	struct pil_reloc_entry *entry;
+	int idx = -1;
+	int ret;
+	int i;
+
+	mutex_lock(&reloc_mutex);
+	for (i = 0; i < _reloc->num_entries; i++) {
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
+	if (idx == -1) {
+		dev_warn(_reloc->dev, "insufficient PIL info slots\n");
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+found:
+	entry = &_reloc->entries[idx];
+	strscpy(entry->name, image, ARRAY_SIZE(entry->name));
+	entry->base = base;
+	entry->size = size;
+
+	ret = regmap_bulk_write(_reloc->map,
+				_reloc->offset + idx * sizeof(*entry),
+				entry, sizeof(*entry) / _reloc->val_bytes);
+unlock:
+	mutex_unlock(&reloc_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_pil_info_store);
+
+/**
+ * qcom_pil_info_available() - query if the pil info is probed
+ *
+ * Return: boolean indicating if the pil info device is probed
+ */
+bool qcom_pil_info_available(void)
+{
+	return !!_reloc;
+}
+EXPORT_SYMBOL_GPL(qcom_pil_info_available);
+
+static int pil_reloc_probe(struct platform_device *pdev)
+{
+	unsigned int num_entries;
+	struct pil_reloc *reloc;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	num_entries = resource_size(res) / sizeof(struct pil_reloc_entry);
+
+	reloc = devm_kzalloc(&pdev->dev,
+			     struct_size(reloc, entries, num_entries),
+			     GFP_KERNEL);
+	if (!reloc)
+		return -ENOMEM;
+
+	reloc->dev = &pdev->dev;
+	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(reloc->map))
+		return PTR_ERR(reloc->map);
+
+	reloc->offset = res->start;
+	reloc->num_entries = num_entries;
+
+	reloc->val_bytes = regmap_get_val_bytes(reloc->map);
+	if (reloc->val_bytes < 0)
+		return -EINVAL;
+
+	ret = regmap_bulk_write(reloc->map, reloc->offset, reloc->entries,
+				reloc->num_entries *
+				sizeof(struct pil_reloc_entry) /
+				reloc->val_bytes);
+	if (ret < 0)
+		return ret;
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
index 000000000000..93aaaca8aed2
--- /dev/null
+++ b/drivers/remoteproc/qcom_pil_info.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __QCOM_PIL_INFO_H__
+#define __QCOM_PIL_INFO_H__
+
+int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
+bool qcom_pil_info_available(void);
+
+#endif
-- 
2.24.0

