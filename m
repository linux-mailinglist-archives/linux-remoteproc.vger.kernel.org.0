Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EB51AD312
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 01:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgDPXHa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 19:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbgDPXH3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587078449;
        bh=7N4Y7wmCCNQlFU8MuPplABmwwxJu59fobva+jxydexs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=glxXT9W+EIvOFw46lV4BEgpHVOERkkvrryJXlpo8QJ2a2T1EHM3K10dwpf3xU1bsN
         RQRSAzF598RXp0WGawwUID0l62vKRKtD5rZ/GX3jQzL0e+zpgDwm/twe1cKaEbAmbr
         TCKqr6xQU28aZJRiOvp4Ov3Q8SieM1++pHEeC6r0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: clean up notification config
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844908.17838.9038914705270378769.git-patchwork-notify@kernel.org>
Date:   Thu, 16 Apr 2020 23:07:29 +0000
References: <20200316225121.29905-1-elder@linaro.org>
In-Reply-To: <20200316225121.29905-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 16 Mar 2020 17:51:21 -0500 you wrote:
> Rearrange the config files for remoteproc and IPA to fix their
> interdependencies.
> 
> First, have CONFIG_QCOM_Q6V5_MSS select QCOM_Q6V5_IPA_NOTIFY so the
> notification code is built regardless of whether IPA needs it.
> 
> Next, represent QCOM_IPA as being dependent on QCOM_Q6V5_MSS rather
> than setting its value to match QCOM_Q6V5_COMMON (which is selected
> by QCOM_Q6V5_MSS).
> 
> [...]


Here is a summary with links:
  - [v2] remoteproc: clean up notification config
    https://git.kernel.org/andersson/remoteproc/c/5e0ef51b161c79e1c768d240b38837bdc06e0506

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
