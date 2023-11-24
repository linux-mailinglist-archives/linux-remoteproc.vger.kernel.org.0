Return-Path: <linux-remoteproc+bounces-30-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D797F861B
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Nov 2023 23:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13DA9B2130F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Nov 2023 22:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846503C6A6;
	Fri, 24 Nov 2023 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G+3r5MeD"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EC31BD8;
	Fri, 24 Nov 2023 14:21:51 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOM0bs5026925;
	Fri, 24 Nov 2023 22:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Ni8mPx/bBIsnmkKB9Zvh8ADCg/wTob8Ml3va5e8yT34=;
 b=G+3r5MeDS/52iSkEcQjS2ihIj0T7uwWLTe3FF0y/T3x4moMJAM4r1Qd3QQBo1Oduggw/
 JdGj6FK0DeFRnCjGh82sYaEUZ73oZHJx8jFBMDLWZ9Q8B+PD6XJJYVSPYl0PGWsM8NkZ
 KCtDxDEhM9/+cfz7FwbDM8kK2oNTL1Iya5yUS9YjBAf+P9VJcqWAdJqwdlWXbBZJT7Kp
 ybtEin5506NZycJqhzPuN4X/BK3vP0N0op0XBY8asyBAw/TOWpxVTyL1Fj9Rw5EXjYKD
 6UioEUlQBYmrmPNpoD0XE35TKBX2llhvLmKKPb6dMsdTbWeLnp0LmiWq/OyC3XqTMDJl Qg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ujp8x26ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:21:25 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOMLPrw004071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:21:25 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 24 Nov 2023 14:21:15 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [Patch v6 08/12] soc: qcom: Add Qualcomm APSS minidump kernel driver
Date: Sat, 25 Nov 2023 03:49:51 +0530
Message-ID: <1700864395-1479-9-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y5gupyU-c15rHZ7pluY2FcXODXG50dMK
X-Proofpoint-ORIG-GUID: y5gupyU-c15rHZ7pluY2FcXODXG50dMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240174

Minidump is a best effort mechanism to collect useful and predefined
data for first level of debugging on end user devices running on
Qualcomm SoCs. It is built on the premise that System on Chip (SoC)
or subsystem part of SoC crashes, due to a range of hardware and
software bugs. Hence, the ability to collect accurate data is only
a best-effort. The data collected could be invalid or corrupted,
data collection itself could fail, and so on.

Qualcomm devices in engineering mode provides a mechanism for
generating full system ramdumps for post mortem debugging. But in some
cases it's however not feasible to capture the entire content of RAM.
The minidump mechanism provides the means for selecting region should
be included in the ramdump. The solution supports extracting the
ramdump/minidump produced either over USB or stored to an attached
storage device.

The core of minidump feature is part of Qualcomm's boot firmware code.
It initializes shared memory (SMEM), which is a part of DDR and
allocates a small section of it to minidump table i.e also called
global table of content (G-ToC). Each subsystem (APSS, ADSP, ...) has
their own table of segments to be included in the minidump, all
references from a descriptor in SMEM (G-ToC). Each segment/region has
some details like name, physical address and it's size etc. and it
could be anywhere scattered in the DDR.

qcom_minidump(core or frontend) driver adds the capability to add inux
region to be dumped as part of ram dump collection. It provides
appropriate symbol to register/unregister client regions.

To simplify post mortem debugging, it creates and maintain an ELF
header as first region that gets updated upon registration
of a new region.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/soc/qcom/Kconfig                  |  13 +
 drivers/soc/qcom/Makefile                 |   1 +
 drivers/soc/qcom/qcom_minidump.c          | 606 ++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_minidump_internal.h |  10 +
 drivers/soc/qcom/smem.c                   |  20 +
 include/linux/soc/qcom/smem.h             |   2 +
 include/soc/qcom/qcom_minidump.h          |  18 +
 7 files changed, 670 insertions(+)
 create mode 100644 drivers/soc/qcom/qcom_minidump.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index e507a317c74f..984623c0c1a0 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -264,4 +264,17 @@ config QCOM_RPROC_MINIDUMP
 	  query predefined minidump segments associated with the remote processor
 	  and check its validity and end up collecting the dump on remote processor
 	  crash during its recovery.
