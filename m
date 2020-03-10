Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5451180BC0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 23:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgCJWkD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 18:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:32798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgCJWkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 18:40:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583880003;
        bh=vuW2fj6XXTSeop/fwJ+EDlIwGKCU4N/J9AMGm17WhQw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SMij0dp7++XH8jBKY/Q5qEq0pBu2e3N+nQusAIBC+NhMf9ePZG4jRc2QyUT1n2SP1
         he47M+6z5ssyF7ffp7Z9TA9GystpkOTKHe9vsdZo3OiKVzMIkTV83gM2GKuAL/6sfL
         gJ1yBscFQwZ4/MYvUrlxh3d3cbZudczLNISDAawU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: Use size_t type for len in scp_da_to_va
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158388000298.13341.4779270989480251438.git-patchwork-notify@kernel.org>
Date:   Tue, 10 Mar 2020 22:40:02 +0000
References: <20200310211514.32288-1-natechancellor@gmail.com>
In-Reply-To: <20200310211514.32288-1-natechancellor@gmail.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 10 Mar 2020 14:15:14 -0700 you wrote:
> Clang errors:
> 
> drivers/remoteproc/mtk_scp.c:364:14: error: incompatible function
> pointer types initializing 'void *(*)(struct rproc *, u64, size_t)' (aka
> 'void *(*)(struct rproc *, unsigned long long, unsigned int)') with an
> expression of type 'void *(struct rproc *, u64, int)' (aka 'void
> *(struct rproc *, unsigned long long, int)')
> [-Werror,-Wincompatible-function-pointer-types]
>         .da_to_va       = scp_da_to_va,
>                           ^~~~~~~~~~~~
> 1 error generated.
> 
> [...]


Here is a summary with links:
  - remoteproc/mediatek: Use size_t type for len in scp_da_to_va
    https://git.kernel.org/andersson/remoteproc/c/18101380c160ec0787e77656106812baa2995f9c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
