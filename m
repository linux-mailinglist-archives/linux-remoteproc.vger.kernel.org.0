Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58E13A5FF6
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Jun 2021 12:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhFNKYk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Jun 2021 06:24:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56492 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbhFNKYd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 06:24:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623666151; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aMGSD4+uuzB4h+EpkcG4tHv+ZXv8MVmX8UzZ7sJlY/M=; b=DbL9v9HG5EKC4CmZ4j+wQM8TUNyWGCh2kDHXmzrfvpvK+mW+VTYBY2KgHWAijeUPh7PtNp3c
 ISxObJ2+zgMo0y4hneoWKal3Qmu557nFdlXImiq5iHW0iZ0qpC/83O1UwJkcalWlfq13XLvv
 kmA7+mj1hpS5SyE4G3YM+67zl2g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c72de2abfd22a3dc8ca67f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 10:22:26
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11761C433F1; Mon, 14 Jun 2021 10:22:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CCA8C433F1;
        Mon, 14 Jun 2021 10:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CCA8C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org, manivannan.sadhasivam@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V4 1/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Mon, 14 Jun 2021 15:51:33 +0530
Message-Id: <1623666094-2924-2-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623666094-2924-1-git-send-email-deesin@codeaurora.org>
References: <1623666094-2924-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Not all upcoming usecases will have an interface to allow the aoss
driver to hook onto. Expose the send api and create a get function to
enable drivers to send their own messages to aoss.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c       | 70 ++++++++++++++++++++++++++++++++++++--
 include/linux/soc/qcom/qcom_aoss.h | 38 +++++++++++++++++++++
 2 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 53acb94..cd75d4d 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -8,10 +8,12 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/thermal.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/qcom_aoss.h>
 
 #define QMP_DESC_MAGIC			0x0
 #define QMP_DESC_VERSION		0x4
@@ -61,6 +63,7 @@ struct qmp_cooling_device {
  * @mbox_chan: mailbox channel used to ring the doorbell on transmit
  * @offset: offset within @msgram where messages should be written
  * @size: maximum size of the messages to be transmitted
+ * @orphan: tarcks whether qmp handle is valid
  * @event: wait_queue for synchronization with the IRQ
  * @tx_lock: provides synchronization between multiple callers of qmp_send()
  * @qdss_clk: QDSS clock hw struct
@@ -76,6 +79,8 @@ struct qmp {
 
 	size_t offset;
 	size_t size;
+	atomic_t  orphan;
+	struct kref refcount;
 
 	wait_queue_head_t event;
 
@@ -223,11 +228,17 @@ static bool qmp_message_empty(struct qmp *qmp)
  *
  * Return: 0 on success, negative errno on failure
  */
-static int qmp_send(struct qmp *qmp, const void *data, size_t len)
+int qmp_send(struct qmp *qmp, const void *data, size_t len)
 {
 	long time_left;
 	int ret;
 
+	if (WARN_ON(IS_ERR_OR_NULL(qmp) || !data))
+		return -EINVAL;
+
+	if (atomic_read(&qmp->orphan))
+		return -EINVAL;
+
 	if (WARN_ON(len + sizeof(u32) > qmp->size))
 		return -EINVAL;
 
@@ -261,6 +272,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 
 	return ret;
 }
+EXPORT_SYMBOL(qmp_send);
 
 static int qmp_qdss_clk_prepare(struct clk_hw *hw)
 {
@@ -515,6 +527,54 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
 		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
 }
 
+/**
+ * qmp_get() - get a qmp handle from a device
+ * @dev: client device pointer
+ *
+ * Return: handle to qmp device on success, ERR_PTR() on failure
+ */
+struct qmp *qmp_get(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct qmp *qmp;
+
+	if (!dev || !dev->of_node)
+		return ERR_PTR(-EINVAL);
+
+	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-EINVAL);
+
+	qmp = platform_get_drvdata(pdev);
+	platform_device_put(pdev);
+
+	if (qmp)
+		kref_get(&qmp->refcount);
+
+	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL(qmp_get);
+
+static void qmp_handle_release(struct kref *ref)
+{
+	struct qmp *qmp = container_of(ref, struct qmp, refcount);
+
+	kfree(qmp);
+}
+
+void qmp_put(struct qmp *qmp)
+{
+	if (!IS_ERR_OR_NULL(qmp))
+		kref_put(&qmp->refcount, qmp_handle_release);
+}
+EXPORT_SYMBOL(qmp_put);
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -522,13 +582,14 @@ static int qmp_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
+	qmp = kzalloc(sizeof(*qmp), GFP_KERNEL);
 	if (!qmp)
 		return -ENOMEM;
 
 	qmp->dev = &pdev->dev;
 	init_waitqueue_head(&qmp->event);
 	mutex_init(&qmp->tx_lock);
+	kref_init(&qmp->refcount);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
@@ -569,6 +630,8 @@ static int qmp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmp);
 
+	atomic_set(&qmp->orphan, 0);
+
 	return 0;
 
 err_remove_qdss_clk:
@@ -577,6 +640,7 @@ static int qmp_probe(struct platform_device *pdev)
 	qmp_close(qmp);
 err_free_mbox:
 	mbox_free_channel(qmp->mbox_chan);
+	kfree(qmp);
 
 	return ret;
 }
@@ -590,7 +654,9 @@ static int qmp_remove(struct platform_device *pdev)
 	qmp_cooling_devices_remove(qmp);
 
 	qmp_close(qmp);
+	atomic_set(&qmp->orphan, 1);
 	mbox_free_channel(qmp->mbox_chan);
+	kref_put(&qmp->refcount, qmp_handle_release);
 
 	return 0;
 }
diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
new file mode 100644
index 0000000..a8d8f07
--- /dev/null
+++ b/include/linux/soc/qcom/qcom_aoss.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_AOSS_H__
+#define __QCOM_AOSS_H__
+
+#include <linux/err.h>
+#include <linux/device.h>
+
+struct qmp;
+
+#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
+
+int qmp_send(struct qmp *qmp, const void *data, size_t len);
+struct qmp *qmp_get(struct device *dev);
+void qmp_put(struct qmp *qmp);
+
+#else
+
+static inline int qmp_send(struct qmp *qmp, const void *data, size_t len)
+{
+	return -ENODEV;
+}
+
+static inline struct qmp *qmp_get(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void qmp_put(struct qmp *qmp)
+{
+}
+
+#endif
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

