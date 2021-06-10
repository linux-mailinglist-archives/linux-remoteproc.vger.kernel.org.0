Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1063A331D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 10 Jun 2021 20:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhFJScB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 10 Jun 2021 14:32:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhFJScB (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Jun 2021 14:32:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E058C61419;
        Thu, 10 Jun 2021 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623349804;
        bh=Uj1eVvlwnsMjSlJpOlq0Y6DG9P0cabJGsLYzFT3T2o8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tObd8DMFaj0yDSSgRT1Hh133V/7Ja6aIM8oeTUueFESnGFUtlnnV442J2d8c6jP76
         PlEl7hpvsj9FcrpKNBrJ5BwN0du9gkIpH0d7aNXabJvI3FTCRoQLqm7nMKXy1e5W5U
         zp88E98oKbdJjgfLXfyJjgsiHTyC80qWE0mwVwNP83E97OsjWiFUDX9HjRZjY96ytL
         qQdUljGkYGsib9X3DvE75PhMrNfM4lV2rwpd4QVap7jnFHJRsVClceQ+DXyNTRPSXA
         V8b7/Igd5utOH/TqiEtdEUSiSoAgVZhIOMaLjmgVXSWgur5+PCyYUnbOqXlP/U3WLx
         XTFlUESXtrfBw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DA7A060A6C;
        Thu, 10 Jun 2021 18:30:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: imx-rproc: Fix IMX_REMOTEPROC configuration
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162334980489.1903.5853362106375793238.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 18:30:04 +0000
References: <20210610031530.26326-1-peng.fan@oss.nxp.com>
In-Reply-To: <20210610031530.26326-1-peng.fan@oss.nxp.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 10 Jun 2021 11:15:30 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When CONFIG_IMX_REMOTEPROC is y and CONFIG_HAVE_ARM_SMCCC
> is not set, compiling errors are encountered as follows:
> 
> drivers/remoteproc/imx_rproc.o: in function `imx_rproc_stop':
> imx_rproc.c:(.text+0x140): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/imx_rproc.o: in function `imx_rproc_detect_mode':
> imx_rproc.c:(.text+0x272): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/imx_rproc.o: in function `imx_rproc_start':
> imx_rproc.c:(.text+0x5e0): undefined reference to `__arm_smccc_smc'
> 
> [...]

Here is the summary with links:
  - remoteproc: imx-rproc: Fix IMX_REMOTEPROC configuration
    https://git.kernel.org/andersson/remoteproc/c/1cd6239426a4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


