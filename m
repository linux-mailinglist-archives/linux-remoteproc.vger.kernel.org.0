Return-Path: <linux-remoteproc+bounces-6278-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBKhICP+d2lMnAEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6278-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Jan 2026 00:52:03 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67E8E543
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Jan 2026 00:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49011300443A
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Jan 2026 23:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B086D30FF31;
	Mon, 26 Jan 2026 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="abse7cgw"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D342E54DE
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jan 2026 23:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471517; cv=none; b=e2awVSTu7avs0oucpkY1JAjEENLBCjhLo3pYZgcl31EKEigf3TvEJ5hKg7k56xOJu6vwN+oPivmzIi+MFIiuYBl2hosfiFs0qfpyMWXAZ3kKIY0HJFLSfpTe3sjZQOHsU0pvASdLpi0Xlg1LY8pRF73TUS1Jx65DH2fJpLCAWV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471517; c=relaxed/simple;
	bh=8zZa6ZARHitoc1+bqtC7FMQcSiyFXquJwLixosWd9Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nG5+boUnJPPmCZX3z6Q4HoxIlTyh/bNYx5A0T3JGE7wJBzTmcQwgb8LCrxqSH/64gIOhSI+98SKEQ1tIU9CCpYe0TlE0daOZVptN03j3BCxPuTwuCZekzcLRCAyHz02ArLoPHge3JCP0UbacCAvuPJIUBNjmocWoC31GaeRKe08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=abse7cgw; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1769471503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1fSxClOL3mdUPnELbN+FOWuFk/bMEyjiygh5WUO5XDM=;
	b=abse7cgwIajY6KJRGkVaOlTNVov8kk7mAXnR+J8aEC2yDclW/fRPFL4+8yyZrOW8WOL8up
	ivBVw13apkDghuh2lFy86PEpyHxPh2sHOjaER8BdlrFKJn7ZE/GS5MDgP3mV6eSmooQEfk
	PGYHq3ZrzO/Z2+JNyDIei0dSzPOTH/+TlGUaqbNiAz0WFMpy40adUOFvXoyxZBP9NVVsZc
	Hu05SpwEW3H2epfH3fafVA7vli1uoDG12qIx29pquGdK8nw1gie+lxZy6jYo9Dy1vZFQ2p
	JKV6nXtzLHWRcFAfbPa45TpXaVhBOVnI41AWhxUfLxuiJkVL+BGmzeZkyL0eOg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: Val Packett <val@packett.cool>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
Date: Mon, 26 Jan 2026 20:44:02 -0300
Message-ID: <20260126235018.969140-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6278-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,google.com,lucaweiss.eu];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[packett.cool:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-remoteproc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-remoteproc,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:email,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: AB67E8E543
X-Rspamd-Action: no action

The changes introduced to handle single power domain platforms have
swapped the info pointer increment from num_pd_vregs to num_pds, which
doesn't change anything for pronto-v1 and v2 where they match, but as
pronto-v3 has 2 power domains with no PD regulators at all, this would
shift the pointer past the end of the array.

This showed up as a difference between GCC- and LLVM-compiled kernels
on MSM8953/SDM632 devices, where only with LLVM one would get the
"regulator request with no identifier" error, because the out-of-bounds
memory ended up being zeroed. Fix by reverting that single line.

Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only single power domain")
Signed-off-by: Val Packett <val@packett.cool>
---

I'm like 99% sure that this (old) line is correct and the change in this one line
in 65991ea8a6d1 might've been an unintentional/stray one.

Still, please retest on MSM8974/MSM8226!

Thanks,
~val
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index ee18bf2e8054..5884c5a52af6 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -454,7 +454,7 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
 	 * reserve extra space to manage them through the regulator interface.
 	 */
 	if (wcnss->num_pds) {
-		info += wcnss->num_pds;
+		info += num_pd_vregs;
 		/* Handle single power domain case */
 		if (wcnss->num_pds < num_pd_vregs)
 			num_vregs += num_pd_vregs - wcnss->num_pds;
-- 
2.51.2


