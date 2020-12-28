Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CF12E6A22
	for <lists+linux-remoteproc@lfdr.de>; Mon, 28 Dec 2020 19:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgL1SzY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 28 Dec 2020 13:55:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:39010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728116AbgL1SzY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 13:55:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C3B8322AEC;
        Mon, 28 Dec 2020 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609181683;
        bh=ySo1Cm+PFwF00BsOWRXV3KpcqMsg9bloDDl17qnHUIk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ua6wnLVtUI0kkkpwAorsUdNmwLcUJPz5xGYvKd1vKTSNzE+K4IOG/sKPGo1qgZPag
         Bacn9VcnfTh9jXArkgF4OTHxSQjWPl37F11bcPV7dukSvci6NWMhQK49k196X6OW40
         xb8clyVRXfpZ9V+QN4DAjfFHy37usl433ViK4HNGSz+Kj5fqS2MmXuRsyRL0MfUoAr
         qtWPTt4zjH8Y26e2vgZ4dlmeD3XsB9oTKg6s2o7HUVUyAYETekiVLy3EoAfU0C7szy
         g+dvBlvUSVoow83xU0ohhtZbzE24WsFv1imXg0UitkDTGopcv/wwhaAylCJZE84+ec
         wxCfCY5pHdbpA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B926660108;
        Mon, 28 Dec 2020 18:54:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation for
 rproc serial
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160918168375.4261.7525417768126390145.git-patchwork-notify@kernel.org>
Date:   Mon, 28 Dec 2020 18:54:43 +0000
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
In-Reply-To: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 04 Nov 2020 15:31:36 +0000 you wrote:
> Since commit 086d08725d34 ("remoteproc: create vdev subdevice with
> specific dma memory pool"), every remoteproc has a DMA subdevice
> ("remoteprocX#vdevYbuffer") for each virtio device, which inherits
> DMA capabilities from the corresponding platform device. This allowed
> to associate different DMA pools with each vdev, and required from
> virtio drivers to perform DMA operations with the parent device
> (vdev->dev.parent) instead of grandparent (vdev->dev.parent->parent).
> 
> [...]

Here is the summary with links:
  - [virtio] virtio: virtio_console: fix DMA memory allocation for rproc serial
    https://git.kernel.org/andersson/remoteproc/c/9d516aa82b7d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


