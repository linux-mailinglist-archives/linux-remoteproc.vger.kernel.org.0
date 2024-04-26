Return-Path: <linux-remoteproc+bounces-1231-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521AA8B4010
	for <lists+linux-remoteproc@lfdr.de>; Fri, 26 Apr 2024 21:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E8A1C21EB8
	for <lists+linux-remoteproc@lfdr.de>; Fri, 26 Apr 2024 19:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A2D282F1;
	Fri, 26 Apr 2024 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kN0ITWTo"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E48208CA;
	Fri, 26 Apr 2024 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714159121; cv=none; b=exlM5kCK7Guu8TAz4wC9uj/dWbGmNVPQdhgjpwugu58al1zrqPR0HjohpY0OkUeb1a1fQKuC4igF5gZi7nAflCbHU5NW5V19qEACIXZQy9jAUFTeiSPd6i0l5tpiuPyDUU+nS+zmHRMr4maKieiaRHHZ1oD4ByZQf3rntwKyOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714159121; c=relaxed/simple;
	bh=+tWZM+kFVU3kdNkclUAicKkoeFFVvb//PslMDqI7Jk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVOsgGQN1V0Es7UNyj0fk6ru7Qc4BwjrM34UGKk8iIVkQA813ex8ZfzU8kisG1rFnxdBd1Y/O4CHixOMHElT4qVtlVNYyEwbGmcVhmX7oBjLWqTr+bsdBxYL7VOURuh6O2NYJ0E7Q7+2+7e8a/R+G7CN0IuO7vLBbfSXl7E4VXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kN0ITWTo; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43QJICsi099380;
	Fri, 26 Apr 2024 14:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714159092;
	bh=bSdQyaWl8Zol4kmPf0+LNXQwuSAiQE8WhbT1BIkoCZs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kN0ITWToCvijS94d39rAvZ2iknRsbZ9ss8aiPkTf2duPerHONPp97ZN2CnehH08jl
	 7GZ62yf4C0wBvrPY9CS+bY7iOd0nbGNAw5c9Pj3kBb5GNDCSVphREdihnBhTjQ4/9W
	 nIduPgAMAVWVbHk/ksJDCrh1AziI3MDw3A26WLGY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43QJICoe001741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Apr 2024 14:18:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Apr 2024 14:18:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Apr 2024 14:18:11 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43QJIB7L028593;
	Fri, 26 Apr 2024 14:18:11 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v9 2/5] remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem
Date: Fri, 26 Apr 2024 14:18:08 -0500
Message-ID: <20240426191811.32414-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426191811.32414-1-afd@ti.com>
References: <20240426191811.32414-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Martyn Welch <martyn.welch@collabora.com>

The AM62x and AM64x SoCs of the TI K3 family has a Cortex M4F core in
the MCU domain. This core is typically used for safety applications in a
stand alone mode. However, some application (non safety related) may
want to use the M4F core as a generic remote processor with IPC to the
host processor. The M4F core has internal IRAM and DRAM memories and are
exposed to the system bus for code and data loading.

A remote processor driver is added to support this subsystem, including
being able to load and boot the M4F core. Loading includes to M4F
internal memories and predefined external code/data memories. The
carve outs for external contiguous memory is defined in the M4F device
node and should match with the external memory declarations in the M4F
image binary. The M4F subsystem has two resets. One reset is for the
entire subsystem i.e including the internal memories and the other, a
local reset is only for the M4F processing core. When loading the image,
the driver first releases the subsystem reset, loads the firmware image
and then releases the local reset to let the M4F processing core run.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/Kconfig               |  13 +
 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/ti_k3_m4_remoteproc.c | 785 +++++++++++++++++++++++
 3 files changed, 799 insertions(+)
 create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa852..1a7c0330c91a9 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -339,6 +339,19 @@ config TI_K3_DSP_REMOTEPROC
 	  It's safe to say N here if you're not interested in utilizing
 	  the DSP slave processors.
 