+
+config QCOM_MINIDUMP
+	tristate "QCOM APSS Minidump driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM
+	help
+	  This config enables linux core infrastructure for Application
+	  processor subsystem (APSS) minidump collection i.e, it enables
+	  Linux clients drivers to register their internal data structures
+	  and debug messages as part of the apss minidump table and when
+	  the SoC is crashed, these selective regions will be dumped
+	  instead of the entire DDR dump. This saves significant amount
+	  of time and/or storage space.
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 838528e7e30a..4b5f72f78d3c 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
 qcom_ice-objs			+= ice.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
 obj-$(CONFIG_QCOM_RPROC_MINIDUMP)	+= qcom_rproc_minidump.o
+obj-$(CONFIG_QCOM_MINIDUMP)		+= qcom_minidump.o
diff --git a/drivers/soc/qcom/qcom_minidump.c b/drivers/soc/qcom/qcom_minidump.c
new file mode 100644
index 000000000000..c0f76a51d0e8
--- /dev/null
+++ b/drivers/soc/qcom/qcom_minidump.c
@@ -0,0 +1,606 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/device.h>
+#include <linux/elf.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/string.h>
+#include <soc/qcom/qcom_minidump.h>
+
+#include "qcom_minidump_internal.h"
+
+/**
+ * struct minidump_ss_data - Minidump subsystem private data
+ * @md_ss_toc: Application Subsystem TOC pointer
+ * @md_regions: Application Subsystem region base pointer
+ */
+struct minidump_ss_data {
+	struct minidump_subsystem *md_ss_toc;
+	struct minidump_region	  *md_regions;
+};
+
+/**
+ * struct minidump_elfhdr - Minidump table elf header
+ * @ehdr: elf main header
+ * @shdr: Section header
+ * @phdr: Program header
+ * @elf_offset: Section offset in elf
+ * @strtable_idx: String table current index position
+ */
+struct minidump_elfhdr {
+	struct elfhdr	 *ehdr;
+	struct elf_shdr	 *shdr;
+	struct elf_phdr	 *phdr;
+	size_t		 elf_offset;
+	size_t		 strtable_idx;
+};
+
+/**
+ * struct minidump - Minidump driver data information
+ * @elf: Minidump elf header
+ * @dev: Minidump backend device
+ * @apss_data: APSS driver data
+ * @md_lock: Lock to protect access to APSS minidump table
+ */
+struct minidump {
+	struct minidump_elfhdr	 elf;
+	struct device		 *dev;
+	struct minidump_ss_data	 *apss_data;
+	struct mutex		 md_lock;
+};
+
+/*
+ * In some of the Old Qualcomm devices, boot firmware statically allocates 300
+ * as total number of supported region (including all co-processors) in
+ * minidump table out of which linux was using 201. In future, this limitation
+ * from boot firmware might get removed by allocating the region dynamically.
+ * So, keep it compatible with older devices, we can keep the current limit for
+ * Linux to 201.
+ */
+#define MAX_NUM_ENTRIES	  201
+#define MAX_STRTBL_SIZE	  (MAX_NUM_ENTRIES * MAX_REGION_NAME_LENGTH)
+
+static struct elf_shdr *elf_shdr_entry_addr(struct elfhdr *ehdr, int idx)
+{
+	struct elf_shdr *eshdr = (struct elf_shdr *)((size_t)ehdr + ehdr->e_shoff);
+
+	return &eshdr[idx];
+}
+
+static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
+{
+	struct elf_phdr *ephdr = (struct elf_phdr *)((size_t)ehdr + ehdr->e_phoff);
+
+	return &ephdr[idx];
+}
+
+static char *elf_str_table_start(struct elfhdr *ehdr)
+{
+	struct elf_shdr *eshdr;
+
+	if (ehdr->e_shstrndx == SHN_UNDEF)
+		return NULL;
+
+	eshdr = elf_shdr_entry_addr(ehdr, ehdr->e_shstrndx);
+
+	return (char *)ehdr + eshdr->sh_offset;
+}
+
+static char *elf_lookup_string(struct minidump *md, struct elfhdr *ehdr, int offset)
+{
+	char *strtab = elf_str_table_start(ehdr);
+
+	if (!strtab || (md->elf.strtable_idx < offset))
+		return NULL;
+
+	return strtab + offset;
+}
+
+static unsigned int append_str_to_strtable(struct minidump *md, const char *name)
+{
+	char *strtab = elf_str_table_start(md->elf.ehdr);
+	unsigned int old_idx = md->elf.strtable_idx;
+	unsigned int ret;
+
+	if (!strtab || !name)
+		return 0;
+
+	ret = old_idx;
+	old_idx += strscpy((strtab + old_idx), name, MAX_REGION_NAME_LENGTH);
+	md->elf.strtable_idx = old_idx + 1;
+
+	return ret;
+}
+
+static int qcom_md_clear_elfheader(struct minidump *md,
+				   const struct qcom_minidump_region *region)
+{
+	struct elfhdr *ehdr = md->elf.ehdr;
+	struct elf_shdr *shdr;
+	struct elf_shdr *tmp_shdr;
+	struct elf_phdr *phdr;
+	struct elf_phdr *tmp_phdr;
+	unsigned int phidx;
+	unsigned int shidx;
+	unsigned int len;
+	unsigned int i;
+	char *shname;
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = elf_phdr_entry_addr(ehdr, i);
+		if (phdr->p_paddr == region->phys_addr &&
+		    phdr->p_memsz == region->size)
+			break;
+	}
+
+	if (i == ehdr->e_phnum) {
+		dev_err(md->dev, "Cannot find program header entry in elf\n");
+		return -EINVAL;
+	}
+
+	phidx = i;
+	for (i = 0; i < ehdr->e_shnum; i++) {
+		shdr = elf_shdr_entry_addr(ehdr, i);
+		shname = elf_lookup_string(md, ehdr, shdr->sh_name);
+		if (shname && !strcmp(shname, region->name) &&
+		    shdr->sh_addr == (elf_addr_t)region->virt_addr &&
+		    shdr->sh_size == region->size)
+			break;
+	}
+
+	if (i == ehdr->e_shnum) {
+		dev_err(md->dev, "Cannot find section header entry in elf\n");
+		return -EINVAL;
+	}
+
+	shidx = i;
+	if (shdr->sh_offset != phdr->p_offset) {
+		dev_err(md->dev, "Invalid entry details for region: %s\n", region->name);
+		return -EINVAL;
+	}
+
+	/* Clear name in string table */
+	len = strlen(shname) + 1;
+	memmove(shname, shname + len, md->elf.strtable_idx - shdr->sh_name - len);
+	md->elf.strtable_idx -= len;
+
+	/* Clear program header */
+	tmp_phdr = elf_phdr_entry_addr(ehdr, phidx);
+	for (i = phidx; i < ehdr->e_phnum - 1; i++) {
+		tmp_phdr = elf_phdr_entry_addr(ehdr, i + 1);
+		phdr = elf_phdr_entry_addr(ehdr, i);
+		memcpy(phdr, tmp_phdr, sizeof(*phdr));
+		phdr->p_offset = phdr->p_offset - region->size;
+	}
+	memset(tmp_phdr, 0, sizeof(*tmp_phdr));
+	ehdr->e_phnum--;
+
+	/* Clear section header */
+	tmp_shdr = elf_shdr_entry_addr(ehdr, shidx);
+	for (i = shidx; i < ehdr->e_shnum - 1; i++) {
+		tmp_shdr = elf_shdr_entry_addr(ehdr, i + 1);
+		shdr = elf_shdr_entry_addr(ehdr, i);
+		memcpy(shdr, tmp_shdr, sizeof(*shdr));
+		shdr->sh_offset -= region->size;
+		shdr->sh_name -= len;
+	}
+
+	memset(tmp_shdr, 0, sizeof(*tmp_shdr));
+	ehdr->e_shnum--;
+	md->elf.elf_offset -= region->size;
+
+	return 0;
+}
+
+static void qcom_md_update_elfheader(struct minidump *md,
+				     const struct qcom_minidump_region *region)
+{
+	struct elfhdr *ehdr = md->elf.ehdr;
+	struct elf_shdr *shdr;
+	struct elf_phdr *phdr;
+
+	shdr = elf_shdr_entry_addr(ehdr, ehdr->e_shnum++);
+	phdr = elf_phdr_entry_addr(ehdr, ehdr->e_phnum++);
+
+	shdr->sh_type = SHT_PROGBITS;
+	shdr->sh_name = append_str_to_strtable(md, region->name);
+	shdr->sh_addr = (elf_addr_t)region->virt_addr;
+	shdr->sh_size = region->size;
+	shdr->sh_flags = SHF_WRITE;
+	shdr->sh_offset = md->elf.elf_offset;
+	shdr->sh_entsize = 0;
+
+	phdr->p_type = PT_LOAD;
+	phdr->p_offset = md->elf.elf_offset;
+	phdr->p_vaddr = (elf_addr_t)region->virt_addr;
+	phdr->p_paddr = region->phys_addr;
+	phdr->p_filesz = phdr->p_memsz = region->size;
+	phdr->p_flags = PF_R | PF_W;
+	md->elf.elf_offset += shdr->sh_size;
+}
+
+static void qcom_md_add_region(struct minidump_ss_data *mdss_data,
+			       const struct qcom_minidump_region *region)
+{
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int region_cnt;
+
+	region_cnt = le32_to_cpu(mdss_toc->region_count);
+	mdr = &mdss_data->md_regions[region_cnt];
+	strscpy(mdr->name, region->name, sizeof(mdr->name));
+	mdr->address = cpu_to_le64(region->phys_addr);
+	mdr->size = cpu_to_le64(region->size);
+	mdr->valid = cpu_to_le32(MINIDUMP_REGION_VALID);
+	region_cnt++;
+	mdss_toc->region_count = cpu_to_le32(region_cnt);
+}
+
+static int qcom_md_get_region_index(struct minidump_ss_data *mdss_data,
+				    const struct qcom_minidump_region *region)
+{
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int i;
+	unsigned int count;
+
+	count = le32_to_cpu(mdss_toc->region_count);
+	for (i = 0; i < count; i++) {
+		mdr = &mdss_data->md_regions[i];
+		if (!strcmp(mdr->name, region->name))
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+static int qcom_md_region_unregister(struct minidump *md,
+				     const struct qcom_minidump_region *region)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int region_cnt;
+	unsigned int idx;
+	int ret;
+
+	ret = qcom_md_get_region_index(mdss_data, region);
+	if (ret < 0) {
+		dev_err(md->dev, "%s region is not present\n", region->name);
+		return ret;
+	}
+
+	idx = ret;
+	mdr = &mdss_data->md_regions[0];
+	region_cnt = le32_to_cpu(mdss_toc->region_count);
+	/*
+	 * Left shift all the regions exist after this removed region
+	 * index by 1 to fill the gap and zero out the last region
+	 * present at the end.
+	 */
+	memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr));
+	memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
+	region_cnt--;
+	mdss_toc->region_count = cpu_to_le32(region_cnt);
+
+	return 0;
+}
+
+static int qcom_md_region_register(struct minidump *md,
+				   const struct qcom_minidump_region *region)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	unsigned int num_region;
+	int ret;
+
+	ret = qcom_md_get_region_index(mdss_data, region);
+	if (ret >= 0) {
+		dev_info(md->dev, "%s region is already registered\n", region->name);
+		return -EEXIST;
+	}
+
+	/* Check if there is a room for a new entry */
+	num_region = le32_to_cpu(mdss_toc->region_count);
+	if (num_region >= MAX_NUM_ENTRIES) {
+		dev_err(md->dev, "maximum region limit %u reached\n", num_region);
+		return -ENOSPC;
+	}
+
+	qcom_md_add_region(mdss_data, region);
+
+	return 0;
+}
+
+static bool qcom_minidump_valid_region(const struct qcom_minidump_region *region)
+{
+	return region &&
+		strnlen(region->name, MAX_NAME_LENGTH) < MAX_NAME_LENGTH &&
+		region->virt_addr &&
+		region->size &&
+		IS_ALIGNED(region->size, 4);
+}
+
+/**
+ * qcom_minidump_region_register() - Register region in APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_minidump_region_register(const struct qcom_minidump_region *region)
+{
+	struct minidump *md;
+	int ret;
+
+	md = qcom_smem_minidump_ready();
+	if (!md)
+		return -EPROBE_DEFER;
+
+	if (!qcom_minidump_valid_region(region))
+		return -EINVAL;
+
+	mutex_lock(&md->md_lock);
+	ret = qcom_md_region_register(md, region);
+	if (ret)
+		goto unlock;
+
+	qcom_md_update_elfheader(md, region);
+unlock:
+	mutex_unlock(&md->md_lock);
+	return ret;
+}
+
+/**
+ * qcom_minidump_region_unregister() - Unregister region from APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_minidump_region_unregister(const struct qcom_minidump_region *region)
+{
+	struct minidump *md;
+	int ret;
+
+	md = qcom_smem_minidump_ready();
+	if (!md)
+		return -EPROBE_DEFER;
+
+	if (!qcom_minidump_valid_region(region))
+		return -EINVAL;
+
+	mutex_lock(&md->md_lock);
+	ret = qcom_md_region_unregister(md, region);
+	if (ret)
+		goto unlock;
+
+	ret = qcom_md_clear_elfheader(md, region);
+unlock:
+	mutex_unlock(&md->md_lock);
+	return ret;
+}
+
+static int qcom_md_add_elfheader(struct minidump *md)
+{
+	struct qcom_minidump_region elfregion;
+	struct elfhdr *ehdr;
+	struct elf_shdr *shdr;
+	struct elf_phdr *phdr;
+	unsigned int  elfh_size;
+	unsigned int strtbl_off;
+	unsigned int phdr_off;
+	unsigned int banner_len;
+	char *banner;
+
+	banner_len = strlen(linux_banner);
+	/*
+	 * Header buffer contains:
+	 * ELF header, (MAX_NUM_ENTRIES + 4) of Section and Program ELF headers,
+	 * where, 4 additional entries, one for empty header, one for string table
+	 * one for minidump table and one for linux banner.
+	 *
+	 * Linux banner is stored in minidump to aid post mortem tools to determine
+	 * the kernel version.
+	 */
+	elfh_size = sizeof(*ehdr);
+	elfh_size += MAX_STRTBL_SIZE;
+	elfh_size += banner_len + 1;
+	elfh_size += ((sizeof(*shdr) + sizeof(*phdr)) * (MAX_NUM_ENTRIES + 4));
+	elfh_size = ALIGN(elfh_size, 4);
+
+	md->elf.ehdr = devm_kzalloc(md->dev, elfh_size, GFP_KERNEL);
+	if (!md->elf.ehdr)
+		return -ENOMEM;
+
+	ehdr = md->elf.ehdr;
+	/* Assign Section/Program headers offset */
+	md->elf.shdr = shdr = (struct elf_shdr *)(ehdr + 1);
+	md->elf.phdr = phdr = (struct elf_phdr *)(shdr + MAX_NUM_ENTRIES);
+	phdr_off = sizeof(*ehdr) + (sizeof(*shdr) * MAX_NUM_ENTRIES);
+
+	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
+	ehdr->e_ident[EI_CLASS] = ELF_CLASS;
+	ehdr->e_ident[EI_DATA] = ELF_DATA;
+	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
+	ehdr->e_ident[EI_OSABI] = ELF_OSABI;
+	ehdr->e_type = ET_CORE;
+	ehdr->e_machine  = ELF_ARCH;
+	ehdr->e_version = EV_CURRENT;
+	ehdr->e_ehsize = sizeof(*ehdr);
+	ehdr->e_phoff = phdr_off;
+	ehdr->e_phentsize = sizeof(*phdr);
+	ehdr->e_shoff = sizeof(*ehdr);
+	ehdr->e_shentsize = sizeof(*shdr);
+	ehdr->e_shstrndx = 1;
+
+	md->elf.elf_offset = elfh_size;
+	/*
+	 * The zeroth index of the section header is reserved and is rarely used.
+	 * Set the section header as null (SHN_UNDEF) and move to the next one.
+	 * 2nd Section is String table.
+	 */
+	md->elf.strtable_idx = 1;
+	strtbl_off = sizeof(*ehdr) + ((sizeof(*phdr) + sizeof(*shdr)) * MAX_NUM_ENTRIES);
+	shdr++;
+	shdr->sh_type = SHT_STRTAB;
+	shdr->sh_offset = (elf_addr_t)strtbl_off;
+	shdr->sh_size = MAX_STRTBL_SIZE;
+	shdr->sh_entsize = 0;
+	shdr->sh_flags = 0;
+	shdr->sh_name = append_str_to_strtable(md, "STR_TBL");
+	shdr++;
+
+	/* 3rd Section is Linux banner */
+	banner = (char *)ehdr + strtbl_off + MAX_STRTBL_SIZE;
+	memcpy(banner, linux_banner, banner_len);
+
+	shdr->sh_type = SHT_PROGBITS;
+	shdr->sh_offset = (elf_addr_t)(strtbl_off + MAX_STRTBL_SIZE);
+	shdr->sh_size = banner_len + 1;
+	shdr->sh_addr = (elf_addr_t)linux_banner;
+	shdr->sh_entsize = 0;
+	shdr->sh_flags = SHF_WRITE;
+	shdr->sh_name = append_str_to_strtable(md, "linux_banner");
+
+	phdr->p_type = PT_LOAD;
+	phdr->p_offset = (elf_addr_t)(strtbl_off + MAX_STRTBL_SIZE);
+	phdr->p_vaddr = (elf_addr_t)linux_banner;
+	phdr->p_paddr = virt_to_phys(linux_banner);
+	phdr->p_filesz = phdr->p_memsz = banner_len + 1;
+	phdr->p_flags = PF_R | PF_W;
+
+	/*
+	 * Above are some prdefined sections/program header used
+	 * for debug, update their count here.
+	 */
+	ehdr->e_phnum = 1;
+	ehdr->e_shnum = 3;
+
+	/* Register ELF header as first region */
+	strscpy(elfregion.name, "KELF_HEADER", sizeof(elfregion.name));
+	elfregion.virt_addr = md->elf.ehdr;
+	elfregion.phys_addr = virt_to_phys(md->elf.ehdr);
+	elfregion.size = elfh_size;
+
+	return qcom_md_region_register(md, &elfregion);
+}
+
+static int qcom_apss_md_table_init(struct minidump *md,
+				   struct minidump_subsystem *mdss_toc)
+{
+	struct minidump_ss_data *mdss_data;
+
+	mdss_data = devm_kzalloc(md->dev, sizeof(*mdss_data), GFP_KERNEL);
+	if (!mdss_data)
+		return -ENOMEM;
+
+	mdss_data->md_ss_toc = mdss_toc;
+	mdss_data->md_regions = devm_kcalloc(md->dev, MAX_NUM_ENTRIES,
+					     sizeof(*mdss_data->md_regions),
+					     GFP_KERNEL);
+	if (!mdss_data->md_regions)
+		return -ENOMEM;
+
+	mdss_toc = mdss_data->md_ss_toc;
+	mdss_toc->regions_baseptr = cpu_to_le64(virt_to_phys(mdss_data->md_regions));
+	mdss_toc->enabled = cpu_to_le32(MINIDUMP_SS_ENABLED);
+	mdss_toc->status = cpu_to_le32(1);
+	mdss_toc->region_count = cpu_to_le32(0);
+
+	/* Tell bootloader not to encrypt the regions of this subsystem */
+	mdss_toc->encryption_status = cpu_to_le32(MINIDUMP_SS_ENCR_DONE);
+	mdss_toc->encryption_required = cpu_to_le32(MINIDUMP_SS_ENCR_NOTREQ);
+
+	md->apss_data = mdss_data;
+
+	return 0;
+}
+
+static void qcom_apss_md_table_exit(struct minidump_ss_data *mdss_data)
+{
+	memset(mdss_data->md_ss_toc, cpu_to_le32(0), sizeof(*mdss_data->md_ss_toc));
+}
+
+static int qcom_apss_minidump_probe(struct platform_device *pdev)
+{
+	struct minidump_global_toc *mdgtoc;
+	struct minidump *md;
+	size_t size;
+	int ret;
+
+	md = devm_kzalloc(&pdev->dev, sizeof(*md), GFP_KERNEL);
+	if (!md)
+		return -ENOMEM;
+
+	md->dev = &pdev->dev;
+	mdgtoc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &size);
+	if (IS_ERR(mdgtoc)) {
+		ret = PTR_ERR(mdgtoc);
+		return dev_err_probe(md->dev, ret,
+				     "Couldn't find minidump smem item\n");
+	}
+
+	if (size < sizeof(*mdgtoc) || !mdgtoc->status) {
+		ret = -EINVAL;
+		return dev_err_probe(md->dev, ret,
+				     "minidump table is not initialized\n");
+	}
+
+	mutex_init(&md->md_lock);
+	ret = qcom_apss_md_table_init(md, &mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
+	if (ret)
+		return dev_err_probe(md->dev, ret,
+				     "apss minidump initialization failed\n");
+
+	/* First entry would be ELF header */
+	ret = qcom_md_add_elfheader(md);
+	if (ret) {
+		qcom_apss_md_table_exit(md->apss_data);
+		return dev_err_probe(md->dev, ret, "Failed to add elf header\n");
+	}
+
+	platform_set_drvdata(pdev, md);
+
+	return ret;
+}
+
+static void qcom_apss_minidump_remove(struct platform_device *pdev)
+{
+	struct minidump *md = platform_get_drvdata(pdev);
+
+	qcom_apss_md_table_exit(md->apss_data);
+}
+
+static const struct platform_device_id qcom_minidump_id_table[] = {
+	{ .name = "qcom_minidump_smem" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, qcom_minidump_id_table);
+
+static struct platform_driver qcom_minidump_driver = {
+	.probe = qcom_apss_minidump_probe,
+	.remove_new = qcom_apss_minidump_remove,
+	.driver  = {
+		.name = "qcom_minidump_smem",
+	},
+	.id_table = qcom_minidump_id_table,
+};
+
+module_platform_driver(qcom_minidump_driver);
+
+MODULE_DESCRIPTION("Qualcomm APSS minidump driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/qcom_minidump_internal.h b/drivers/soc/qcom/qcom_minidump_internal.h
index 71709235b196..a2aebe5b690a 100644
--- a/drivers/soc/qcom/qcom_minidump_internal.h
+++ b/drivers/soc/qcom/qcom_minidump_internal.h
@@ -9,10 +9,20 @@
 #define MAX_NUM_OF_SS           10
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
+
 #define MINIDUMP_REGION_VALID	   ('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_REGION_INVALID	   ('I' << 24 | 'N' << 16 | 'V' << 8 | 'A' << 0)
+#define MINIDUMP_REGION_INIT	   ('I' << 24 | 'N' << 16 | 'I' << 8 | 'T' << 0)
+#define MINIDUMP_REGION_NOINIT	   0
+
+#define MINIDUMP_SS_ENCR_REQ	   (0 << 24 | 'Y' << 16 | 'E' << 8 | 'S' << 0)
+#define MINIDUMP_SS_ENCR_NOTREQ	   (0 << 24 | 0 << 16 | 'N' << 8 | 'R' << 0)
+#define MINIDUMP_SS_ENCR_START	   ('S' << 24 | 'T' << 16 | 'R' << 8 | 'T' << 0)
 #define MINIDUMP_SS_ENCR_DONE	   ('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
 #define MINIDUMP_SS_ENABLED	   ('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
 
+#define MINIDUMP_APSS_DESC	   0
+
 /**
  * struct minidump_region - Minidump region
  * @name		: Name of the region to be dumped
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 690afc9a12f4..d6d5f4ade471 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @minidump:	minidump platform device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *minidump;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -806,6 +808,15 @@ int qcom_smem_get_soc_id(u32 *id)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
 
+void *qcom_smem_minidump_ready(void)
+{
+	if (__smem && __smem->minidump)
+		return platform_get_drvdata(__smem->minidump);
+	else
+		return NULL;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_minidump_ready);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
@@ -1184,11 +1195,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->minidump = platform_device_register_data(&pdev->dev, "qcom_minidump_smem",
+						       PLATFORM_DEVID_NONE, NULL,
+						       0);
+	if (IS_ERR(smem->minidump)) {
+		dev_dbg(&pdev->dev, "failed to register minidump device\n");
+		smem->minidump = NULL;
+	}
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
+	platform_device_unregister(__smem->minidump);
 	platform_device_unregister(__smem->socinfo);
 
 	hwspin_lock_free(__smem->hwlock);
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index a36a3b9d4929..08288360a55e 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -14,4 +14,6 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
 
+void *qcom_smem_minidump_ready(void);
+
 #endif
diff --git a/include/soc/qcom/qcom_minidump.h b/include/soc/qcom/qcom_minidump.h
index cd87caef919d..9fdf9e9d0af3 100644
--- a/include/soc/qcom/qcom_minidump.h
+++ b/include/soc/qcom/qcom_minidump.h
@@ -6,6 +6,24 @@
 #ifndef _QCOM_MINIDUMP_H_
 #define _QCOM_MINIDUMP_H_
 
+#define MAX_NAME_LENGTH		12
+
+/**
+ * struct qcom_minidump_region - APSS Minidump region information
+ *
+ * @name:	Entry name, Minidump will dump binary with this name.
+ * @virt_addr:  Virtual address of the entry.
+ * @phys_addr:	Physical address of the entry to dump.
+ * @size:	Number of byte to dump from @address location,
+ *		and it should be 4 byte aligned.
+ */
+struct qcom_minidump_region {
+	char		name[MAX_NAME_LENGTH];
+	void		*virt_addr;
+	phys_addr_t	phys_addr;
+	size_t		size;
+};
+
 struct rproc;
 struct rproc_dump_segment;
 
-- 
2.7.4


