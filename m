Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1881228ED9
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jul 2020 06:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgGVEAD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Jul 2020 00:00:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbgGVEAC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jul 2020 00:00:02 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595390402;
        bh=Gnne1y4BtWHReehRiPBbwJSOdU35mNHaVA2PWtNKh6c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=an89nbYP+9awVehzN6Nz8Daxfqy+J/k6Q/m2nSvX0MPP5gVLCLnbWD/csRyKdqG/z
         wdsKDCTTY6yV0ZWOOgVrE+cy31GMpAnChp1vbatcQXO9jPildLGyrr/qnTI8Dx3OG1
         K4cWH7hMzFcxflXGw8tc7ZAk09B5sYLIzlFnaREg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v4] rpmsg: virtio: add endianness conversions
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159539040245.7019.10247263623360364037.git-patchwork-notify@kernel.org>
Date:   Wed, 22 Jul 2020 04:00:02 +0000
References: <20200721085638.GA3815@ubuntu>
In-Reply-To: <20200721085638.GA3815@ubuntu>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 21 Jul 2020 10:56:38 +0200 you wrote:
> According to the VirtIO 1.0 spec data, sent over virtual queues must
> be in little-endian format. Update the RPMsg VirtIO implementation
> to enforce that but let legacy configurations continue use native
> endianness.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> 
> [...]


Here is a summary with links:
  - [RESEND,v4] rpmsg: virtio: add endianness conversions
    https://git.kernel.org/andersson/remoteproc/c/111d1089700cdb752681ef44f54ab6137736f5c2

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
