Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093476A6B83
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Mar 2023 12:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjCALNy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Mar 2023 06:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCALNw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Mar 2023 06:13:52 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC1B1E9E5;
        Wed,  1 Mar 2023 03:13:40 -0800 (PST)
Received: from pan.home (unknown [IPv6:2a00:23c6:c311:3401:45a5:b946:dcd1:2820])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: martyn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 02FC766020E6;
        Wed,  1 Mar 2023 11:13:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677669219;
        bh=jkGjul5+tsfCWjsZ/vyiyMCK+HE+e1QwZ2Tn/5R096I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fDgn05nzQ4UwEF3yjvw5zNS/zS40oFx2sGsJRXxOFYpGwbOAOxpr9X1A74aW2y8EL
         dUMKoIfpllzBIocFOCMI/rIsvs+Mp3AqlhJEzokNyDFXj3rb1y0QgOzWU/Gy4gJ/jh
         Bzl9/P/uFHhXkD1KzUkhDfP1wG6vjhQm1sqqCo0ubGFn5SA6DSsFi3GQnb0BcWZkDh
         ivA5fEdW4teULGJUVkDkl9j5HrXj0nDWWZNwigliyRQVSI+zn5VNvJDskV6gYhg6o4
         By1YmU37FkoSMXE4qk4blbhniC2IajKg0uy2L97C5CnWAPxE2KH33OAxFZS7FwW8FD
         HdOWulrmkjqyA==
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     kernel@collabora.com, Martyn Welch <martyn.welch@collabora.com>,
        Hari Nagalla <hnagalla@ti.com>, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 3/3] remoteproc: k4: Refactor M4F and DSP drivers
Date:   Wed,  1 Mar 2023 11:13:23 +0000
Message-Id: <20230301111323.1532479-4-martyn.welch@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111323.1532479-1-martyn.welch@collabora.com>
References: <20230301111323.1532479-1-martyn.welch@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The M4 and DSP remoteproc drivers share a lot of common code. Rename and
refactor this common functionality to avoid so much repetition.

Cc: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---

Changes since v1:
 - New patch

 drivers/remoteproc/Makefile               |   4 +-
 drivers/remoteproc/ti_k3_common.c         | 379 ++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         | 107 +++++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 462 ++--------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 458 ++-------------------
 5 files changed, 541 insertions(+), 869 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.c
 create mode 100644 drivers/remoteproc/ti_k3_common.h

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5ff4e2fee4ab..e30908ca4bfc 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -36,7 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
 obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
-obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
-obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o
+obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o ti_k3_common.o
+obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o ti_k3_common.o
 obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
 obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
