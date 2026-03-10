Return-Path: <linux-remoteproc+bounces-6806-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CFSMBvPr2kfcgIAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6806-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2026 08:58:19 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C9B246C88
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2026 08:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5960F313C737
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2026 07:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6588E3B895D;
	Tue, 10 Mar 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ScLpMk9Q"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1213366062
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129372; cv=none; b=o3I/A52Uah74Z29YMMIWMbmqNg9MIGfBGLpr5lq8kXWBS6GnqSJ2BGPqKga1LFhfEbV4buTD0jTKyQRxCEV26E7AeacExidolGZfoAaBwttxN8mVa2Vn+MfPEfA/iOMfLDpnCY2adsi6DpR5HUB7ABfGIRsG+h1LBh1GkRKqUPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129372; c=relaxed/simple;
	bh=nX/JNUQsoIsZPgc0eQr9bDwyuSjW/BHNg7TEpnt7i0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj96J4hAa4H/M2oWXkuyprmiQGVCePXLKEJ6joSgvwFuqj866esq1oBwHTvFLkQ+54hylUVMghE4rZambeAOct6a/lIXlYxIP094pAG96pNwc99F9PGr4/0o29H6Xl9P+8p8h6qG7xztaqiSEmPHwsz3ewF7EeOQkDW1Y0btGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ScLpMk9Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=m6b17guF4mqY7MErq38twR8NUyAOvnb/eht594gA9L4=; b=ScLpMk
	9Q7n5ID/L/JRa1+hzrXUvaaiGAaQO9dgi/mIlkNt63SflDot19QzhM55nZpIaRJR
	Xxw7dLSTBOZhfKOJ4qEeR9xcbrHqX5HjPnzWUf0zYhJScyInYTcjtv0jaKTHhjaY
	JPgzeFOYEUUOxwOcQ6iLST/GT1aBOn1C9JZRNbH290yXXNxUl3sgAwSKdfkCIwjL
	dnz6ZhMKBGCHsHBSCC+J37mt8FlMUlmwQEw7/ZQ24IaU7m2SAEmiR2pCwBv+NX+y
	iCDZlHn1pBz91MmQieqNPwFvWpCYw5ncZyfjURlGtBVyelScfpXy/PfSZpoRq6k5
	NivpAtH8tcMGyFOQ==
Received: (qmail 3112659 invoked from network); 10 Mar 2026 08:55:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:52 +0100
X-UD-Smtp-Session: l3s3148p1@CQky2aZMwJAujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 05/15] hwspinlock: omap: use new callback to initialize hwspinlock priv
Date: Tue, 10 Mar 2026 08:55:20 +0100
Message-ID: <20260310075539.11701-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 20C9B246C88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6806-lists,linux-remoteproc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-remoteproc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/omap_hwspinlock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index adff502bcbc4..868b93131796 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -66,10 +66,16 @@ static void omap_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *omap_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops omap_hwspinlock_ops = {
 	.trylock = omap_hwspinlock_trylock,
 	.unlock = omap_hwspinlock_unlock,
 	.relax = omap_hwspinlock_relax,
+	.init_priv = omap_hwspinlock_init_priv,
 };
 
 static int omap_hwspinlock_probe(struct platform_device *pdev)
@@ -116,11 +122,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	for (i = 0; i < num_locks; i++)
-		bank->lock[i].priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
-
 	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-						base_id, num_locks, NULL);
+					 base_id, num_locks, io_base + LOCK_BASE_OFFSET);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
-- 
2.47.3


