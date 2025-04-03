Return-Path: <linux-remoteproc+bounces-3308-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21FA7A268
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Apr 2025 14:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4AA73B4678
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Apr 2025 12:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A882624CEE8;
	Thu,  3 Apr 2025 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti22W0JT"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E224C09E
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Apr 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681813; cv=none; b=T3eJe1dFqWuDx12uZp7dKE5w+YK2Np4N3Wu1MtlbCH+1Z58HHS/CHlCuibPEbLLJcm2/DZ1GKmCsftEYfvnRP3aa0HoDc1riuRB8qGqmFR89r2WDHlDz3Lj0W+w6+A/nPaFmhGKH0zYQEKQrKNWweNyPb37Jtag4Dfw91z/2T9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681813; c=relaxed/simple;
	bh=s1AZRq0Ro0z/JSNtKFowYleaKwidfQ27IMmAxHeDf6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GUjq0UHNXddOM+eKMdiW+eXUA/JrNNZxLori2yff2kQQQS/QSCwaO1vVDyZDTyOEGLBlip52UwxvgsmZ/MuUI8vqTJFZJLcmIEPLEFnRsjGMDtBklVbbKt8d8Eh5DXR/3C9hBFsmMwgkfX6HuM9TRowQsS6xKbH+xBmgfBVGIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti22W0JT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rwJd025677
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Apr 2025 12:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OiVyJ9HIT+J
	y3t8ULO00gMydZY0WULMCQbUZhY1u9Bo=; b=Ti22W0JTt5aIsloU0iHse+0YvOs
	IsKwgPLCZMUZP+dtuu8wovxzI7pA3f7U01dHxhlj59ugCYLCMEhgCVU1br3uvrRy
	uDpWSPFHGF9fxXEHvGQXNFb6Hb+kKKuR6KxHgoIA/2oy8HzKH8tLd9lSvNpfcW0p
	yCoImNNr1qya3Ep2iSr8fBMRt2Ys78p3cuDZGU3i5d/DfbeMGuJlvoZQ5AfZ4qnf
	tx7mZUnlrX++6JFshvnjnN5QmxJLzv4GkChnwsriodI9vcFcYY89V6HpnlLl9vyW
	i3J3ZSayQcGDHDqGR9HsI89yw2Blvi9cQBR3ufOHgIfTtveeUBeLA5SpFSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc7x1ykd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 12:03:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3032ea03448so943286a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 05:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681810; x=1744286610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiVyJ9HIT+Jy3t8ULO00gMydZY0WULMCQbUZhY1u9Bo=;
        b=OVPD/iHQ5GBz4UuxCuusP9GeCCSenf/hVdFP6nUEMMczGeFmHi7KI0KK6Py0cIe4NA
         8a3oYsQxwvwHGswbp8T8XMJxHKXxL4t15CZsb9cvAM26eoPOcLFJ+mipd+z3/m7ClAch
         Uk0tRFoc3UlINAkDYgMnxJmj/0aSd5BZMm3yWfjHAGj3KkjBtHfwkWea0i5X5wMsQy1/
         U/FF0EXDlyH+ejccIS2bMU4P/eVJfl9wr4cmOZFjTgS6wou6RWSqUafvGC2ubEw2H3uz
         ojcNE2I/3c4FrQKKMTFk6HEtZRJ2/PsNe0KQa3wdfp1UP3Nddj1s1uZexM4mFYFULeOI
         U5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXOl5bALsUeC7akjpBbnHRV57NZgOTXfh6mXD3h8acdRFGD2yXfSrSu3uJmDYefXDpHPmoH+SeAGiz1fPHioi7@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpprEDIlvah6bXz+hEmjyzU0sjtw9ZPtfMA7VgcS+1YRItVfL
	GDwTfp+hcx4XTwF16IGuoIls8Dxkryz+rQi9PZegUmFDw0gi0VGnXxx1PVDxHeAOawF4WII0wF/
	K7nAJYwZtcXupYP+GBDrczz8EDgGzWrkXyLTv2WTL0IxmABntoBNl0OJseWoB5usX//Tn
X-Gm-Gg: ASbGncvG5OzbyoxoEkxYRRKBAhhUYIaamOYZoz5T2GRa03j4zSUyP33jORxwhMKE8/N
	PXIJLChjsbqgp0bOVh9wFlzBkMWGlfKVvvpc3aF0RWsqnY+tIbuRAST5kZhQQ64XBqAjO+wTmni
	RFdxAfTlBEPzjx1SPUuRmrJ6r/fh0Obx3gu5HpD9nJTP/GnlhIN0SCsE3CMAY34arhZXtqq8g8N
	FUDc6qSK88YaBUxL5WgtXBQTCDuz3k3hdibnxDYVldsXQaXk7l4ZkSyPQhViHcBjFpBaJ9O96/X
	ORvNksa89jv684rz9H4iLrbvf0UjudZN+4MwhXRz07IJNXJE8OJlXX/dgsjQxkqUisQ3+wL/AGz
	GNRustSR0aAhlP/KlhZXbGxDfYz1XhtlNM99akK4=
