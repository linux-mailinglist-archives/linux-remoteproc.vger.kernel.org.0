Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CDD3E08E1
	for <lists+linux-remoteproc@lfdr.de>; Wed,  4 Aug 2021 21:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhHDTcD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 4 Aug 2021 15:32:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:39484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234064AbhHDTcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 15:32:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A230C60F58;
        Wed,  4 Aug 2021 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628105509;
        bh=32dhI4Lq82bDWZ6lQpM5yPOqjeufvXnb6PvyxRfng5E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VfDpcbX+EpFN9MICXyLR+cIiabkhCtOFV3mPQYQxPfZuI0eU5L18sbgE/Gqkhcj5J
         bgrNHu8h3DUhCWSYxaRpa7niAeMYUbna62atK8s9WriEjcHSoC1JLTgnGV+p64wJEn
         TjbZy/W4mL+cLjBBReyhzRDMK8LuzUd2WzhEO41KdXhXzwNUenueLt/x2aqw6C89Ht
         NU3KmUOe1w6iwzVOdriPOzIB/plPOFhl5gs8flrg9TzpUgKWPSt1QHMQDnEo99tMLv
         rkVoKtQnUE1fF/Asl7gHKmApFOH0P0f8RC6dVKML3GRj8FqBCjQ0e2ev+hPpGITNQo
         +FGMg8hDeBokQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8E30860A72;
        Wed,  4 Aug 2021 19:31:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] remoteproc: avoid notification when suspended
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162810550957.17752.12206541568388699220.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Aug 2021 19:31:49 +0000
References: <20210519234418.1196387-1-elder@linaro.org>
In-Reply-To: <20210519234418.1196387-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 19 May 2021 18:44:17 -0500 you wrote:
> I added a cover page for this single patch to provide a little more
> explanation about testing.
> 
> I have verified that, when this patch is applied, the IPA driver
> receives the desired crash notification after the modem has crashed.
> It recovers properly, and functions correctly following the crash.
> 
> [...]

Here is the summary with links:
  - [1/1] remoteproc: use freezable workqueue for crash notifications
    https://git.kernel.org/andersson/remoteproc/c/3ad51c1743eb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


