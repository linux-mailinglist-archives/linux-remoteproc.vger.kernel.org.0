Return-Path: <linux-remoteproc+bounces-7087-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHrmHqzYu2k6pAIAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7087-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2026 12:06:20 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC62CA065
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2026 12:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C710D32592C8
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2026 11:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1070D3C8722;
	Thu, 19 Mar 2026 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i3a2eKDx"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6E3C9EFD
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918031; cv=none; b=B0rznWzDE6iG21aWEPttKP0RPDISSpdwSurHZB2GGR9U3qtPpONZeSBETnUB5fWJRu+gE3DBozqPHLxYzAaz743A4GZi2tK/8aAZfalFScLYWOOwxO0/N2H6NK8f9RJXTdUK7kr3ERmRprkLaCprEPJdK+98VbrzyOKx4jzOcFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918031; c=relaxed/simple;
	bh=KzyLEUFyySml/W/QoWMCTJFa5ir/a4hjtyApO1sVLuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMSVKLsYsfWcwMb3ONMMTq77bX5yc8u/2XNL0qrxubHQPIs4kjC4sgU4qch99wc6LB0dnBKtkf2jYIf4CN6uDq5WYpdeg9+ZYpBKEooHLRjuloAB5CNBCOyyN8DX/b5+bVv7s1Brw9por8uPXkcao3j2XN0Qfc3QHOW5licXwEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i3a2eKDx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zJPnV6sWCqcikZmuYtUvxsV1HgXNWyKzDo8+0458in4=; b=i3a2eK
	DxSBMURYHxV4OXoM+UKykTDNhOCzRHayQxgVcIUd+QIen0ieRn56eQCrHfQvUD4R
	uKZN/6u1fTHyr9YMdeKvdk/VWP4tz4AwGIVh4ZSuVDKTzGIy6zZy2W4jcYfNWH2Q
	4BDHHl5PW96xUcmGZq6EdSohg46AJr+0HpY6PC8wGT3z1PLjF/yMaSIRFLCPgmyE
	C5jJw/5W5DEdIfrxFYvlGpqYWbdqDA/GwcvC/Fco3N4voWMu3ZzML0Rr/JlCYHNn
	WqYuE1gq6Z6BLTBY9g3nXbniafKoA7lhbRGUVXV1KWffXQuzsuvsrH0iA6jmp3ba
	nvywWZbfAF3MKLPg==
Received: (qmail 1099602 invoked from network); 19 Mar 2026 11:59:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:59 +0100
X-UD-Smtp-Session: l3s3148p1@PFs7eF5NbJsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 08/15] hwspinlock: stm32: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:30 +0100
Message-ID: <20260319105947.6237-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7087-lists,linux-remoteproc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-remoteproc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-remoteproc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6EC62CA065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 51e8e533ac31..62214f31f909 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -48,10 +48,16 @@ static void stm32_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *stm32_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + local_id * sizeof(u32);
+}
+
 static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.trylock	= stm32_hwspinlock_trylock,
 	.unlock		= stm32_hwspinlock_unlock,
 	.relax		= stm32_hwspinlock_relax,
+	.init_priv	= stm32_hwspinlock_init_priv,
 };
 
 static void stm32_hwspinlock_disable_clk(void *data)
@@ -73,7 +79,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	int i, ret;
+	int ret;
 
 	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
@@ -106,11 +112,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
-
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS, NULL);
+					0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
-- 
2.51.0


