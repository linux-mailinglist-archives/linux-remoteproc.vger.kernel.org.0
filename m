Return-Path: <linux-remoteproc+bounces-7519-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFaOg938WkxhAEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7519-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 05:12:15 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353748E9A4
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 05:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A67030F3EC0
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 03:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCB3371898;
	Wed, 29 Apr 2026 03:08:23 +0000 (UTC)
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79143337BAC;
	Wed, 29 Apr 2026 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432103; cv=none; b=kPhTJFmmSlNI5XkZ3jFfGnCx2S+oqK6Pivg1ISfkgrVQIfDGBUeMG7nX1y0RVmj731ZAp3ZQAGGQdR7x7E/eMlGsXXpNV9RlKEIQHCkLaKDtT7f+9Ym/nRayLP6WxTI/K8Wc1hCkeONDDy7AaXxjMvwF+yQsA076IZU+/Lfx2tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432103; c=relaxed/simple;
	bh=pm8owCSvi5laK7dQAogzpytS3J+UVBzTzFwDIhOLVBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AmKzDwoiG2fSpxOw01TJ4xm1fkvJIQsJhZWn5o+4aHrTfpSs3OFA8rnMWEPiFQdCMIWL3sN9gN7/TQz5TYUE1H4NZdZDwgPl7+rtai+36hBXlRkAGnZ+I9WRLl4e5BhkPvvZARSxmc7H+Z7+beAQ8Jmn4MqHi8ajQbQWJfQeY40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E0BD1A1EE6;
	Wed, 29 Apr 2026 05:08:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA9C11A391E;
	Wed, 29 Apr 2026 05:08:20 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 059A0180026F;
	Wed, 29 Apr 2026 11:08:18 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/5] drivers: remoteproc: imx: add autoboot support for A-core remoteproc
Date: Wed, 29 Apr 2026 11:10:45 +0800
Message-Id: <20260429031047.30893-4-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 7353748E9A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7519-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[Jiafei.Pan@nxp.com,linux-remoteproc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.330];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Add autoboot support for Cortex-A Core remoteproc.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8a3de27c96b7..e8d239bef5c9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1286,7 +1286,24 @@ static int imx_rproc_sm_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_psci_detect_mode(struct rproc *rproc)
 {
-	rproc->state = RPROC_OFFLINE;
+	struct imx_rproc *priv = rproc->priv;
+	unsigned int cpu;
+	int cpu_aff;
+
+	rproc->state = RPROC_DETACHED;
+	for_each_cpu(cpu, &priv->cpus) {
+		cpu_aff = psci_ops.affinity_info(cpu_logical_map(cpu), 0);
+		if (cpu_aff == PSCI_0_2_AFFINITY_LEVEL_OFF) {
+			rproc->state = RPROC_OFFLINE;
+			break;
+		}
+
+		/* in psci on state but running Linux */
+		if (cpu_online(cpu)) {
+			rproc->state = RPROC_OFFLINE;
+			break;
+		}
+	}
 
 	return 0;
 }
@@ -1391,7 +1408,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		bitmap_copy(cpumask_bits(&priv->cpus), &cpus_bits,
 				min((unsigned int)nr_cpumask_bits,
 				    (unsigned int)sizeof(unsigned long)));
-		rproc->auto_boot = false;
 	}
 
 	ret = imx_rproc_detect_mode(priv);
-- 
2.43.0


