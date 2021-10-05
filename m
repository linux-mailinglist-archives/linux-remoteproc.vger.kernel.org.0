Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99EA42226A
	for <lists+linux-remoteproc@lfdr.de>; Tue,  5 Oct 2021 11:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbhJEJiE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 Oct 2021 05:38:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50426 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233077AbhJEJiD (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Oct 2021 05:38:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633426572; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RB+goc1pXqOwBcgiibJgzjP9NGjxT5I8g25065BnTUo=; b=iZ0+poDWML+xQX9rF1edki1qTYtXMAU6wXYR7jE2ZoPrWBeAfxDsd7OP1q7FHvYRvTHEKYhS
 lNkAGxpjCaHclfaQXHacvgegHwa0fXlPyZIxHWtcikuHmMwO1qy/UYbdnQWilo8PJS0EGw9Q
 B3+bTejUXttDEqLo3bxk4qtZvo4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615c1c87519bd8dcf0c8de65 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 09:36:07
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1BD59C43618; Tue,  5 Oct 2021 09:36:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 855EBC4360C;
        Tue,  5 Oct 2021 09:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 855EBC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V3 1/2] soc: qcom: smem: map only partitions used by local HOST
Date:   Tue,  5 Oct 2021 15:02:44 +0530
Message-Id: <1633426371-4827-2-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
References: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SMEM driver is IO mapping complete region and CPU is doing a speculative
read into a partition where local HOST does not have permission resulting
in a NOC error.

Map only those partitions which are accessibly to local HOST.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smem.c | 238 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 176 insertions(+), 62 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 4fb5aee..dfbd06b 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -194,6 +194,20 @@ struct smem_partition_header {
 	__le32 reserved[3];
 };
 
+/**
+ * struct smem_partition - describes smem partition
+ * @virt_base:	starting virtual address of partition
+ * @phys_base:	starting physical address of partition
+ * @cacheline:	alignment for "cached" entries
+ * @size:	size of partition
+ */
+struct smem_partition {
+	void __iomem *virt_base;
+	phys_addr_t phys_base;
+	size_t cacheline;
+	size_t size;
+};
+
 static const u8 SMEM_PART_MAGIC[] = { 0x24, 0x50, 0x52, 0x54 };
 
 /**
@@ -249,11 +263,9 @@ struct smem_region {
  * struct qcom_smem - device data for the smem device
  * @dev:	device pointer
  * @hwlock:	reference to a hwspinlock
- * @global_partition:	pointer to global partition when in use
- * @global_cacheline:	cacheline size for global partition
- * @partitions:	list of pointers to partitions affecting the current
- *		processor/host
- * @cacheline:	list of cacheline sizes for each host
+ * @ptable: virtual base of partition table
+ * @global_partition: describes for global partition when in use
+ * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
  * @num_regions: number of @regions
@@ -264,12 +276,11 @@ struct qcom_smem {
 
 	struct hwspinlock *hwlock;
 
-	struct smem_partition_header *global_partition;
-	size_t global_cacheline;
-	struct smem_partition_header *partitions[SMEM_HOST_COUNT];
-	size_t cacheline[SMEM_HOST_COUNT];
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct smem_ptable *ptable;
+	struct smem_partition global_partition;
+	struct smem_partition partitions[SMEM_HOST_COUNT];
 
 	unsigned num_regions;
 	struct smem_region regions[];
@@ -347,14 +358,17 @@ static struct qcom_smem *__smem;
 #define HWSPINLOCK_TIMEOUT	1000
 
 static int qcom_smem_alloc_private(struct qcom_smem *smem,
-				   struct smem_partition_header *phdr,
+				   struct smem_partition *part,
 				   unsigned item,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
 
+	phdr = (struct smem_partition_header __force *)part->virt_base;
+
 	hdr = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
@@ -441,7 +455,7 @@ static int qcom_smem_alloc_global(struct qcom_smem *smem,
  */
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 {
-	struct smem_partition_header *phdr;
+	struct smem_partition *part;
 	unsigned long flags;
 	int ret;
 
@@ -463,12 +477,12 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 	if (ret)
 		return ret;
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
-		phdr = __smem->partitions[host];
-		ret = qcom_smem_alloc_private(__smem, phdr, item, size);
-	} else if (__smem->global_partition) {
-		phdr = __smem->global_partition;
-		ret = qcom_smem_alloc_private(__smem, phdr, item, size);
+	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
+		part = &__smem->partitions[host];
+		ret = qcom_smem_alloc_private(__smem, part, item, size);
+	} else if (__smem->global_partition.virt_base) {
+		part = &__smem->global_partition;
+		ret = qcom_smem_alloc_private(__smem, part, item, size);
 	} else {
 		ret = qcom_smem_alloc_global(__smem, item, size);
 	}
