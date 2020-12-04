Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FBA2CF57D
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Dec 2020 21:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbgLDUUO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Dec 2020 15:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgLDUUO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 15:20:14 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FA1C09424C
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Dec 2020 12:18:25 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id b4so1769551lfo.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Dec 2020 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wMxC+IvyWBR942e55z/Z2GZyYcRalCFkkkHaCkUZH8U=;
        b=Wxd92WLg6xh09PWwhvh0Cg6ePBvFSIydmz64tQfxNVCufME5Tu2WsbRjTo6yKG2Yxe
         WtvJa2fMVDcSnIXlMPS56hbEkjy3+HGs9xwdM/WH/LXc5TUNkX5mbfzJARHG5jScPM2d
         E6SHuoINcexSQnqiXH7sMYZO8tXnTB9WeCumA26K4AD+/93yU5GjVXcLHy2N/SzuwlNT
         GgehMyINZ4CGIqeVD70kLezRR5bvuaL+zz315oVKoeUfzGa7j9WHkOVu2Tt2+xCmis6y
         iipjnuBPpeXfi4Zj6bZo5bETeewz1S/KF3PL4lrnUiRmIRrD/EebY0GeTOtxP2HyEX+3
         hzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMxC+IvyWBR942e55z/Z2GZyYcRalCFkkkHaCkUZH8U=;
        b=ftSb3clDs/ftIjUkCrt24jtrGXSbDGKP53IpxrxaHHaDM2KUe17Jfkajo+Q+PSpCJK
         a6vr2EZFpyTiDasHwb+NC4iSUqzHBgyU/mjpjsTqQh00sgMrFUsqdFTqweD2T7JYWywy
         MmRmVfXtNjztHlYdrWQYF+KWXy9HuCewBwH59ZEcboPxUA2ax596/9t1W6KF/I1pO4jS
         qxJzD2iNg6xTf29XNWgKjk2bytAUQonecs8KxU1sO72F774ewjrvfbM3BnI3GuEEmcoH
         krZw1o9fAgCQfQ+AwG+dS2+unOXsu/wJJRyprsH5ggDsjvdBnjbrmsczxY34GraIQinF
         E+Bg==
X-Gm-Message-State: AOAM532chqE2UCiYgK0i3Ar8K4CuedSFmE2VN9ImquY9s3EmU4wpSntS
        PrEd46xs8TEWDkdsfj1efLp+Jg==
X-Google-Smtp-Source: ABdhPJxFSoGIddJCxiN4Y8NkGlcmp+kdTuenUUMsZMEkJuKSM0UQCjZr4f5QTLPqOoNyHQP/kNTfKg==
X-Received: by 2002:ac2:4831:: with SMTP id 17mr4135030lft.487.1607113103639;
        Fri, 04 Dec 2020 12:18:23 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w21sm2036918lff.280.2020.12.04.12.18.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Dec 2020 12:18:23 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v3 5/6] remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs
Date:   Fri,  4 Dec 2020 21:18:06 +0100
Message-Id: <20201204201807.14716-6-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 AM65x family of SoCs have the next generation of the PRU-ICSS
processor subsystem, commonly referred to as ICSSG. Each ICSSG processor
subsystem on AM65x SR1.0 contains two primary PRU cores and two new
auxiliary PRU cores called RTUs. The AM65x SR2.0 SoCs have a revised
ICSSG IP that is based off the subsequent IP revision used on J721E
SoCs. This IP instance has two new custom auxiliary PRU cores called
Transmit PRUs (Tx_PRUs) in addition to the existing PRUs and RTUs.

Each RTU and Tx_PRU cores have their own dedicated IRAM (smaller than
a PRU), Control and debug feature sets, but is different in terms of
sub-modules integrated around it and does not have the full capabilities
associated with a PRU core. The RTU core is typically used to aid a
PRU core in accelerating data transfers, while the Tx_PRU cores is
normally used to control the TX L2 FIFO if enabled in Ethernet
applications. Both can also be used to run independent applications.
The RTU and Tx_PRU cores though share the same Data RAMs as the PRU
cores, so the memories have to be partitioned carefully between different
applications. The new cores also support a new sub-module called Task
Manager to support two different context thread executions.

Enhance the existing PRU remoteproc driver to support these new PRU, RTU
and Tx PRU cores by using specific compatibles. The initial names for the
firmware images for each PRU core are retrieved from DT nodes, and can
be adjusted through sysfs if required.

The PRU remoteproc driver has to be specifically modified to use a
custom memcpy function within its ELF loader implementation for these
new cores in order to overcome a limitation with copying data into each
of the core's IRAM memories. These memory ports support only 4-byte
writes, and any sub-word order byte writes clear out the remaining
bytes other than the bytes being written within the containing word.
The default ARM64 memcpy also cannot be used as it throws an exception
when the preferred 8-byte copy operation is attempted. This choice is
made by using a state flag that is set only on K3 SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v2->v3:
Address Mathieu comments:
- Change type of some local variable in pru_rproc_memcpy from 'int *' to
  'u32 *'. At the occasion use size_t for 'size' inside mentioned
  function.
