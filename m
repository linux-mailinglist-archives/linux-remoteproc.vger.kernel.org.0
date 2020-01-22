Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51025144904
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jan 2020 01:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgAVAkI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Jan 2020 19:40:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:50364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728665AbgAVAkI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jan 2020 19:40:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579653607;
        bh=ymQcS6DfZiqj1NvnkmaQtFN/fRhawulq0nXxhYn2e+M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=0vULyEWtbhCFuPwNVvxeHm+dSgOTgr6+XpCRnxB0d5iyDkgm7fPW+jkWeMg+WcF2d
         +Jejfx0vmVCNLMbDua87Xif5Ia8YL980HwgfYwOk/FBA8DM/74WWZkvgZAN3gYk9uu
         Aj/oc87wI6WCJp1cpqOiNOcZ4pqsIGJA8Rbb9I/k=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND 0/3] Some improvements for SIRF hwspinlock
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157965360765.2917.18165267937126479853.git-patchwork-notify@kernel.org>
Date:   Wed, 22 Jan 2020 00:40:07 +0000
References: <cover.1578453662.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453662.git.baolin.wang7@gmail.com>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed,  8 Jan 2020 11:23:43 +0800 you wrote:
> This patch set did some improvements for the SIRF hwspinlock driver,
> including changing to use devm_xxx APIs and removing some redundant
> pm runtime functions.
> 
> Baolin Wang (3):
>   hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
>   hwspinlock: sirf: Remove redundant PM runtime functions
>   hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock
>     controller
> 
> [...]


Here is a summary with links:
  - [RESEND,1/3] hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
    https://git.kernel.org/andersson/remoteproc/c/77d99a6a9df2ac3d1832b408123e48549d1e01fd
  - [RESEND,2/3] hwspinlock: sirf: Remove redundant PM runtime functions
    https://git.kernel.org/andersson/remoteproc/c/8f2a0dc87dad7f5c644fc9210a1efb4617acd6a1
  - [RESEND,3/3] hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock controller
    https://git.kernel.org/andersson/remoteproc/c/cb36017a8b1b582bcb7063e44c598c3e36aa0228

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
