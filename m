Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C161AD314
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 01:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgDPXHb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 19:07:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728322AbgDPXHa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:30 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587078449;
        bh=b1l3gO9ttN8bAgVY23187mm1irurnrbOw6n/ell0IlY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=I92iuT0XSruybbEBXgPVJedqUSC003mqUiG2atCihq+4UJDdrrYcyb7dmhIwj6HOq
         2kLjNzkmOX4GuF1mbLyo7YX/UtHZ7ucpnoBHSU7Z339wDq+04H2qUiyuYsbNI5Z2uY
         H4omVyflPvTg+C4vhXOiKlHHg+g64YqtQKGEQ+Jo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in
 omap_rproc_request_timer
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844983.17838.7154296955803704839.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Apr 2020 23:07:29 +0000
References: <20200403013134.11407-1-natechancellor@gmail.com>
In-Reply-To: <20200403013134.11407-1-natechancellor@gmail.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu,  2 Apr 2020 18:31:35 -0700 you wrote:
> When building arm allyesconfig:
> 
> drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
> to function call, expected 2, have 3
>         timer->timer_ops->set_load(timer->odt, 0, 0);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
> 1 error generated.
> 
> [...]


Here is a summary with links:
  - remoteproc/omap: Fix set_load call in omap_rproc_request_timer
    https://git.kernel.org/andersson/remoteproc/c/e6d05acd57013114977ec77a131fe79d2f542774

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
