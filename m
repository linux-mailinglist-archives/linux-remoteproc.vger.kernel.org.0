Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C687617ECBC
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 00:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgCIXkG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 9 Mar 2020 19:40:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727287AbgCIXkG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Mar 2020 19:40:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583797206;
        bh=rsWub1JA61ZJiesn9xZ9UQvX/65p1COm8fD6DKyAzg8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sjSRmtlxN0QXS0UaHWW0EjRBkx7SpVmCmsQSGc/R5yr3KWcZt3d1fSaE4S6exG+5p
         UF0oK/XR18xk6CGClxxYhYLJ/V6yTp5fXc+XH/8stGn946hWR2RsLrwWQ7aTCGHkNm
         iIpnJj6OOH/UtaKWc55agpb2UtGHOHcUwOuLBMKw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] hwspinlock: Allow drivers to be built with
 COMPILE_TEST
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158379720615.7411.16061670925081522259.git-patchwork-notify@kernel.org>
Date:   Mon, 09 Mar 2020 23:40:06 +0000
References: <5a95c3de07ef020a4e2f2776fa5adb00637ee387.1581324976.git.baolin.wang7@gmail.com>
In-Reply-To: <5a95c3de07ef020a4e2f2776fa5adb00637ee387.1581324976.git.baolin.wang7@gmail.com>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 10 Feb 2020 17:01:07 +0800 you wrote:
> Allow drivers to be built with COMPILE_TEST.
> 
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
> ---
>  drivers/hwspinlock/Kconfig |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)


Here is a summary with links:
  - [RESEND] hwspinlock: Allow drivers to be built with COMPILE_TEST
    https://git.kernel.org/andersson/remoteproc/c/05eafe64881fae970470406948f2fb115f5fc347

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
