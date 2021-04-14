Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0E435EABB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Apr 2021 04:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhDNCUj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Apr 2021 22:20:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:46680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236976AbhDNCUb (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 16362613D0;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=s8jGKAI9LvtklDmh89mEEYkKfKxjDXk+CUPT7BxmfYc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=n1u1ksDlDMaz3FGue11Py2cEPRageiMhcldUgblvURVoh7saGpQYgM2dNVDUXiRhT
         mS1kAId8FdzSe/rfzyfVZhPhAXO7JdI7vdTPrk5P6Lq2DVumBYTq75asMIaxJRZ/Z+
         /s8q/afURPfG0HRynBpbaB63OARP+Z2lXL5inOZsoAmhacoZ7RNvh0L+lN4gB802iP
         /I3sW4AdU0nWUV/ThpgJ/D3uBm46PE+FaG3pIAMXeVjAcrJGJxL9QVGp38p9fRnrrz
         zCxnlbRaTjgvbDTiS5v3K1FD8hj5yLT6vAe5eJvHZY7MOV6+ro0iQ3DpKMVPNPtExY
         Wp6HuSA7ngorg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0D74360CD1;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] remoteproc: imx_rproc: fix build error without
 CONFIG_MAILBOX
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681105.7360.407748973557579923.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:11 +0000
References: <20210331122709.3935521-1-weiyongjun1@huawei.com>
In-Reply-To: <20210331122709.3935521-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 31 Mar 2021 12:27:09 +0000 you wrote:
> Fix build error when CONFIG_MAILBOX is not set:
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_kick':
> imx_rproc.c:(.text+0x328): undefined reference to `mbox_send_message'
> arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_probe':
> imx_rproc.c:(.text+0x52c): undefined reference to `mbox_request_channel_byname'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x548): undefined reference to `mbox_request_channel_byname'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x76c): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x774): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x7c4): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_remove':
> imx_rproc.c:(.text+0x86c): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x874): undefined reference to `mbox_free_channel'
> make: *** [Makefile:1292: vmlinux] Error 1
> 
> [...]

Here is the summary with links:
  - [-next] remoteproc: imx_rproc: fix build error without CONFIG_MAILBOX
    https://git.kernel.org/andersson/remoteproc/c/889cb0d43d18

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


