Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FBC2B7F66
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Nov 2020 15:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgKROaI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709807;
        bh=rasJYD0Vhzt1vcPafWrQ4H8iKn1lE35LPxuChLZueX0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YqUX+zxTviJGTvTq9ircZp5nS6j1j3IjJpRjp0ByPfHe2i7rnGm67poGhXD0NwWJA
         FlmXXva+VzpPxcZe/RXmReVd+yagk7WfExKuyHGq8h3RrZ/9heCD4tWrMZqP9frd9A
         HwT/f1fX3oBlvGcnYf/80j1s8QFKQTw5x6LjLw00=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980688.9988.13065730747493473016.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:06 +0000
References: <20201102074007.299222-1-acourbot@chromium.org>
In-Reply-To: <20201102074007.299222-1-acourbot@chromium.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon,  2 Nov 2020 16:40:07 +0900 you wrote:
> Now that this driver can be compiled with COMPILE_TEST, we have no
> guarantee that CONFIG_OF will also be defined. When that happens, a
> warning about mtk_scp_of_match being defined but unused will be reported
> so make sure this variable is only defined if of_match_ptr() actually
> uses it.
> 
> Fixes: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COMPILE_TEST dependency
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> 
> [...]

Here is the summary with links:
  - remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
    https://git.kernel.org/andersson/remoteproc/c/b8ba90450331

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


