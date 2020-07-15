Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D430221543
	for <lists+linux-remoteproc@lfdr.de>; Wed, 15 Jul 2020 21:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGOTkD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 15 Jul 2020 15:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:48910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgGOTkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Jul 2020 15:40:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594842002;
        bh=MrSY03bTjh7xYACNpg/WhRc9O78b64kIlHzXCZlwai4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZMrCjvE1P4kwvIAt5QK6yKdF7hVeqFdPqtYK5gtIXcrHnl7WXn9T94x+Z2ysaohAj
         TaBcvUc2VrpKM6Fvcn5nDeHRdzWGBeHedDAx+liu3UGgb7x2Daw7SNynbqWO+jM9wK
         +gQH/aTsIxqmbETfRUGDoc7+G7XtlBSKcavEeun4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] remoteproc: remoteproc_core: Use 'gnu_printf' format notation
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159484200274.30575.12937428171208697619.git-patchwork-notify@kernel.org>
Date:   Wed, 15 Jul 2020 19:40:02 +0000
References: <20200715123551.4011154-1-lee.jones@linaro.org>
In-Reply-To: <20200715123551.4011154-1-lee.jones@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 15 Jul 2020 13:35:50 +0100 you wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/remoteproc/remoteproc_core.c: In function ‘rproc_find_carveout_by_name’:
>  drivers/remoteproc/remoteproc_core.c:257:2: warning: function ‘rproc_find_carveout_by_name’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
>  257 | vsnprintf(_name, sizeof(_name), name, args);
>  | ^~~~~~~~~
>  drivers/remoteproc/remoteproc_core.c: In function ‘rproc_mem_entry_init’:
>  drivers/remoteproc/remoteproc_core.c:993:2: warning: function ‘rproc_mem_entry_init’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
>  993 | vsnprintf(mem->name, sizeof(mem->name), name, args);
>  | ^~~~~~~~~
>  drivers/remoteproc/remoteproc_core.c: In function ‘rproc_of_resm_mem_entry_init’:
>  drivers/remoteproc/remoteproc_core.c:1029:2: warning: function ‘rproc_of_resm_mem_entry_init’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
>  1029 | vsnprintf(mem->name, sizeof(mem->name), name, args);
>  | ^~~~~~~~~
> 
> [...]


Here is a summary with links:
  - [1/2] remoteproc: remoteproc_core: Use 'gnu_printf' format notation
    https://git.kernel.org/andersson/remoteproc/c/7e05c8de132308da0c2a5b17842b808d99a00ca8
  - [2/2] remoteproc: qcom_sysmon: Solve function header bitrot issues
    https://git.kernel.org/andersson/remoteproc/c/5b435ca38b2ce785b60b4d3c230f0a21121d6728

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
