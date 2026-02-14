Return-Path: <linux-remoteproc+bounces-6446-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHbGHvPgkGlmdgEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6446-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Feb 2026 21:54:11 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BC13D31B
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Feb 2026 21:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E0563004C9D
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Feb 2026 20:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169CB308F23;
	Sat, 14 Feb 2026 20:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rv7a9CVA"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544E3054E4;
	Sat, 14 Feb 2026 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771102446; cv=none; b=JAIvAOLVbsaoHyTEyC3cozhPySQxZqCBacml4alIKiTLNvZtrByjcH0QwTyxqTAmwEzO9GXLG+1e1pmY8EffWdNrw1g/SeBzUCQxttgrgHpX1Vdod7smg5sIhuqAAqarPUsojug9olTmQV7T3TP+JIl9SRZWIDW1yd9c7RbCBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771102446; c=relaxed/simple;
	bh=du/ECaXRjLiCX99ZD5IxrIWhvbAyKQeqZAFsjueINZk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SgDKTA3M+9LQ3OeJxIudJfspsz5w99sveIHkC8zd8FH+8CoQwiCF9w+LRCXR1GarFMuG3A+SFj1cj1a5K0jagFZzsArVu74rceTWl/S3lVHk7GJFs5DB7aq6MPehwqbRKwvfCRY2SP6WgjOHQlJlY7R3tDr27XTf1ssHbl1gPAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rv7a9CVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48D7C16AAE;
	Sat, 14 Feb 2026 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771102445;
	bh=du/ECaXRjLiCX99ZD5IxrIWhvbAyKQeqZAFsjueINZk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rv7a9CVA69WDFyXLoJyclQX0nyBWan5ygInpcvvSeUhHgWY26BcOqHYogjTVV/OX5
	 2CTxlnaIImwlz5AdmhNeOSyw+QmmAusrJOgtGvIhNZH4qZlZdWF03KNSgJ50Uq3eSv
	 YDLoFg0RHFHO4ZZmQDkItrFslTvOcHGQF/CLage2QMYZXdYto/i2sfjbMlK1LkEyVO
	 TSovjCxrTkZytNvFi0/pJM29JZUoRLW2fWNcSB/hQc4rd1TogjCPbDZ7/Uh/ySeLAI
	 Cp0KYctfEIG/+RSxq862QEgh+XPhX7d1R2XMt8cwLYslPK8z04I6A2wgZkxBtnOho+
	 Jf68akFVSo3Og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 482BC393091E;
	Sat, 14 Feb 2026 20:54:00 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260214182744.3718339-1-andersson@kernel.org>
References: <20260214182744.3718339-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260214182744.3718339-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.0
X-PR-Tracked-Commit-Id: 26aa5295010ffaebcf8f1991c53fa7cf2ee1b20d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bfc50c6e6e67b08770c6ef46660c3ee9c6a1519
Message-Id: <177110243875.2897141.10381640218056935676.pr-tracker-bot@kernel.org>
Date: Sat, 14 Feb 2026 20:53:58 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Beleswar Padhi <b-padhi@ti.com>, Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Soham Metha <sohammetha01@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,oss.qualcomm.com,nxp.com,ti.com,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-6446-lists,linux-remoteproc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C2BC13D31B
X-Rspamd-Action: no action

The pull request you sent on Sat, 14 Feb 2026 12:27:44 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bfc50c6e6e67b08770c6ef46660c3ee9c6a1519

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

