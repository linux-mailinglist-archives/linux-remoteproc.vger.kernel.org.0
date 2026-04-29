Return-Path: <linux-remoteproc+bounces-7520-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EOQNTN28WkxhAEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7520-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 05:08:35 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86848E8EB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 05:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AF4830197DC
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 03:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C882536C0C8;
	Wed, 29 Apr 2026 03:08:29 +0000 (UTC)
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64188344DAE;
	Wed, 29 Apr 2026 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432109; cv=none; b=iI/Lm2EthqFUExJLQBmgGuzcp3fN2JCVX6B5gfg9miBD17o9E2NCqf5PStvolB8CUlGKjcfaGC5++SsISHM7ZiqtyAyvP6ZkJhQu9lQl6MULxre22gZzoxEZjntiGaBidLaSRG3b5MednigFcF9RVoRHw6ChSqmdv/Bzq6Sf950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432109; c=relaxed/simple;
	bh=lQoUiY+lt3bjHsPzg5VqObWgbpGt7W1tAnizhzeKrxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nwma29gwtlmyneAkZegAkylvguEBLHjPbKG7BiGpKtThXKUlTnQ9n5c0fixeoHHZvWFV5oXjckR9soxPdLNHQio6cpP5xj6Ca18RwzyiCXe4A1PiIEp2bWa1AV9Fv0wAz9tz34wwg5Od/L+ucXSsUogFsZIxqVulwenCOjT65RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DF53A201A26;
	Wed, 29 Apr 2026 05:08:26 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A721E201A1E;
	Wed, 29 Apr 2026 05:08:26 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 618B01800083;
	Wed, 29 Apr 2026 11:08:24 +0800 (+08)
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
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 5/5] remoteproc: imx: use device node name as processor name
Date: Wed, 29 Apr 2026 11:10:47 +0800
Message-Id: <20260429031047.30893-6-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 9D86848E8EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-7520-lists,linux-remoteproc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.261];
	FROM_NEQ_ENVFROM(0.00)[Jiafei.Pan@nxp.com,linux-remoteproc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

As currently there are maybe multiple remote processors, so change from
using fixed name to using device node name as remote processor name in
order to make them can be distinguished by through of name in sys
filesystem.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e8d239bef5c9..17026e390e88 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1357,7 +1357,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	int ret;
 
 	/* set some other name then imx */
-	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
+	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
 				 NULL, sizeof(*priv));
 	if (!rproc)
 		return -ENOMEM;
-- 
2.43.0


