Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E97E1AD313
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 01:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgDPXHa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 19:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728142AbgDPXH3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587078449;
        bh=7KeaUOSzNO2lnWHozcO7lo7ZUDx/eEbL7/NyIVZ0QNc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gPfs3qND/TJjV0mjBKVtIiYYCGqk5Ry8gjKI+jJHdUoj6uJUxzGXJ3YiPSDUBAVg+
         Aq7C0EAUzhdgg9SD4KVMWpauJkF3HaJPH/Jtwtahp+EjTgSpNF7ij5/hgMDD+kAL6b
         w1m0bdauxYv606l47jtmLFbNgnVehSz0P3hB8f+A=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: mtk_scp: use dma_addr_t for DMA API
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844948.17838.5032787244781893947.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Apr 2020 23:07:29 +0000
References: <20200408155450.2186471-1-arnd@arndb.de>
In-Reply-To: <20200408155450.2186471-1-arnd@arndb.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed,  8 Apr 2020 17:54:29 +0200 you wrote:
> dma_addr_t and phys_addr_t are distinct types and must not be
> mixed, as both the values and the size of the type may be
> different depending on what the remote device uses.
> 
> In this driver the compiler warns when the two types are different:
> 
> drivers/remoteproc/mtk_scp.c: In function 'scp_map_memory_region':
> drivers/remoteproc/mtk_scp.c:454:9: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   454 |         &scp->phys_addr, GFP_KERNEL);
>       |         ^~~~~~~~~~~~~~~
>       |         |
>       |         phys_addr_t * {aka unsigned int *}
> In file included from drivers/remoteproc/mtk_scp.c:7:
> include/linux/dma-mapping.h:642:15: note: expected 'dma_addr_t *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
>   642 |   dma_addr_t *dma_handle, gfp_t gfp)
> 
> [...]


Here is a summary with links:
  - remoteproc: mtk_scp: use dma_addr_t for DMA API
    https://git.kernel.org/andersson/remoteproc/c/c2781e4d9bc6d925dfc1ff833dfdaf12b69679de

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