X-Received: by 2002:a17:90b:2f10:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-3057cbf53bemr3901089a91.10.1743681810014;
        Thu, 03 Apr 2025 05:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvrjvKoKHjNYELBa0Lyp30V3YrB0+CCYX2FVzgm+S7OA9G+72hJaGlN9YK8gFhNZxziDFw3A==
X-Received: by 2002:a17:90b:2f10:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-3057cbf53bemr3901045a91.10.1743681809590;
        Thu, 03 Apr 2025 05:03:29 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:29 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 5/8] remoteproc: qcom: add support for Q6 device-tree loading
Date: Thu,  3 Apr 2025 17:33:01 +0530
Message-Id: <20250403120304.2345677-6-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gwFrZx7ilXNdyj1j_moNft1ggGW0JeoY
X-Authority-Analysis: v=2.4 cv=XamJzJ55 c=1 sm=1 tr=0 ts=67ee7912 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=aTtrrYsn2t972Xo9M2sA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: gwFrZx7ilXNdyj1j_moNft1ggGW0JeoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

In IPQ5332 and IPQ5424 SoCs, Q6 requires separate device-tree.

Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 147 ++++++++++++++++++++++--
 1 file changed, 137 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
index 30422c6c982d..e4cc7caebd7c 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss_sec.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -10,9 +10,12 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/tmelcom-qmp.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/smem.h>
 
 #include "qcom_common.h"
 #include "qcom_q6v5.h"
@@ -34,6 +37,18 @@ struct wcss_sec {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+
+	const char *dtb_firmware_name;
+	const struct firmware *dtb_firmware;
+	phys_addr_t dtb_mem_phys;
+	phys_addr_t dtb_mem_reloc;
+	void *dtb_mem_region;
+	size_t dtb_mem_size;
+	struct regmap *tcsr_map;
+	u32 dtb_low_offset;
+	u32 dtb_high_offset;
+	u32 machid_offset;
+
 	const struct wcss_data *desc;
 
 	struct mbox_client mbox_client;
@@ -46,6 +61,7 @@ struct wcss_data {
 	u32 pasid;
 	const char *ss_name;
 	bool auto_boot;
+	const char *dtb_firmware_name;
 	bool tmelcom;
 };
 
@@ -137,8 +153,45 @@ static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct wcss_sec *wcss = rproc->priv;
 	struct device *dev = wcss->dev;
+	u32 machid;
 	int ret;
 
+	if (wcss->dtb_firmware_name) {
+		ret = request_firmware(&wcss->dtb_firmware, wcss->dtb_firmware_name, wcss->dev);
+		if (ret) {
+			dev_err(wcss->dev, "request_firmware failed for %s: %d\n",
+				wcss->dtb_firmware_name, ret);
+			return ret;
+		}
+
+		ret = qcom_mdt_load_no_init(wcss->dev, wcss->dtb_firmware,
+					    wcss->dtb_firmware_name, 0, wcss->dtb_mem_region,
+					    wcss->dtb_mem_phys, wcss->dtb_mem_size,
+					    &wcss->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_firmware;
+
+		ret = qcom_smem_get_machid(&machid);
+		if (ret) {
+			pr_err("machid get failed, ret = %d\n", ret);
+			goto release_dtb_firmware;
+		}
+
+		ret = regmap_write(wcss->tcsr_map, wcss->dtb_low_offset,
+				   wcss->dtb_mem_phys & 0xFFFFFFFF);
+		if (ret)
+			goto release_dtb_firmware;
+
+		ret = regmap_write(wcss->tcsr_map, wcss->dtb_high_offset,
+				   wcss->dtb_mem_phys & (0xFFFFFFFF << 31));
+		if (ret)
+			goto release_dtb_firmware;
+
+		ret = regmap_write(wcss->tcsr_map, wcss->machid_offset, machid);
+		if (ret)
+			goto release_dtb_firmware;
+	}
+
 	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
 		wcss->metadata = qcom_mdt_read_metadata(fw, &wcss->metadata_len,
 							rproc->firmware, wcss->dev);
@@ -146,26 +199,33 @@ static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
 			ret = PTR_ERR(wcss->metadata);
 			dev_err(wcss->dev, "error %d reading firmware %s metadata\n",
 				ret, rproc->firmware);
-			return ret;
+			goto release_dtb_firmware;
 		}
 
 		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware, wcss->desc->pasid,
 					    wcss->mem_region, wcss->mem_phys, wcss->mem_size,
 					    &wcss->mem_reloc);
