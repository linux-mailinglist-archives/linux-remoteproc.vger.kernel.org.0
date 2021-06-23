Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF2E3B22BC
	for <lists+linux-remoteproc@lfdr.de>; Wed, 23 Jun 2021 23:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFWVwY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 23 Jun 2021 17:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhFWVwX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 17:52:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9CEF061185;
        Wed, 23 Jun 2021 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624485005;
        bh=IEFLIt0CZL2VTZmJ129Br9PR6Q1XRRzCWrrad/T5m6A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=U++oY2S/s22oINjTch2dSnRxQACbs9S3L9ykKqA6AyMikAIl0s2ron25P3YtwQp68
         NTvU8upliAB4/SEl0uhwJQUfYJ86Q17huP25seRwp1wEHBu5GBrmLacLGHEZik+zSE
         UVP9Bq+M0Zngi/8ew0IisjKHmaLqIXe40pi1uaXNodopdlrv2NoymMva3reNUcGglD
         RYlPUd4Fsxd/XN46KU2D+6rd8CkuCsUEG23r0Dh3rhdCH1G+xXPbF/qfoBtJzk+gG5
         AGtRMOgNE1n0fIXTNnB96PXXIDVBvpKdERwnfl5eZt5PUtBiPI0rJ5rk6/b9k/vhvc
         jwOwq+Vfk6Lvg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 901A460A2F;
        Wed, 23 Jun 2021 21:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: stm32: fix mbox_send_message call
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162448500558.18278.2355898451447696936.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Jun 2021 21:50:05 +0000
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 20 Apr 2021 11:19:22 +0200 you wrote:
> mbox_send_message is called by passing a local dummy message or
> a function parameter. As the message is queued, it is dereferenced.
> This works because the message field is not used by the stm32 ipcc
> driver, but it is not clean.
> 
> Fix by passing a constant string in all cases.
> 
> [...]

Here is the summary with links:
  - remoteproc: stm32: fix mbox_send_message call
    https://git.kernel.org/andersson/remoteproc/c/51c4b4e21226

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


