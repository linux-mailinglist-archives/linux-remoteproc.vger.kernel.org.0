Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5855A1D070C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 08:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgEMGUI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 02:20:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729026AbgEMGUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 02:20:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589350807;
        bh=/A1eECqNMynRH2eqrwFutvn/1UlyfqwOMM3kayDNmdk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=yRZA8kdlAQuRxot8+3aCXW4G83dE0tuganqkl31F999pjHhp98uUubfnjs2OP0fg3
         AZhUVLKAF7pU38rgdBQQAqHns624WvwjVgMxFlFp2Dp8d9UD9uA/qeSLGlIb9wMQFS
         Zn/PV7+B+pWpKwsebgo5aGUvc9DOJIWznZoKw6qU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: core: Prevent system suspend during remoteproc
 recovery
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158935080708.26945.7079941302344036400.git-patchwork-notify@kernel.org>
Date:   Wed, 13 May 2020 06:20:07 +0000
References: <1588183482-21146-1-git-send-email-rishabhb@codeaurora.org>
In-Reply-To: <1588183482-21146-1-git-send-email-rishabhb@codeaurora.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 29 Apr 2020 11:04:42 -0700 you wrote:
> The system might go into suspend during recovery of any remoteproc.
> This will interrupt the recovery process in between increasing the
> recovery time. Make the platform device as wakeup capable and
> use pm_stay_wake/pm_relax APIs to avoid system from going into
> suspend during recovery.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> [...]


Here is a summary with links:
  - remoteproc: core: Prevent system suspend during remoteproc recovery
    https://git.kernel.org/andersson/remoteproc/c/a781e5aa59110d002a56bd41a397c0c8892f0609

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
