Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECFC22476E
	for <lists+linux-remoteproc@lfdr.de>; Sat, 18 Jul 2020 02:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgGRAUH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Jul 2020 20:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728087AbgGRAUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 20:20:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595031606;
        bh=vVjK+yYNk/f+rDq+LS6k0CTeVJ5puvaR8aUTHGwVX0w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KyHDGrOUCUdb5wLPqKatuEhWmoJRSHdkW9y/neqiCxsypAHgPIPFRyS7m2lmSEP1j
         hYhqv6ijDEsXXXpAtd7a25BgrQcoMr95ntFGkK7TNujVipLHrYEh3RY/i+uFXqgz4F
         2CJ3+B35VHJdw8pB0+2UHw3JIJJqNsJGvjcSLHnA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Monitor MSS_STATUS for boot completion
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159503160666.20678.3759236500037905462.git-patchwork-notify@kernel.org>
Date:   Sat, 18 Jul 2020 00:20:06 +0000
References: <20200716120514.21588-1-sibis@codeaurora.org>
In-Reply-To: <20200716120514.21588-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 16 Jul 2020 17:35:14 +0530 you wrote:
> On secure devices there exists a race condition which could lock the MSS
> CONFIG AHB bus thus preventing access to BOOT_STATUS register during SSR.
> Switch to polling the MSS_STATUS register with an additional 10 us delay
> to reliably track boot completion.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> [...]


Here is a summary with links:
  - remoteproc: qcom_q6v5_mss: Monitor MSS_STATUS for boot completion
    https://git.kernel.org/andersson/remoteproc/c/4e6751a1cfab85b7a1c054cf3d55f12322e1ee3b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
