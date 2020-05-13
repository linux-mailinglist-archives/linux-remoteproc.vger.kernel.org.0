Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0524A1D0709
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 08:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgEMGUG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 02:20:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728498AbgEMGUG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 02:20:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589350806;
        bh=3kwooWg1nYa3wooNhDF7adA2xkysgf585zfpz/Ip1gY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vmzxorvwveV4CRcF2U2xuMG2JeFZeXyDnX70BAwWcAWf6gywIyIWru/X2M7Vg/mhQ
         EpMuDoP1uaAtRnnrkWWYjBtBmPS/+n8r2+rOOInnIXV4nYf/v/YXHNmAyCp0k9pnRk
         M+P1l74ingiVY0nzSq59QWzVvBXp7Olkj5tkJfU4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] Misc. rproc fixes around fixed memory region support
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158935080615.26945.6515979936407548365.git-patchwork-notify@kernel.org>
Date:   Wed, 13 May 2020 06:20:06 +0000
References: <20200420160600.10467-1-s-anna@ti.com>
In-Reply-To: <20200420160600.10467-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 20 Apr 2020 11:05:58 -0500 you wrote:
> Hi Bjorn,
> 
> This is another minor revision of the fixes around fixed memory region
> support [1] series. Patch 1 is revised to go back to the logic used in v1
> after a long discussion on the v2 version [2]. The other suggestions can
> be future improvments as they would require corresponding platform driver
> changes. Please look through the discussion there and let us know your
> preference. Patches are based on v5.7-rc1.
> 
> [...]


Here is a summary with links:
  - [v3,1/2] remoteproc: Fall back to using parent memory pool if no dedicated available
    https://git.kernel.org/andersson/remoteproc/c/db9178a4f8c4e523f824892cb8bab00961b07385
  - [v3,2/2] remoteproc: Fix and restore the parenting hierarchy for vdev
    https://git.kernel.org/andersson/remoteproc/c/c774ad010873bb89dcc0cdcb1e96aef6664d8caf

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