@@ -510,12 +524,14 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 }
 
 static void *qcom_smem_get_private(struct qcom_smem *smem,
-				   struct smem_partition_header *phdr,
-				   size_t cacheline,
+				   struct smem_partition *part,
 				   unsigned item,
 				   size_t *size)
 {
 	struct smem_private_entry *e, *end;
+	struct smem_partition_header *phdr;
+
+	phdr = (struct smem_partition_header __force *)part->virt_base;
 
 	e = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
@@ -537,7 +553,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 
 	/* Item was not found in the uncached list, search the cached list */
 
-	e = phdr_to_first_cached_entry(phdr, cacheline);
+	e = phdr_to_first_cached_entry(phdr, part->cacheline);
 	end = phdr_to_last_cached_entry(phdr);
 
 	while (e > end) {
@@ -552,7 +568,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			return cached_entry_to_item(e);
 		}
 
-		e = cached_entry_next(e, cacheline);
+		e = cached_entry_next(e, part->cacheline);
 	}
 
 	return ERR_PTR(-ENOENT);
@@ -575,9 +591,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
  */
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 {
-	struct smem_partition_header *phdr;
+	struct smem_partition *part;
 	unsigned long flags;
-	size_t cacheln;
 	int ret;
 	void *ptr = ERR_PTR(-EPROBE_DEFER);
 
@@ -593,14 +608,12 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
-		phdr = __smem->partitions[host];
-		cacheln = __smem->cacheline[host];
-		ptr = qcom_smem_get_private(__smem, phdr, cacheln, item, size);
-	} else if (__smem->global_partition) {
-		phdr = __smem->global_partition;
-		cacheln = __smem->global_cacheline;
-		ptr = qcom_smem_get_private(__smem, phdr, cacheln, item, size);
+	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
+		part = &__smem->partitions[host];
+		ptr = qcom_smem_get_private(__smem, part, item, size);
+	} else if (__smem->global_partition.virt_base) {
+		part = &__smem->global_partition;
+		ptr = qcom_smem_get_private(__smem, part, item, size);
 	} else {
 		ptr = qcom_smem_get_global(__smem, item, size);
 	}
@@ -621,6 +634,7 @@ EXPORT_SYMBOL(qcom_smem_get);
  */
 int qcom_smem_get_free_space(unsigned host)
 {
+	struct smem_partition *part;
 	struct smem_partition_header *phdr;
 	struct smem_header *header;
 	unsigned ret;
@@ -628,12 +642,14 @@ int qcom_smem_get_free_space(unsigned host)
 	if (!__smem)
 		return -EPROBE_DEFER;
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
-		phdr = __smem->partitions[host];
+	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
+		part = &__smem->partitions[host];
+		phdr = part->virt_base;
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
-	} else if (__smem->global_partition) {
-		phdr = __smem->global_partition;
+	} else if (__smem->global_partition.virt_base) {
+		part = &__smem->global_partition;
+		phdr = part->virt_base;
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
 	} else {
@@ -645,6 +661,11 @@ int qcom_smem_get_free_space(unsigned host)
 }
 EXPORT_SYMBOL(qcom_smem_get_free_space);
 
