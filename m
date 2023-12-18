Return-Path: <linux-remoteproc+bounces-128-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C281664E
	for <lists+linux-remoteproc@lfdr.de>; Mon, 18 Dec 2023 07:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9C52823A8
	for <lists+linux-remoteproc@lfdr.de>; Mon, 18 Dec 2023 06:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1776FB2;
	Mon, 18 Dec 2023 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p7F+srUY"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058E6FB6;
	Mon, 18 Dec 2023 06:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI5r31e016264;
	Mon, 18 Dec 2023 06:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=ivqOryf
	a4EohV/JuQOGdO5Z+rOyIBl74LtkPa6yvA+o=; b=p7F+srUYWWmcsSQXSiEyb/t
	W9BGD0nObdo/5c7lRUOxBJA1VFxJLtgrrMTP2sgOgWBPMHrMWXhsYI/5vUXhVgGn
	9JR9TeVdUDWHy4DFx+qLoMG4rZ6oB3FHmEjVjcHQ6Te34djcEQUnVwYrp6ojPZMR
	66HLRsbUIBQxJptWx1OBIK92NswcCQWgh6tHcxp/h0QwAHE8xDsFpcYbBGZ+nnRr
	NMkZX+kTQDMFlovttkJXBtXFPCULiZpIFQkmBplk/JYjc9cOMHJ4OI8PkozJAVTm
	0efQxGhpU2vSChJ36ioFef5PeuHxjw9xdTTFOJZuEYqTf+KJdvk1SYrCzIe3baw=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v1531ug05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 06:10:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BI6Aww9014835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 06:10:58 GMT
Received: from hu-viswanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Dec 2023 22:10:54 -0800
From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <lee@kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_anusha@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        Vignesh Viswanathan
	<quic_viswanat@quicinc.com>
Subject: [PATCH V3] remoteproc: qcom: q6v5: Get crash reason from specific SMEM partition
Date: Mon, 18 Dec 2023 11:40:42 +0530
Message-ID: <20231218061042.3015013-1-quic_viswanat@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fMY9dyMrhWeZL7hzA_m7RjbF4OOgFBNi
X-Proofpoint-ORIG-GUID: fMY9dyMrhWeZL7hzA_m7RjbF4OOgFBNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=883
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180041

q6v5 fatal and watchdog IRQ handlers always retrieves the crash reason
information from SMEM global partition (QCOM_SMEM_HOST_ANY).

For some targets like IPQ9574 and IPQ5332, crash reason information is
present in target specific partition due to which the crash reason is
not printed in the current implementation.

Add support to pass crash_reason_partition along with crash_reason_item
number in qcom_q6v5_init call and use the same to get the crash
information from SMEM in fatal and watchdog IRQ handlers.

Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
---
Changes in V3: Updated commit message.
Changes in V2: Addressed comments in V1.

This patch depends on [1] which adds support for IPQ9574 and IPQ5332
remoteproc q5v5_mpd driver.

[1]: https://lore.kernel.org/all/20231110091939.3025413-1-quic_mmanikan@quicinc.com/

 drivers/remoteproc/qcom_q6v5.c      | 10 ++++++----
 drivers/remoteproc/qcom_q6v5.h      |  6 ++++--
 drivers/remoteproc/qcom_q6v5_adsp.c |  5 +++--
 drivers/remoteproc/qcom_q6v5_mpd.c  | 14 ++++++++------
 drivers/remoteproc/qcom_q6v5_mss.c  |  5 +++--
 drivers/remoteproc/qcom_q6v5_pas.c  |  3 ++-
 drivers/remoteproc/qcom_q6v5_wcss.c |  4 +++-
 7 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 0e32f13c196d..e4a28bf25130 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -100,7 +100,7 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
