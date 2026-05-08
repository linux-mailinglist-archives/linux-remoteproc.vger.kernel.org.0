Return-Path: <linux-remoteproc+bounces-7676-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN4rDh5Y/Wl7awAAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7676-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Fri, 08 May 2026 05:27:26 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0E4F12B8
	for <lists+linux-remoteproc@lfdr.de>; Fri, 08 May 2026 05:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2155F300F10A
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 May 2026 03:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C80308F15;
	Fri,  8 May 2026 03:27:15 +0000 (UTC)
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB7309EF2;
	Fri,  8 May 2026 03:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210833; cv=none; b=Zy5aNufIBiGULqm+aMyRCqwy1wzkdHfrONoD5PHyGRnN6wQ2t9z/A8hYVSVxeGhuqatdBFuihVjiNhcwofmREERGS28p255h8Sq7qpUM1VGforFzcIAB5oGP5l5hyTnQ+DM9FQa0oRsPUIfsqjlSVIcLZcjKR9BcBjkH3dc9xtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210833; c=relaxed/simple;
	bh=rq+kXuSyWYb57VR9Wun9wHncBZzkfhzoqnzHS4xSlx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=I97w2Z69yrqspgG4m+iPj2tbelFrsKgn6M/mg2Nzhbn14vPRthMZJLyvIjx6nG65Vk9IvqS7VZFXoHudQMzPRVIUBVEWnT4e0UMaG0x1+lsMQgNqdoXo0EUT3XVh5K2uZAkaCQK5JBk90rY+nh2QoWxn3MQLPfLhzaQBVnhvV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D23012012E3;
	Fri,  8 May 2026 05:17:52 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8810A203365;
	Fri,  8 May 2026 05:17:52 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 78A6A1800091;
	Fri,  8 May 2026 11:17:50 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: daniel.baluta@nxp.com
Cc: Frank.Li@nxp.com,
	Jiafei.Pan@nxp.com,
	andersson@kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	s.hauer@pengutronix.de
Subject: [PATCH v2] remoteproc: imx_rproc: Use device node name as processor name
Date: Fri,  8 May 2026 11:20:16 +0800
Message-Id: <20260508032016.27716-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: AEF0E4F12B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7676-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,gmail.com,lists.linux.dev,pengutronix.de,lists.infradead.org,vger.kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[Jiafei.Pan@nxp.com,linux-remoteproc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.861];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

As currently there are maybe multiple remote processors, so change from
using fixed name to using device node name as remote processor name in
order to make them can be distinguished by through of name in sys
filesystem.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Fixes sine v1:
* Update patch subject to aligin prefix name with existing patches

 drivers/remoteproc/imx_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e8d239bef5c9..38713f6f1c50 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	unsigned long cpus_bits;
 	int ret;
 
-	/* set some other name then imx */
-	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
+	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
 				 NULL, sizeof(*priv));
 	if (!rproc)
 		return -ENOMEM;
-- 
2.43.0


