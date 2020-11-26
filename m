Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9282C5AD0
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Nov 2020 18:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391696AbgKZRkG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Nov 2020 12:40:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:34406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391694AbgKZRkG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:40:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606412405;
        bh=fpPmvvwxPBvLDgKzsATjOaheLBKcbbfUS2ZQDxY4g50=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=h8TUk0KEEVl6lp8OI9OqNGIzUlq+WDfOpmkIaQhAXsIHt37VgZ4+b6C89/3xT/s0H
         c1Hjm9MCL5j302Oy8KJhbBiLoHqspOn1GiBmgS7H0DtAtifZbHy8O7YyfsdlGhyFV+
         4FE8ZgvNQ4S7fWYp/vV588NXL9twMFNUQvpxBKy8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] TI K3 R5F remoteproc support on J7200 SoCs
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160641240572.5337.14819862757502229008.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 17:40:05 +0000
References: <20201119010531.21083-1-s-anna@ti.com>
In-Reply-To: <20201119010531.21083-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 18 Nov 2020 19:05:28 -0600 you wrote:
> Hi All,
> 
> The following series enhances the K3 R5F remoteproc driver to add support
> for the R5F clusters on the newer TI K3 J7200 SoC family. The J7200 SoCs
> have 2 R5FSS clusters, and both clusters are capable of supporting either
> the LockStep or Split-modes like on the existing AM65x and J721E SoCs.
> 
> [...]

Here is the summary with links:
  - [1/3] dt-bindings: remoteproc: k3-r5f: Update bindings for J7200 SoCs
    https://git.kernel.org/andersson/remoteproc/c/41e6f43f3b24
  - [2/3] remoteproc: k3-r5: Extend support to R5F clusters on J7200 SoCs
    https://git.kernel.org/andersson/remoteproc/c/7508ea19b20d
  - [3/3] remoteproc: k3-r5: Adjust TCM sizes in Split-mode on J7200 SoCs
    https://git.kernel.org/andersson/remoteproc/c/c3c21b356505

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


