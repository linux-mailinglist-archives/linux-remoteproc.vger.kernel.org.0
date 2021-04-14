Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326C435EAB9
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Apr 2021 04:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhDNCUf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Apr 2021 22:20:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232245AbhDNCUb (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0B043613CD;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=bYdBZpqbAktuWP2V6gT7wo2alFWDK3+wRGvXnk9bIu0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fbSjbLfGmxl5pOxKmwyN21HVR5OeWlTqdVQHw1L5b3YWjGTKMiJK3i7QgSaFf9bF2
         WEiw9accpTY/1x7OLpK6Ab7l4ZQHXeKD/xBsnDv2uoEORBMqyxw6jglGiVlpMeQVyH
         I2YvWIY9QBDE5J85Vr2tygB3P8FPGy95C1mNCBk4KqHDEbRXAn31WLm80Z6zqn5Gum
         hx+dvJn2OaPt8NbJfWxzaPbH2PqCBnQIETd12vxhD2VPgwMPTjj4NArkptS0MQkNbu
         BmdltMqynw7NJv986polNUAjMXWwWFEmlJDrwge35zlTOQ6czzDtEblFiH9SxrZFhu
         TXeSzMl6Jbbvw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EF96660CD3;
        Wed, 14 Apr 2021 02:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V3 0/4] remoteproc: imx_rproc: support remote cores booted
 early
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681097.7360.7737514948088950128.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:10 +0000
References: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
In-Reply-To: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  8 Apr 2021 09:44:45 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V3:
>  Add R-b tag
>  Typo fix in Patch 3
>  Align the patch subject using remoteproc: imx_rproc:
>  Update commit msg in Patch 4
> 
> [...]

Here is the summary with links:
  - [V3,1/4] remoteproc: imx_rproc: add missing of_node_put
    https://git.kernel.org/andersson/remoteproc/c/6e962bfe56b9
  - [V3,2/4] remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
    https://git.kernel.org/andersson/remoteproc/c/f638a19775ae
  - [V3,3/4] remoteproc: imx_rproc: move memory parsing to rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/10a3d4079eae
  - [V3,4/4] remoteproc: imx_rproc: support remote cores booted before Linux Kernel
    https://git.kernel.org/andersson/remoteproc/c/5e4c1243071d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