new file mode 100644
index 000000000000..b4d65dbec713
--- /dev/null
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI K3 Remote Processor(s) driver common code
+ *
+ * Refactored from ti_k3_dsp_remoteproc.c and ti_k3_m4_remoteproc.c.
+ *
+ * ti_k3_dsp_remoteproc.c:
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ *
+ * ti_k3_m4_remoteproc.c:
+ * Copyright (C) 2021 Texas Instruments Incorporated - https://www.ti.com/
+ *	Hari Nagalla <hnagalla@ti.com>
+ */
+
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/omap-mailbox.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "omap_remoteproc.h"
+#include "remoteproc_internal.h"
+#include "ti_sci_proc.h"
+#include "ti_k3_common.h"
+
+/*
+ * Kick the remote processor to notify about pending unprocessed messages.
+ * The vqid usage is not used and is inconsequential, as the kick is performed
+ * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
+ * the remote processor is expected to process both its Tx and Rx virtqueues.
+ */
+void k3_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	mbox_msg_t msg = (mbox_msg_t)vqid;
+	int ret;
+
+	/* send the index of the triggered virtqueue in the mailbox payload */
+	ret = mbox_send_message(kproc->mbox, (void *)msg);
+	if (ret < 0)
+		dev_err(dev, "failed to send mailbox message, status = %d\n",
+			ret);
+}
+EXPORT_SYMBOL_GPL(k3_rproc_kick);
+
+/* Put the remote processor into reset */
+int k3_rproc_reset(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	int ret;
+
+	ret = reset_control_assert(kproc->reset);
+	if (ret) {
+		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	if (kproc->data->uses_lreset)
+		return ret;
+
+	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret) {
+		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
+		if (reset_control_deassert(kproc->reset))
+			dev_warn(dev, "local-reset deassert back failed\n");
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_reset);
+
+/* Release the remote processor from reset */
+int k3_rproc_release(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (kproc->data->uses_lreset)
+		goto lreset;
+
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret) {
+		dev_err(dev, "module-reset deassert failed, ret = %d\n", ret);
+		return ret;
+	}
+
+lreset:
+	ret = reset_control_deassert(kproc->reset);
+	if (ret) {
+		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
+		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							  kproc->ti_sci_id))
+			dev_warn(dev, "module-reset assert back failed\n");
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_release);
+
+/*
+ * This function implements the .get_loaded_rsc_table() callback and is used
+ * to provide the resource table for a booted remote processor in IPC-only
+ * mode. The remote processor firmwares follow a design-by-contract approach
+ * and are expected to have the resource table at the base of the DDR region
+ * reserved for firmware usage. This provides flexibility for the remote
+ * processor to be booted by different bootloaders that may or may not have the
+ * ability to publish the resource table address and size through a DT
+ * property.
+ */
+struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
+					       size_t *rsc_table_sz)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	if (!kproc->rmem[0].cpu_addr) {
+		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * NOTE: The resource table size is currently hard-coded to a maximum
+	 * of 256 bytes. The most common resource table usage for K3 firmwares
+	 * is to only have the vdev resource entry and an optional trace entry.
+	 * The exact size could be computed based on resource table address, but
+	 * the hard-coded value suffices to support the IPC-only mode.
+	 */
+	*rsc_table_sz = 256;
+	return (struct resource_table *)kproc->rmem[0].cpu_addr;
+}
+EXPORT_SYMBOL_GPL(k3_get_loaded_rsc_table);
+
+/*
+ * Custom function to translate a remote processor device address (internal
+ * RAMs only) to a kernel virtual address.  The remote processors can access
+ * their RAMs at either an internal address visible only from a remote
+ * processor, or at the SoC-level bus address. Both these addresses need to be
+ * looked through for translation. The translated addresses can be used either
+ * by the remoteproc core for loading (when using kernel remoteproc loader), or
+ * by any rpmsg bus drivers.
+ */
+void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	void __iomem *va = NULL;
+	phys_addr_t bus_addr;
+	u32 dev_addr, offset;
+	size_t size;
+	int i;
+
+	if (len == 0)
+		return NULL;
+
+	for (i = 0; i < kproc->num_mems; i++) {
+		bus_addr = kproc->mem[i].bus_addr;
+		dev_addr = kproc->mem[i].dev_addr;
+		size = kproc->mem[i].size;
+
+		if (da < KEYSTONE_RPROC_LOCAL_ADDRESS_MASK) {
+			/* handle remote-view addresses */
+			if (da >= dev_addr &&
+			    ((da + len) <= (dev_addr + size))) {
+				offset = da - dev_addr;
+				va = kproc->mem[i].cpu_addr + offset;
+				return (__force void *)va;
+			}
+		} else {
+			/* handle SoC-view addresses */
+			if (da >= bus_addr &&
+			    (da + len) <= (bus_addr + size)) {
+				offset = da - bus_addr;
+				va = kproc->mem[i].cpu_addr + offset;
+				return (__force void *)va;
+			}
+		}
+	}
+
+	/* handle static DDR reserved memory regions */
+	for (i = 0; i < kproc->num_rmems; i++) {
+		dev_addr = kproc->rmem[i].dev_addr;
+		size = kproc->rmem[i].size;
+
+		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
+			offset = da - dev_addr;
+			va = kproc->rmem[i].cpu_addr + offset;
+			return (__force void *)va;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_da_to_va);
+
+int k3_rproc_of_get_memories(struct platform_device *pdev,
+			     struct k3_rproc *kproc)
+{
+	const struct k3_rproc_dev_data *data = kproc->data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int num_mems = 0;
+	int i;
+
+	num_mems = kproc->data->num_mems;
+	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
+				  sizeof(*kproc->mem), GFP_KERNEL);
+	if (!kproc->mem)
+		return -ENOMEM;
+
+	for (i = 0; i < num_mems; i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   data->mems[i].name);
+		if (!res) {
+			dev_err(dev, "found no memory resource for %s\n",
+				data->mems[i].name);
+			return -EINVAL;
+		}
+		if (!devm_request_mem_region(dev, res->start,
+					     resource_size(res),
+					     dev_name(dev))) {
+			dev_err(dev, "could not request %s region for resource\n",
+				data->mems[i].name);
+			return -EBUSY;
+		}
+
+		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
+							 resource_size(res));
+		if (!kproc->mem[i].cpu_addr) {
+			dev_err(dev, "failed to map %s memory\n",
+				data->mems[i].name);
+			return -ENOMEM;
+		}
+		kproc->mem[i].bus_addr = res->start;
+		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
+		kproc->mem[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			data->mems[i].name, &kproc->mem[i].bus_addr,
+			kproc->mem[i].size, kproc->mem[i].cpu_addr,
+			kproc->mem[i].dev_addr);
+	}
+	kproc->num_mems = num_mems;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
+
+int k3_reserved_mem_init(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *rmem_np;
+	struct reserved_mem *rmem;
+	int num_rmems;
+	int ret, i;
+
+	num_rmems = of_property_count_elems_of_size(np, "memory-region",
+						    sizeof(phandle));
+	if (num_rmems <= 0) {
+		dev_err(dev, "device does not reserved memory regions, ret = %d\n",
+			num_rmems);
+		return -EINVAL;
+	}
+	if (num_rmems < 2) {
+		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
+			num_rmems);
+		return -EINVAL;
+	}
+
+	/* use reserved memory region 0 for vring DMA allocations */
+	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	if (ret) {
+		dev_err(dev, "device cannot initialize DMA pool, ret = %d\n",
+			ret);
+		return ret;
+	}
+
+	num_rmems--;
+	kproc->rmem = kcalloc(num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
+	if (!kproc->rmem) {
+		ret = -ENOMEM;
+		goto release_rmem;
+	}
+
+	/* use remaining reserved memory regions for static carveouts */
+	for (i = 0; i < num_rmems; i++) {
+		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
+		if (!rmem_np) {
+			ret = -EINVAL;
+			goto unmap_rmem;
+		}
+
+		rmem = of_reserved_mem_lookup(rmem_np);
+		if (!rmem) {
+			of_node_put(rmem_np);
+			ret = -EINVAL;
+			goto unmap_rmem;
+		}
+		of_node_put(rmem_np);
+
+		kproc->rmem[i].bus_addr = rmem->base;
+		/* 64-bit address regions currently not supported */
+		kproc->rmem[i].dev_addr = (u32)rmem->base;
+		kproc->rmem[i].size = rmem->size;
+		kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
+		if (!kproc->rmem[i].cpu_addr) {
+			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
+				i + 1, &rmem->base, &rmem->size);
+			ret = -ENOMEM;
+			goto unmap_rmem;
+		}
+
+		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			i + 1, &kproc->rmem[i].bus_addr,
+			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
+			kproc->rmem[i].dev_addr);
+	}
+	kproc->num_rmems = num_rmems;
+
+	return 0;
+
+unmap_rmem:
+	for (i--; i >= 0; i--)
+		iounmap(kproc->rmem[i].cpu_addr);
+	kfree(kproc->rmem);
+release_rmem:
+	of_reserved_mem_device_release(kproc->dev);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
+
+void k3_reserved_mem_exit(struct k3_rproc *kproc)
+{
+	int i;
+
+	for (i = 0; i < kproc->num_rmems; i++)
+		iounmap(kproc->rmem[i].cpu_addr);
+	kfree(kproc->rmem);
+
+	of_reserved_mem_device_release(kproc->dev);
+}
+EXPORT_SYMBOL_GPL(k3_reserved_mem_exit);
+
+struct ti_sci_proc *k3_rproc_of_get_tsp(struct device *dev,
+					const struct ti_sci_handle *sci)
+{
+	struct ti_sci_proc *tsp;
+	u32 temp[2];
+	int ret;
+
+	ret = of_property_read_u32_array(dev->of_node, "ti,sci-proc-ids",
+					 temp, 2);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	tsp = kzalloc(sizeof(*tsp), GFP_KERNEL);
+	if (!tsp)
+		return ERR_PTR(-ENOMEM);
+
+	tsp->dev = dev;
+	tsp->sci = sci;
+	tsp->ops = &sci->ops.proc_ops;
+	tsp->proc_id = temp[0];
+	tsp->host_id = temp[1];
+
+	return tsp;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_of_get_tsp);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("TI K3 common Remoteproc support");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
new file mode 100644
index 000000000000..ed8ca5858492
--- /dev/null
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * TI K3 Remote Processor(s) driver common code
+ *
+ * Refactored from ti_k3_dsp_remoteproc.c and ti_k3_m4_remoteproc.c.
+ *
+ * ti_k3_dsp_remoteproc.c:
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ *
+ * ti_k3_m4_remoteproc.c:
+ * Copyright (C) 2021 Texas Instruments Incorporated - https://www.ti.com/
+ *	Hari Nagalla <hnagalla@ti.com>
+ */
+
+#ifndef REMOTEPROC_TI_K3_COMMON_H
+#define REMOTEPROC_TI_K3_COMMON_H
+
+#define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
+
+/**
+ * struct k3_rproc_mem - internal memory structure
+ * @cpu_addr: MPU virtual address of the memory region
+ * @bus_addr: Bus address used to access the memory region
+ * @dev_addr: Device address of the memory region from DSP view
+ * @size: Size of the memory region
+ */
+struct k3_rproc_mem {
+	void __iomem *cpu_addr;
+	phys_addr_t bus_addr;
+	u32 dev_addr;
+	size_t size;
+};
+
+/**
+ * struct k3_rproc_mem_data - memory definitions for a DSP
+ * @name: name for this memory entry
+ * @dev_addr: device address for the memory entry
+ */
+struct k3_rproc_mem_data {
+	const char *name;
+	const u32 dev_addr;
+};
+
+/**
+ * struct k3_rproc_dev_data - device data structure for a DSP
+ * @mems: pointer to memory definitions for a DSP
+ * @num_mems: number of memory regions in @mems
+ * @boot_align_addr: boot vector address alignment granularity
+ * @uses_lreset: flag to denote the need for local reset management
+ */
+struct k3_rproc_dev_data {
+	const struct k3_rproc_mem_data *mems;
+	u32 num_mems;
+	u32 boot_align_addr;
+	bool uses_lreset;
+};
+
+/**
+ * struct k3_rproc - k3 remote processor driver structure
+ * @dev: cached device pointer
+ * @rproc: remoteproc device handle
+ * @mem: internal memory regions data
+ * @num_mems: number of internal memory regions
+ * @rmem: reserved memory regions data
+ * @num_rmems: number of reserved memory regions
+ * @reset: reset control handle
+ * @data: pointer to device data
+ * @tsp: TI-SCI processor control handle
+ * @ti_sci: TI-SCI handle
+ * @ti_sci_id: TI-SCI device identifier
+ * @mbox: mailbox channel handle
+ * @client: mailbox client to request the mailbox channel
+ * @ipc_only: flag to indicate IPC-only mode
+ */
+struct k3_rproc {
+	struct device *dev;
+	struct rproc *rproc;
+	struct k3_rproc_mem *mem;
+	int num_mems;
+	struct k3_rproc_mem *rmem;
+	int num_rmems;
+	struct reset_control *reset;
+	const struct k3_rproc_dev_data *data;
+	struct ti_sci_proc *tsp;
+	const struct ti_sci_handle *ti_sci;
+	u32 ti_sci_id;
+	struct mbox_chan *mbox;
+	struct mbox_client client;
+	bool ipc_only;
+};
+
+void k3_rproc_kick(struct rproc *rproc, int vqid);
+int k3_rproc_reset(struct k3_rproc *kproc);
+int k3_rproc_release(struct k3_rproc *kproc);
+struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
+					       size_t *rsc_table_sz);
+void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			bool *is_iomem);
+int k3_rproc_of_get_memories(struct platform_device *pdev,
+			     struct k3_rproc *kproc);
+int k3_reserved_mem_init(struct k3_rproc *kproc);
+void k3_reserved_mem_exit(struct k3_rproc *kproc);
+struct ti_sci_proc *k3_rproc_of_get_tsp(struct device *dev,
+					const struct ti_sci_handle *sci);
+
+#endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index eb9c64f7b9b4..006fd444badb 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -20,78 +20,7 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
-
-#define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
-
-/**
- * struct k3_dsp_mem - internal memory structure
- * @cpu_addr: MPU virtual address of the memory region
- * @bus_addr: Bus address used to access the memory region
- * @dev_addr: Device address of the memory region from DSP view
- * @size: Size of the memory region
- */
-struct k3_dsp_mem {
-	void __iomem *cpu_addr;
-	phys_addr_t bus_addr;
-	u32 dev_addr;
-	size_t size;
-};
-
-/**
- * struct k3_dsp_mem_data - memory definitions for a DSP
- * @name: name for this memory entry
- * @dev_addr: device address for the memory entry
- */
-struct k3_dsp_mem_data {
-	const char *name;
-	const u32 dev_addr;
-};
-
-/**
- * struct k3_dsp_dev_data - device data structure for a DSP
- * @mems: pointer to memory definitions for a DSP
- * @num_mems: number of memory regions in @mems
- * @boot_align_addr: boot vector address alignment granularity
- * @uses_lreset: flag to denote the need for local reset management
- */
-struct k3_dsp_dev_data {
-	const struct k3_dsp_mem_data *mems;
-	u32 num_mems;
-	u32 boot_align_addr;
-	bool uses_lreset;
-};
-
-/**
- * struct k3_dsp_rproc - k3 DSP remote processor driver structure
- * @dev: cached device pointer
- * @rproc: remoteproc device handle
- * @mem: internal memory regions data
- * @num_mems: number of internal memory regions
- * @rmem: reserved memory regions data
- * @num_rmems: number of reserved memory regions
- * @reset: reset control handle
- * @data: pointer to DSP-specific device data
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
- */
-struct k3_dsp_rproc {
-	struct device *dev;
-	struct rproc *rproc;
-	struct k3_dsp_mem *mem;
-	int num_mems;
-	struct k3_dsp_mem *rmem;
-	int num_rmems;
-	struct reset_control *reset;
-	const struct k3_dsp_dev_data *data;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
-};
+#include "ti_k3_common.h"
 
 /**
  * k3_dsp_rproc_mbox_callback() - inbound mailbox message handler
@@ -109,7 +38,7 @@ struct k3_dsp_rproc {
  */
 static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 {
-	struct k3_dsp_rproc *kproc = container_of(client, struct k3_dsp_rproc,
+	struct k3_rproc *kproc = container_of(client, struct k3_rproc,
 						  client);
 	struct device *dev = kproc->rproc->dev.parent;
 	const char *name = kproc->rproc->name;
@@ -142,83 +71,9 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 	}
 }
 
