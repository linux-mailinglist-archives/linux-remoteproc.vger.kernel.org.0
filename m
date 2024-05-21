Return-Path: <linux-remoteproc+bounces-1358-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC618CAE48
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 May 2024 14:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E01801F23B63
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 May 2024 12:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4233D7828B;
	Tue, 21 May 2024 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="O7q1ZAlZ"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26601757F7;
	Tue, 21 May 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294545; cv=none; b=NaaWhAH/tVVaiNCLcCTvNpxxDFnQtnTWGbz/45hPL/9a3QrSWM1U8dCkS8TC+oiTJVpVpv764Ymro00nFcAHstWLcXXQyHLuf/4PjO12ugecnvutugcDxh67jSEJnv9HiBTb3jP2PCMEciXmr6ivclQQ1jxWAVVusIMJJfri2ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294545; c=relaxed/simple;
	bh=ibR4vJMfrHUhnfMxYAC0fMYtSrPtKaV7rcoxKzaHFjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oASgaZrg3yv3XzGmt843VFRRJnTgvU9YZKD/LA8M9Zhj2MSOChtbX0NGhxLVglceXG3e1W3jTgWvBUUsuX34+WYz5TyODaQOvquu2Nmy7BQMHAnOvvZ9cb/EnafB9BgknGzuoFb8IdgFFV/hh93M3XdTTmQgtK/W6gx3gTP5e5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=O7q1ZAlZ; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBRhHn019425;
	Tue, 21 May 2024 14:28:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=kgVIqvtcxNrOP/hhUaH+aAauOzdwnKf+O8volStLKIM=; b=O7
	q1ZAlZ82GuR7zoc1NMuSFZKH35S+vrS9VoaagXvshVFh96BIdbZDqHEuBF+RtQ72
	yuoBh9X5hcgflXynNzXzPXwA5pXTib8zHr0z1ZRlD0JKBllt4ApkLzniFqD0fvc+
	nn4BjiEF/ORIkHGOrc62wPiJXMsyjg1uKk3eVjWKcwmHemwp3ui00qkeOj/+drmx
	HpaIagBArhufEJxl3aoKLa7M9vy1ROm3dCIY6K5RpV5YPpbi9NpSedR4txmEzLnU
	2GzLw/FMbvmaJjW6jaYikTkrjv0b13XUi+sdq+Pu+50sdln5aaSEAwnxNa/qQlw5
	eS+chtDmJj7pz3aVAmqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n42c5jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 14:28:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4826340049;
	Tue, 21 May 2024 14:28:38 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14DB42194F9;
	Tue, 21 May 2024 14:27:49 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:48 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:27:48 +0200
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
Subject: [RESEND PATCH v5 4/7] remoteproc: core introduce rproc_set_rsc_table_on_start function
Date: Tue, 21 May 2024 14:24:55 +0200
Message-ID: <20240521122458.3517054-5-arnaud.pouliquen@foss.st.com>
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

Split rproc_start()to prepare the update of the management of
the cache table on start, for the support of the firmware loading
by the TEE interface.
- create rproc_set_rsc_table_on_start() to address the management of
  the cache table in a specific function, as done in
  rproc_reset_rsc_table_on_stop().
- rename rproc_set_rsc_table in rproc_set_rsc_table_on_attach()
- move rproc_reset_rsc_table_on_stop() to be close to the
  rproc_set_rsc_table_on_start() function

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 116 ++++++++++++++-------------
 1 file changed, 62 insertions(+), 54 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..42bca01f3bde 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1264,18 +1264,9 @@ void rproc_resource_cleanup(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_resource_cleanup);
 
