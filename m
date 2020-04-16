Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEA51AD311
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 01:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgDPXHa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 19:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728167AbgDPXH3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587078449;
        bh=r4u6FyzfhN84oyck8D9HcehXnyK89YUS1DZOAHgDC0Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=1C9Q6We13svLoJipYviwfZUTcS8bGhtiOrzI+aMnR414r1AovJ0+0oBNvFjIz9E0p
         PI+NtHFZWigZ8ZO5sT28XHsWUWwdq4CxfYImKKUlaQGD26Qb1c24ml37uVMc7QiL2X
         Vpy9AVei+hZeW0C4baqSRuR2o+EtIU8WJpA//LhU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/3] Introduce Protection Domain Restart (PDR) Helpers
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844965.17838.12465981439547329890.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Apr 2020 23:07:29 +0000
References: <20200312120842.21991-1-sibis@codeaurora.org>
In-Reply-To: <20200312120842.21991-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 12 Mar 2020 17:38:39 +0530 you wrote:
> Qualcomm SoCs (starting with MSM8998) allow for multiple protection
> domains (PDs) to run on the same Q6 sub-system. This allows for
> services like AVS AUDIO to have their own separate address space and
> crash/recover without disrupting the other PDs running on the same Q6
> ADSP. This patch series introduces pdr helper library and adds PD
> tracking functionality for "avs/audio" allowing apr services to register
> themselves asynchronously once the dependent PDs are up.
> 
> [...]


Here is a summary with links:
  - [v7,1/3] soc: qcom: Introduce Protection Domain Restart helpers
    https://git.kernel.org/andersson/remoteproc/c/fbe639b44a82755d639df1c5d147c93f02ac5a0f
  - [v7,2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
    https://git.kernel.org/andersson/remoteproc/c/a03a5b6313c210565605a5dbf5d3e463c1fd5d30
  - [v7,3/3] soc: qcom: apr: Add avs/audio tracking functionality
    https://git.kernel.org/andersson/remoteproc/c/83473566260288c560e5443ea4cc40a458aa9e6a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
