Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB1912C0A8
	for <lists+linux-remoteproc@lfdr.de>; Sun, 29 Dec 2019 06:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfL2FkE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 29 Dec 2019 00:40:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:46884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbfL2FkE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 29 Dec 2019 00:40:04 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577598004;
        bh=Cn1T3p1zjmMuw147NZghm5OkH8ieIaLMvUis0wLkSvY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y3O/A33yUYg3PT/S2sWH64rbsTJQ8ly1//EwJ1/f3qZ2pVKiv0d1DJ1LZaVCMyJPe
         bpLO4mlSdEVnfGN12vChj7exQqpt4kWwhoEr4RYXnf0DSkycMfwmVfquG9Pq8+V1+k
         wGyleMuO7ENf+dmipEonSQzkgX5D+U+14R9Y/h2g=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hwspinlock: stm32: convert to devm_platform_ioremap_resource
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157759800404.15003.6371683197257428610.git-patchwork-notify@kernel.org>
Date:   Sun, 29 Dec 2019 05:40:04 +0000
References: <20191228191541.26999-1-tiny.windzz@gmail.com>
In-Reply-To: <20191228191541.26999-1-tiny.windzz@gmail.com>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Sat, 28 Dec 2019 19:15:41 +0000 you wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)


Here is a summary with links:
  - hwspinlock: stm32: convert to devm_platform_ioremap_resource
    https://git.kernel.org/andersson/remoteproc/c/d4824486b676ef87071081bdb77a6de2a5a341c7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
