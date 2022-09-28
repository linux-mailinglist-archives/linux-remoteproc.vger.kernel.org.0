Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78595EDCA9
	for <lists+linux-remoteproc@lfdr.de>; Wed, 28 Sep 2022 14:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbiI1MaI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 28 Sep 2022 08:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbiI1M3r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Sep 2022 08:29:47 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFF62EF01;
        Wed, 28 Sep 2022 05:29:42 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SA6B06000601;
        Wed, 28 Sep 2022 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=80Zx/fpfN738Afn5maYFKuP5UtNBBeyq0CUNs+Odxys=;
 b=QHK8rumMQb5qUKP8tXjHfDAhVwJsl2tb788lqrsymvhLgslRIjUAW4mjyty5wqadvPPG
 eQPkmDexnmxZFEJmuA3RHEXQpofangA1XZ/RNki0fTVxf92BDKGQAmSrqaYOha2sHllp
 nsTmikxdGmJDEyYPy4LvdY6gNr9Np5mVBd/7V+unLsYVHkeGKRKUwprCWDpMI+FCk5gh
 gp0wcNWGScdqCoy3Scy8DLtic5ePxTNxGlcjein1fADBp1g3cti4Mzal4736UmYil1/A
 WL2S5lUscaMeIFcpRMozhVctd+b3VqYLXBV4hw1kEEZB+6CPgWJXF8F8ssvy8VHpo8bV jA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvep6sdg2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 12:29:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SCT0k0028720
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 12:29:00 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 28 Sep 2022 05:28:54 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <linux-remoteproc@vger.kernel.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v10 7/7] remoteproc: qcom: Add support for memory sandbox
Date:   Wed, 28 Sep 2022 17:57:53 +0530
Message-ID: <1664368073-13659-8-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1664368073-13659-1-git-send-email-quic_srivasam@quicinc.com>
References: <1664368073-13659-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zpRcH8S1zFwzgjIhWxRYP_UvGPvMMhWW
X-Proofpoint-ORIG-GUID: zpRcH8S1zFwzgjIhWxRYP_UvGPvMMhWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_05,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280077
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update pil driver with SMMU mapping for allowing authorised
memory access to ADSP firmware, by carveout reserved adsp memory
region from device tree file.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Changes since V6:
	-- Update smmu map and unmap function names.
	-- Revert adsp_ops const change.
	-- Move iommu check to within smmu map/unmap functions.
Changes since V5:
	-- Remove adsp_rproc_unmap_smmu, adsp_of_unmap_smmu, adsp_of_map_smmu and 
	   adsp_rproc_map_smmu functions.
	-- Remove find_loaded_rsc_table call back initialization.
	-- Rename adsp_sandbox_needed to has_iommu.
Changes since V4:
	-- Split the code and add appropriate APIs for resource allocation and free.
	-- Update adsp_unmap_smmu with missing free ops call.
	-- Update normalizing length value in adsp_of_unmap_smmu.
Changes since V3:
	-- Rename is_adsp_sb_needed to adsp_sandbox_needed.
	-- Add smmu unmapping in error case and in adsp stop.
Changes since V2:
	-- Replace platform_bus_type with adsp->dev->bus.
	-- Use API of_parse_phandle_with_args() instead of of_parse_phandle_with_fixed_args().
	-- Replace adsp->is_wpss with adsp->is_adsp.
	-- Update error handling in adsp_start().

 drivers/remoteproc/qcom_q6v5_adsp.c | 56 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 4e70e76..2dc850f 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -9,6 +9,7 @@
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -48,6 +49,8 @@
 #define LPASS_PWR_ON_REG		0x10
 #define LPASS_HALTREQ_REG		0x0
 
+#define SID_MASK_DEFAULT        0xF
+
 #define QDSP6SS_XO_CBCR		0x38
 #define QDSP6SS_CORE_CBCR	0x20
 #define QDSP6SS_SLEEP_CBCR	0x3c
@@ -332,6 +335,47 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static void adsp_unmap_carveout(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = rproc->priv;
+
+	if (adsp->has_iommu)
+		iommu_unmap(rproc->domain, adsp->mem_phys, adsp->mem_size);
+}
+
+static int adsp_map_carveout(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = rproc->priv;
+	struct of_phandle_args args;
+	long long sid;
+	unsigned long iova;
+	int ret;
+
+	if (!adsp->has_iommu)
+		return 0;
+
+	if (!rproc->domain)
+		return -EINVAL;
+
+	ret = of_parse_phandle_with_args(adsp->dev->of_node, "iommus", "#iommu-cells", 0, &args);
+	if (ret < 0)
+		return ret;
+
+	sid = args.args[0] & SID_MASK_DEFAULT;
+
+	/* Add SID configuration for ADSP Firmware to SMMU */
+	iova =  adsp->mem_phys | (sid << 32);
+
+	ret = iommu_map(rproc->domain, iova, adsp->mem_phys,
+			adsp->mem_size,	IOMMU_READ | IOMMU_WRITE);
+	if (ret) {
+		dev_err(adsp->dev, "Unable to map ADSP Physical Memory\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -342,9 +386,15 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	ret = adsp_map_carveout(rproc);
+	if (ret) {
+		dev_err(adsp->dev, "ADSP smmu mapping failed\n");
+		goto disable_irqs;
+	}
+
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
-		goto disable_irqs;
+		goto adsp_smmu_unmap;
 
 	ret = qcom_rproc_pds_enable(adsp, adsp->proxy_pds,
 				    adsp->proxy_pd_count);
@@ -400,6 +450,8 @@ static int adsp_start(struct rproc *rproc)
 	qcom_rproc_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 disable_xo_clk:
 	clk_disable_unprepare(adsp->xo);
+adsp_smmu_unmap:
+	adsp_unmap_carveout(rproc);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
@@ -428,6 +480,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
+	adsp_unmap_carveout(rproc);
+
 	handover = qcom_q6v5_unprepare(&adsp->q6v5);
 	if (handover)
 		qcom_adsp_pil_handover(&adsp->q6v5);
-- 
2.7.4

