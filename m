Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486301D070E
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 08:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgEMGUJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 02:20:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:43900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgEMGUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 02:20:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589350807;
        bh=ySVR9vavCdcC0lo1SZsXzRk0+QRNJyrxvijcR8QvNfk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=efNWRi1CDhG8vPdxYiM/LxguPU4ZZziQ0qb3IXr6q+2kCNE4slXbp1Rx3XYzZO5pL
         8Q9Ny932bCvxgfSuqAPCWLzU+c/4OUc+jAQdpBoCoDgWSVJhxUV/KyExEqI9tACMp7
         v8hHqUA0eAw6GulPIHpyGzcpZrpiV/vDTRYePNWw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: wcss: add support for rpmsg communication
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158935080761.26945.15636027701860531952.git-patchwork-notify@kernel.org>
Date:   Wed, 13 May 2020 06:20:07 +0000
References: <1588350492-4663-1-git-send-email-sivaprak@codeaurora.org>
In-Reply-To: <1588350492-4663-1-git-send-email-sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri,  1 May 2020 21:58:12 +0530 you wrote:
> add glink and ssr subdevices for wcss rproc to enable rpmsg
> communication.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++++
>  1 file changed, 6 insertions(+)


Here is a summary with links:
  - remoteproc: wcss: add support for rpmsg communication
    https://git.kernel.org/andersson/remoteproc/c/8a226e2c71bb3763e27a063d36eac5fa4ea53c3f

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
