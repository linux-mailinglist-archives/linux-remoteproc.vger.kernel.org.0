Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F5F2B7F68
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Nov 2020 15:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgKROaI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709806;
        bh=bInKburzFrWZlCPvspBJDRTTX4iNRmGkr4RC/DEbkcM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aNA952K7f7QMY52FVy0nWZgOx6eGv+Aj30cRviRQOr/hYTdLKcq44eekBFjbGm+Py
         W3otk4Lmzngq5AT5NMWvTfCuJMtu5AKCanx3EEK0MSTjGzbTzQfVTYeUgrwOukksKP
         cOV6y1nd5+LUowY7hLtwUSfLD+lITHLZqmFw+Iuc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] remoteproc: Constify static struct rproc_ops
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980683.9988.13943627937848448918.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:06 +0000
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sun,  8 Nov 2020 00:36:28 +0100 you wrote:
> Constify two static struct rproc_ops which are never modified. These two
> changes makes all static instances of rproc_ops in the kernel const.
> 
> Rikard Falkeborn (2):
>   remoteproc: ingenic: Constify ingenic_rproc_ops
>   remoteproc: stm32: Constify st_rproc_ops
> 
> [...]

Here is the summary with links:
  - [1/2] remoteproc: ingenic: Constify ingenic_rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/bb7eda7eddf1
  - [2/2] remoteproc: stm32: Constify st_rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/0eee3d28ff65

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