-		if (ret) {
-			kfree(wcss->metadata);
-			return ret;
-		}
+		if (ret)
+			goto release_metadata;
 	} else {
 		ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
 				    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
 		if (ret)
-			return ret;
+			goto release_dtb_firmware;
 	}
 
 	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
 
 	return 0;
+
+release_metadata:
+	if (!IS_ERR_OR_NULL(wcss->mbox_chan))
+		kfree(wcss->metadata);
+release_dtb_firmware:
+	if (wcss->dtb_firmware_name)
+		release_firmware(wcss->dtb_firmware);
+
+	return ret;
 }
 
 static unsigned long wcss_sec_panic(struct rproc *rproc)
@@ -282,6 +342,33 @@ static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
 		return -ENOMEM;
 	}
 
+	if (!wcss->dtb_firmware_name)
+		return 0;
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 1);
+	if (!node) {
+		dev_err(dev, "can't find dtb memory-region\n");
+		return -EINVAL;
+	}
+
+	rmem = of_reserved_mem_lookup(node);
+	of_node_put(node);
+
+	if (!rmem) {
+		dev_err(dev, "unable to resolve dtb memory-region\n");
+		return -EINVAL;
+	}
+
+	wcss->dtb_mem_phys = rmem->base;
+	wcss->dtb_mem_reloc = rmem->base;
+	wcss->dtb_mem_size = rmem->size;
+	wcss->dtb_mem_region = devm_ioremap_wc(dev, wcss->dtb_mem_phys, wcss->dtb_mem_size);
+	if (!wcss->dtb_mem_region) {
+		dev_err(dev, "unable to map dtb memory region: %pa+%pa\n",
+			&rmem->base, &rmem->size);
+		return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -291,6 +378,9 @@ static int wcss_sec_probe(struct platform_device *pdev)
 	struct wcss_sec *wcss;
 	struct clk *sleep_clk;
 	const char *fw_name = NULL;
+	const char *dtb_fw_name = NULL;
+	struct of_phandle_args args;
+	int args_cell_cnt = 3;
 	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
 	int ret;
 
@@ -310,6 +400,33 @@ static int wcss_sec_probe(struct platform_device *pdev)
 	wcss->dev = &pdev->dev;
 	wcss->desc = desc;
 
+	if (desc->dtb_firmware_name) {
+		ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
+						    1, &dtb_fw_name);
+		if (ret < 0)
+			return ret;
+
+		if (dtb_fw_name)
+			wcss->dtb_firmware_name = dtb_fw_name;
+
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "qcom,q6-dtb-info",
+						       args_cell_cnt, 0, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse qcom,q6-dtb-info\n");
+			return ret;
+		}
+
+		wcss->tcsr_map = syscon_node_to_regmap(args.np);
+		of_node_put(args.np);
+		if (IS_ERR(wcss->tcsr_map))
+			return dev_err_probe(&pdev->dev, PTR_ERR(wcss->tcsr_map),
+					     "unable to get syscon regmap\n");
+
+		wcss->dtb_low_offset = args.args[0];
+		wcss->dtb_high_offset = args.args[1];
+		wcss->machid_offset = args.args[2];
+	}
+
 	ret = wcss_sec_alloc_memory_region(wcss);
 	if (ret)
 		return ret;
@@ -336,18 +453,26 @@ static int wcss_sec_probe(struct platform_device *pdev)
 		wcss->mbox_client.knows_txdone = true;
 		wcss->mbox_client.tx_block = true;
 		wcss->mbox_chan = mbox_request_channel(&wcss->mbox_client, 0);
-		if (IS_ERR(wcss->mbox_chan))
-			return dev_err_probe(wcss->dev, PTR_ERR(wcss->mbox_chan),
-					     "mbox chan for IPC is missing\n");
+		if (IS_ERR(wcss->mbox_chan)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(wcss->mbox_chan),
+					    "mbox chan for IPC is missing\n");
+			goto remove_subdevs;
+		}
 	}
 
 	ret = devm_rproc_add(&pdev->dev, rproc);
 	if (ret)
-		return ret;
+		goto remove_subdevs;
 
 	platform_set_drvdata(pdev, rproc);
 
 	return 0;
+
+remove_subdevs:
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+
+	return ret;
 }
 
 static void wcss_sec_remove(struct platform_device *pdev)
@@ -364,11 +489,13 @@ static void wcss_sec_remove(struct platform_device *pdev)
 static const struct wcss_data wcss_sec_ipq5332_res_init = {
 	.pasid = MPD_WCSS_PAS_ID,
 	.ss_name = "q6wcss",
+	.dtb_firmware_name = "qdsp6sw_dtb.mbn",
 };
 
 static const struct wcss_data wcss_sec_ipq5424_res_init = {
 	.pasid = MPD_WCSS_PAS_ID,
 	.ss_name = "q6wcss",
+	.dtb_firmware_name = "qdsp6sw_dtb.mbn",
 	.tmelcom = true,
 };
 
-- 
2.34.1


