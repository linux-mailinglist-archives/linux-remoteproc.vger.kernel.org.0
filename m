Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1201396307
	for <lists+linux-remoteproc@lfdr.de>; Mon, 31 May 2021 17:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbhEaPD0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 31 May 2021 11:03:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233907AbhEaPAg (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 May 2021 11:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D8D2610C8;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622472647;
        bh=LFH+3FTK5Ge5lDd8AS8vlF5L16cGR7aV1t0jS8AXJkg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Bjza7+MjuKKgL63nNYosA6G1KLynr4f+JW5tybKbSZNigmmHUeQYh1OQ7YWAMrr7N
         GMd0W/uP3DYrnK5F7DYOeABOXHhd0khnRAaYbDsQkJIqj3a98NEfvdtMsNvKCdv4NR
         A6SEpGgWG9pNnE+LVhbYnSNU2SvCUscXwFoKdYDxI8GhyNZhfI+rRAVI4tHCM4jQnB
         yzWbkPRRFJeBWnGNcakvnz7utrIPr4RbUdWZQEeXrz5xBUtKmpJOAUUg2QNPq+xTx+
         g7QZFqOQJ1wlIJft2B8r7z8gd8gInPZYjYLgXDrwVL7Ziu/WBIzpi5i3G2aWA7qfzz
         cPPC97kFGcDRA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C96160C28;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: k3-r5: Fix an error message
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162247264750.13780.11355747185931627623.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 14:50:47 +0000
References: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  6 May 2021 22:46:01 +0200 you wrote:
> 'ret' is known to be 0 here.
> Reorder the code so that the expected error code is printed.
> 
> Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - remoteproc: k3-r5: Fix an error message
    https://git.kernel.org/andersson/remoteproc/c/34c4da6d5dfb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