- Add Reviewed-by: tag.

v1->v2:
- Update documentation of pru_rproc_memcpy() according to Suman
  comments.
- Update documentation of is_k3 flag.
---
 drivers/remoteproc/pru_rproc.c | 140 ++++++++++++++++++++++++++++++---
 1 file changed, 131 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index b22c4903299e..f76423792acb 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -46,10 +46,14 @@
 #define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
 #define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
 
-/* PRU Core IRAM address masks */
+/* PRU/RTU/Tx_PRU Core IRAM address masks */
 #define PRU_IRAM_ADDR_MASK	0x3ffff
 #define PRU0_IRAM_ADDR_MASK	0x34000
 #define PRU1_IRAM_ADDR_MASK	0x38000
+#define RTU0_IRAM_ADDR_MASK	0x4000
+#define RTU1_IRAM_ADDR_MASK	0x6000
+#define TX_PRU0_IRAM_ADDR_MASK	0xa000
+#define TX_PRU1_IRAM_ADDR_MASK	0xc000
 
 /* PRU device addresses for various type of PRU RAMs */
 #define PRU_IRAM_DA	0	/* Instruction RAM */
@@ -74,12 +78,38 @@ enum pru_iomem {
 	PRU_IOMEM_MAX,
 };
 
+/**
+ * enum pru_type - PRU core type identifier
+ *
+ * @PRU_TYPE_PRU: Programmable Real-time Unit
+ * @PRU_TYPE_RTU: Auxiliary Programmable Real-Time Unit
+ * @PRU_TYPE_TX_PRU: Transmit Programmable Real-Time Unit
+ * @PRU_TYPE_MAX: just keep this one at the end
+ */
+enum pru_type {
+	PRU_TYPE_PRU = 0,
+	PRU_TYPE_RTU,
+	PRU_TYPE_TX_PRU,
+	PRU_TYPE_MAX,
+};
+
+/**
+ * struct pru_private_data - device data for a PRU core
+ * @type: type of the PRU core (PRU, RTU, Tx_PRU)
+ * @is_k3: flag used to identify the need for special load handling
+ */
+struct pru_private_data {
+	enum pru_type type;
+	unsigned int is_k3 : 1;
+};
+
 /**
  * struct pru_rproc - PRU remoteproc structure
  * @id: id of the PRU core within the PRUSS
  * @dev: PRU core device pointer
  * @pruss: back-reference to parent PRUSS structure
  * @rproc: remoteproc pointer for this PRU core
+ * @data: PRU core specific data
  * @mem_regions: data for each of the PRU memory regions
  * @fw_name: name of firmware image used during loading
  * @mapped_irq: virtual interrupt numbers of created fw specific mapping
@@ -94,6 +124,7 @@ struct pru_rproc {
 	struct device *dev;
 	struct pruss *pruss;
 	struct rproc *rproc;
+	const struct pru_private_data *data;
 	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
 	const char *fw_name;
 	unsigned int *mapped_irq;
@@ -318,11 +349,12 @@ static int pru_rproc_start(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	struct pru_rproc *pru = rproc->priv;
+	const char *names[PRU_TYPE_MAX] = { "PRU", "RTU", "Tx_PRU" };
 	u32 val;
 	int ret;
 
-	dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
-		pru->id, (rproc->bootaddr >> 2));
+	dev_dbg(dev, "starting %s%d: entry-point = 0x%llx\n",
+		names[pru->data->type], pru->id, (rproc->bootaddr >> 2));
 
 	ret = pru_handle_intrmap(rproc);
 	/*
@@ -344,9 +376,10 @@ static int pru_rproc_stop(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	struct pru_rproc *pru = rproc->priv;
+	const char *names[PRU_TYPE_MAX] = { "PRU", "RTU", "Tx_PRU" };
 	u32 val;
 
-	dev_dbg(dev, "stopping PRU%d\n", pru->id);
+	dev_dbg(dev, "stopping %s%d\n", names[pru->data->type], pru->id);
 
 	val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
 	val &= ~CTRL_CTRL_EN;
@@ -458,9 +491,52 @@ static struct rproc_ops pru_rproc_ops = {
 	.da_to_va	= pru_rproc_da_to_va,
 };
 
+/*
+ * Custom memory copy implementation for ICSSG PRU/RTU/Tx_PRU Cores
+ *
+ * The ICSSG PRU/RTU/Tx_PRU cores have a memory copying issue with IRAM
+ * memories, that is not seen on previous generation SoCs. The data is reflected
+ * properly in the IRAM memories only for integer (4-byte) copies. Any unaligned
+ * copies result in all the other pre-existing bytes zeroed out within that
+ * 4-byte boundary, thereby resulting in wrong text/code in the IRAMs. Also, the
+ * IRAM memory port interface does not allow any 8-byte copies (as commonly used
+ * by ARM64 memcpy implementation) and throws an exception. The DRAM memory
+ * ports do not show this behavior.
+ */
+static int pru_rproc_memcpy(void *dest, const void *src, size_t count)
+{
+	const u32 *s = src;
+	u32 *d = dest;
+	size_t size = count / 4;
+	u32 *tmp_src = NULL;
+
+	/*
+	 * TODO: relax limitation of 4-byte aligned dest addresses and copy
+	 * sizes
+	 */
+	if ((long)dest % 4 || count % 4)
+		return -EINVAL;
+
+	/* src offsets in ELF firmware image can be non-aligned */
+	if ((long)src % 4) {
+		tmp_src = kmemdup(src, count, GFP_KERNEL);
+		if (!tmp_src)
+			return -ENOMEM;
+		s = tmp_src;
+	}
+
+	while (size--)
+		*d++ = *s++;
+
+	kfree(tmp_src);
+
+	return 0;
+}
+
 static int
 pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
 {
+	struct pru_rproc *pru = rproc->priv;
 	struct device *dev = &rproc->dev;
 	struct elf32_hdr *ehdr;
 	struct elf32_phdr *phdr;
@@ -508,7 +584,17 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		memcpy(ptr, elf_data + phdr->p_offset, filesz);
+		if (pru->data->is_k3 && is_iram) {
+			ret = pru_rproc_memcpy(ptr, elf_data + phdr->p_offset,
+					       filesz);
+			if (ret) {
+				dev_err(dev, "PRU memory copy failed for da 0x%x memsz 0x%x\n",
+					da, memsz);
+				break;
+			}
+		} else {
+			memcpy(ptr, elf_data + phdr->p_offset, filesz);
+		}
 
 		/* skip the memzero logic performed by remoteproc ELF loader */
 	}
