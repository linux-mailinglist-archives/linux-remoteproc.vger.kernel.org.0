Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69B21D3EB0
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 May 2020 22:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgENUIb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 14 May 2020 16:08:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:11939 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729439AbgENUI3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 16:08:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589486908; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=HTTLvGf/p+GB7zdORuJgczUJawkZV7V1aYsxuOi8hQ8=; b=Iah7FLB0rx0MxIojhfxJi2zlrfWlBPHIk4kWE4hMTz0jIR4AB4JCj4ZuBbxcyysnmLsnvHGx
 H8s+v70QOcbCAo/BYmmsXgzlgAn2wEl2EQwaduv4lDqsz+KigkNeV59Sslq37z//WtOG8IaO
 MprV0QS0/TJ2lVpKDVJVfl5ygT4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebda53b.7fea7e3dece0-smtp-out-n01;
 Thu, 14 May 2020 20:08:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4FDFDC38567; Thu, 14 May 2020 20:08:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 755EBC44795;
        Thu, 14 May 2020 20:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 755EBC44795
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 1/3] remoteproc: Move coredump functionality to a new file
Date:   Thu, 14 May 2020 13:07:34 -0700
Message-Id: <1589486856-23440-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589486856-23440-1-git-send-email-rishabhb@codeaurora.org>
References: <1589486856-23440-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move all coredump functionality to an individual file. This is
being done so that the current functionality can be extended
in future patchsets.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/remoteproc_core.c     | 191 -----------------------------
 drivers/remoteproc/remoteproc_coredump.c | 204 +++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |   4 +
 4 files changed, 209 insertions(+), 191 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_coredump.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 0effd38..f1a33c3 100644
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
index 4bd0f45..22575f4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -26,7 +26,6 @@
 #include <linux/firmware.h>
 #include <linux/string.h>
 #include <linux/debugfs.h>
-#include <linux/devcoredump.h>
 #include <linux/rculist.h>
 #include <linux/remoteproc.h>
 #include <linux/iommu.h>
@@ -40,7 +39,6 @@
 #include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
-#include "remoteproc_elf_helpers.h"
 
 #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
 
@@ -1238,19 +1236,6 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
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
@@ -1509,182 +1494,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
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
@@ -47,6 +47,10 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
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