-/*
- * Kick the remote processor to notify about pending unprocessed messages.
- * The vqid usage is not used and is inconsequential, as the kick is performed
- * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
- * the remote processor is expected to process both its Tx and Rx virtqueues.
- */
-static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
-{
-	struct k3_dsp_rproc *kproc = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	mbox_msg_t msg = (mbox_msg_t)vqid;
-	int ret;
-
-	/* send the index of the triggered virtqueue in the mailbox payload */
-	ret = mbox_send_message(kproc->mbox, (void *)msg);
-	if (ret < 0)
-		dev_err(dev, "failed to send mailbox message, status = %d\n",
-			ret);
-}
-
-/* Put the DSP processor into reset */
-static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
-		return ret;
-	}
-
-	if (kproc->data->uses_lreset)
-		return ret;
-
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
-		if (reset_control_deassert(kproc->reset))
-			dev_warn(dev, "local-reset deassert back failed\n");
-	}
-
-	return ret;
-}
-
-/* Release the DSP processor from reset */
-static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset)
-		goto lreset;
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset deassert failed, ret = %d\n", ret);
-		return ret;
-	}
-
-lreset:
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
-			dev_warn(dev, "module-reset assert back failed\n");
-	}
-
-	return ret;
-}
-
 static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
@@ -253,6 +108,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 
 	return 0;
 }
