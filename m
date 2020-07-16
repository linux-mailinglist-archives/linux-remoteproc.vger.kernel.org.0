Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4030A222E9F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Jul 2020 01:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgGPXJF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Jul 2020 19:09:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38121 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbgGPXJE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Jul 2020 19:09:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594940942; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4gVsqE+YTWjIEmmI++cajGVBZ2to7Zul+XJMBjkNm1U=; b=v60dKRSMj6wZVexVWf2aC8EKd7Gs8dOK8PAx2kTS5SBJ2peZsoexDishx35YQVdwFfTvGqZH
 dSwguTZVTNk5aSHCHJ7ISHNLxTecuLN0Q33t8hKOTkkrEju2neRqGp/kxZunsL0bnroPURgr
 S7CgM6OUhUtW/wHDuLZz514UoQE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f10d31e427cd557667019e0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 22:22:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D307C433C9; Thu, 16 Jul 2020 22:22:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03B76C433CB;
        Thu, 16 Jul 2020 22:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03B76C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sibis@codearora.org, tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v8 1/5] remoteproc: Move coredump functionality to a new file
Date:   Thu, 16 Jul 2020 15:20:31 -0700
Message-Id: <1594938035-7327-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
References: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move all coredump functionality to an individual file. This is
being done so that the current functionality can be extended
in future patchsets.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Tested-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/remoteproc_core.c     | 191 -----------------------------
 drivers/remoteproc/remoteproc_coredump.c | 204 +++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |   4 +
 4 files changed, 209 insertions(+), 191 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_coredump.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index e8b886e..8702a4e 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -5,6 +5,7 @@
 
 obj-$(CONFIG_REMOTEPROC)		+= remoteproc.o
 remoteproc-y				:= remoteproc_core.o
+remoteproc-y				+= remoteproc_coredump.o
 remoteproc-y				+= remoteproc_debugfs.o
 remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9f04c30..57db042 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -26,7 +26,6 @@
 #include <linux/firmware.h>
 #include <linux/string.h>
 #include <linux/debugfs.h>
-#include <linux/devcoredump.h>
 #include <linux/rculist.h>
 #include <linux/remoteproc.h>
 #include <linux/pm_runtime.h>
@@ -41,7 +40,6 @@
 #include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
-#include "remoteproc_elf_helpers.h"
 
 #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
 
@@ -1239,19 +1237,6 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 	return 0;
 }
 