@@ -614,9 +700,17 @@ static int pru_rproc_set_id(struct pru_rproc *pru)
 	int ret = 0;
 
 	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
+	case TX_PRU0_IRAM_ADDR_MASK:
+		fallthrough;
+	case RTU0_IRAM_ADDR_MASK:
+		fallthrough;
 	case PRU0_IRAM_ADDR_MASK:
 		pru->id = 0;
 		break;
+	case TX_PRU1_IRAM_ADDR_MASK:
+		fallthrough;
+	case RTU1_IRAM_ADDR_MASK:
+		fallthrough;
 	case PRU1_IRAM_ADDR_MASK:
 		pru->id = 1;
 		break;
@@ -637,8 +731,13 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	struct rproc *rproc = NULL;
 	struct resource *res;
 	int i, ret;
+	const struct pru_private_data *data;
 	const char *mem_names[PRU_IOMEM_MAX] = { "iram", "control", "debug" };
 
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = of_property_read_string(np, "firmware-name", &fw_name);
 	if (ret) {
 		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
@@ -671,6 +770,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
 
 	pru = rproc->priv;
 	pru->dev = dev;
+	pru->data = data;
 	pru->pruss = platform_get_drvdata(ppdev);
 	pru->rproc = rproc;
 	pru->fw_name = fw_name;
@@ -722,11 +822,33 @@ static int pru_rproc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pru_private_data pru_data = {
+	.type = PRU_TYPE_PRU,
+};
+
+static const struct pru_private_data k3_pru_data = {
+	.type = PRU_TYPE_PRU,
+	.is_k3 = 1,
+};
+
+static const struct pru_private_data k3_rtu_data = {
+	.type = PRU_TYPE_RTU,
+	.is_k3 = 1,
+};
+
+static const struct pru_private_data k3_tx_pru_data = {
+	.type = PRU_TYPE_TX_PRU,
+	.is_k3 = 1,
+};
+
 static const struct of_device_id pru_rproc_match[] = {
-	{ .compatible = "ti,am3356-pru", },
-	{ .compatible = "ti,am4376-pru", },
-	{ .compatible = "ti,am5728-pru", },
-	{ .compatible = "ti,k2g-pru",    },
+	{ .compatible = "ti,am3356-pru",	.data = &pru_data },
+	{ .compatible = "ti,am4376-pru",	.data = &pru_data },
+	{ .compatible = "ti,am5728-pru",	.data = &pru_data },
+	{ .compatible = "ti,k2g-pru",		.data = &pru_data },
+	{ .compatible = "ti,am654-pru",		.data = &k3_pru_data },
+	{ .compatible = "ti,am654-rtu",		.data = &k3_rtu_data },
+	{ .compatible = "ti,am654-tx-pru",	.data = &k3_tx_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.29.0

