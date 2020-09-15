Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBAF269DA6
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Sep 2020 07:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgIOFAK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 15 Sep 2020 01:00:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbgIOFAI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 01:00:08 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600146008;
        bh=tlLUkh6eFvqO5CFgbf1QBzytPRGhklIQjPlaWNfVZa0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=u2PPDNva2t5YLGgm89GfYm+C93ttYOSIZ7daBliNMd07Bj51ALnKMZBM4kAGrgwQq
         0C4bmw9yV2l10B7rttTTCqnAHWdSu953IXedq0//k4tX8RhFv+9D5mCKjuxq0mCqfm
         eeHYd88HmhNxZRCAzRYjDsxRTVHOnEqgC28+f4Cs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: virtio: fix compilation warning for
 virtio_rpmsg_channel description
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014600804.14763.17918413271661760288.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 05:00:08 +0000
References: <20200731074850.3262-1-arnaud.pouliquen@st.com>
In-Reply-To: <20200731074850.3262-1-arnaud.pouliquen@st.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri, 31 Jul 2020 09:48:50 +0200 you wrote:
> Complete the virtio_rpmsg_channel structure description to fix a
> compilation warning with W=1 option:
> 
> drivers/rpmsg/virtio_rpmsg_bus.c:95: warning: Cannot understand
>  * @vrp: the remote processor this channel belongs to
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> 
> [...]


Here is a summary with links:
  - rpmsg: virtio: fix compilation warning for virtio_rpmsg_channel description
    https://git.kernel.org/andersson/remoteproc/c/6c09ea0b0aefda20d49e8d771f77a3e92f46b7d2

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
