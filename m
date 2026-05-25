Return-Path: <linux-remoteproc+bounces-7913-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD8sOMHpE2qoHQcAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7913-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 May 2026 08:18:41 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA15C6473
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 May 2026 08:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 632573002321
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 May 2026 06:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D6F3542CF;
	Mon, 25 May 2026 06:18:39 +0000 (UTC)
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9138F232
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 06:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779689919; cv=none; b=KCnF4HOl48Q4werNpXYyIaTYlcMC2R5BS2S0TUEWoLyyORRSt5aqNzN3v79hV6HA2GzzNhj8zVyMld31Y7qz2uybX21jiQtZtnT7YGiiTQl/7achILxaAW7pYb3fOkhw+QDhxiTB9f3/gn5ETPTODXNmPH7S5Ftt/QU3GrDC8QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779689919; c=relaxed/simple;
	bh=EGVnheqbiCCyNwjQGZTN5f4f29ScgXd7Hft7KXSnBHI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=n+kpLDS7C4bb9nwFiz9VRZKCUMZqVWDjGzGAPsFi1VYDnbYbqEMf3hKxAx8rqKbzebsgL63PPo1tZV0dS3QzdSfR9qdpFuuIiNP23PFByKNTg1sKkwjmulOQg+Oyw2r3Hl9tWXOYFTjGzWNqN5Z/UoM2b6agNDuNIS16WJ6Zvvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D894A202D2A;
	Mon, 25 May 2026 08:18:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A0879202D1C;
	Mon, 25 May 2026 08:18:30 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B1F5F1800071;
	Mon, 25 May 2026 14:18:28 +0800 (+08)
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for i.MX93
Date: Mon, 25 May 2026 14:20:31 +0800
Message-Id: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7913-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[Zhiqiang.Hou@nxp.com,linux-remoteproc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 8FDA15C6473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None Secure)
and 0xB0000000-0xBFFFFFFF(Secure) are both mapped to
0xA0000000-0xAFFFFFFF in the A55 address space.

These ranges are currently missing from the i.MX93 remoteproc
address translation table, which may lead to invalid address
translation for firmware accessing these regions.

Add the missing mappings to complete the DRAM coverage.

Fixes: 9222fabf0e39d ("remoteproc: imx_rproc: Support i.MX93")
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - Added more info in the changelog.

 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244aca..175c2d3099794 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	{ 0x80000000, 0x80000000, 0x10000000, 0 },
 	{ 0x90000000, 0x80000000, 0x10000000, 0 },
 
+	{ 0xA0000000, 0xA0000000, 0x10000000, 0 },
+	{ 0xB0000000, 0xA0000000, 0x10000000, 0 },
+
 	{ 0xC0000000, 0xC0000000, 0x10000000, 0 },
 	{ 0xD0000000, 0xC0000000, 0x10000000, 0 },
 };
-- 
2.43.0


