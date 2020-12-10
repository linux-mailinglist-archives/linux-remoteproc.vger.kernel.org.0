Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0247B2D6BA0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 11 Dec 2020 00:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbgLJXLw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 10 Dec 2020 18:11:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:33946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390369AbgLJWav (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:30:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607639410;
        bh=6f/lJgvg68Ilfv43DXH+vvq8Pw47u+/5K+HS9XNhfsc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gTOf8HJwQs+19b26oShdfyknzmbxm/860AAsyuBI0pSaYVSW2WLty3Aq/3nu4SzBl
         fEsJcPGP0icME8KIJ2ywM6y51Ph83KFavdVFULFA+7Jbt3gTy7/CBwKHBc0IjVs72i
         eBZTV5dYDnHIVrDmVy5VAyPpr5Iqd/HyavutQiVVnPNG/IVVU17aRPmzPp6nBiDOz/
         1nGZJRYUwLo2QUlAvDVq95I55nMLyphik6aZ9/++6o0DB9EXesQzM8b6upYVgkxbfP
         nHeeoGj3/GVkQ6fuv6pF1stHLq4AkQ3cqY4DepcuP+tWVqUbdjpxdn8PNLDirCpgUC
         zkNptWhRq+AKg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160763941081.7130.16199053287620253205.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Dec 2020 22:30:10 +0000
References: <20201210054109.587795-1-tzungbi@google.com>
In-Reply-To: <20201210054109.587795-1-tzungbi@google.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 10 Dec 2020 13:41:09 +0800 you wrote:
> The correct MT8192 CFG register base is 0x20000 off.  Changes the
> registers accordingly.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Here is the summary with links:
  - remoteproc/mediatek: change MT8192 CFG register base
    https://git.kernel.org/andersson/remoteproc/c/0a441514bc2b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


