Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B804340683
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Mar 2021 14:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhCRNKZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 18 Mar 2021 09:10:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:58366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230476AbhCRNKQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 09:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8CC5E64E28;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616073016;
        bh=xOb4+5NrBwO5BJptcZ46wHZ5luRwx/SELLBLu5Bd9BY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kcFG777Mp+p7sWEKZOnjNjtMTDDF+y3gFYRCu59QFXqKS+nUZ5WKQilF5Og/Bwygb
         qByDfIcLxUlPuO/qxwVURj9Uu/qHkU38vVf7n0HPl6/xkGqdEE+ipcCMs92qMC9cBk
         LO3yREXsowYcfIM8BaYqFeZkiDfRa0mdMsOc/rnqV4Etyc35+zGUfdyRMurLS1xt5W
         QHkosNETexk0D4aEoqrWEWZACFaI/2h1M3+8/xmFl7pDe18HDvY4mNK99VLhejQ3MB
         jFuQZ5a97DGRYwJRYjWHPwjZRfsKLY9I4qPnsgCqWwRBbzLqbRrPrDQXBx36TZpDao
         gsd7iM5TzGQuA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7BD396097B;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: pru: Fix firmware loading crashes on K3 SoCs
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607301650.31848.2277738706245893769.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 13:10:16 +0000
References: <20210315205859.19590-1-s-anna@ti.com>
In-Reply-To: <20210315205859.19590-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 15 Mar 2021 15:58:59 -0500 you wrote:
> The K3 PRUs are 32-bit processors and in general have some limitations
> in using the standard ARMv8 memcpy function for loading firmware segments,
> so the driver already uses a custom memcpy implementation. This added
> logic however is limited to only IRAMs at the moment, but the loading
> into Data RAMs is not completely ok either and does generate a kernel
> crash for unaligned accesses.
> 
> [...]

Here is the summary with links:
  - remoteproc: pru: Fix firmware loading crashes on K3 SoCs
    https://git.kernel.org/andersson/remoteproc/c/9afeefcf06fc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


