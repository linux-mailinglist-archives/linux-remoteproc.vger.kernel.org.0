Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5E528D74D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Oct 2020 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727157AbgJNAKF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Oct 2020 20:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602634204;
        bh=IDIOpftfh2j7Yua/hVu2Ofs9UC2FTlOniKQbKz9LjpU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=V4MQ3dUaq7cSP0dznm4C+2qtu1i0xeXHXvveTrsGYUxpSpt6gqcjDEHSs2bvuIYAW
         ZFlQHksgsz2CYRcwwyuklluxq6XzhunfI1q7+/OMur7NZh8v1s0HqWWXTcXB4KBwEy
         GCD+Pez9CbMZHprxPUDi/dYOAtUYYhtpHP+sLrBY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/4] TI K3 R5F remoteproc support
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160263420460.29882.3026947061831312564.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Oct 2020 00:10:04 +0000
References: <20201002234234.20704-1-s-anna@ti.com>
In-Reply-To: <20201002234234.20704-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 2 Oct 2020 18:42:30 -0500 you wrote:
> Hi Bjorn,
> 
> The following is v5 of the TI K3 R5F remoteproc driver series supporting all
> the R5F processor clusters/subsystems on TI AM65x and J721E SoCs. Please
> see the v1 cover-letter [1] for the features supported on these R5F processors.
> 
> This series has only 1 line change w.r.t v4 version [4], the example in
> dt-bindings is updated to fix couple of dt_binding_check warnings when
> applied against the latest linux-next version due to a base TI binding
> conversion to YAML.
> 
> [...]

Here is the summary with links:
  - [v5,1/4] dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs
    https://git.kernel.org/andersson/remoteproc/c/5ee79c2ed5bd
  - [v5,2/4] remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem
    https://git.kernel.org/andersson/remoteproc/c/6dedbd1d5443
  - [v5,3/4] remoteproc: k3-r5: Initialize TCM memories for ECC
    https://git.kernel.org/andersson/remoteproc/c/34f2653686fe
  - [v5,4/4] remoteproc: k3-r5: Add loading support for on-chip SRAM regions
    https://git.kernel.org/andersson/remoteproc/c/ea47c6887b6d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