+static bool addr_in_range(void __iomem *base, size_t size, void *addr)
+{
+	return base && (addr >= base && addr < base + size);
+}
+
 /**
  * qcom_smem_virt_to_phys() - return the physical address associated
  * with an smem item pointer (previously returned by qcom_smem_get()
@@ -654,17 +675,36 @@ EXPORT_SYMBOL(qcom_smem_get_free_space);
  */
 phys_addr_t qcom_smem_virt_to_phys(void *p)
 {
-	unsigned i;
+	struct smem_partition *part;
+	struct smem_region *area;
+	u64 offset;
+	u32 i;
+
+	for (i = 0; i < SMEM_HOST_COUNT; i++) {
+		part = &__smem->partitions[i];
+
+		if (addr_in_range(part->virt_base, part->size, p)) {
+			offset = p - part->virt_base;
+
+			return (phys_addr_t)part->phys_base + offset;
+		}
+	}
+
+	part = &__smem->global_partition;
+
+	if (addr_in_range(part->virt_base, part->size, p)) {
+		offset = p - part->virt_base;
+
+		return (phys_addr_t)part->phys_base + offset;
+	}
 
 	for (i = 0; i < __smem->num_regions; i++) {
-		struct smem_region *region = &__smem->regions[i];
+		area = &__smem->regions[i];
 
-		if (p < region->virt_base)
-			continue;
-		if (p < region->virt_base + region->size) {
-			u64 offset = p - region->virt_base;
+		if (addr_in_range(area->virt_base, area->size, p)) {
+			offset = p - area->virt_base;
 
-			return (phys_addr_t)region->aux_base + offset;
+			return (phys_addr_t)area->aux_base + offset;
 		}
 	}
 
@@ -688,7 +728,7 @@ static struct smem_ptable *qcom_smem_get_ptable(struct qcom_smem *smem)
 	struct smem_ptable *ptable;
 	u32 version;
 
-	ptable = smem->regions[0].virt_base + smem->regions[0].size - SZ_4K;
+	ptable = smem->ptable;
 	if (memcmp(ptable->magic, SMEM_PTABLE_MAGIC, sizeof(ptable->magic)))
 		return ERR_PTR(-ENOENT);
 
@@ -727,9 +767,14 @@ qcom_smem_partition_header(struct qcom_smem *smem,
 		struct smem_ptable_entry *entry, u16 host0, u16 host1)
 {
 	struct smem_partition_header *header;
+	u32 phys_addr;
 	u32 size;
 
-	header = smem->regions[0].virt_base + le32_to_cpu(entry->offset);
+	phys_addr = smem->regions[0].aux_base + le32_to_cpu(entry->offset);
+	header = devm_ioremap_wc(smem->dev, phys_addr, le32_to_cpu(entry->size));
+
+	if (!header)
+		return NULL;
 
 	if (memcmp(header->magic, SMEM_PART_MAGIC, sizeof(header->magic))) {
 		dev_err(smem->dev, "bad partition magic %4ph\n", header->magic);
@@ -771,7 +816,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
 	bool found = false;
 	int i;
 
-	if (smem->global_partition) {
+	if (smem->global_partition.virt_base) {
 		dev_err(smem->dev, "Already found the global partition\n");
 		return -EINVAL;
 	}
@@ -806,8 +851,11 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
 	if (!header)
 		return -EINVAL;
 
-	smem->global_partition = header;
-	smem->global_cacheline = le32_to_cpu(entry->cacheline);
+	smem->global_partition.virt_base = (void __iomem *)header;
+	smem->global_partition.phys_base = smem->regions[0].aux_base +
+								le32_to_cpu(entry->offset);
+	smem->global_partition.size = le32_to_cpu(entry->size);
+	smem->global_partition.cacheline = le32_to_cpu(entry->cacheline);
 
 	return 0;
 }
@@ -847,7 +895,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 			return -EINVAL;
 		}
 
-		if (smem->partitions[remote_host]) {
+		if (smem->partitions[remote_host].virt_base) {
 			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
 			return -EINVAL;
 		}
@@ -856,8 +904,11 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		if (!header)
 			return -EINVAL;
 
-		smem->partitions[remote_host] = header;
-		smem->cacheline[remote_host] = le32_to_cpu(entry->cacheline);
+		smem->partitions[remote_host].virt_base = (void __iomem *)header;
+		smem->partitions[remote_host].phys_base = smem->regions[0].aux_base +
+										le32_to_cpu(entry->offset);
+		smem->partitions[remote_host].size = le32_to_cpu(entry->size);
+		smem->partitions[remote_host].cacheline = le32_to_cpu(entry->cacheline);
 	}
 
 	return 0;
@@ -892,14 +943,64 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
 	return 0;
 }
 
+static int qcom_smem_map_toc(struct qcom_smem *smem, struct device *dev,
+				const char *name, int i)
+{
+	struct device_node *np;
+	struct resource r;
+	u32 ptable_start;
+	int ret;
+
+	np = of_parse_phandle(dev->of_node, name, 0);
+	if (!np) {
+		dev_err(dev, "No %s specified\n", name);
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(np, 0, &r);
+	of_node_put(np);
+	if (ret)
+		return ret;
+
+	smem->regions[i].aux_base = (u32)r.start;
+	smem->regions[i].size = resource_size(&r);
+	/* map starting 4K for smem header */
+	smem->regions[i].virt_base = devm_ioremap_wc(dev, r.start, SZ_4K);
+	ptable_start = r.start + resource_size(&r) - SZ_4K;
+	/* map last 4k for toc */
+	smem->ptable = devm_ioremap_wc(dev, ptable_start, SZ_4K);
+
+	if (!smem->regions[i].virt_base || !smem->ptable)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int qcom_smem_map_global(struct qcom_smem *smem, u32 size)
+{
+	u32 phys_addr;
+
+	phys_addr = smem->regions[0].aux_base;
+
+	smem->regions[0].size = size;
+	smem->regions[0].virt_base = devm_ioremap_wc(smem->dev, phys_addr, size);
+
+	if (!smem->regions[0].virt_base)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_smem_probe(struct platform_device *pdev)
 {
 	struct smem_header *header;
 	struct qcom_smem *smem;
+	unsigned long flags;
 	size_t array_size;
 	int num_regions;
 	int hwlock_id;
 	u32 version;
+	u32 size;
 	int ret;
 
 	num_regions = 1;
@@ -914,7 +1015,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	smem->dev = &pdev->dev;
 	smem->num_regions = num_regions;
 
-	ret = qcom_smem_map_memory(smem, &pdev->dev, "memory-region", 0);
+	ret = qcom_smem_map_toc(smem, &pdev->dev, "memory-region", 0);
 	if (ret)
 		return ret;
 
@@ -929,7 +1030,30 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	hwlock_id = of_hwspin_lock_get_id(pdev->dev.of_node, 0);
+	if (hwlock_id < 0) {
+		if (hwlock_id != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to retrieve hwlock\n");
+		return hwlock_id;
+	}
+
+	smem->hwlock = hwspin_lock_request_specific(hwlock_id);
+	if (!smem->hwlock)
+		return -ENXIO;
+
+	ret = hwspin_lock_timeout_irqsave(smem->hwlock, HWSPINLOCK_TIMEOUT, &flags);
+	if (ret)
+		return ret;
+	size = readl_relaxed(&header->available) + readl_relaxed(&header->free_offset);
+	hwspin_unlock_irqrestore(smem->hwlock, &flags);
+
 	version = qcom_smem_get_sbl_version(smem);
+	/*
+	 * smem header mapping is required only in heap version scheme, so unmap
+	 * it here. It will be remapped in qcom_smem_map_global() when whole
+	 * partition is mapped again.
+	 */
+	devm_iounmap(smem->dev, smem->regions[0].virt_base);
 	switch (version >> 16) {
 	case SMEM_GLOBAL_PART_VERSION:
 		ret = qcom_smem_set_global_partition(smem);
@@ -938,6 +1062,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		smem->item_count = qcom_smem_get_item_count(smem);
 		break;
 	case SMEM_GLOBAL_HEAP_VERSION:
+		qcom_smem_map_global(smem, size);
 		smem->item_count = SMEM_ITEM_COUNT;
 		break;
 	default:
@@ -950,17 +1075,6 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (ret < 0 && ret != -ENOENT)
 		return ret;
 
-	hwlock_id = of_hwspin_lock_get_id(pdev->dev.of_node, 0);
-	if (hwlock_id < 0) {
-		if (hwlock_id != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to retrieve hwlock\n");
-		return hwlock_id;
-	}
-
-	smem->hwlock = hwspin_lock_request_specific(hwlock_id);
-	if (!smem->hwlock)
-		return -ENXIO;
-
 	__smem = smem;
 
 	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

