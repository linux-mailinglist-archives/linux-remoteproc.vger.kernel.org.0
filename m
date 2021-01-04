Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B11E2E8FD7
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 Jan 2021 05:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbhADEkt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 3 Jan 2021 23:40:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:39362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbhADEkt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 3 Jan 2021 23:40:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E762321D7A;
        Mon,  4 Jan 2021 04:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609735208;
        bh=UG0CpW54wALhemaiJbbnxTxaK8a8tBd43i3KPR4vIg8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Nne5RKP+zWzup1kQVc/Z6sWEhH78IV1mj6GlNw6T7ntoxlsT22vDF8zWih9QqpIiC
         sWp5sVtgDs5kKAc4eLwUEhR2F93STusGmfn57t7Qu1DsdM7szNo7J8quRHxtbw86VZ
         46xP0lbh4wfHSz7Ic6bmgPq7MFuo+XmBbTMbfBGXFDSszVm/J7b7sdNODkYCn46FeK
         Udl0eklncxyWlDymcn4cfmYV8ZFktJ4OYrlh3vy4nTKRweOMtO9SDh2Ta5toztjmDy
         2Gb2Cgux0xDFZfN+Vi3JUuZ58BDvio8vXvQa3J56/9+BDZH7xkPvC96jEZTHDQAvJH
         Lbmu6kwm3ONvQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E18DA6011A;
        Mon,  4 Jan 2021 04:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pil_info: avoid 64-bit division
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160973520891.9031.3450325908825059275.git-patchwork-notify@kernel.org>
Date:   Mon, 04 Jan 2021 04:40:08 +0000
References: <20210103135628.3702427-1-arnd@kernel.org>
In-Reply-To: <20210103135628.3702427-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sun,  3 Jan 2021 14:56:12 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit machines with 64-bit resource_size_t, the driver causes
> a link failure because of the 64-bit division:
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/qcom_pil_info.o: in function `qcom_pil_info_store':
> qcom_pil_info.c:(.text+0x1ec): undefined reference to `__aeabi_uldivmod'
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: pil_info: avoid 64-bit division
    https://git.kernel.org/andersson/remoteproc/c/c101deb7d50b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