+	msg = qcom_smem_get(q6v5->crash_reason_partition, q6v5->crash_reason_item, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(q6v5->dev, "watchdog received: %s\n", msg);
 	else
@@ -121,7 +121,7 @@ irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 	if (!q6v5->running)
 		return IRQ_HANDLED;
 
-	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
+	msg = qcom_smem_get(q6v5->crash_reason_partition, q6v5->crash_reason_item, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
 	else
@@ -279,14 +279,16 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  * Return: 0 on success, negative errno on failure
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason, const char *load_state,
+		   struct rproc *rproc, int crash_reason_partition,
+		   int crash_reason_item, const char *load_state,
 		   void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
 
 	q6v5->rproc = rproc;
 	q6v5->dev = &pdev->dev;
-	q6v5->crash_reason = crash_reason;
+	q6v5->crash_reason_partition = crash_reason_partition;
+	q6v5->crash_reason_item = crash_reason_item;
 	q6v5->handover = handover;
 
 	init_completion(&q6v5->start_done);
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 4e1bb1a68284..cd02372e9856 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -40,7 +40,8 @@ struct qcom_q6v5 {
 	struct completion stop_done;
 	struct completion spawn_done;
 
-	int crash_reason;
+	int crash_reason_partition;
+	int crash_reason_item;
 
 	bool running;
 
@@ -49,7 +50,8 @@ struct qcom_q6v5 {
 };
 
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason, const char *load_state,
+		   struct rproc *rproc, int crash_reason_partition,
+		   int crash_reason_item, const char *load_state,
 		   void (*handover)(struct qcom_q6v5 *q6v5));
 void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 6c67514cc493..8feb2eb45737 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -731,8 +731,9 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_pm;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_adsp_pil_handover);
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     desc->crash_reason_smem, desc->load_state,
+			     qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
diff --git a/drivers/remoteproc/qcom_q6v5_mpd.c b/drivers/remoteproc/qcom_q6v5_mpd.c
index b133285888c7..c893deac30e1 100644
--- a/drivers/remoteproc/qcom_q6v5_mpd.c
+++ b/drivers/remoteproc/qcom_q6v5_mpd.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -555,9 +556,9 @@ static int q6_get_outbound_irq(struct qcom_q6v5 *q6,
 	return 0;
 }
 
-static int init_irq(struct qcom_q6v5 *q6,
-		    struct platform_device *pdev, struct rproc *rproc,
-		    int crash_reason, const char *load_state,
+static int init_irq(struct qcom_q6v5 *q6, struct platform_device *pdev,
+		    struct rproc *rproc, int crash_reason_partition,
+		    int crash_reason_item, const char *load_state,
 		    void (*handover)(struct qcom_q6v5 *q6))
 {
 	int ret;
@@ -565,7 +566,8 @@ static int init_irq(struct qcom_q6v5 *q6,
 
 	q6->rproc = rproc;
 	q6->dev = &pdev->dev;
-	q6->crash_reason = crash_reason;
+	q6->crash_reason_partition = crash_reason_partition;
+	q6->crash_reason_item = crash_reason_item;
 	q6->handover = handover;
 
 	init_completion(&q6->start_done);
@@ -666,7 +668,7 @@ static int q6_register_userpd(struct platform_device *pdev,
 	if (ret)
 		goto free_rproc;
 
-	ret = init_irq(&wcss->q6, userpd_pdev, rproc,
+	ret = init_irq(&wcss->q6, userpd_pdev, rproc, WCSS_SMEM_HOST,
 		       WCSS_CRASH_REASON, NULL, NULL);
 	if (ret)
 		goto free_rproc;
@@ -725,7 +727,7 @@ static int q6_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
+	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc, WCSS_SMEM_HOST,
 			     WCSS_CRASH_REASON, NULL, NULL);
 	if (ret)
 		goto free_rproc;
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 394b2c1cb5e2..48f115f9337b 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/smem.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
@@ -2093,8 +2094,8 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->need_mem_protection = desc->need_mem_protection;
 	qproc->has_mba_logs = desc->has_mba_logs;
 
-	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
-			     qcom_msa_handover);
+	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     MPSS_CRASH_REASON_SMEM, "modem", qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 913a5d2068e8..bfadc7bd4b51 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -728,7 +728,8 @@ static int adsp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	adsp->proxy_pd_count = ret;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     desc->crash_reason_smem, desc->load_state,
 			     qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index cff1fa07d1de..29510bbefa2e 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/smem.h>
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
@@ -1047,7 +1048,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     desc->crash_reason_smem, NULL, NULL);
 	if (ret)
 		goto free_rproc;
 
-- 
2.41.0


