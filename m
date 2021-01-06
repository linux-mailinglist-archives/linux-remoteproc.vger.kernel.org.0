Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68ED32EB8F9
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Jan 2021 05:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbhAFEat (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 Jan 2021 23:30:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:56210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbhAFEas (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 23:30:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3611C22D04;
        Wed,  6 Jan 2021 04:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609907408;
        bh=fzplfduMyfRi3Rj7pu9P7VmaXcOEI5NcDU/kt1ujZAo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OHxNj+o9cvPKUgQh0LR/PMnxOqCKxusmUoCj9FJOisiQBxVtA4dwIsRE3i9nPf1aD
         LecsgMeqxUE/VS2GgTncTA3Dih2vxWRulArdptrQx8/bIG55bUmMehajkPUz3YfQfc
         DyT9OKoYtPKTM2q/drHkpZ7I7MpAeaew/eL5gA8cfFPYh0wE+Tf3Af1f6bbh6dfWK+
         Bjx/m45/Z+nmLDnc9EhzuGfVce5kx4cU2vISIqb8bBTTLeHOfB4Q8c0lmYQFf0VU3F
         948d2yA4zmq6jH8upIhWRgi8JEcHjPysTlE/bD04bR0+c0RKCI+VmaukcYS/Do2c9U
         8qwz/gnAvNYwg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2638260508;
        Wed,  6 Jan 2021 04:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: glink: add a header file
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160990740815.2319.8084561202674042816.git-patchwork-notify@kernel.org>
Date:   Wed, 06 Jan 2021 04:30:08 +0000
References: <20210105235528.32538-1-elder@linaro.org>
In-Reply-To: <20210105235528.32538-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue,  5 Jan 2021 17:55:28 -0600 you wrote:
> With an x86_64 architecture W=1 build, qcom_glink_ssr_notify() is
> reported as having no previous prototype.  The prototype is found in
> "qcom_glink.h", so we just need "qcom_glink_ssr.c" to include that
> file.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> 
> [...]

Here is the summary with links:
  - rpmsg: glink: add a header file
    https://git.kernel.org/andersson/remoteproc/c/3e35772bc1e4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


