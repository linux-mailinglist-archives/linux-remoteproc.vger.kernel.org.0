Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D1F19381B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Mar 2020 06:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCZFrA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Mar 2020 01:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgCZFrA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:47:00 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585201619;
        bh=f66f2WUjm2iM2+9aZeA4irlBMX5TfohVOZJh2DfD4lg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OoscNR4AppSZRtZ0idUphHq/lV24Rcloc32if4gwiuQ1oFpcrWHtLaxvUIq9kLwwG
         J31cLg+hYGNc8wd3fHT0n4IjI1eWLawc6WdjRUrPlHSHcCa09F4bTZuRsRyBBCgV1P
         4bhT14S66H6/MDLP0Mj9eEGpf2x2hnw/8RwDmlsI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/4] remoteproc: Panic handling
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158520161973.22016.9379591268245001299.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Mar 2020 05:46:59 +0000
References: <20200324052904.738594-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200324052904.738594-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 23 Mar 2020 22:29:00 -0700 you wrote:
> Add support for invoking a panic handler in remoteproc drivers, to allow them
> to invoke e.g. cache flushing on the remote processors in response to a kernel
> panic - to aid in post mortem debugging of system issues.
> 
> Bjorn Andersson (4):
>   remoteproc: Traverse rproc_list under RCU read lock
>   remoteproc: Introduce "panic" callback in ops
>   remoteproc: qcom: q6v5: Add common panic handler
>   remoteproc: qcom: Introduce panic handler for PAS and ADSP
> 
> [...]


Here is a summary with links:
  - [v5,1/4] remoteproc: Traverse rproc_list under RCU read lock
    https://git.kernel.org/andersson/remoteproc/c/c0abe2ca3605e4c4fb25bf69d0218c63baf71d2b
  - [v5,2/4] remoteproc: Introduce "panic" callback in ops
    https://git.kernel.org/andersson/remoteproc/c/dc5192c449368eed3385f4405670aa3ed21d6270
  - [v5,3/4] remoteproc: qcom: q6v5: Add common panic handler
    https://git.kernel.org/andersson/remoteproc/c/e9142f5c28e997ab45fac23bc27a3bc01725bb49
  - [v5,4/4] remoteproc: qcom: Introduce panic handler for PAS and ADSP
    https://git.kernel.org/andersson/remoteproc/c/717c21bad161dd7127f6e6acf86a3571e1102254

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
