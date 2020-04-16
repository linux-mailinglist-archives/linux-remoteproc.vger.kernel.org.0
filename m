Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AF51AD310
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 01:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgDPXHa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 19:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbgDPXH3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587078448;
        bh=rPuy0OsQyuW2N/7tYjh9562TPSmCh8ScQa/YYTmjJFI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=1OUsxIwCmGUVmj027m89ozGuX9U5qCy+YQfpQ98Mmor/XlUjx/tqqOkWOmj61KV91
         7lkQ5Y5Dcm4J0MQOYo3mAkkvNMVciLaOb7QBI6f78As9Ffdc7u+OA4IdUB4bKstKoM
         tVmeybemWGMnkBnmu1UXmis8UZRPdPzNklO42HXw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: fix a comment typo for rpmsg_device_match()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844890.17838.7721061437896209308.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Apr 2020 23:07:28 +0000
References: <20200313165049.62907-1-wenhu.wang@vivo.com>
In-Reply-To: <20200313165049.62907-1-wenhu.wang@vivo.com>
To:     Wang Wenhu <wenhu.wang@vivo.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri, 13 Mar 2020 09:50:49 -0700 you wrote:
> Should be 'a' rather than 'an'.
> 
> Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - rpmsg: fix a comment typo for rpmsg_device_match()
    https://git.kernel.org/andersson/remoteproc/c/075894d45656fe9aeced4f34ef692b52791d78dc

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
