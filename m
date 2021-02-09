Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE8B315559
	for <lists+linux-remoteproc@lfdr.de>; Tue,  9 Feb 2021 18:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbhBIRli (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 Feb 2021 12:41:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:59674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233366AbhBIRkv (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 12:40:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 12C5A64EA6;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612892408;
        bh=JKyOyWA8SJC3jPhXY186zg0OFMZYM86qlCi0fQbVHzQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HTtXYppf38gy0VnP5ioGERJ5J8/J1D58uXweNsfiLv0WRwO1nBs0X40D0WBHpK7eu
         8jo4ev/m538jNrsGe5HY0u1epF1HPbvuRIfsrvV5QIUZbq6CXqc9TB27tYV0ZzciCu
         qK77YZchk2CmKbqPEnc6AwT+Ju39I+VNT0nlBRlkw+7oqvpaskWSFG9kcxacX+rTNM
         t7x1zN9r0Z6Gcn8paezEt5iB36GZN8DtivaMM+HlHv+XLkG/BAratTdlWqs6BLgZe2
         kJUhuFfS7R1f1pzhH5oF5Em61Zuz0BslIo7p1wmAtDMEze1u3sp7d1fZPaMwwro6Bj
         KU+Z4yOI9/9Og==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 04C6C609E4;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: acknowledge watchdog IRQ after handled
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161289240801.27941.13835302751250925229.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 17:40:08 +0000
References: <20210127082046.3735157-1-tzungbi@google.com>
In-Reply-To: <20210127082046.3735157-1-tzungbi@google.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 27 Jan 2021 16:20:46 +0800 you wrote:
> Acknowledges watchdog IRQ after handled or kernel keeps receiving the
> interrupt.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h |  1 +
>  drivers/remoteproc/mtk_scp.c    | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)

Here is the summary with links:
  - remoteproc/mediatek: acknowledge watchdog IRQ after handled
    https://git.kernel.org/andersson/remoteproc/c/8c545f52dce4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


