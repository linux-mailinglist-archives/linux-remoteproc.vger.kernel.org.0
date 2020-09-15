Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB8F269DA3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 15 Sep 2020 07:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgIOFAJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 15 Sep 2020 01:00:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgIOFAH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 01:00:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600146007;
        bh=ds+G6rNf9ikqV7cYKQYbTfeiEkVs46OoSjx29fs01gE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bvvWebOUdFkMPGGCrm1i3xcF0zKvi2V/q+8iip+yzduCIfXiflKndJg5mDgMECtfq
         Zp4WccDTSJFQQYNgTpmuxe0VkabwsXmR5CB+5yiR5CyKuJm2QetUrLmNhahIwxbxVB
         Se1C/8G+5V7HsOpt+T8ea9ANTRrmdfp0Mq0zs+i8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] rpmsg: Avoid double-free in mtk_rpmsg_register_device
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014600753.14763.10108949218439016935.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 05:00:07 +0000
References: <20200903080547.v3.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
In-Reply-To: <20200903080547.v3.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu,  3 Sep 2020 08:05:58 +0800 you wrote:
> If rpmsg_register_device fails, it will call
> mtk_rpmsg_release_device which already frees mdev.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> [...]


Here is a summary with links:
  - [v3] rpmsg: Avoid double-free in mtk_rpmsg_register_device
    https://git.kernel.org/andersson/remoteproc/c/231331b2dbd71487159a0400d9ffd967eb0d0e08

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
