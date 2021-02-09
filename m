Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398C0315555
	for <lists+linux-remoteproc@lfdr.de>; Tue,  9 Feb 2021 18:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhBIRl3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 Feb 2021 12:41:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233352AbhBIRks (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 12:40:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F81864EB8;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612892408;
        bh=76LQMP+d430MZUrBJslwJFKZh8Mj6Q0OgMdquTLoFy4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tZorWE6ht1QXgCgoEc5T9G36jwoM0J5NparDSVp1tfoGpRgIqeVwd3ocfVQerr097
         9uDq5LNGnSPxvNcBAK6PVhx7BdW7JDSyFR48quiOTmIuwi0TRkQiA2fwWrUC/i+IUW
         KW5ee5+vciab2Be1nkJZASH7BZlUqab8tQaxVme/jq/0AhUJ6Gd2vTtwuCBzvl7Mcu
         7ak9ggWC7mYKeQxQlhX6I5YjCBFd9w5h+ArRz9AvBLZ+uBeRbErH0+ZzMFobPLo+Wv
         FZi0CQ9zY3sdBCzJm3Yylpww33wLq7MS+NTqNsahB64z0lC5dtjPSsxM6I65Nnfm+e
         Pa6g5gw4shTxw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 187D0609D6;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: stm32: improve debug using dev_err_probe
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161289240809.27941.7088751960645148206.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 17:40:08 +0000
References: <20201217144125.12903-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20201217144125.12903-1-arnaud.pouliquen@foss.st.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 17 Dec 2020 15:41:25 +0100 you wrote:
> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> 
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error.
> The benefit is that DEFER issue will be logged in the devices_deferred
> debugfs file.
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: stm32: improve debug using dev_err_probe
    https://git.kernel.org/andersson/remoteproc/c/cf34838d591f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


