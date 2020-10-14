Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A9028D74F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Oct 2020 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgJNAKF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Oct 2020 20:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602634204;
        bh=DKoAPElv8St0YxRdtTo8ELLcCe58ZsHKJCuDwRPxgOY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=r+/l2BmHERvSIYhXN09hXb/PV0eHus19OHpWnESahmOQVikxlNu82lNBcyYyxDyGB
         pBaFmyEqYRlf/s1SZgORD7mSDI5VWBj+NvqdZJkACfPJYjXaWxYYRvceKlallowb3g
         LHjcjwmK++JH/XeDq+HtGO6LgLjYeK7gzRnYpy+E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: fix null pointer dereference on null scp
 pointer
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160263420472.29882.481014245330242078.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Oct 2020 00:10:04 +0000
References: <20200918152428.27258-1-colin.king@canonical.com>
In-Reply-To: <20200918152428.27258-1-colin.king@canonical.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 18 Sep 2020 16:24:28 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when pointer scp is null a dev_err is being called that
> references the pointer which is the very thing we are trying to
> avoid doing. Remove the extraneous error message to avoid this
> issue.
> 
> [...]

Here is the summary with links:
  - remoteproc/mediatek: fix null pointer dereference on null scp pointer
    https://git.kernel.org/andersson/remoteproc/c/434ac4d51407

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


