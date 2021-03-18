Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149A534067D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Mar 2021 14:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhCRNKZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 18 Mar 2021 09:10:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:58364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231448AbhCRNKQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 09:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8330964EED;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616073016;
        bh=CSo547muX/SlzZRiuJPqWVaPpY9sdy2T+eD8889sJWU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IDcnIbZYPXzLR1AEd4J0PQjrsaWFMUuM7foZCxcgvVDkPSUIot/JfTUjjkomWtBOM
         K4NBxkT1Nh4mYR3NzK+eXi7FP9CIZZHmQvWiNBcqEaQsvZIZ4BIRy16LHA6V/vmd81
         JQdkZeXKSkWYZv/KD1DfL5oWwE4BU7xfgp0Sf4t9/UjgU2dWou2l7hrX8xwN3vhF7z
         YitKpEcl+HmDSNAW8hF9My6QKFalJjuXikFPHwTvseWkAGei9BN4tpQtHJuS/Otgyy
         1/jGEHNxeZy8dULwLEJVmgrGQU0pgrgIcXBH5c2nF6EF+K8XjqjoYNNXHQu7w+Idfp
         2Jny+DspfNb0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7401A6098E;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: char: return an error if device already open
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607301647.31848.9009108925239145042.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 13:10:16 +0000
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 6 Jan 2021 14:37:14 +0100 you wrote:
> The rpmsg_create_ept function is invoked when the device is opened.
> As only one endpoint must be created per device. It is not
> possible to open the same device twice.
> The fix consists in returning -EBUSY when device is already
> opened.
> 
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> [...]

Here is the summary with links:
  - rpmsg: char: return an error if device already open
    https://git.kernel.org/andersson/remoteproc/c/964e8bedd5a1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


