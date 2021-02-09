Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA119315554
	for <lists+linux-remoteproc@lfdr.de>; Tue,  9 Feb 2021 18:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhBIRlX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 Feb 2021 12:41:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:59676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233319AbhBIRks (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 12:40:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1692764EB4;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612892408;
        bh=6C6yRfAXHu8No0ZW1DOAiRLNG5lxFYQP7q/uAymydjc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MgVCoxrf8AOQ+3qoKVuGZORrTUhCT2fG6WwnyarCQdc2sDH9705PsvxAiSEr/8p2h
         MxniD7xa+PbCjmsVEAT+v1Dr2XAB/kCNkDYCpBdniDwelyrFYAUNWQmMO7uUwDuxDq
         QQubS9RhXEjS700mv+vgDj5KpJ81dxHrunzeAdr6yWiSYKKgAPKo9oyln2ngtZR7ge
         82pba1wop3Fs/ESdto+hZn+gzLVTzncm9bnFg95rje4Y1jwwbrEacw/T9cRoBOMymn
         dQE6bX5ZgYVKWgdv2E0w7zF0AX8s3UfXK1poTYw+thZI20Hf45yeMB8fdZduwagvyI
         dsppsFdOKRO2Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0DB0C609F1;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_wcnss: remove unneeded semicolon
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161289240805.27941.17929418053996951409.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 17:40:08 +0000
References: <1612320402-3313-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612320402-3313-1-git-send-email-yang.lee@linux.alibaba.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed,  3 Feb 2021 10:46:42 +0800 you wrote:
> Eliminate the following coccicheck warning:
> ./drivers/remoteproc/qcom_wcnss.c:573:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - remoteproc: qcom_wcnss: remove unneeded semicolon
    https://git.kernel.org/andersson/remoteproc/c/9a1d27148543

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


