Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9385A34067F
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Mar 2021 14:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhCRNKY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 18 Mar 2021 09:10:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231439AbhCRNKQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 09:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 74ADA64E86;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616073016;
        bh=o+IFS7RCjK6mYPJ3My8i2HGJue0E7BYQ9hcD7U6w5bU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GhGYVJm58YjpkUDHjZnLqA6X2MtPOPrr5goQIYUETIsAFZ14KJ8vhtoETM2v+FQw7
         U6kL/i2as8whd0pAm/aif6c82G9hI44VL1+LFrQVyrLi1UXudUCiOqgmVBO5yAly3x
         BfbpGwpMf4kWZNGWLJOMQNAgS2jQSeFXel6w28Be3r/t0TkUajIYrjGn5JkD2Ffj2v
         ls5/mYbFVPluCzJxdqau8rfaIPRZvUnLhaUZupOemBiCfktYpnCQiVm6h2nou3CT8i
         iLefloffn+nGTa1RLhARRANLH9ywj3Ajh3X4SqL4zJvlWczeoiu2YUif3NcLe0JIqI
         VfBK6KC5s3BcQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6530F60951;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Provide errors for firmware-name
 parsing
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607301641.31848.7826095241271166731.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 13:10:16 +0000
References: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 11 Mar 2021 16:26:05 -0800 you wrote:
> Failing to read the "firmware-name" DT property without informing the
> developer is annoying, add some helpful debug prints.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Here is the summary with links:
  - remoteproc: qcom_q6v5_mss: Provide errors for firmware-name parsing
    https://git.kernel.org/andersson/remoteproc/c/9af2a2a9c64e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


