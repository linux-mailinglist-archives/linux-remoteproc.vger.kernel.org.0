Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDF52D6BA1
	for <lists+linux-remoteproc@lfdr.de>; Fri, 11 Dec 2020 00:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388801AbgLJXLx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 10 Dec 2020 18:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:33940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390362AbgLJWav (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:30:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607639410;
        bh=Vc3SiGFOwhHAhkN7Y8ucCdaVE/JCJB/gFg8qjb/GZzY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VuGkp+fbzQ5YwYpofQ1jOWn+nNgzsOdwF3upbwIcrSt0rIY/hjkdF3zxdsPQhswdu
         a6mNCIh2CowH2kzo/KUommYW/4YmcX/WCosTD08iF2carYrn/ujuk8vNq5ynVbXbwy
         kdAZRLfVJj7eTpPJFF/4964avTqXGXrFnyZfr+nm8nD4iNpsRlNk3+m+8WkwYspd61
         jAycbADaxIksGV4CyioqZ691jk3IJfsphpFtKJ3/DhUH0SasCi3RZVIOh80wxeD53+
         iwb0086M2Xi5tw0HexGiiEPXLxwvNALAihlqu+4dB72iSFBlndGxYkhmaueJzes5Im
         e5/S6ZbfLuXGg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: Fix potential NULL dereference in
 adsp_init_mmio()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160763941076.7130.10148757617520446304.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Dec 2020 22:30:10 +0000
References: <1607392460-20516-1-git-send-email-zhangchangzhong@huawei.com>
In-Reply-To: <1607392460-20516-1-git-send-email-zhangchangzhong@huawei.com>
To:     Zhang Changzhong <zhangchangzhong@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 8 Dec 2020 09:54:20 +0800 you wrote:
> platform_get_resource() may fail and in this case a NULL dereference
> will occur.
> 
> Fix it to use devm_platform_ioremap_resource() instead of calling
> platform_get_resource() and devm_ioremap().
> 
> This is detected by Coccinelle semantic patch.
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: Fix potential NULL dereference in adsp_init_mmio()
    https://git.kernel.org/andersson/remoteproc/c/c3d4e5b12672

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


