Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F58E22476F
	for <lists+linux-remoteproc@lfdr.de>; Sat, 18 Jul 2020 02:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgGRAUH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Jul 2020 20:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgGRAUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 20:20:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595031606;
        bh=ny7eOIZso/SXfx6ujzSKGgslbBNXTZ0CRpfebPISmxc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DczfeivOSMzw3juolvXF9aQ/a/CRpdkxmjYlhBtAeweCV3vR0avAosnyUihERyA0H
         Um8b5Xnvti5w2umC2GXxexquD0U7KXY0hmxxinSq08RIkcIVJnfLu2Q78T/5iRqKiq
         jSXLUBm9CM/3ZQfwo91Qc+rXZS4KcivKp3NxiKsg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/9] remoteproc: Add support for attaching with rproc
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159503160649.20678.6713482814298871841.git-patchwork-notify@kernel.org>
Date:   Sat, 18 Jul 2020 00:20:06 +0000
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 14 Jul 2020 13:50:26 -0600 you wrote:
> This set provides functionality allowing the remoteproc core to attach to
> a remote processor that was started by another entity.
> 
> New in V6:
> 1) Added Arnaud's reviewed-by and tested-by tags.
> 
> Applies cleanly on rproc-next (0cf17702d872)
> 
> [...]


Here is a summary with links:
  - [v6,1/9] remoteproc: Add new RPROC_DETACHED state
    https://git.kernel.org/andersson/remoteproc/c/e2e5c55eed8023ecfbf4c9b623ef7dec343d1845
  - [v6,2/9] remoteproc: Add new attach() remoteproc operation
    https://git.kernel.org/andersson/remoteproc/c/a6a4f2857524007848f7957af432cddb4d43b593
  - [v6,3/9] remoteproc: Introducing function rproc_attach()
    https://git.kernel.org/andersson/remoteproc/c/d848a4819d858973952de181314de6d05512fb98
  - [v6,4/9] remoteproc: Introducing function rproc_actuate()
    https://git.kernel.org/andersson/remoteproc/c/fdf0e00ed646fc94ab27e7d46fac983b1533a761
  - [v6,5/9] remoteproc: Introducing function rproc_validate()
    https://git.kernel.org/andersson/remoteproc/c/88d3a1360755b7dd88a737ef2cd966a54c932682
  - [v6,6/9] remoteproc: Refactor function rproc_boot()
    https://git.kernel.org/andersson/remoteproc/c/0f9dc562b721aa1c0190ffe9f32aa0fcd7b8f2e8
  - [v6,7/9] remoteproc: Refactor function rproc_trigger_auto_boot()
    https://git.kernel.org/andersson/remoteproc/c/e3d2193959824e2119996fe361f92b34750de2b0
  - [v6,8/9] remoteproc: Refactor function rproc_free_vring()
    https://git.kernel.org/andersson/remoteproc/c/4d3ebb3b99905e0e1c83b320764495f5fc3f93fe
  - [v6,9/9] remoteproc: Properly handle firmware name when attaching
    https://git.kernel.org/andersson/remoteproc/c/4a4dca1941fedc1b02635ff0b4ed51b9857d0382

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
