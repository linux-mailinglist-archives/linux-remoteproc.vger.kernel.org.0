Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3407B3B4AC1
	for <lists+linux-remoteproc@lfdr.de>; Sat, 26 Jun 2021 00:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFYWwZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 25 Jun 2021 18:52:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229816AbhFYWwZ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 18:52:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BD16161931;
        Fri, 25 Jun 2021 22:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624661403;
        bh=94aAGsHTF06yymffsvS6Kw27WsMMGuL/TUHInF2zErU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bNeE9Ox0Cx0agE7zemPbLomdjQ3ZLp4hZ3Tm8aDZPwEW+9+/PiMw25wLfO8G3AxFY
         xVTDAVyxrJhPcETklX6MPE+i/Hw/fIe4mm4U2L77c1c6tfS4cEUcrH8IiN1FhrGe/1
         r4oKpIYIWQKmH4NTAH2p3dqg+gXS+Ii5L6bFPh18On53nqDrmNwQfq1TjGS+eR0PgR
         fcyWe9y4qYoqzYsNX/MUSVZ5Rdb75J1gr/cnEo86LJOetBG8IAtcMUvrMXpPZBpoEF
         lcoUxpWN+MRAxnmqwWkvf3aMpV2Gi1dLb6+jzAdP+PUi577XBH2pGqP/zNV6GCDRXc
         KgQdgk1XRURUQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B1BD160A37;
        Fri, 25 Jun 2021 22:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: pas: Add SC8180X adsp,
 cdsp and mpss
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162466140372.17852.13507418543100942030.git-patchwork-notify@kernel.org>
Date:   Fri, 25 Jun 2021 22:50:03 +0000
References: <20210608174944.2045215-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210608174944.2045215-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue,  8 Jun 2021 10:49:43 -0700 you wrote:
> Add compatibles for the Audio DSP, Compute DSP and Modem subsystem found
> in the Qualcomm SC8180x to the Peripheral Authentication Service
> remoteproc binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss
    https://git.kernel.org/andersson/remoteproc/c/4865ed136045
  - [v2,2/2] remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss
    https://git.kernel.org/andersson/remoteproc/c/aef6a521e5bf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


