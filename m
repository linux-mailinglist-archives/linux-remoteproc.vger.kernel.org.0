Return-Path: <linux-remoteproc+bounces-7380-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF/THsil4mlV8gAAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7380-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2026 23:27:36 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D338841EB3E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2026 23:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5898F30BFDB8
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2026 21:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFDE36F420;
	Fri, 17 Apr 2026 21:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtVjAxAD"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42B36EABE;
	Fri, 17 Apr 2026 21:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461076; cv=none; b=m+7m/835Ns77E/FJHgcZMVsnmM+b0DXBO/8k/0eHO8JNcRFa6WBsXcR4KT41qfM563vRAGOHx2HJbBdKIZN5zh2PvJZKXsGGgGFdrHD7HXkHUQY3ZvVZmRXn2tadcEXInMW6RrPXPocU/GykYYz/bU4eJd+i9h/WUIofLnIuias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461076; c=relaxed/simple;
	bh=aJLB7nJ5RAOxP165po1Myju+sDKn4IP75+subiN1aeg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fAyyaEri3B+6VQD3FwrcHY04SR9tPih0zJVQSm/nmmlZGSV/mhvPZR7tmMGvUHCNynTM9rMUcy6O6Mrr1gjZk6xgdg+X+P/MKBlwp8CCZoj5pd99afSyaB52vedpcqENDosZCYg3GcuKvPaU1P4HOnsMRBqFNzYZiHEFz02Z3UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtVjAxAD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B41C19425;
	Fri, 17 Apr 2026 21:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776461075;
	bh=aJLB7nJ5RAOxP165po1Myju+sDKn4IP75+subiN1aeg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LtVjAxADdVrjTlZb7gioSOmyKXkKRAyxzqBow7ukqjh0GcW5r3IK/vtuzlLR3lskq
	 I4hrOLq9IJqBL2YvI0QliPAHEX/SuK6SKdzfuuVBkCB5GvqoY0BaUMEI6worczYhMk
	 6NiYPnbTZmlWgzmIAxT4zacaVtO3V9WOGOnxPiy+D09wsjBLnh5gNz8+T1xCaL1wHa
	 xa9xyrjuixXX9qgqO9pkBlRxnsKXc1zF+8xQQkvRj/sR8hGvSMF18yfSpSn5ZmB7D+
	 5c0Beauu2q34h3OgJymCyFqw3gSecN7zGtsQGsZyXW3jKv3AbcfA0P6Y/bhXAGlEUo
	 Q9k8vVCLpWrpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD2B380CEE7;
	Fri, 17 Apr 2026 21:24:04 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260417200156.2581631-1-andersson@kernel.org>
References: <20260417200156.2581631-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260417200156.2581631-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.1
X-PR-Tracked-Commit-Id: 3e2fa997d1e2b651993ae7e81646aadd55470bce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d2d10e1f558be304d747056c01dad2218ddc534
Message-Id: <177646104307.161623.17308386326203592473.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 21:24:03 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jori Koolstra <jkoolstra@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,oss.qualcomm.com,xs4all.nl];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7380-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D338841EB3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Fri, 17 Apr 2026 15:01:56 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d2d10e1f558be304d747056c01dad2218ddc534

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

