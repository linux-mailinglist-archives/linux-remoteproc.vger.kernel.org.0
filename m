Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7854340682
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Mar 2021 14:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhCRNK0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 18 Mar 2021 09:10:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:58384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231459AbhCRNKR (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 09:10:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 94A7064F04;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616073016;
        bh=7npmoX/fiZQ9whD43Xs90e34vfo4bE3N8Ge/4JmE7r4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Wu6SmYVMMK2zN/ZhfHplAw1yUzPs7RYnt+sxIa67bQ7eP+45zFlh2uqQIRVcTPRSR
         hEqJIc9hBHOdiNopw4ZFIHmgU7502YY6Kkxln0EQgSIdJwKkMLvT0Ox6+sRlYqj4oZ
         42WJmytjK5dRZGsOdU+Jne/N7PKtRsXnvJ6WHLiUBPE+uoI2TIwwT2OYO+LiDH0rcO
         g9PqceW8gLwfSmKB0PDVL5IJoL4LM4fl1Rugcok52WlgYqfCPHHVRrCzpP17C4aCn/
         vDtw2Z9z38iGZ8AiCf/ueB0mL+1Lz2tqr6kNEugtxAzUTYnyXGsePxB4b0x1g7YVTg
         4zzTUL+ibRlTA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 839F6609B6;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hwspinlock: remove sirf driver
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607301653.31848.16959545465911476635.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 13:10:16 +0000
References: <20210120132537.2285157-1-arnd@kernel.org>
In-Reply-To: <20210120132537.2285157-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 20 Jan 2021 14:25:37 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
> 
> Cc: Barry Song <baohua@kernel.org>
> Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> [...]

Here is the summary with links:
  - hwspinlock: remove sirf driver
    https://git.kernel.org/andersson/remoteproc/c/1cb8f3e2d8fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


