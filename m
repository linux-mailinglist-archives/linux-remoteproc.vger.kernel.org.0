Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4960D269DA4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Sep 2020 07:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgIOFAJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 15 Sep 2020 01:00:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgIOFAI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 01:00:08 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600146007;
        bh=/WRfMotLX/AVE7gJrqHCxHNkComVYmrJyU1M0mkTw2o=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RL+X8H0qnEMxM68PQ3EiwdsFPO9zgC6GcNvDHxF7S1eMf3Kek/zy7wiBqxnNY7M05
         CjHhkfrosvQQdLXtypfbVQFcx/GnnTAJVbGSQAqNcTCkP5/qA0c1nGp5Lhca2S3nwQ
         nEFGRI+FbMTSwhPd209of5/IY8FMpxWT/wbgjcDs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: stm32: Fix pointer assignement
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014600769.14763.2071539280123638328.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 05:00:07 +0000
References: <20200831213758.206690-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200831213758.206690-1-mathieu.poirier@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 31 Aug 2020 15:37:58 -0600 you wrote:
> Fix the assignment of the @state pointer - it is obviously wrong.
> 
> Fixes: 376ffdc04456 ("remoteproc: stm32: Properly set co-processor state when attaching")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - remoteproc: stm32: Fix pointer assignement
    https://git.kernel.org/andersson/remoteproc/c/cb2d8d5b196c2e96e29343383c8c8d8db68b934e

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
