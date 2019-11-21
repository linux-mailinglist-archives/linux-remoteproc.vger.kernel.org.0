Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD2C105965
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 Nov 2019 19:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfKUSUE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 Nov 2019 13:20:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbfKUSUE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Nov 2019 13:20:04 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574360404;
        bh=6qCUYWh1eO40z78+vgUC6rz/VunqpJmeUoKQSPa1Nus=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=w+ZnD4C1FHoGtw9y6C4zVkiIL2PdqlvGfHDy7+nVbdrNGCIwfm9zcCJa64fYRzWUh
         SqeaLTqHP59i4orXNF08ughIR8c/aoFem6sotA5IZFRBro83X4LcBgbFfwbHonxvJy
         B2EtemgrjDeMWTlxBjrla1t07h9Bc1b5g12LqdYY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: Fix Kconfig indentation
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157436040403.16867.9406941033394425417.git-patchwork-notify@kernel.org>
Date:   Thu, 21 Nov 2019 18:20:04 +0000
References: <20191120133945.13938-1-krzk@kernel.org>
In-Reply-To: <20191120133945.13938-1-krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 20 Nov 2019 21:39:44 +0800 you wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/rpmsg/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - rpmsg: Fix Kconfig indentation
    https://git.kernel.org/andersson/remoteproc/c/8cf9b615653e40debdcf3b6f1d69e6b580d71173

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