+
 /*
  * The C66x DSP cores have a local reset that affects only the CPU, and a
  * generic module reset that powers on the device and allows the DSP internal
@@ -265,7 +121,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
  */
 static int k3_dsp_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -289,7 +145,7 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
  */
 static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -310,7 +166,7 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
  */
 static int k3_dsp_rproc_start(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	u32 boot_addr;
 	int ret;
@@ -332,7 +188,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	if (ret)
 		goto put_mbox;
 
-	ret = k3_dsp_rproc_release(kproc);
+	ret = k3_rproc_release(kproc);
 	if (ret)
 		goto put_mbox;
 
@@ -351,11 +207,11 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
  */
 static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 
 	mbox_free_channel(kproc->mbox);
 
-	k3_dsp_rproc_reset(kproc);
+	k3_rproc_reset(kproc);
 
 	return 0;
 }
@@ -370,7 +226,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
  */
 static int k3_dsp_rproc_attach(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -392,7 +248,7 @@ static int k3_dsp_rproc_attach(struct rproc *rproc)
  */
 static int k3_dsp_rproc_detach(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	mbox_free_channel(kproc->mbox);
@@ -400,282 +256,20 @@ static int k3_dsp_rproc_detach(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * This function implements the .get_loaded_rsc_table() callback and is used
- * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
- * firmwares follow a design-by-contract approach and are expected to have the
- * resource table at the base of the DDR region reserved for firmware usage.
- * This provides flexibility for the remote processor to be booted by different
- * bootloaders that may or may not have the ability to publish the resource table
- * address and size through a DT property. This callback is invoked only in
- * IPC-only mode.
- */
-static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
-							  size_t *rsc_table_sz)
-{
-	struct k3_dsp_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	if (!kproc->rmem[0].cpu_addr) {
-		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	/*
-	 * NOTE: The resource table size is currently hard-coded to a maximum
-	 * of 256 bytes. The most common resource table usage for K3 firmwares
-	 * is to only have the vdev resource entry and an optional trace entry.
-	 * The exact size could be computed based on resource table address, but
-	 * the hard-coded value suffices to support the IPC-only mode.
-	 */
-	*rsc_table_sz = 256;
-	return (struct resource_table *)kproc->rmem[0].cpu_addr;
-}
-
-/*
- * Custom function to translate a DSP device address (internal RAMs only) to a
- * kernel virtual address.  The DSPs can access their RAMs at either an internal
- * address visible only from a DSP, or at the SoC-level bus address. Both these
- * addresses need to be looked through for translation. The translated addresses
- * can be used either by the remoteproc core for loading (when using kernel
- * remoteproc loader), or by any rpmsg bus drivers.
- */
-static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
-{
-	struct k3_dsp_rproc *kproc = rproc->priv;
-	void __iomem *va = NULL;
-	phys_addr_t bus_addr;
-	u32 dev_addr, offset;
-	size_t size;
-	int i;
-
-	if (len == 0)
-		return NULL;
-
-	for (i = 0; i < kproc->num_mems; i++) {
-		bus_addr = kproc->mem[i].bus_addr;
-		dev_addr = kproc->mem[i].dev_addr;
-		size = kproc->mem[i].size;
-
-		if (da < KEYSTONE_RPROC_LOCAL_ADDRESS_MASK) {
-			/* handle DSP-view addresses */
-			if (da >= dev_addr &&
-			    ((da + len) <= (dev_addr + size))) {
-				offset = da - dev_addr;
-				va = kproc->mem[i].cpu_addr + offset;
-				return (__force void *)va;
-			}
-		} else {
-			/* handle SoC-view addresses */
-			if (da >= bus_addr &&
-			    (da + len) <= (bus_addr + size)) {
-				offset = da - bus_addr;
-				va = kproc->mem[i].cpu_addr + offset;
-				return (__force void *)va;
-			}
-		}
-	}
-
-	/* handle static DDR reserved memory regions */
-	for (i = 0; i < kproc->num_rmems; i++) {
-		dev_addr = kproc->rmem[i].dev_addr;
-		size = kproc->rmem[i].size;
-
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->rmem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
-	return NULL;
-}
 
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_dsp_rproc_stop,
-	.kick		= k3_dsp_rproc_kick,
-	.da_to_va	= k3_dsp_rproc_da_to_va,
+	.kick		= k3_rproc_kick,
+	.da_to_va	= k3_rproc_da_to_va,
 };
 
-static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
-					struct k3_dsp_rproc *kproc)
-{
-	const struct k3_dsp_dev_data *data = kproc->data;
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems = 0;
-	int i;
-
-	num_mems = kproc->data->num_mems;
-	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
-				  sizeof(*kproc->mem), GFP_KERNEL);
-	if (!kproc->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   data->mems[i].name);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				data->mems[i].name);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				data->mems[i].name);
-			return -EBUSY;
-		}
-
-		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							 resource_size(res));
-		if (!kproc->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n",
-				data->mems[i].name);
-			return -ENOMEM;
-		}
-		kproc->mem[i].bus_addr = res->start;
-		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
-		kproc->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			data->mems[i].name, &kproc->mem[i].bus_addr,
-			kproc->mem[i].size, kproc->mem[i].cpu_addr,
-			kproc->mem[i].dev_addr);
-	}
-	kproc->num_mems = num_mems;
-
-	return 0;
-}
-
-static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
-	int num_rmems;
-	int ret, i;
-
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
-	if (num_rmems <= 0) {
-		dev_err(dev, "device does not reserved memory regions, ret = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-	if (num_rmems < 2) {
-		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-
-	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
-	if (ret) {
-		dev_err(dev, "device cannot initialize DMA pool, ret = %d\n",
-			ret);
-		return ret;
-	}
-
-	num_rmems--;
-	kproc->rmem = kcalloc(num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
-	if (!kproc->rmem) {
-		ret = -ENOMEM;
-		goto release_rmem;
-	}
-
-	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np) {
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
-
-		rmem = of_reserved_mem_lookup(rmem_np);
-		if (!rmem) {
-			of_node_put(rmem_np);
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
-		of_node_put(rmem_np);
-
-		kproc->rmem[i].bus_addr = rmem->base;
-		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
-		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
-			ret = -ENOMEM;
-			goto unmap_rmem;
-		}
-
-		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
-	}
-	kproc->num_rmems = num_rmems;
-
-	return 0;
-
-unmap_rmem:
-	for (i--; i >= 0; i--)
-		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
-release_rmem:
-	of_reserved_mem_device_release(kproc->dev);
-	return ret;
-}
-
-static void k3_dsp_reserved_mem_exit(struct k3_dsp_rproc *kproc)
-{
-	int i;
-
-	for (i = 0; i < kproc->num_rmems; i++)
-		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
-
-	of_reserved_mem_device_release(kproc->dev);
-}
-
-static
-struct ti_sci_proc *k3_dsp_rproc_of_get_tsp(struct device *dev,
-					    const struct ti_sci_handle *sci)
-{
-	struct ti_sci_proc *tsp;
-	u32 temp[2];
-	int ret;
-
-	ret = of_property_read_u32_array(dev->of_node, "ti,sci-proc-ids",
-					 temp, 2);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	tsp = kzalloc(sizeof(*tsp), GFP_KERNEL);
-	if (!tsp)
-		return ERR_PTR(-ENOMEM);
-
-	tsp->dev = dev;
-	tsp->sci = sci;
-	tsp->ops = &sci->ops.proc_ops;
-	tsp->proc_id = temp[0];
-	tsp->host_id = temp[1];
-
-	return tsp;
-}
-
 static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct k3_dsp_dev_data *data;
-	struct k3_dsp_rproc *kproc;
+	const struct k3_rproc_dev_data *data;
+	struct k3_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
 	bool p_state = false;
@@ -733,7 +327,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		goto put_sci;
 	}
 