-/**
- * rproc_coredump_cleanup() - clean up dump_segments list
- * @rproc: the remote processor handle
- */
-static void rproc_coredump_cleanup(struct rproc *rproc)
-{
-	struct rproc_dump_segment *entry, *tmp;
-
-	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
-		list_del(&entry->node);
-		kfree(entry);
-	}
-}
 
 /**
  * rproc_resource_cleanup() - clean up and free all acquired resources
@@ -1518,182 +1503,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	return 0;
 }
 
-/**
- * rproc_coredump_add_segment() - add segment of device memory to coredump
- * @rproc:	handle of a remote processor
- * @da:		device address
- * @size:	size of segment
- *
- * Add device memory to the list of segments to be included in a coredump for
- * the remoteproc.
- *
- * Return: 0 on success, negative errno on error.
- */
-int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
-{
-	struct rproc_dump_segment *segment;
-
-	segment = kzalloc(sizeof(*segment), GFP_KERNEL);
-	if (!segment)
-		return -ENOMEM;
-
-	segment->da = da;
-	segment->size = size;
-
-	list_add_tail(&segment->node, &rproc->dump_segments);
-
-	return 0;
-}
-EXPORT_SYMBOL(rproc_coredump_add_segment);
-
-/**
- * rproc_coredump_add_custom_segment() - add custom coredump segment
- * @rproc:	handle of a remote processor
- * @da:		device address
- * @size:	size of segment
- * @dumpfn:	custom dump function called for each segment during coredump
- * @priv:	private data
- *
- * Add device memory to the list of segments to be included in the coredump
- * and associate the segment with the given custom dump function and private
- * data.
- *
- * Return: 0 on success, negative errno on error.
- */
-int rproc_coredump_add_custom_segment(struct rproc *rproc,
-				      dma_addr_t da, size_t size,
-				      void (*dumpfn)(struct rproc *rproc,
-						     struct rproc_dump_segment *segment,
-						     void *dest),
-				      void *priv)
-{
-	struct rproc_dump_segment *segment;
-
-	segment = kzalloc(sizeof(*segment), GFP_KERNEL);
-	if (!segment)
-		return -ENOMEM;
-
-	segment->da = da;
-	segment->size = size;
-	segment->priv = priv;
-	segment->dump = dumpfn;
-
-	list_add_tail(&segment->node, &rproc->dump_segments);
-
-	return 0;
-}
-EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
-
-/**
- * rproc_coredump_set_elf_info() - set coredump elf information
- * @rproc:	handle of a remote processor
- * @class:	elf class for coredump elf file
- * @machine:	elf machine for coredump elf file
- *
- * Set elf information which will be used for coredump elf file.
- *
- * Return: 0 on success, negative errno on error.
- */
-int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine)
-{
-	if (class != ELFCLASS64 && class != ELFCLASS32)
-		return -EINVAL;
-
-	rproc->elf_class = class;
-	rproc->elf_machine = machine;
-
-	return 0;
-}
-EXPORT_SYMBOL(rproc_coredump_set_elf_info);
-
-/**
- * rproc_coredump() - perform coredump
- * @rproc:	rproc handle
- *
- * This function will generate an ELF header for the registered segments
- * and create a devcoredump device associated with rproc.
- */
-static void rproc_coredump(struct rproc *rproc)
-{
-	struct rproc_dump_segment *segment;
-	void *phdr;
-	void *ehdr;
-	size_t data_size;
-	size_t offset;
-	void *data;
-	void *ptr;
-	u8 class = rproc->elf_class;
-	int phnum = 0;
-
-	if (list_empty(&rproc->dump_segments))
-		return;
-
-	if (class == ELFCLASSNONE) {
-		dev_err(&rproc->dev, "Elf class is not set\n");
-		return;
-	}
-
-	data_size = elf_size_of_hdr(class);
-	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		data_size += elf_size_of_phdr(class) + segment->size;
-
-		phnum++;
-	}
-
-	data = vmalloc(data_size);
-	if (!data)
-		return;
-
-	ehdr = data;
-
-	memset(ehdr, 0, elf_size_of_hdr(class));
-	/* e_ident field is common for both elf32 and elf64 */
-	elf_hdr_init_ident(ehdr, class);
-
-	elf_hdr_set_e_type(class, ehdr, ET_CORE);
-	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
-	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
-	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
-	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
-	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
-	elf_hdr_set_e_phentsize(class, ehdr, elf_size_of_phdr(class));
-	elf_hdr_set_e_phnum(class, ehdr, phnum);
-
-	phdr = data + elf_hdr_get_e_phoff(class, ehdr);
-	offset = elf_hdr_get_e_phoff(class, ehdr);
-	offset += elf_size_of_phdr(class) * elf_hdr_get_e_phnum(class, ehdr);
-
-	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		memset(phdr, 0, elf_size_of_phdr(class));
-		elf_phdr_set_p_type(class, phdr, PT_LOAD);
-		elf_phdr_set_p_offset(class, phdr, offset);
-		elf_phdr_set_p_vaddr(class, phdr, segment->da);
-		elf_phdr_set_p_paddr(class, phdr, segment->da);
-		elf_phdr_set_p_filesz(class, phdr, segment->size);
-		elf_phdr_set_p_memsz(class, phdr, segment->size);
-		elf_phdr_set_p_flags(class, phdr, PF_R | PF_W | PF_X);
-		elf_phdr_set_p_align(class, phdr, 0);
-
-		if (segment->dump) {
-			segment->dump(rproc, segment, data + offset);
-		} else {
-			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
-			if (!ptr) {
-				dev_err(&rproc->dev,
-					"invalid coredump segment (%pad, %zu)\n",
-					&segment->da, segment->size);
-				memset(data + offset, 0xff, segment->size);
-			} else {
-				memcpy(data + offset, ptr, segment->size);
-			}
-		}
-
-		offset += elf_phdr_get_p_filesz(class, phdr);
-		phdr += elf_size_of_phdr(class);
-	}
-
-	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
-}
 
 /**
  * rproc_trigger_recovery() - recover a remoteproc
diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
new file mode 100644
index 0000000..ded0244
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Coredump functionality for Remoteproc framework.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/remoteproc.h>
+#include "remoteproc_internal.h"
+#include "remoteproc_elf_helpers.h"
+
+/**
+ * rproc_coredump_cleanup() - clean up dump_segments list
+ * @rproc: the remote processor handle
+ */
+void rproc_coredump_cleanup(struct rproc *rproc)
+{
+	struct rproc_dump_segment *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+}
+
+/**
+ * rproc_coredump_add_segment() - add segment of device memory to coredump
+ * @rproc:	handle of a remote processor
+ * @da:		device address
+ * @size:	size of segment
+ *
+ * Add device memory to the list of segments to be included in a coredump for
+ * the remoteproc.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
+{
+	struct rproc_dump_segment *segment;
+
+	segment = kzalloc(sizeof(*segment), GFP_KERNEL);
+	if (!segment)
+		return -ENOMEM;
+
+	segment->da = da;
+	segment->size = size;
+
+	list_add_tail(&segment->node, &rproc->dump_segments);
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_coredump_add_segment);
+
+/**
+ * rproc_coredump_add_custom_segment() - add custom coredump segment
+ * @rproc:	handle of a remote processor
+ * @da:		device address
+ * @size:	size of segment
+ * @dumpfn:	custom dump function called for each segment during coredump
+ * @priv:	private data
+ *
+ * Add device memory to the list of segments to be included in the coredump
+ * and associate the segment with the given custom dump function and private
+ * data.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_add_custom_segment(struct rproc *rproc,
+				      dma_addr_t da, size_t size,
+				      void (*dumpfn)(struct rproc *rproc,
+						     struct rproc_dump_segment *segment,
+						     void *dest),
+				      void *priv)
+{
+	struct rproc_dump_segment *segment;
+
+	segment = kzalloc(sizeof(*segment), GFP_KERNEL);
+	if (!segment)
+		return -ENOMEM;
+
+	segment->da = da;
+	segment->size = size;
+	segment->priv = priv;
+	segment->dump = dumpfn;
+
+	list_add_tail(&segment->node, &rproc->dump_segments);
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
+
+/**
+ * rproc_coredump_set_elf_info() - set coredump elf information
+ * @rproc:	handle of a remote processor
+ * @class:	elf class for coredump elf file
+ * @machine:	elf machine for coredump elf file
+ *
+ * Set elf information which will be used for coredump elf file.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine)
+{
+	if (class != ELFCLASS64 && class != ELFCLASS32)
+		return -EINVAL;
+
+	rproc->elf_class = class;
+	rproc->elf_machine = machine;
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_coredump_set_elf_info);
+
+/**
+ * rproc_coredump() - perform coredump
+ * @rproc:	rproc handle
+ *
+ * This function will generate an ELF header for the registered segments
+ * and create a devcoredump device associated with rproc.
+ */
+void rproc_coredump(struct rproc *rproc)
+{
+	struct rproc_dump_segment *segment;
+	void *phdr;
+	void *ehdr;
+	size_t data_size;
+	size_t offset;
+	void *data;
+	void *ptr;
+	u8 class = rproc->elf_class;
+	int phnum = 0;
+
+	if (list_empty(&rproc->dump_segments))
+		return;
+
+	if (class == ELFCLASSNONE) {
+		dev_err(&rproc->dev, "Elf class is not set\n");
+		return;
+	}
+
+	data_size = elf_size_of_hdr(class);
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		data_size += elf_size_of_phdr(class) + segment->size;
+
+		phnum++;
+	}
+
+	data = vmalloc(data_size);
+	if (!data)
+		return;
+
+	ehdr = data;
+
+	memset(ehdr, 0, elf_size_of_hdr(class));
+	/* e_ident field is common for both elf32 and elf64 */
+	elf_hdr_init_ident(ehdr, class);
+
+	elf_hdr_set_e_type(class, ehdr, ET_CORE);
+	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
+	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
+	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
+	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_phentsize(class, ehdr, elf_size_of_phdr(class));
+	elf_hdr_set_e_phnum(class, ehdr, phnum);
+
+	phdr = data + elf_hdr_get_e_phoff(class, ehdr);
+	offset = elf_hdr_get_e_phoff(class, ehdr);
+	offset += elf_size_of_phdr(class) * elf_hdr_get_e_phnum(class, ehdr);
+
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		memset(phdr, 0, elf_size_of_phdr(class));
+		elf_phdr_set_p_type(class, phdr, PT_LOAD);
+		elf_phdr_set_p_offset(class, phdr, offset);
+		elf_phdr_set_p_vaddr(class, phdr, segment->da);
+		elf_phdr_set_p_paddr(class, phdr, segment->da);
+		elf_phdr_set_p_filesz(class, phdr, segment->size);
+		elf_phdr_set_p_memsz(class, phdr, segment->size);
+		elf_phdr_set_p_flags(class, phdr, PF_R | PF_W | PF_X);
+		elf_phdr_set_p_align(class, phdr, 0);
+
+		if (segment->dump) {
+			segment->dump(rproc, segment, data + offset);
+		} else {
+			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+			if (!ptr) {
+				dev_err(&rproc->dev,
+					"invalid coredump segment (%pad, %zu)\n",
+					&segment->da, segment->size);
+				memset(data + offset, 0xff, segment->size);
+			} else {
+				memcpy(data + offset, ptr, segment->size);
+			}
+		}
+
+		offset += elf_phdr_get_p_filesz(class, phdr);
+		phdr += elf_size_of_phdr(class);
+	}
+
+	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
+}
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 4ba7cb5..97d441b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -47,6 +47,10 @@ extern struct class rproc_class;
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
+/* from remoteproc_coredump.c */
+void rproc_coredump_cleanup(struct rproc *rproc);
+void rproc_coredump(struct rproc *rproc);
+
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