+config TI_K3_M4_REMOTEPROC
+	tristate "TI K3 M4 remoteproc support"
+	depends on ARCH_K3 || COMPILE_TEST
+	select MAILBOX
+	select OMAP2PLUS_MBOX
+	help
+	  Say m here to support TI's M4 remote processor subsystems
+	  on various TI K3 family of SoCs through the remote processor
+	  framework.
+
+	  It's safe to say N here if you're not interested in utilizing
+	  a remote processor.
+
 config TI_K3_R5_REMOTEPROC
 	tristate "TI K3 R5 remoteproc support"
 	depends on ARCH_K3
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 91314a9b43cef..5ff4e2fee4abd 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -37,5 +37,6 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
 obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
+obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o
 obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
 obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
new file mode 100644
index 0000000000000..0030e509f6b5d
--- /dev/null
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -0,0 +1,785 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI K3 Cortex-M4 Remote Processor(s) driver
+ *
+ * Copyright (C) 2021-2024 Texas Instruments Incorporated - https://www.ti.com/
+ *	Hari Nagalla <hnagalla@ti.com>
+ */
+
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "omap_remoteproc.h"
+#include "remoteproc_internal.h"
+#include "ti_sci_proc.h"
+
+/**
+ * struct k3_m4_rproc_mem - internal memory structure
+ * @cpu_addr: MPU virtual address of the memory region
+ * @bus_addr: Bus address used to access the memory region
+ * @dev_addr: Device address of the memory region from remote processor view
+ * @size: Size of the memory region
+ */
+struct k3_m4_rproc_mem {
+	void __iomem *cpu_addr;
+	phys_addr_t bus_addr;
+	u32 dev_addr;
+	size_t size;
+};
+
+/**
+ * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
+ * @name: name for this memory entry
+ * @dev_addr: device address for the memory entry
+ */
+struct k3_m4_rproc_mem_data {
+	const char *name;
+	const u32 dev_addr;
+};
+
+/**
+ * struct k3_m4_rproc_dev_data - device data structure for a remote processor
+ * @mems: pointer to memory definitions for a remote processor
+ * @num_mems: number of memory regions in @mems
+ * @uses_lreset: flag to denote the need for local reset management
+ */
+struct k3_m4_rproc_dev_data {
+	const struct k3_m4_rproc_mem_data *mems;
+	u32 num_mems;
+	bool uses_lreset;
+};
+
+/**
+ * struct k3_m4_rproc - k3 remote processor driver structure
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
+ */
+struct k3_m4_rproc {
+	struct device *dev;
+	struct rproc *rproc;
+	struct k3_m4_rproc_mem *mem;
+	int num_mems;
+	struct k3_m4_rproc_mem *rmem;
+	int num_rmems;
+	struct reset_control *reset;
+	const struct k3_m4_rproc_dev_data *data;
+	struct ti_sci_proc *tsp;
+	const struct ti_sci_handle *ti_sci;
+	u32 ti_sci_id;
+	struct mbox_chan *mbox;
+	struct mbox_client client;
+};
+
+/**
+ * k3_m4_rproc_mbox_callback() - inbound mailbox message handler
+ * @client: mailbox client pointer used for requesting the mailbox channel
+ * @data: mailbox payload
+ *
+ * This handler is invoked by the K3 mailbox driver whenever a mailbox
+ * message is received. Usually, the mailbox payload simply contains
+ * the index of the virtqueue that is kicked by the remote processor,
+ * and we let remoteproc core handle it.
+ *
+ * In addition to virtqueue indices, we also have some out-of-band values
+ * that indicate different events. Those values are deliberately very
+ * large so they don't coincide with virtqueue indices.
+ */
+static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
+{
+	struct k3_m4_rproc *kproc = container_of(client, struct k3_m4_rproc,
+						  client);
+	struct device *dev = kproc->rproc->dev.parent;
+	const char *name = kproc->rproc->name;
+	u32 msg = (u32)(uintptr_t)(data);
+
+	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
+
+	switch (msg) {
+	case RP_MBOX_CRASH:
+		/*
+		 * remoteproc detected an exception, but error recovery is not
+		 * supported. So, just log this for now
+		 */
+		dev_err(dev, "K3 rproc %s crashed\n", name);
+		break;
+	case RP_MBOX_ECHO_REPLY:
+		dev_info(dev, "received echo reply from %s\n", name);
+		break;
+	default:
+		/* silently handle all other valid messages */
+		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
+			return;
+		if (msg > kproc->rproc->max_notifyid) {
+			dev_dbg(dev, "dropping unknown message 0x%x", msg);
+			return;
+		}
+		/* msg contains the index of the triggered vring */
+		if (rproc_vq_interrupt(kproc->rproc, msg) == IRQ_NONE)
+			dev_dbg(dev, "no message was found in vqid %d\n", msg);
+	}
+}
+
+/*
+ * Kick the remote processor to notify about pending unprocessed messages.
+ * The vqid usage is not used and is inconsequential, as the kick is performed
+ * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
+ * the remote processor is expected to process both its Tx and Rx virtqueues.
+ */
+static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	u32 msg = (u32)vqid;
+	int ret;
+
+	/* send the index of the triggered virtqueue in the mailbox payload */
+	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
+	if (ret < 0)
+		dev_err(dev, "failed to send mailbox message, status = %d\n",
+			ret);
+}
+
+/* Put the remote processor into reset */
+static int k3_m4_rproc_reset(struct k3_m4_rproc *kproc)
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
+
+/* Release the remote processor from reset */
+static int k3_m4_rproc_release(struct k3_m4_rproc *kproc)
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
+
+static int k3_m4_rproc_request_mbox(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	struct mbox_client *client = &kproc->client;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	client->dev = dev;
+	client->tx_done = NULL;
+	client->rx_callback = k3_m4_rproc_mbox_callback;
+	client->tx_block = false;
+	client->knows_txdone = false;
+
+	kproc->mbox = mbox_request_channel(client, 0);
+	if (IS_ERR(kproc->mbox)) {
+		ret = -EBUSY;
+		dev_err(dev, "mbox_request_channel failed: %ld\n",
+			PTR_ERR(kproc->mbox));
+		return ret;
+	}
+
+	/*
+	 * Ping the remote processor, this is only for sanity-sake for now;
+	 * there is no functional effect whatsoever.
+	 *
+	 * Note that the reply will _not_ arrive immediately: this message
+	 * will wait in the mailbox fifo until the remote processor is booted.
+	 */
+	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
+	if (ret < 0) {
+		dev_err(dev, "mbox_send_message failed: %d\n", ret);
+		mbox_free_channel(kproc->mbox);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * The M4 cores have a local reset that affects only the CPU, and a
+ * generic module reset that powers on the device and allows the internal
+ * memories to be accessed while the local reset is asserted. This function is
+ * used to release the global reset on remote cores to allow loading into the
+ * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
+ * firmware loading, and is followed by the .start() ops after loading to
+ * actually let the remote cores to run. This callback is invoked only in
+ * remoteproc mode.
+ */
+static int k3_m4_rproc_prepare(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret)
+		dev_err(dev, "module-reset deassert failed, cannot enable internal RAM loading, ret = %d\n",
+			ret);
+
+	return ret;
+}
+
+/*
+ * This function implements the .unprepare() ops and performs the complimentary
+ * operations to that of the .prepare() ops. The function is used to assert the
+ * global reset on applicable cores. This completes the second portion of
+ * powering down the remote core. The cores themselves are only halted in the
+ * .stop() callback through the local reset, and the .unprepare() ops is invoked
+ * by the remoteproc core after the remoteproc is stopped to balance the global
+ * reset. This callback is invoked only in remoteproc mode.
+ */
+static int k3_m4_rproc_unprepare(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret)
+		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
+
+	return ret;
+}
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
+static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
+							 size_t *rsc_table_sz)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
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
+	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
+}
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
+static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
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
+		/* handle M4-view addresses */
+		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
+			offset = da - dev_addr;
+			va = kproc->mem[i].cpu_addr + offset;
+			return (__force void *)va;
+		}
+
+		/* handle SoC-view addresses */
+		if (da >= bus_addr && ((da + len) <= (bus_addr + size))) {
+			offset = da - bus_addr;
+			va = kproc->mem[i].cpu_addr + offset;
+			return (__force void *)va;
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
+
+static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
+				       struct k3_m4_rproc *kproc)
+{
+	const struct k3_m4_rproc_dev_data *data = kproc->data;
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
+
+static void k3_m4_rproc_dev_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+
+static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
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
+	if (num_rmems < 0) {
+		dev_err(dev, "device does not reserved memory regions (%pe)\n",
+			ERR_PTR(num_rmems));
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
+		dev_err(dev, "device cannot initialize DMA pool (%pe)\n",
+			ERR_PTR(ret));
+		return ret;
+	}
+	ret = devm_add_action_or_reset(dev, k3_m4_rproc_dev_mem_release, dev);
+	if (ret)
+		return ret;
+
+	num_rmems--;
+	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
+	if (!kproc->rmem)
+		return -ENOMEM;
+
+	/* use remaining reserved memory regions for static carveouts */
+	for (i = 0; i < num_rmems; i++) {
+		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
+		if (!rmem_np)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(rmem_np);
+		if (!rmem) {
+			of_node_put(rmem_np);
+			return -EINVAL;
+		}
+		of_node_put(rmem_np);
+
+		kproc->rmem[i].bus_addr = rmem->base;
+		/* 64-bit address regions currently not supported */
+		kproc->rmem[i].dev_addr = (u32)rmem->base;
+		kproc->rmem[i].size = rmem->size;
+		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
+		if (!kproc->rmem[i].cpu_addr) {
+			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
+				i + 1, &rmem->base, &rmem->size);
+			return -ENOMEM;
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
+}
+
+static struct ti_sci_proc *k3_m4_rproc_of_get_tsp(struct device *dev,
+						  const struct ti_sci_handle *sci)
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
+	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
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
+
+static void k3_m4_release_tsp(void *data)
+{
+	struct ti_sci_proc *tsp = data;
+
+	ti_sci_proc_release(tsp);
+}
+
+/*
+ * Power up the M4F remote processor.
+ *
+ * This function will be invoked only after the firmware for this rproc
+ * was loaded, parsed successfully, and all of its resource requirements
+ * were met. This callback is invoked only in remoteproc mode.
+ */
+static int k3_m4_rproc_start(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	int ret;
+
+	ret = k3_m4_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
+	ret = k3_m4_rproc_release(kproc);
+	if (ret)
+		goto put_mbox;
+
+	return 0;
+
+put_mbox:
+	mbox_free_channel(kproc->mbox);
+	return ret;
+}
+
+/*
+ * Stop the M4 remote processor.
+ *
+ * This function puts the M4 processor into reset, and finishes processing
+ * of any pending messages. This callback is invoked only in remoteproc mode.
+ */
+static int k3_m4_rproc_stop(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+
+	mbox_free_channel(kproc->mbox);
+
+	k3_m4_rproc_reset(kproc);
+
+	return 0;
+}
+
+/*
+ * Attach to a running M4 remote processor (IPC-only mode)
+ *
+ * This rproc attach callback only needs to request the mailbox, the remote
+ * processor is already booted, so there is no need to issue any TI-SCI
+ * commands to boot the M4 core. This callback is used only in IPC-only mode.
+ */
+static int k3_m4_rproc_attach(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	ret = k3_m4_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "M4 initialized in IPC-only mode\n");
+	return 0;
+}
+
+/*
+ * Detach from a running M4 remote processor (IPC-only mode)
+ *
+ * This rproc detach callback performs the opposite operation to attach callback
+ * and only needs to release the mailbox, the M4 core is not stopped and will
+ * be left to continue to run its booted firmware. This callback is invoked only in
+ * IPC-only mode.
+ */
+static int k3_m4_rproc_detach(struct rproc *rproc)
+{
+	struct k3_m4_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	mbox_free_channel(kproc->mbox);
+	dev_info(dev, "M4 deinitialized in IPC-only mode\n");
+	return 0;
+}
+
+static const struct rproc_ops k3_m4_rproc_ops = {
+	.start		= k3_m4_rproc_start,
+	.stop		= k3_m4_rproc_stop,
+	.attach		= k3_m4_rproc_attach,
+	.detach		= k3_m4_rproc_detach,
+	.kick		= k3_m4_rproc_kick,
+	.da_to_va	= k3_m4_rproc_da_to_va,
+	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
+};
+
+static int k3_m4_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct k3_m4_rproc_dev_data *data;
+	struct k3_m4_rproc *kproc;
+	struct rproc *rproc;
+	const char *fw_name;
+	bool r_state = false;
+	bool p_state = false;
+	int ret = 0;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
+
+	rproc = devm_rproc_alloc(dev, dev_name(dev), &k3_m4_rproc_ops, fw_name,
+				 sizeof(*kproc));
+	if (!rproc)
+		return -ENOMEM;
+
+	rproc->has_iommu = false;
+	rproc->recovery_disabled = true;
+	if (data->uses_lreset) {
+		rproc->ops->prepare = k3_m4_rproc_prepare;
+		rproc->ops->unprepare = k3_m4_rproc_unprepare;
+	}
+	kproc = rproc->priv;
+	kproc->rproc = rproc;
+	kproc->dev = dev;
+	kproc->data = data;
+
+	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
+	if (IS_ERR(kproc->ti_sci))
+		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
+				     "failed to get ti-sci handle\n");
+
+	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
+
+	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(kproc->reset))
+		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
+
+	kproc->tsp = k3_m4_rproc_of_get_tsp(dev, kproc->ti_sci);
+	if (IS_ERR(kproc->tsp))
+		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
+				     "failed to construct ti-sci proc control\n");
+
+	ret = ti_sci_proc_request(kproc->tsp);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
+	ret = devm_add_action_or_reset(dev, k3_m4_release_tsp, kproc->tsp);
+	if (ret)
+		return ret;
+
+	ret = k3_m4_rproc_of_get_memories(pdev, kproc);
+	if (ret)
+		return ret;
+
+	ret = k3_m4_reserved_mem_init(kproc);
+	if (ret)
+		return dev_err_probe(dev, ret, "reserved memory init failed\n");
+
+	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
+					       &r_state, &p_state);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get initial state, mode cannot be determined\n");
+
+	/* configure devices for either remoteproc or IPC-only mode */
+	if (p_state) {
+		dev_info(dev, "configured M4 for IPC-only mode\n");
+		rproc->state = RPROC_DETACHED;
+		/* override rproc ops with only required IPC-only mode ops */
+		rproc->ops->prepare = NULL;
+		rproc->ops->unprepare = NULL;
+		rproc->ops->start = NULL;
+		rproc->ops->stop = NULL;
+		rproc->ops->attach = k3_m4_rproc_attach;
+		rproc->ops->detach = k3_m4_rproc_detach;
+		rproc->ops->get_loaded_rsc_table = k3_m4_get_loaded_rsc_table;
+	} else {
+		dev_info(dev, "configured M4 for remoteproc mode\n");
+		/*
+		 * ensure the M4 local reset is asserted to ensure the core
+		 * doesn't execute bogus code in .prepare() when the module
+		 * reset is released.
+		 */
+		if (data->uses_lreset) {
+			ret = reset_control_status(kproc->reset);
+			if (ret < 0) {
+				return dev_err_probe(dev, ret, "failed to get reset status\n");
+			} else if (ret == 0) {
+				dev_warn(dev, "local reset is deasserted for device\n");
+				k3_m4_rproc_reset(kproc);
+			}
+		}
+	}
+
+	ret = devm_rproc_add(dev, rproc);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add register device with remoteproc core\n");
+
+	return 0;
+}
+
+static const struct k3_m4_rproc_mem_data am64_m4_mems[] = {
+	{ .name = "iram", .dev_addr = 0x0 },
+	{ .name = "dram", .dev_addr = 0x30000 },
+};
+
+static const struct k3_m4_rproc_dev_data am64_m4_data = {
+	.mems = am64_m4_mems,
+	.num_mems = ARRAY_SIZE(am64_m4_mems),
+	.uses_lreset = true,
+};
+
+static const struct of_device_id k3_m4_of_match[] = {
+	{ .compatible = "ti,am64-m4fss", .data = &am64_m4_data, },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, k3_m4_of_match);
+
+static struct platform_driver k3_m4_rproc_driver = {
+	.probe	= k3_m4_rproc_probe,
+	.driver	= {
+		.name = "k3-m4-rproc",
+		.of_match_table = k3_m4_of_match,
+	},
+};
+module_platform_driver(k3_m4_rproc_driver);
+
+MODULE_AUTHOR("Hari Nagalla <hnagalla@ti.com>");
+MODULE_DESCRIPTION("TI K3 M4 Remoteproc driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2


