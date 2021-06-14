Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F933A7157
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Jun 2021 23:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbhFNVcG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Jun 2021 17:32:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:33036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234042AbhFNVcG (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 17:32:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 494E461245;
        Mon, 14 Jun 2021 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623706203;
        bh=RCrHbkWiqyZlL+G9v2Hk1WteEGOIYxjGpRKfBHHsB2A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KEhV1n+98DhtviZmY1kRFyiLbxNw2/mWZVGLa0uGEiSTC4QcngJaXg7DqFhIEzs+1
         GUKXWVKWtIGjb8P+zbUlkaV8+yNsQhrYvJff/M5/VqoSLReOPUBUpjA5rdZUJABs6i
         1/Rj84rDMOvQck65/2+9PWcFPdMe2AtHCAHkMH1XHSQo4OVbu+d9VwBxxJuZpH06l8
         V37JnciukYDiS/rIDf68grWEDWGtB/HEU8AwtWSP5D+clOigu9hWXcVzGDinWC1uBI
         myMgURuUzC7ARB5BIOb3YRBodIQeWkTyv67usNa/owjjUza9jBoyEWCynrTHf/Y8UB
         k9NqEIp4ETLlw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 38E63609E7;
        Mon, 14 Jun 2021 21:30:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: pas: Fix indentation warnings
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162370620322.27129.546254612474662487.git-patchwork-notify@kernel.org>
Date:   Mon, 14 Jun 2021 21:30:03 +0000
References: <20210603142639.8335-1-s-anna@ti.com>
In-Reply-To: <20210603142639.8335-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 3 Jun 2021 09:26:39 -0500 you wrote:
> The list indentation should always be 2 spaces more than the preceding
> keyword. A few of the items are only using 1 space, and resulting in
> warnings with dt_binding_check. Fix these.
> 
> Fixes: cf107e98d024 ("dt-bindings: remoteproc: qcom: pas: Convert binding to YAML")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> 
> [...]

Here is the summary with links:
  - dt-bindings: remoteproc: qcom: pas: Fix indentation warnings
    https://git.kernel.org/andersson/remoteproc/c/30da589dba53

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


