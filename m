Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37C0217ECB4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 00:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgCIXkG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 9 Mar 2020 19:40:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727143AbgCIXkG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Mar 2020 19:40:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583797206;
        bh=Asv6sCb6E8whmkCnFkpg+DyVF4WwKOGCTGojOr0esps=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rx6tM6scpzuE4x3ozo4+BokQEson86wxxBlnLnWRC/84JUVOR+lBfDDCi5NHuWCke
         hFzJmNWEVoqdUTbUb7hrdsXSF1Xf+YNJGcknyYkY9LkuC1uihdKugKo7mV5ojGsjLx
         GGZoLIgMLMPaosFAviymggHU9njqQH8KePktmzDI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: fix kernel-doc warnings
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158379720595.7411.17212679414987470499.git-patchwork-notify@kernel.org>
Date:   Mon, 09 Mar 2020 23:40:05 +0000
References: <20200212161956.10358-1-arnaud.pouliquen@st.com>
In-Reply-To: <20200212161956.10358-1-arnaud.pouliquen@st.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 12 Feb 2020 17:19:56 +0100 you wrote:
> Fix the following warnings when documentation is built:
> drivers/remoteproc/remoteproc_virtio.c:330: warning: Function parameter
> or member 'id' not described in 'rproc_add_virtio_dev'
> drivers/remoteproc/remoteproc_core.c:243: warning: Function parameter
> or member 'name' not described in 'rproc_find_carveout_by_name'
> drivers/remoteproc/remoteproc_core.c:473: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_vdev'
> drivers/remoteproc/remoteproc_core.c:604: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_trace'
> drivers/remoteproc/remoteproc_core.c:678: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_devmem'
> drivers/remoteproc/remoteproc_core.c:873: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_carveout'
> drivers/remoteproc/remoteproc_core.c:1029: warning: cannot understand function
> prototype: 'rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = '
> drivers/remoteproc/remoteproc_core.c:1693: warning: Function parameter
> or member 'work' not described in 'rproc_crash_handler_work'
> 
> [...]


Here is a summary with links:
  - [v2] remoteproc: fix kernel-doc warnings
    https://git.kernel.org/andersson/remoteproc/c/9307a1578aea8ff949b20cf896c46d7020f7b639

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
