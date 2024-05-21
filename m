Return-Path: <linux-remoteproc+bounces-1359-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F588CAE49
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 May 2024 14:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CFF1C225FE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 May 2024 12:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCF078C66;
	Tue, 21 May 2024 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="2xbxyrBM"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5B76057;
	Tue, 21 May 2024 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294545; cv=none; b=ZfmFrFiajtCvEFryjGeZIj7lzXck6Pg9mdYDAV2zHOMM+d/XZqhPK9d5z5iY+F8hgkC5RoCErmfQ0APOQQiJj+Qc8HRX4mQC1kpfuVTkRXWDUlyCW2OAp91nKwAm4BfKb7dlskpXdsALvrTJV6lgh5Pqvodbro/ZJWnEkqqSsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294545; c=relaxed/simple;
	bh=paM+/T4ub8hSwj6+v2vKkq691ZmzBdKEhnjn/9+0gNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OeYN7y9UsGkQ+ACLt7rTJb27GkfH3X97bwpAmzv5t0ARAvokv4HwWGCuHH27WCTVSEmBJQ2hvDfm4ggV2UrHKogOCl4PH52Q1/atGX+r2oqd9wG8WkqAlZfBkArQlIztn30EKOuF1xei/qLhE6L8u4CtRw59VIq+O5ZPJck/igA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=2xbxyrBM; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBRmXX009359;
	Tue, 21 May 2024 14:28:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=GN+nLCoaZHUydrf2dv/aCIwv8FX5c5zQd+BfUG5pP3U=; b=2x
	bxyrBMcGw8ChDi6QE/jbQY42zkN35Ecah8Tl/dGn89axgJjHnMlGLWmXFjJP3nD1
	G/LEqn6/jFwvnyGGFO+gDSbi4bPLDbr3bSeCKhe8APy/le0zqCl7f5+jWILp1qZw
	yx8VQzc3B60OH1oCIhZ8KAG4DhcYQD7w4TYJJ2P+2rmFbYIgDliOaDAci14TWxIc
	kla+cgTPRVrds2uEPdRRs8P0TFB3Pq0ZucLG/aR5SajrIHf9xGmbmoGFWut/ter/
	8IHt8vRtiV28On84GvDm+x0SnbuEKJfC+oQQAtHsgWFg/tFGpkOx2sgl6tU4o2gJ
	L74v4bPi+1NfN90pcQ5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y779hsp05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 14:28:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BCBE140044;
	Tue, 21 May 2024 14:28:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76FD821A206;
	Tue, 21 May 2024 14:27:51 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:51 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:51 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [RESEND PATCH v5 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
Date: Tue, 21 May 2024 14:24:58 +0200
Message-ID: <20240521122458.3517054-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01

The new TEE remoteproc device is used to manage remote firmware in a
secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
introduced to delegate the loading of the firmware to the trusted
execution context. In such cases, the firmware should be signed and
adhere to the image format defined by the TEE.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update from V4:
- remove hard coded remote proc ID STM32_MP1_M4_PROC_ID, get the
  ID from the DT,
- replace find_loaded_rsc_table by get_loaded_rsc_table.
---
 drivers/remoteproc/stm32_rproc.c | 65 ++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8cd838df4e92..f6f748814bf2 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -20,6 +20,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/tee_remoteproc.h>
 #include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
@@ -257,6 +258,19 @@ static int stm32_rproc_release(struct rproc *rproc)
 	return 0;
 }
 
+static int stm32_rproc_tee_stop(struct rproc *rproc)
+{
+	int err;
+
+	stm32_rproc_request_shutdown(rproc);
+
+	err = tee_rproc_stop(rproc);
+	if (err)
+		return err;
+
+	return stm32_rproc_release(rproc);
+}
+
 static int stm32_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
@@ -693,8 +707,20 @@ static const struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static const struct rproc_ops st_rproc_tee_ops = {
+	.prepare	= stm32_rproc_prepare,
+	.start		= tee_rproc_start,
+	.stop		= stm32_rproc_tee_stop,
+	.kick		= stm32_rproc_kick,
+	.load		= tee_rproc_load_fw,
+	.parse_fw	= tee_rproc_parse_fw,
+	.get_loaded_rsc_table = tee_rproc_get_loaded_rsc_table,
+
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
-	{ .compatible = "st,stm32mp1-m4" },
+	{.compatible = "st,stm32mp1-m4",},
+	{.compatible = "st,stm32mp1-m4-tee",},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_rproc_match);
@@ -853,17 +879,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
+	struct tee_rproc *trproc = NULL;
 	struct rproc *rproc;
 	unsigned int state;
+	u32 proc_id;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
-	if (!rproc)
-		return -ENOMEM;
+	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
+		/*
+		 * Delegate the firmware management to the secure context.
+		 * The firmware loaded has to be signed.
+		 */
+		ret = of_property_read_u32(np, "st,proc-id", &proc_id);
+		if (ret) {
+			dev_err(dev, "failed to read st,rproc-id property\n");
+			return ret;
+		}
+
+		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
+		if (!rproc)
+			return -ENOMEM;
+
+		trproc = tee_rproc_register(dev, rproc, proc_id);
+		if (IS_ERR(trproc)) {
+			dev_err_probe(dev, PTR_ERR(trproc),
+				      "signed firmware not supported by TEE\n");
+			return PTR_ERR(trproc);
+		}
+	} else {
+		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
+		if (!rproc)
+			return -ENOMEM;
+	}
 
 	ddata = rproc->priv;
 
@@ -915,6 +966,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	if (trproc)
+		tee_rproc_unregister(trproc);
+
 	return ret;
 }
 
@@ -935,6 +989,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	if (rproc->tee_interface)
+		tee_rproc_unregister(rproc->tee_interface);
+
 }
 
 static int stm32_rproc_suspend(struct device *dev)
-- 
2.25.1


