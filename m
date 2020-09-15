Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E16E269C8D
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Sep 2020 05:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgIODbC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Sep 2020 23:31:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgIODbC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Sep 2020 23:31:02 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600140662;
        bh=8CP6Z9zYCoySK3hYonM+Kkm5PNhW8jkOk1bLiNDE9fg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tlwHSFsM5v12TCfxpR/v1F9hJpAODvX5tD8ZE887jfD1kITkMYGYgKltESm27d0e6
         UJtY6IbfJ9CJKdwtz4rlmd5nq9D6oZKvNFJQQvudvW4FrNEc4L3efcMhU+FJc5Raui
         fbEiQ0Y/McNMLAlmqIQ0rEVZS5e2SWqBiTfpe9U8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND RESEND] remoteproc: scp: add COMPILE_TEST dependency
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014066207.2880.16741677966752176955.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 03:31:02 +0000
References: <20200915012911.489820-1-acourbot@chromium.org>
In-Reply-To: <20200915012911.489820-1-acourbot@chromium.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 15 Sep 2020 10:29:11 +0900 you wrote:
> This will improve this driver's build coverage.
> 
> Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
> Hi remoteproc maintainers,
> 
> [...]


Here is a summary with links:
  - [RESEND,RESEND] remoteproc: scp: add COMPILE_TEST dependency
    https://git.kernel.org/andersson/remoteproc/c/5185e3a9dc2d68bb52e3e12400428aa060b87733

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
