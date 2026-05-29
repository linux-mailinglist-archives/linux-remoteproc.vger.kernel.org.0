Return-Path: <linux-remoteproc+bounces-7955-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGUGEgfIGWpXzAgAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7955-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 May 2026 19:08:23 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35B606241
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 May 2026 19:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B6AD33B7B68
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 May 2026 16:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981773F1659;
	Fri, 29 May 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VljFyF0c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lXf18RGd"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851A3ECBE5
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 May 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070482; cv=none; b=T1UUgDWtDZg5OpE+TASwmvE94wZs0v4qSgJkP5DTx/95AAdZwLXuxmhomVCj9yvSN68Fww8qvjhTzRTd8nHjT2QICnpwjzZjO0VYL78ePUolv8RuWufHwPzktaLg4IpH5a9loFBK5jMSRYAgNOVZmmR+mHviHL13nr3zAC2EHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070482; c=relaxed/simple;
	bh=SqCP3d+Yo3Bx8etFr9jdQSZX38IYK8rRnTlwveosbXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7st7X846lV+z38J0W3dRZQE6wc9r1py7MG8WxOdw/+mfaKYalzQZFyWRt7apZ8hX4FJrFtOSHPgox+O+6wD7zadWMiyDwrO3U61KAc89Xr1xGSvyDZbC+ADR8OeajQbZC47cV9eM8bpokL8XSVMqPe+8Z95ZWrbeLjHd4XDogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VljFyF0c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lXf18RGd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgbq601Vyxjzmop4iCKNkx+ZohBqivTKPAGyNBI2MX0=;
	b=VljFyF0cp5ti8DcWCTfH1OI3+fs6mUI0RX1cd8j+vwNIf1aRHnPgpDOifVzT7T5lAIqO6C
	c2JDEj4FzvtUPJ9CDcO/h6OWMSz1KEWxajhM6gLhnRD3cw5xUrErb73LHLNReb3rkpwgg4
	QLvfkWL4SDoPDp3T3M2QVs0CDZzTBS6FFgA4biKf+t9Jjdpv1V4wDpCFRQeXZAZnH2E28Z
	q1QlLTSGTcvbCo+/i3NM59T7Tm18dpDm3ABX51ewjmLE1FNirg3zmqM8WpRDwwmeumNsb6
	TU2eZ39qNVkwpgbpARd08r5zSwi7o285iFe2gEp9hIX3+3dYDvft/7DiwtJeeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgbq601Vyxjzmop4iCKNkx+ZohBqivTKPAGyNBI2MX0=;
	b=lXf18RGdD5cb4wZ8HXesHQ4wWvfZw+t1SYuZP0+14y5Iuut/T30Im81ailBovvU8nX9X2p
	MIhgfs+dkMM9SCDQ==
To: linux-rt-devel@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/5] mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
Date: Fri, 29 May 2026 18:01:03 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-1-b8ffc36e11e5@linutronix.de>
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7955-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,gmail.com,nxp.com,linaro.org,pengutronix.de,goodmis.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-remoteproc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: BA35B606241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
a threaded handler (imx_mu_isr_th()). The primary handler unmasks the
interrupt so the threaded handler can run without raising the interrupt
again. The threaded handler can invoke the actuall callback in
preemtible context.

As a first step, prepare the logic and move TX handling part.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 246a9a9e39520..2809965677bd7 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -80,6 +80,7 @@ struct imx_mu_con_priv {
 	enum imx_mu_chan_type	type;
 	struct mbox_chan	*chan;
 	struct work_struct 	txdb_work;
+	unsigned int		pending;
 };
=20
 struct imx_mu_priv {
@@ -508,11 +509,34 @@ static void imx_mu_txdb_work(struct work_struct *t)
 	mbox_chan_txdone(cp->chan, 0);
 }
=20
+static irqreturn_t imx_mu_isr_th(int irq, void *p)
+{
+	struct mbox_chan *chan =3D p;
+	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
+	struct imx_mu_con_priv *cp =3D chan->con_priv;
+
+	if (!cp->pending)
+		return IRQ_NONE;
+
+	switch (cp->type) {
+	case IMX_MU_TYPE_TX:
+		cp->pending =3D 0;
+		mbox_chan_txdone(chan, 0);
+		return IRQ_HANDLED;
+
+	default:
+		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
+				     cp->type);
+		return IRQ_NONE;
+	}
+}
+
 static irqreturn_t imx_mu_isr(int irq, void *p)
 {
 	struct mbox_chan *chan =3D p;
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
+	irqreturn_t ret =3D IRQ_HANDLED;
 	u32 val, ctrl;
=20
 	switch (cp->type) {
@@ -548,7 +572,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if ((val =3D=3D IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
 	    (cp->type =3D=3D IMX_MU_TYPE_TX)) {
 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
-		mbox_chan_txdone(chan, 0);
+		cp->pending =3D 1;
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
 		priv->dcfg->rx(priv, cp);
@@ -563,7 +588,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if (priv->suspend)
 		pm_system_wakeup();
=20
-	return IRQ_HANDLED;
+	return ret;
 }
=20
 static int imx_mu_send_data(struct mbox_chan *chan, void *data)
@@ -598,7 +623,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
 	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
 		irq_flag |=3D IRQF_SHARED;
=20
-	ret =3D request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_de=
sc, chan);
+	ret =3D request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_isr_=
th,
+				   irq_flag, cp->irq_desc, chan);
 	if (ret) {
 		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq[cp->type]);
 		return ret;

--=20
2.53.0