-	kproc->tsp = k3_dsp_rproc_of_get_tsp(dev, kproc->ti_sci);
+	kproc->tsp = k3_rproc_of_get_tsp(dev, kproc->ti_sci);
 	if (IS_ERR(kproc->tsp)) {
 		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
 			ret);
@@ -747,11 +341,11 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		goto free_tsp;
 	}
 
-	ret = k3_dsp_rproc_of_get_memories(pdev, kproc);
+	ret = k3_rproc_of_get_memories(pdev, kproc);
 	if (ret)
 		goto release_tsp;
 
-	ret = k3_dsp_reserved_mem_init(kproc);
+	ret = k3_reserved_mem_init(kproc);
 	if (ret) {
 		dev_err(dev, "reserved memory init failed, ret = %d\n", ret);
 		goto release_tsp;
@@ -776,7 +370,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		rproc->ops->stop = NULL;
 		rproc->ops->attach = k3_dsp_rproc_attach;
 		rproc->ops->detach = k3_dsp_rproc_detach;
-		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
+		rproc->ops->get_loaded_rsc_table = k3_get_loaded_rsc_table;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
 		/*
@@ -792,7 +386,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 				goto release_mem;
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_dsp_rproc_reset(kproc);
+				k3_rproc_reset(kproc);
 			}
 		}
 	}
@@ -809,7 +403,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 release_mem:
-	k3_dsp_reserved_mem_exit(kproc);
+	k3_reserved_mem_exit(kproc);
 release_tsp:
 	ret1 = ti_sci_proc_release(kproc->tsp);
 	if (ret1)
@@ -827,7 +421,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 static int k3_dsp_rproc_remove(struct platform_device *pdev)
 {
-	struct k3_dsp_rproc *kproc = platform_get_drvdata(pdev);
+	struct k3_rproc *kproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = kproc->rproc;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -852,32 +446,32 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(dev, "failed to put ti_sci handle, ret = %d\n", ret);
 
-	k3_dsp_reserved_mem_exit(kproc);
+	k3_reserved_mem_exit(kproc);
 	rproc_free(kproc->rproc);
 
 	return 0;
 }
 
-static const struct k3_dsp_mem_data c66_mems[] = {
+static const struct k3_rproc_mem_data c66_mems[] = {
 	{ .name = "l2sram", .dev_addr = 0x800000 },
 	{ .name = "l1pram", .dev_addr = 0xe00000 },
 	{ .name = "l1dram", .dev_addr = 0xf00000 },
 };
 
 /* C71x cores only have a L1P Cache, there are no L1P SRAMs */
-static const struct k3_dsp_mem_data c71_mems[] = {
+static const struct k3_rproc_mem_data c71_mems[] = {
 	{ .name = "l2sram", .dev_addr = 0x800000 },
 	{ .name = "l1dram", .dev_addr = 0xe00000 },
 };
 
-static const struct k3_dsp_dev_data c66_data = {
+static const struct k3_rproc_dev_data c66_data = {
 	.mems = c66_mems,
 	.num_mems = ARRAY_SIZE(c66_mems),
 	.boot_align_addr = SZ_1K,
 	.uses_lreset = true,
 };
 
-static const struct k3_dsp_dev_data c71_data = {
+static const struct k3_rproc_dev_data c71_data = {
 	.mems = c71_mems,
 	.num_mems = ARRAY_SIZE(c71_mems),
 	.boot_align_addr = SZ_2M,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 66301eb69f6f..8a55e42544af 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -20,80 +20,7 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
-
-#define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
-
-/**
- * struct k3_m4_mem - internal memory structure
- * @cpu_addr: MPU virtual address of the memory region
- * @bus_addr: Bus address used to access the memory region
- * @dev_addr: Device address of the memory region from DSP view
- * @size: Size of the memory region
- */
-struct k3_m4_mem {
-	void __iomem *cpu_addr;
-	phys_addr_t bus_addr;
-	u32 dev_addr;
-	size_t size;
-};
-
-/**
- * struct k3_m4_mem_data - memory definitions for a DSP
- * @name: name for this memory entry
- * @dev_addr: device address for the memory entry
- */
-struct k3_m4_mem_data {
-	const char *name;
-	const u32 dev_addr;
-};
-
-/**
- * struct k3_m4_dev_data - device data structure for a DSP
- * @mems: pointer to memory definitions for a DSP
- * @num_mems: number of memory regions in @mems
- * @boot_align_addr: boot vector address alignment granularity
- * @uses_lreset: flag to denote the need for local reset management
- */
-struct k3_m4_dev_data {
-	const struct k3_m4_mem_data *mems;
-	u32 num_mems;
-	u32 boot_align_addr;
-	bool uses_lreset;
-};
-
-/**
- * struct k3_m4_rproc - k3 M4 remote processor driver structure
- * @dev: cached device pointer
- * @rproc: remoteproc device handle
- * @mem: internal memory regions data
- * @num_mems: number of internal memory regions
- * @rmem: reserved memory regions data
- * @num_rmems: number of reserved memory regions
- * @reset: reset control handle
- * @data: pointer to M4-specific device data
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
- * @ipc_only: flag to indicate IPC-only mode
- */
-struct k3_m4_rproc {
-	struct device *dev;
-	struct rproc *rproc;
-	struct k3_m4_mem *mem;
-	int num_mems;
-	struct k3_m4_mem *rmem;
-	int num_rmems;
-	struct reset_control *reset;
-	const struct k3_m4_dev_data *data;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
-	bool ipc_only;
-};
+#include "ti_k3_common.h"
 
 /**
  * k3_m4_rproc_mbox_callback() - inbound mailbox message handler
@@ -111,7 +38,7 @@ struct k3_m4_rproc {
  */
 static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
 {
-	struct k3_m4_rproc *kproc = container_of(client, struct k3_m4_rproc,
+	struct k3_rproc *kproc = container_of(client, struct k3_rproc,
 						  client);
 	struct device *dev = kproc->rproc->dev.parent;
 	const char *name = kproc->rproc->name;
@@ -144,85 +71,9 @@ static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
 	}
 }
 
-/*
- * Kick the remote processor to notify about pending unprocessed messages.
- * The vqid usage is not used and is inconsequential, as the kick is performed
- * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
- * the remote processor is expected to process both its Tx and Rx virtqueues.
- */
-static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
-{
-	struct k3_m4_rproc *kproc = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	mbox_msg_t msg = (mbox_msg_t)vqid;
-	int ret;
-
-	/* send the index of the triggered virtqueue in the mailbox payload */
-	ret = mbox_send_message(kproc->mbox, (void *)msg);
-	if (ret < 0)
-		dev_err(dev, "failed to send mailbox message, status = %d\n",
-			ret);
-}
-
-/* Put the M4 processor into reset */
-static int k3_m4_rproc_reset(struct k3_m4_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
-		return ret;
-	}
-
-	if (kproc->data->uses_lreset)
-		return ret;
-
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
-		if (reset_control_deassert(kproc->reset))
-			dev_warn(dev, "local-reset deassert back failed\n");
-	}
-
-	return ret;
-}
-
-/* Release the M4 processor from reset */
-static int k3_m4_rproc_release(struct k3_m4_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset)
-		goto lreset;
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset deassert failed, ret = %d\n", ret);
-		return ret;
-	}
-
-	dev_info(dev, "released m4 reset\n");
-
-lreset:
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
-			dev_warn(dev, "module-reset assert back failed\n");
-	}
-
-	return ret;
-}
-
 static int k3_m4_rproc_request_mbox(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
@@ -269,7 +120,7 @@ static int k3_m4_rproc_request_mbox(struct rproc *rproc)
  */
 static int k3_m4_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -297,7 +148,7 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
  */
 static int k3_m4_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -322,7 +173,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
  */
 static int k3_m4_rproc_start(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	u32 boot_addr;
 	int ret;
@@ -338,7 +189,7 @@ static int k3_m4_rproc_start(struct rproc *rproc)
 		return ret;
 
 	boot_addr = rproc->bootaddr;
-	ret = k3_m4_rproc_release(kproc);
+	ret = k3_rproc_release(kproc);
 	if (ret)
 		goto put_mbox;
 
@@ -357,7 +208,7 @@ static int k3_m4_rproc_start(struct rproc *rproc)
  */
 static int k3_m4_rproc_stop(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (kproc->ipc_only) {
@@ -368,7 +219,7 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
 
 	mbox_free_channel(kproc->mbox);
 
-	k3_m4_rproc_reset(kproc);
+	k3_rproc_reset(kproc);
 
 	return 0;
 }
@@ -382,7 +233,7 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
  */
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -408,7 +259,7 @@ static int k3_m4_rproc_attach(struct rproc *rproc)
  */
 static int k3_m4_rproc_detach(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (!kproc->ipc_only || rproc->state != RPROC_ATTACHED) {
@@ -421,283 +272,24 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * This function implements the .get_loaded_rsc_table() callback and is used
- * to provide the resource table for a booted M4 in IPC-only mode. The K3 M4
- * firmwares follow a design-by-contract approach and are expected to have the
- * resource table at the base of the DDR region reserved for firmware usage.
- * This provides flexibility for the remote processor to be booted by different
- * bootloaders that may or may not have the ability to publish the resource table
- * address and size through a DT property.
- */
-static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
-							 size_t *rsc_table_sz)
-{
-	struct k3_m4_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
 
-	if (!kproc->rmem[0].cpu_addr) {
-		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	/*
-	 * NOTE: The resource table size is currently hard-coded to a maximum
-	 * of 256 bytes. The most common resource table usage for K3 firmwares
-	 * is to only have the vdev resource entry and an optional trace entry.
-	 * The exact size could be computed based on resource table address, but
-	 * the hard-coded value suffices to support the IPC-only mode.
-	 */
-	*rsc_table_sz = 256;
-	return (struct resource_table *)kproc->rmem[0].cpu_addr;
-}
-
-/*
- * Custom function to translate a M4 device address (internal RAMs only) to a
- * kernel virtual address.  The M4s can access their RAMs at either an internal
- * address visible only from a M4, or at the SoC-level bus address. Both these
- * addresses need to be looked through for translation. The translated addresses
- * can be used either by the remoteproc core for loading (when using kernel
- * remoteproc loader), or by any rpmsg bus drivers.
- */
-static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
-{
-	struct k3_m4_rproc *kproc = rproc->priv;
-	void __iomem *va = NULL;
-	phys_addr_t bus_addr;
-	u32 dev_addr, offset;
-	size_t size;
-	int i;
-
-	if (len == 0)
-		return NULL;
-
-	for (i = 0; i < kproc->num_mems; i++) {
-		bus_addr = kproc->mem[i].bus_addr;
-		dev_addr = kproc->mem[i].dev_addr;
-		size = kproc->mem[i].size;
-
-		if (da < KEYSTONE_RPROC_LOCAL_ADDRESS_MASK) {
-			/* handle M4-view addresses */
-			if (da >= dev_addr &&
-			    ((da + len) <= (dev_addr + size))) {
-				offset = da - dev_addr;
-				va = kproc->mem[i].cpu_addr + offset;
-				return (__force void *)va;
-			}
-		} else {
-			/* handle SoC-view addresses */
-			if (da >= bus_addr &&
-			    (da + len) <= (bus_addr + size)) {
-				offset = da - bus_addr;
-				va = kproc->mem[i].cpu_addr + offset;
-				return (__force void *)va;
-			}
-		}
-	}
-
-	/* handle static DDR reserved memory regions */
-	for (i = 0; i < kproc->num_rmems; i++) {
-		dev_addr = kproc->rmem[i].dev_addr;
-		size = kproc->rmem[i].size;
-
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->rmem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
-	return NULL;
-}
 
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.start		= k3_m4_rproc_start,
 	.stop		= k3_m4_rproc_stop,
 	.attach		= k3_m4_rproc_attach,
 	.detach		= k3_m4_rproc_detach,
-	.kick		= k3_m4_rproc_kick,
-	.da_to_va	= k3_m4_rproc_da_to_va,
-	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
+	.kick		= k3_rproc_kick,
+	.da_to_va	= k3_rproc_da_to_va,
+	.get_loaded_rsc_table = k3_get_loaded_rsc_table,
 };
 
-static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
-				       struct k3_m4_rproc *kproc)
-{
-	const struct k3_m4_dev_data *data = kproc->data;
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems = 0;
-	int i;
-
-	num_mems = kproc->data->num_mems;
-	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
-				  sizeof(*kproc->mem), GFP_KERNEL);
-	if (!kproc->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   data->mems[i].name);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				data->mems[i].name);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				data->mems[i].name);
-			return -EBUSY;
-		}
-
-		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							 resource_size(res));
-		if (!kproc->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n",
-				data->mems[i].name);
-			return -ENOMEM;
-		}
-		kproc->mem[i].bus_addr = res->start;
-		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
-		kproc->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			data->mems[i].name, &kproc->mem[i].bus_addr,
-			kproc->mem[i].size, kproc->mem[i].cpu_addr,
-			kproc->mem[i].dev_addr);
-	}
-	kproc->num_mems = num_mems;
-
-	return 0;
-}
-
-static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
-	int num_rmems;
-	int ret, i;
-
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
-	if (num_rmems <= 0) {
-		dev_err(dev, "device does not reserved memory regions, ret = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-	if (num_rmems < 2) {
-		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-
-	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
-	if (ret) {
-		dev_err(dev, "device cannot initialize DMA pool, ret = %d\n",
-			ret);
-		return ret;
-	}
-
-	num_rmems--;
-	kproc->rmem = kcalloc(num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
-	if (!kproc->rmem) {
-		ret = -ENOMEM;
-		goto release_rmem;
-	}
-
-	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np) {
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
-
-		rmem = of_reserved_mem_lookup(rmem_np);
-		if (!rmem) {
-			of_node_put(rmem_np);
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
-		of_node_put(rmem_np);
-
-		kproc->rmem[i].bus_addr = rmem->base;
-		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
-		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
-			ret = -ENOMEM;
-			goto unmap_rmem;
-		}
-
-		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
-	}
-	kproc->num_rmems = num_rmems;
-
-	return 0;
-
-unmap_rmem:
-	for (i--; i >= 0; i--)
-		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
-release_rmem:
-	of_reserved_mem_device_release(kproc->dev);
-	return ret;
-}
-
-static void k3_m4_reserved_mem_exit(struct k3_m4_rproc *kproc)
-{
-	int i;
-
-	for (i = 0; i < kproc->num_rmems; i++)
-		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
-
-	of_reserved_mem_device_release(kproc->dev);
-}
-
-static struct ti_sci_proc *k3_m4_rproc_of_get_tsp(struct device *dev,
-						  const struct ti_sci_handle *sci)
-{
-	struct ti_sci_proc *tsp;
-	u32 temp[2];
-	int ret;
-
-	ret = of_property_read_u32_array(dev->of_node, "ti,sci-proc-ids",
-					 temp, 2);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	tsp = kzalloc(sizeof(*tsp), GFP_KERNEL);
-	if (!tsp)
-		return ERR_PTR(-ENOMEM);
-
-	tsp->dev = dev;
-	tsp->sci = sci;
-	tsp->ops = &sci->ops.proc_ops;
-	tsp->proc_id = temp[0];
-	tsp->host_id = temp[1];
-
-	return tsp;
-}
-
 static int k3_m4_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct k3_m4_dev_data *data;
-	struct k3_m4_rproc *kproc;
+	const struct k3_rproc_dev_data *data;
+	struct k3_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
 	bool r_state = false;
@@ -756,7 +348,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		goto put_sci;
 	}
 
