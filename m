Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC3135F745
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Apr 2021 17:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344661AbhDNPKb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 14 Apr 2021 11:10:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:39580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347136AbhDNPKa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Apr 2021 11:10:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F062B611C9;
        Wed, 14 Apr 2021 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618413009;
        bh=sCWfeG/B5zDoa7UhM/o1t0Wr0iIzXisuYLAx23pBc34=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gy4s4yBiBUPrcpjEwscexECFQJpTLAwN3nBPOiFctiLvF+jU/QCrv7bqaRoyRhkmw
         iMSmPuwyJul7juTLWioDjbzcpQADPz6VbMCqHYPrzvjPLqZSX4ivKPar1mKn61geSo
         jmXQLvsE7YqMHu7uB0w1c9D0ehNdvqShIOF/TjTTPtY3T+cvxGry7QGw9jMVqcwaq0
         fT0w2HqWX1QnesnHVALyMBW1cgyIf2uc9SoJAsIIoMzWSAPOFV5lJvv5HUmYmnj41U
         GwDO3bASdnklY5YoTlDYVC8uzQrgymIBKAWVCj41U3gWMuTkxgwlJozVLybFXSNFJz
         dIbQtwtGfGXHA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E688D60CD2;
        Wed, 14 Apr 2021 15:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] remoteproc: stm32: add support of detaching a remote
 processor
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161841300893.3600.15987548617054431266.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 15:10:08 +0000
References: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 31 Mar 2021 09:33:45 +0200 you wrote:
> Update from V3:
> add Reviewed by Rob Herring in patch 1/2 for bindings
> 
> This patchset is the stm32mp1 platform implementation of the detach operation
> added in series [1].
> 
> On detach, the stm32 rproc driver sends a mailbox signal to the remote
> processor to inform it that it will be detached.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach
    https://git.kernel.org/andersson/remoteproc/c/aca8f94e5b69
  - [v4,2/2] remoteproc: stm32: add capability to detach
    https://git.kernel.org/andersson/remoteproc/c/edf696f26855

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


