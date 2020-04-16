Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BDA1AD30F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 01:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgDPXHa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 19:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727896AbgDPXH3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587078449;
        bh=LXUyfD85UEjTahPadSeP0CymtNBafI7YMPk+6jZnz3M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=I2bYdk6jDJvE2cfx0y9qBsJvWtJtdtk3GVnm1QYKjyXgYqXnu5HRhqrdpyjTyKwo/
         ukln0bVjNaqyok7hPYMKbZjLYB0aA19f1OPHu7h1nXsYQ8cRc9SiBe8V4OnS+BsvoE
         ZdjcwO4rKegh/9u7Hb5rfIM8xG7F3kNCD2YLn4r8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: Build failure in omap_remoteproc due to 02e6d546e3bd
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844927.17838.6909682471662108981.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Apr 2020 23:07:29 +0000
References: <20200327185055.GA22438@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200327185055.GA22438@ubuntu-m2-xlarge-x86>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri, 27 Mar 2020 11:50:55 -0700 you wrote:
> Hi all,
> 
> Apologies if this has already been reported, I did not see anything in
> the archives. On next-20200327, I see the following build error:
> 
> drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
> to function call, expected 2, have 3
>         timer->timer_ops->set_load(timer->odt, 0, 0);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
> 1 error generated.
> 
> [...]


Here is a summary with links:
  - Build failure in omap_remoteproc due to 02e6d546e3bd
    https://git.kernel.org/andersson/remoteproc/c/e6d05acd57013114977ec77a131fe79d2f542774

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
