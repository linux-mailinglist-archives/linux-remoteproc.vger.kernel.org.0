Return-Path: <linux-remoteproc+bounces-6447-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAISHzThkGlmdgEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6447-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Feb 2026 21:55:16 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E500813D340
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Feb 2026 21:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02700304F233
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Feb 2026 20:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBBF3101A5;
	Sat, 14 Feb 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQs5SSpt"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02A30F54B;
	Sat, 14 Feb 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771102447; cv=none; b=rTacJkcNzN6nCmYWEFk+KcUy0kWPG35dPdcQ909dsj25VE6ZrShnry8St2P0XDBSZZE6sM3Yazjf1EV4EUKp8tBB2jtaWmtU+uf+Xir/jR39qUAb3O9npx9UcpWdHIy0TV0KLtQNDtjeLTDEdYq3KrtOPWtVHaDhZfwm1mJio14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771102447; c=relaxed/simple;
	bh=q7lalhiOkm2Fa7vWVNeFx7LLdiOlBIuepdegr0NxvjA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WUggd8DABlNJ2KgvCTur1QWkTYzeK2JBYx1D5xv830ZlxgKBqn/OKwJihqIW9Bg0H8QWB6LXbVbLbWuiCCWd0pIrO+qMDrnJ2vX1khJmDHEgDx7BG/G9V58NOPXLbmW0GavhFSr8nb+ppWIQd3otRxI3E4GruLmWqF84uPJ9jc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQs5SSpt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B2AC19425;
	Sat, 14 Feb 2026 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771102447;
	bh=q7lalhiOkm2Fa7vWVNeFx7LLdiOlBIuepdegr0NxvjA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DQs5SSptoH/vKwGbakm9ZiaSY1JgxN4Lo7I8xbbBdWBoa3ouHXzdVM5w1pjFnSuHf
	 1bEn4PdjrzocbIIy/uG7YJCG6tUOjeWBYKNquE4mUtTgJ5sHP/QgpCEVmAB/tnBvoe
	 3LpDuNK1knrC+it4Q6fr2aS9vCyp/0/NEO4lc1tWjszK4Vjb64LcxZ7CrwB90A5L1b
	 PhdcBUNinR6Yu8fw8y18AsQphcbdpk3jlV60zbFUAKbpKzhVo7IgalK46nVxg89pq9
	 98m6Tn5PUJLUcbiFbVk0cq3t4nuN6UdA2MqfsV5KBCocIZUZDgrJ5W1HgW2CC0F7K5
	 qqVoIhP5bHxOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B0CF393091E;
	Sat, 14 Feb 2026 20:54:02 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260214183116.3718674-1-andersson@kernel.org>
References: <20260214183116.3718674-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260214183116.3718674-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.0
X-PR-Tracked-Commit-Id: 42023d4b6d2661a40ee2dcf7e1a3528a35c638ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 986d555afd50452909b2fb52c00554419832eac2
Message-Id: <177110244064.2897141.6653972853564835602.pr-tracker-bot@kernel.org>
Date: Sat, 14 Feb 2026 20:54:00 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Gui-Dong Han <hanguidong02@gmail.com>, Patrick Oppenlander <patrick.oppenlander@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6447-lists,linux-remoteproc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-remoteproc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E500813D340
X-Rspamd-Action: no action

The pull request you sent on Sat, 14 Feb 2026 12:31:16 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/986d555afd50452909b2fb52c00554419832eac2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

