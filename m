Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05019269DA7
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Sep 2020 07:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIOFAN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 15 Sep 2020 01:00:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIOFAI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 01:00:08 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600146008;
        bh=dpfeGhhw8E/9dZS0MvWwuL5m52az18vuwqaiWQSCAGI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Cd9pBZhZZoRiWx25Gq4MrCK2DY0s0nOQovpaQK224oB1MLUO9NkSev7Kg4fru4JDd
         vmvWmllYBdidGMYeHuyd7TF06B+asPofd9+m1a2Wu4NXAdQyKvisBrJNwo9IvaAGXm
         IWQ6Yrouw3qKVkKrG5OpXtKhpcfGcn8fa7fA+iRw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hwspinlock: sprd: Remove redundant header files
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014600821.14763.5327215955557784659.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 05:00:08 +0000
References: <1590991552-93643-1-git-send-email-baolin.wang@linux.alibaba.com>
In-Reply-To: <1590991552-93643-1-git-send-email-baolin.wang@linux.alibaba.com>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon,  1 Jun 2020 14:05:52 +0800 you wrote:
> Remove redundant header files.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/hwspinlock/sprd_hwspinlock.c | 2 --
>  1 file changed, 2 deletions(-)


Here is a summary with links:
  - hwspinlock: sprd: Remove redundant header files
    https://git.kernel.org/andersson/remoteproc/c/870f1b23fa8e3defc985f6ee531834c548e4c30e

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