-static int rproc_start(struct rproc *rproc, const struct firmware *fw)
+static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
 {
 	struct resource_table *loaded_table;
-	struct device *dev = &rproc->dev;
-	int ret;
-
-	/* load the ELF segments to memory */
-	ret = rproc_load_segments(rproc, fw);
-	if (ret) {
-		dev_err(dev, "Failed to load program segments: %d\n", ret);
-		return ret;
-	}
 
 	/*
 	 * The starting device has been given the rproc->cached_table as the
@@ -1291,6 +1282,64 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 		rproc->table_ptr = loaded_table;
 	}
 
+	return 0;
+}
+
+static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
+{
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If a cache table exists the remote processor was started by
+	 * the remoteproc core.  That cache table should be used for
+	 * the rest of the shutdown process.
+	 */
+	if (rproc->cached_table)
+		goto out;
+
+	/*
+	 * If we made it here the remote processor was started by another
+	 * entity and a cache table doesn't exist.  As such make a copy of
+	 * the resource table currently used by the remote processor and
+	 * use that for the rest of the shutdown process.  The memory
+	 * allocated here is free'd in rproc_shutdown().
+	 */
+	rproc->cached_table = kmemdup(rproc->table_ptr,
+				      rproc->table_sz, GFP_KERNEL);
+	if (!rproc->cached_table)
+		return -ENOMEM;
+
+	/*
+	 * Since the remote processor is being switched off the clean table
+	 * won't be needed.  Allocated in rproc_set_rsc_table_on_start().
+	 */
+	kfree(rproc->clean_table);
+
+out:
+	/*
+	 * Use a copy of the resource table for the remainder of the
+	 * shutdown process.
+	 */
+	rproc->table_ptr = rproc->cached_table;
+	return 0;
+}
+
+static int rproc_start(struct rproc *rproc, const struct firmware *fw)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	/* load the ELF segments to memory */
+	ret = rproc_load_segments(rproc, fw);
+	if (ret) {
+		dev_err(dev, "Failed to load program segments: %d\n", ret);
+		return ret;
+	}
+
+	rproc_set_rsc_table_on_start(rproc, fw);
+
 	ret = rproc_prepare_subdevices(rproc);
 	if (ret) {
 		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
@@ -1450,7 +1499,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int rproc_set_rsc_table(struct rproc *rproc)
+static int rproc_set_rsc_table_on_attach(struct rproc *rproc)
 {
 	struct resource_table *table_ptr;
 	struct device *dev = &rproc->dev;
@@ -1540,54 +1589,13 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
 
 	/*
 	 * The clean resource table is no longer needed.  Allocated in
-	 * rproc_set_rsc_table().
+	 * rproc_set_rsc_table_on_attach().
 	 */
 	kfree(rproc->clean_table);
 
 	return 0;
 }
 
-static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
-{
-	/* A resource table was never retrieved, nothing to do here */
-	if (!rproc->table_ptr)
-		return 0;
-
-	/*
-	 * If a cache table exists the remote processor was started by
-	 * the remoteproc core.  That cache table should be used for
-	 * the rest of the shutdown process.
-	 */
-	if (rproc->cached_table)
-		goto out;
-
-	/*
-	 * If we made it here the remote processor was started by another
-	 * entity and a cache table doesn't exist.  As such make a copy of
-	 * the resource table currently used by the remote processor and
-	 * use that for the rest of the shutdown process.  The memory
-	 * allocated here is free'd in rproc_shutdown().
-	 */
-	rproc->cached_table = kmemdup(rproc->table_ptr,
-				      rproc->table_sz, GFP_KERNEL);
-	if (!rproc->cached_table)
-		return -ENOMEM;
-
-	/*
-	 * Since the remote processor is being switched off the clean table
-	 * won't be needed.  Allocated in rproc_set_rsc_table().
-	 */
-	kfree(rproc->clean_table);
-
-out:
-	/*
-	 * Use a copy of the resource table for the remainder of the
-	 * shutdown process.
-	 */
-	rproc->table_ptr = rproc->cached_table;
-	return 0;
-}
-
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1614,7 +1622,7 @@ static int rproc_attach(struct rproc *rproc)
 		goto disable_iommu;
 	}
 
-	ret = rproc_set_rsc_table(rproc);
+	ret = rproc_set_rsc_table_on_attach(rproc);
 	if (ret) {
 		dev_err(dev, "can't load resource table: %d\n", ret);
 		goto unprepare_device;
-- 
2.25.1


