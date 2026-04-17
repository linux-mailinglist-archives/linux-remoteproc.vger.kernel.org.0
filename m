Return-Path: <linux-remoteproc+bounces-7381-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHx8Hy+l4mlV8gAAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7381-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2026 23:25:03 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46441EAF6
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2026 23:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D1E430011BB
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2026 21:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4DA36E483;
	Fri, 17 Apr 2026 21:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2ElBoFJ"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF5C36CE19;
	Fri, 17 Apr 2026 21:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461078; cv=none; b=bh0ET0KW2o1C07/o+VNFYct8KyMit6LTk43Z0uhouPctu4JHZa9qY2pxHlwbZ5hbshD8HZabBT3Vkl0HLbDBrVUVzdKgZkoBmDWYYjmN6icGPVc3OuQDz19j2c/xLMN1vszrg++nD/xzXitdvc3YjCw5QhRBNLMxc5xDgBD1kIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461078; c=relaxed/simple;
	bh=v5UWmhLTO/CyjN4Dfoi5/cVIRnajh4NrDu6xvimtb3Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M754uyVU6HbgDYMItgmt+3tsbUKltUSq7kUXGCKbTOoBTtvpg+t/P1JUQlPuqEJ9G3aNfrNTpVIm00FgHljisRNCKwR/P7eCnZlGy2I5ADRi4ZUJXK+VcpgqJRCAP5mFKFoYMycU6+5CeUFDQwxiiQUp7TlkUh25J4MLVHfUVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2ElBoFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50A4C19425;
	Fri, 17 Apr 2026 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776461077;
	bh=v5UWmhLTO/CyjN4Dfoi5/cVIRnajh4NrDu6xvimtb3Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=E2ElBoFJZ0rZYm7sMAEFBFmdb4b7H3R7NvYHgNWPivTLnMXuaWzHgGZQeNqresiCp
	 NJUbY92N+YaSfkXkfO8U98EThH3gKTCbmK0hgPYz8fN/eAPZ9HJwVdQ2PAkA8iS839
	 fu/BuQSxIt+b8c48llGYFab7X/A9ina31+GNJdy50k6nt7YDLnxw71rIeV7yW1g/ox
	 n1Pxh1bIKC8i+jSCtjDTw60XW+Yg6joyg2PmLZwp6IFafI291APOKTmORGwmksEnCf
	 T23BFjA3evL1cojFDouPQRcmR26RaSQ36s//nFcRQMuySA2zFbVPZb81edAfCgn5wF
	 ezhYqghFbHNyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDBE380CEE7;
	Fri, 17 Apr 2026 21:24:06 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260417200322.2582396-1-andersson@kernel.org>
References: <20260417200322.2582396-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260417200322.2582396-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.1
X-PR-Tracked-Commit-Id: ad5fd5aeb65a4426635cf55ef06c96e60a66e648
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba314ed1bff907321ab4091a4e46c4d9f24b5e39
Message-Id: <177646104507.161623.6149008403560575102.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 21:24:05 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7381-lists,linux-remoteproc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA46441EAF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Fri, 17 Apr 2026 15:03:22 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba314ed1bff907321ab4091a4e46c4d9f24b5e39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

