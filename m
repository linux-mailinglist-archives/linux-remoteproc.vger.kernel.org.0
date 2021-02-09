Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42536315A4A
	for <lists+linux-remoteproc@lfdr.de>; Wed, 10 Feb 2021 00:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhBIXvd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 Feb 2021 18:51:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:40458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234861AbhBIXQ5 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 18:16:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CD2964DED;
        Tue,  9 Feb 2021 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612911007;
        bh=wUs9WTuVmgOAUO4SpCTeHJAMDwmlRdDl37A6r3KJYeY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Hn+wEcjgo7PshdHBkvVQ65lRW4B6DIBzP2McAqKQ0WbEcF05viZHpzIepc0hVUqR5
         gJulPLAc4Ki1obE/qHkL1/V5ID2OFH+Z09m8/Epi1n+NahcsMCbZdD9XI7PX8D1+UL
         6LUcaD3SlFXtI54GeoCFTWow877SQOPyTDfmeOmm03XqMH1MzV6NmE++lBQMFPDUXQ
         TtChl8RbbKWwDlfSqXkWiAsg7RAuJuiOKDro6dpSq6VxWPga7kY5LsHdYgVnw7xY1A
         WfXYBdy5FO2w5jAqcBGyJkLJEm3MtsmbZa8SY8WuCny4kQmE/EmBJAwRf5q09eQirN
         a1bBB8YLk10+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 40F31609E2;
        Tue,  9 Feb 2021 22:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: core: Fix rproc->firmware free in
 rproc_set_firmware()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161291100726.6282.7146787273205980697.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 22:50:07 +0000
References: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
In-Reply-To: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
To:     Daniele Alessandrelli <daniele.alessandrelli@linux.intel.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 18 Jan 2021 16:59:04 +0000 you wrote:
> From: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> 
> rproc_alloc_firmware() (called by rproc_alloc()) can allocate
> rproc->firmware using kstrdup_const() and therefore should be freed
> using kfree_const(); however, rproc_set_firmware() frees it using the
> simple kfree(). This causes a kernel oops if a constant string is passed
> to rproc_alloc() and rproc_set_firmware() is subsequently called.
> 
> [...]

Here is the summary with links:
  - remoteproc: core: Fix rproc->firmware free in rproc_set_firmware()
    https://git.kernel.org/andersson/remoteproc/c/43d3f2c715ce

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


