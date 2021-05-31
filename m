Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804D33962FC
	for <lists+linux-remoteproc@lfdr.de>; Mon, 31 May 2021 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbhEaPC5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 31 May 2021 11:02:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:52274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233926AbhEaPAg (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 May 2021 11:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 93FB960FF0;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622472647;
        bh=AF1o6ynb5rqo6cUXgkxTsmHkG9MoQ3wSq3y4FiPgSnU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IYT/yNryO87at+0WV8BPnFG5cctkBplv1wYPR+nTM424Pb3zBSax7fn9u2INLs15O
         mdrbGZEFHH9syz01nars8IulxbI9Z/xAoHZE+Jd7hZX7vasJPkXGtk9P4QYlfciKzb
         Hyxi1+5COUCuvY9nBKPmzph9uEmYRVbSKG7ETNeW5yI2td+TsjV+bYQJzWXor0/bHj
         j+yqIFjfeP0/M9Ql89x12fqM/WghyyljULO72JPD3eQdYbGq7BbFJ3THgGbAEev0EG
         k+5pXwLVpTTQoxboWsoGhi/LBf9jNYt4Nmz3jjRa3Fn2yM29byk2UHxautzNOFZe0c
         uvaGBPj39ZtnQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8635C60A6F;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: stm32: fix phys_addr_t format string
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162247264754.13780.4876391076631283984.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 14:50:47 +0000
References: <20210421140053.3727528-1-arnd@kernel.org>
In-Reply-To: <20210421140053.3727528-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 21 Apr 2021 16:00:40 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A phys_addr_t may be wider than an int or pointer:
> 
> drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_da_to_pa':
> drivers/remoteproc/stm32_rproc.c:583:30: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Werror=format=]
>   583 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> 
> [...]

Here is the summary with links:
  - remoteproc: stm32: fix phys_addr_t format string
    https://git.kernel.org/andersson/remoteproc/c/3e25e407a1c9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


