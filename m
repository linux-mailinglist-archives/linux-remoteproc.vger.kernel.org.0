Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D02D5B5D25
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Sep 2022 17:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiILPax (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 12 Sep 2022 11:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiILPaw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Sep 2022 11:30:52 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783A42251B;
        Mon, 12 Sep 2022 08:30:51 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CF5hkp012145;
        Mon, 12 Sep 2022 15:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Ij81E1OQlgZvSM3xquEVml12KCb9/5N2KS1Kns1QJh4=;
 b=YKEvUmcaeNrbyaaKdROwNIBIXvchZJ/MAS8v0lg6fc7FyRsByAQEL34VbuVSgYlKcGxy
 4p6VqwQHznhfmBJWyM8ti49bxzc0PAMs2Kvgq+rhLRyAi+SBA0irYC3KhIwIikif+mD2
 wK6XdEIVIpweV8NfEkrh0RTtQk/+Z9/cHV9UK0lLQN8PPv1xZtCfeJqAIne4baezpEQR
 0ACjtsmuqYg4KS5+28pH+Cj0ejLP7lklH5KM87D4zx57L5tAF1yp7bC7wavJBQhWB9UD
 T9/PMeVa07S6GpAAcg5tNhBIOccABQvhn97vm47E2LR6Jpi9kfll04krSyw0BQpwu0aW kQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk634fy3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Sep 2022 15:30:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28CFUfHg010242
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Sep 2022 15:30:41 GMT
Received: from hu-gokukris-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 12 Sep 2022 08:30:41 -0700
From:   Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org--cc=Trilok Soni" 
        <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Elliot Berman" <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Subject: [PATCH v1 1/3] remoteproc: qcom: q6v5: Send subdevice notifications before panic
Date:   Mon, 12 Sep 2022 08:30:27 -0700
Message-ID: <842a6b6307d26874959d29f2065aad544ff0b86c.1662995608.git.quic_gokukris@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1662995608.git.quic_gokukris@quicinc.com>
References: <cover.1662995608.git.quic_gokukris@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rH8S5i5tDBUTXa49tWc_uM5agFKPdzPE
X-Proofpoint-ORIG-GUID: rH8S5i5tDBUTXa49tWc_uM5agFKPdzPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_10,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209120052
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Subdevice notifications after a remoteproc has crashed are useful to any
clients that might want to preserve data pertaining to the driver after the
remoteproc crashed. Sending subdevice notifications before triggering a
kernel panic gives these drivers the time to do collect this information.

Change-Id: Id6e55fb038b70f54ff5854d2adff72b74b6a9570
Signed-off-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5.c | 31 +++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 497acfb..89f5384 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -15,6 +15,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/remoteproc.h>
+#include <linux/delay.h>
 #include "qcom_common.h"
 #include "qcom_q6v5.h"
 
@@ -94,6 +95,29 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_unprepare);
 
+static void qcom_q6v5_crash_handler_work(struct work_struct *work)
+{
+	struct qcom_q6v5 *q6v5 = container_of(work, struct qcom_q6v5, crash_handler);
+	struct rproc *rproc = q6v5->rproc;
+	struct rproc_subdev *subdev;
+
+	mutex_lock(&rproc->lock);
+
+	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
+		if (subdev->stop)
+			subdev->stop(subdev, true);
+	}
+
+	mutex_unlock(&rproc->lock);
+
+	/*
+	 * Temporary workaround until ramdump userspace application calls
+	 * sync() and fclose() on attempting the dump.
+	 */
+	msleep(100);
+	panic("Panicking, remoteproc %s crashed\n", q6v5->rproc->name);
+}
+
 static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
@@ -113,6 +137,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 		dev_err(q6v5->dev, "watchdog without message\n");
 
 	q6v5->running = false;
+	if (q6v5->rproc->recovery_disabled)
+		schedule_work(&q6v5->crash_handler);
+
 	rproc_report_crash(q6v5->rproc, RPROC_WATCHDOG);
 
 	return IRQ_HANDLED;
@@ -134,6 +161,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 		dev_err(q6v5->dev, "fatal error without message\n");
 
 	q6v5->running = false;
+	if (q6v5->rproc->recovery_disabled)
+		schedule_work(&q6v5->crash_handler);
+
 	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
 
 	return IRQ_HANDLED;
@@ -354,6 +384,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	if (IS_ERR(q6v5->path))
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
+	INIT_WORK(&q6v5->crash_handler, qcom_q6v5_crash_handler_work);
 
 	return 0;
 }
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c4..b1654be 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -29,6 +29,8 @@ struct qcom_q6v5 {
 	int handover_irq;
 	int stop_irq;
 
+	struct work_struct crash_handler;
+
 	bool handover_issued;
 
 	struct completion start_done;
-- 
2.7.4

