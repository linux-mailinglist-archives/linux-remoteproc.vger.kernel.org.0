Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297EA17ECBD
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 00:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgCIXkS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 9 Mar 2020 19:40:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbgCIXkG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Mar 2020 19:40:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583797206;
        bh=KDGfxj9HI+OFgnfLx7wi09DTKIQ7lmucMwLg/Y6MtVw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LBfuTFbDbFD6/zgAb3gTwWqRFxs80yMnrVCQYPV9MUO+lItrd1HRZBptbI31l0+dV
         xuEFeupOkvlJJiwhXk/QzR1eduJp4R/8Qakh3p11/CxpG7qS0jDaG1d2W9WRPbEohq
         uKbUQub3WogA+Y6yGgv5z9rCWo2WLyHQ9+UfNlcQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/3] remoteproc: mss: Improve mem_assign and firmware load
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158379720632.7411.14831620251171101042.git-patchwork-notify@kernel.org>
Date:   Mon, 09 Mar 2020 23:40:06 +0000
References: <20200304194729.27979-1-sibis@codeaurora.org>
In-Reply-To: <20200304194729.27979-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu,  5 Mar 2020 01:17:26 +0530 you wrote:
> Two things came up in the effort of figuring out why the modem crashed the
> entire system when being restarted; the first one solves the actual problem, in
> that it's not possible to reclaim the main modem firmware region unless the
> modem subsystem is running - causing the crash.
> 
> The second patch aligns the firmware loading process to that of the downstream
> driver, which seems to be a requirement in 8974 as well.
> 
> [...]


Here is a summary with links:
  - [v4,1/3] remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
    https://git.kernel.org/andersson/remoteproc/c/0d20e3d606b084dbaa9f62885f9edf97c2a37c0e
  - [v4,2/3] remoteproc: qcom_q6v5_mss: Validate each segment during loading
    https://git.kernel.org/andersson/remoteproc/c/02b82b2e521407ed502850104fb40dad65b22329
  - [v4,3/3] remoteproc: qcom_q6v5_mss: Reload the mba region on coredump
    https://git.kernel.org/andersson/remoteproc/c/1a40eb61fe11e97ed0a69cf50dd6c0a79b32985a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
