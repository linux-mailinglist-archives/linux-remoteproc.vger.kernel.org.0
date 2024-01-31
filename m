Return-Path: <linux-remoteproc+bounces-380-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF801843DEB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 12:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20BC31C2A19C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 11:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A428874E24;
	Wed, 31 Jan 2024 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BWilbicq"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16DB79DCF;
	Wed, 31 Jan 2024 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699393; cv=none; b=pnBAQDzUpAsGPz6W6YDIKKDJvwNL/u7PGZEegzMQ2WsN+7tFNhVSQtdT6gtslBQHY3+jvtXOR9keR1Dew/rC2dzU6DNmr/3Te8NaHR4RSsW7giyIBYb1KwEPnceSVHbrjE0jusfBwzbHy/A8ix3kXEowypebFsGuzFmLRIPm1gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699393; c=relaxed/simple;
	bh=Rj7NwH82VZywGlw+2HspE0bqtshPXHOoPd9clarX4yE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVxx7PuGZSMgYXi1TlxTXkvdeJtc1xay3hGI/mrOKGAOgWM96gjfezoBsa5jbbmS5EcI9YSMImP0JNASWBkeD5AHhZZsav5OOV5vaSF7xymXHOKJl4X4M0Syjhwjx6nD3Jp6eTMIe2FVlB/gt3pJ9kH+YeHm6vjxEOrsl7mRcfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BWilbicq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V77Y4k004507;
	Wed, 31 Jan 2024 11:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=E5ZBEKhML5zzIDJkNKeCZoNN28sYgImgOcEqdeDbsz8=; b=BW
	ilbicq+rpf5uWJnRSvbHVSRVNtoSm5x+O8CutDM085jxduisL0OwlevVdL7f6zQ1
	FjXGU3Ai85w7iOHa+XliCvRBUIbEn7uH+GKNoYeItduvKSj9pkQSSHsA8jLx7wcq
	htmiPJNodgKsAqykTh5tJBTI3L3Sg9WuXSidMIVwBdCQZn4LzfEJiRS+T4HCoCg/
	m5cW4IwZyO0Dylp8JCjTFg4Y+oLRAYZMhSiUwlCKY2mu30j9u0gDTxNDJCFyPc3h
	IarepYJgcihh1KR27FFp/USIWiTzreljJwAKrhVNfXtXjtEIbVqrEmX7YibIO+lM
	MXEfY0yMtG9NnmO2H0Mw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyfc8rydp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:09:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VB9TtL001758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:09:29 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 03:09:19 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>, <vigneshr@ti.com>,
        <nm@ti.com>, <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [PATCH v8 04/10] remoteproc: qcom: Remove minidump related data from qcom_common.c
Date: Wed, 31 Jan 2024 16:38:31 +0530
Message-ID: <20240131110837.14218-5-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.43.0.254.ga26002b62827
In-Reply-To: <20240131110837.14218-1-quic_mojha@quicinc.com>
References: <20240131110837.14218-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cu3UllgvNBO3Ic-c6PnZGOvUnNYfmNwN
X-Proofpoint-ORIG-GUID: cu3UllgvNBO3Ic-c6PnZGOvUnNYfmNwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310085

As minidump specific data structure and functions move under
config QCOM_RPROC_MINIDUMP, so remove minidump specific data
from driver/remoteproc/qcom_common.c .

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/remoteproc/qcom_common.c | 160 -------------------------------
 1 file changed, 160 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 03e5f5d533eb..085fd73fa23a 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -17,7 +17,6 @@
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
-#include <linux/soc/qcom/smem.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
@@ -26,61 +25,6 @@
 #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 