-	kproc->tsp = k3_m4_rproc_of_get_tsp(dev, kproc->ti_sci);
+	kproc->tsp = k3_rproc_of_get_tsp(dev, kproc->ti_sci);
 	if (IS_ERR(kproc->tsp)) {
 		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
 			ret);
@@ -770,11 +362,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		goto free_tsp;
 	}
 
-	ret = k3_m4_rproc_of_get_memories(pdev, kproc);
+	ret = k3_rproc_of_get_memories(pdev, kproc);
 	if (ret)
 		goto release_tsp;
 
-	ret = k3_m4_reserved_mem_init(kproc);
+	ret = k3_reserved_mem_init(kproc);
 	if (ret) {
 		dev_err(dev, "reserved memory init failed, ret = %d\n", ret);
 		goto release_tsp;
@@ -808,7 +400,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 				goto release_mem;
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_m4_rproc_reset(kproc);
+				k3_rproc_reset(kproc);
 			}
 		}
 	}
@@ -825,7 +417,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 release_mem:
-	k3_m4_reserved_mem_exit(kproc);
+	k3_reserved_mem_exit(kproc);
 release_tsp:
 	ret1 = ti_sci_proc_release(kproc->tsp);
 	if (ret1)
@@ -843,7 +435,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 
 static int k3_m4_rproc_remove(struct platform_device *pdev)
 {
-	struct k3_m4_rproc *kproc = platform_get_drvdata(pdev);
+	struct k3_rproc *kproc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -859,18 +451,18 @@ static int k3_m4_rproc_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(dev, "failed to put ti_sci handle, ret = %d\n", ret);
 
-	k3_m4_reserved_mem_exit(kproc);
+	k3_reserved_mem_exit(kproc);
 	rproc_free(kproc->rproc);
 
 	return 0;
 }
 
-static const struct k3_m4_mem_data am64_m4_mems[] = {
+static const struct k3_rproc_mem_data am64_m4_mems[] = {
 	{ .name = "iram", .dev_addr = 0x0 },
 	{ .name = "dram", .dev_addr = 0x30000 },
 };
 
-static const struct k3_m4_dev_data am64_m4_data = {
+static const struct k3_rproc_dev_data am64_m4_data = {
 	.mems = am64_m4_mems,
 	.num_mems = ARRAY_SIZE(am64_m4_mems),
 	.boot_align_addr = SZ_1K,
-- 
2.39.1

