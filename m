Return-Path: <linux-remoteproc+bounces-7785-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMUiJr91CWokbAQAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7785-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Sun, 17 May 2026 10:01:03 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3455FD60
	for <lists+linux-remoteproc@lfdr.de>; Sun, 17 May 2026 10:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 430D13005981
	for <lists+linux-remoteproc@lfdr.de>; Sun, 17 May 2026 08:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F278F3112BA;
	Sun, 17 May 2026 08:01:00 +0000 (UTC)
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153130C155
	for <linux-remoteproc@vger.kernel.org>; Sun, 17 May 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779004860; cv=none; b=NaWFtJe+fyYPHhZ+myiu83P+0YnIHfCYwIKsNUNARlQof21ZQnPID7+nk77uFECqRbAcUM80Dn3ljMquLxtajsrKac6jWZsDum4yzdCKfeZMrbNoWVySUb0BJdvZsxxc04AIU2PwSs2SC0ntuArdSx1Uq9fU0ESxDQMYfuDujBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779004860; c=relaxed/simple;
	bh=7xlmiF2cKn9+mTGPsHYhQtTJHz+rY9y3OXOe/uN+ZI4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=fAnYK1L43OC3AVRWA2CX6AluSXKv67h6JxJG+HRkCPcl87Zw0nVJJI1kjQoEF/lRpIYIBrG0RheQaHWXIdNTQokL2pqy10TiC9uiEIahwZ/7YqP4KsY+71Mwrqv0JFVqM5+x+pQJRE3/v7yOkxNwX0HKJMI/UeyZMPK9WNXEgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C28CD202C3E;
	Sun, 17 May 2026 10:00:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C7722008AE;
	Sun, 17 May 2026 10:00:49 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E13221800093;
	Sun, 17 May 2026 16:00:47 +0800 (+08)
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv2] remoteproc: imx_rproc: add missing DRAM range for i.MX93
Date: Sun, 17 May 2026 16:03:01 +0800
Message-Id: <20260517080301.24774-1-Zhiqiang.Hou@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: AAF3455FD60
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-7785-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[Zhiqiang.Hou@nxp.com,linux-remoteproc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
0xa0000000 of A55 mapping view.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V2:
 - Refined the patch subject.

 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..175c2d309979 100644
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
2.17.1