-#define MAX_NUM_OF_SS           10
-#define MAX_REGION_NAME_LENGTH  16
-#define SBL_MINIDUMP_SMEM_ID	602
-#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
-#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
-
-/**
- * struct minidump_region - Minidump region
- * @name		: Name of the region to be dumped
- * @seq_num:		: Use to differentiate regions with same name.
- * @valid		: This entry to be dumped (if set to 1)
- * @address		: Physical address of region to be dumped
- * @size		: Size of the region
- */
-struct minidump_region {
-	char	name[MAX_REGION_NAME_LENGTH];
-	__le32	seq_num;
-	__le32	valid;
-	__le64	address;
-	__le64	size;
-};
-
-/**
- * struct minidump_subsystem - Subsystem's SMEM Table of content
- * @status : Subsystem toc init status
- * @enabled : if set to 1, this region would be copied during coredump
- * @encryption_status: Encryption status for this subsystem
- * @encryption_required : Decides to encrypt the subsystem regions or not
- * @region_count : Number of regions added in this subsystem toc
- * @regions_baseptr : regions base pointer of the subsystem
- */
-struct minidump_subsystem {
-	__le32	status;
-	__le32	enabled;
-	__le32	encryption_status;
-	__le32	encryption_required;
-	__le32	region_count;
-	__le64	regions_baseptr;
-};
-
-/**
- * struct minidump_global_toc - Global Table of Content
- * @status : Global Minidump init status
- * @md_revision : Minidump revision
- * @enabled : Minidump enable status
- * @subsystems : Array of subsystems toc
- */
-struct minidump_global_toc {
-	__le32				status;
-	__le32				md_revision;
-	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
-};
-
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
@@ -90,110 +34,6 @@ struct qcom_ssr_subsystem {
 static LIST_HEAD(qcom_ssr_subsystem_list);
 static DEFINE_MUTEX(qcom_ssr_subsys_lock);
 
-static void qcom_minidump_cleanup(struct rproc *rproc)
-{
-	struct rproc_dump_segment *entry, *tmp;
-
-	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
-		list_del(&entry->node);
-		kfree(entry->priv);
-		kfree(entry);
-	}
-}
-
-static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsystem *subsystem,
-			void (*rproc_dumpfn_t)(struct rproc *rproc, struct rproc_dump_segment *segment,
-				void *dest, size_t offset, size_t size))
-{
-	struct minidump_region __iomem *ptr;
-	struct minidump_region region;
-	int seg_cnt, i;
-	dma_addr_t da;
-	size_t size;
-	char *name;
-
-	if (WARN_ON(!list_empty(&rproc->dump_segments))) {
-		dev_err(&rproc->dev, "dump segment list already populated\n");
-		return -EUCLEAN;
-	}
-
-	seg_cnt = le32_to_cpu(subsystem->region_count);
-	ptr = ioremap((unsigned long)le64_to_cpu(subsystem->regions_baseptr),
-		      seg_cnt * sizeof(struct minidump_region));
-	if (!ptr)
-		return -EFAULT;
-
-	for (i = 0; i < seg_cnt; i++) {
-		memcpy_fromio(&region, ptr + i, sizeof(region));
-		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
-			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
-			if (!name) {
-				iounmap(ptr);
-				return -ENOMEM;
-			}
-			da = le64_to_cpu(region.address);
-			size = le64_to_cpu(region.size);
-			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
-		}
-	}
-
-	iounmap(ptr);
-	return 0;
-}
-
-void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
-		void (*rproc_dumpfn_t)(struct rproc *rproc,
-		struct rproc_dump_segment *segment, void *dest, size_t offset,
-		size_t size))
-{
-	int ret;
-	struct minidump_subsystem *subsystem;
-	struct minidump_global_toc *toc;
-
-	/* Get Global minidump ToC*/
-	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
-
-	/* check if global table pointer exists and init is set */
-	if (IS_ERR(toc) || !toc->status) {
-		dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
-		return;
-	}
-
-	/* Get subsystem table of contents using the minidump id */
-	subsystem = &toc->subsystems[minidump_id];
-
-	/**
-	 * Collect minidump if SS ToC is valid and segment table
-	 * is initialized in memory and encryption status is set.
-	 */
-	if (subsystem->regions_baseptr == 0 ||
-	    le32_to_cpu(subsystem->status) != 1 ||
-	    le32_to_cpu(subsystem->enabled) != MINIDUMP_SS_ENABLED) {
-		return rproc_coredump(rproc);
-	}
-
-	if (le32_to_cpu(subsystem->encryption_status) != MINIDUMP_SS_ENCR_DONE) {
-		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
-		return;
-	}
-
-	/**
-	 * Clear out the dump segments populated by parse_fw before
-	 * re-populating them with minidump segments.
-	 */
-	rproc_coredump_cleanup(rproc);
-
-	ret = qcom_add_minidump_segments(rproc, subsystem, rproc_dumpfn_t);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
-		goto clean_minidump;
-	}
-	rproc_coredump_using_sections(rproc);
-clean_minidump:
-	qcom_minidump_cleanup(rproc);
-}
-EXPORT_SYMBOL_GPL(qcom_minidump);
-
 static int glink_subdev_start(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
-- 
2.43.0.254.ga26002b62827


