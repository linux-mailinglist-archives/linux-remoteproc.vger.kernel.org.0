Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1802E6A29
	for <lists+linux-remoteproc@lfdr.de>; Mon, 28 Dec 2020 19:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgL1SzY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 28 Dec 2020 13:55:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:39006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728203AbgL1SzY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 13:55:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B77A022AAD;
        Mon, 28 Dec 2020 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609181683;
        bh=0bp9cELRHFGlkj4aKZ+BUVuA3EVqrkjNYE70HWfmWwk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aNnn1RKX7H5FbPaNyJqCaVfZK89GF8HQhZz+z4G+4EwVPSIUuSDVel2EaGmGRSh5u
         ObnSQO5feuYZkenNJn3QLkzqan80sa72edbx+GdeJfRIG4GxAOXSfNx+C1/s4mmacL
         HQvOIpf38eIZCWkZJduFnLqy5FOBiM+/VsHcPDUL+D1bxuFgDtnAlHQO5ylqUGmJSr
         q07iJKox4hL4re5MUs+W8nsWVTny/C02wJKd7MuR14yCHxmBpTB/sJ6q+agOzd0pLD
         zDP8vqei7qB8IopSb5wOvxD0p0aJ4TSsW8xsg90MHFQipJnisScsepd982YCOEkPlD
         AnKOwurEoIgoA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id AD0F360591;
        Mon, 28 Dec 2020 18:54:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2 0/9] Genpd related code changes to drop am335x pdata
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160918168370.4261.10714640125853225318.git-patchwork-notify@kernel.org>
Date:   Mon, 28 Dec 2020 18:54:43 +0000
References: <20201110112042.65489-1-tony@atomide.com>
In-Reply-To: <20201110112042.65489-1-tony@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 10 Nov 2020 13:20:33 +0200 you wrote:
> Hi all,
> 
> Here's v2 set of changes for v5.11 merge window to drop the remaining
> am335x platform data.
> 
> Changes since v1:
> - Simplify wkup_m3_rproc.c changes as suggested by Philipp Zabel
> - Do not configure pm_clk for omap_prm.c except for simple-pm-bus
> 
> [...]

Here is the summary with links:
  - [1/9] ARM: OMAP2+: Check for inited flag
    https://git.kernel.org/andersson/remoteproc/c/9261c5b2f519
  - [2/9] ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
    https://git.kernel.org/andersson/remoteproc/c/ae5f70f70788
  - [3/9] clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
    https://git.kernel.org/andersson/remoteproc/c/9fac08999c10
  - [4/9] bus: ti-sysc: Support modules without control registers
    https://git.kernel.org/andersson/remoteproc/c/2928135c93f8
  - [5/9] bus: ti-sysc: Implement GPMC debug quirk to drop platform data
    https://git.kernel.org/andersson/remoteproc/c/cfeeea60af2f
  - [6/9] soc: ti: omap-prm: Add pm_clk for genpd
    https://git.kernel.org/andersson/remoteproc/c/176958dd8ea4
  - [7/9] soc: ti: omap-prm: am3: add genpd support for remaining PRM instances
    https://git.kernel.org/andersson/remoteproc/c/f29ef9807f85
  - [8/9] soc: ti: pm33xx: Enable basic PM runtime support for genpd
    https://git.kernel.org/andersson/remoteproc/c/74033131d246
  - [9/9] remoteproc/wkup_m3: Use reset control driver if available
    https://git.kernel.org/andersson/remoteproc/c/57df7e370d2a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


