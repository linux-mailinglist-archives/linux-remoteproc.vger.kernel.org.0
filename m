Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934661B1C7E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Apr 2020 05:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgDUDUE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Apr 2020 23:20:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgDUDUE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 23:20:04 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587439204;
        bh=/X67kLBN8Oi62tA4YijqDOJEhXCRqBehSW3f2tYs3RM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=izwv3fcUFYBZXxS8EDXTZR6b6L+XIFmqeUY0sKyhix/M5asbb5dw8kq6T2L4TgwVl
         hwu+xHwj8A+OrbpK4pNEDzU68aBbru3640NxsV+lMUh9pPwqM7D8/2d/jjZimqZRGT
         GhiKqeC1k2w4xy0zuBzdu/Tk3lp0H/sdkSLQv9SQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] remoteproc: Refactor function rproc_alloc()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158743920429.29152.8654726851018507112.git-patchwork-notify@kernel.org>
Date:   Tue, 21 Apr 2020 03:20:04 +0000
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200420231601.16781-1-mathieu.poirier@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 20 Apr 2020 17:15:57 -0600 you wrote:
> These are the remaining patches from the second version [1] that have
> not been applied yet.
> 
> Applies cleanly on rproc-next (3898fc99d199)
> 
> Thanks,
> Mathieu
> 
> [...]


Here is a summary with links:
  - [v3,1/4] remoteproc: Use kstrdup_const() rather than kstrdup()
    https://git.kernel.org/andersson/remoteproc/c/1487deda19c82d30d1867277e89bc2d515b9d2d4
  - [v3,2/4] remoteproc: Restructure firmware name allocation
    https://git.kernel.org/andersson/remoteproc/c/9d5f82c8ba2471e34150a0e750ef54089e2a3740
  - [v3,3/4] remoteproc: Split rproc_ops allocation from rproc_alloc()
    https://git.kernel.org/andersson/remoteproc/c/bf860aa176d0104cfbaf863acbadf5548f1172c2
  - [v3,4/4] remoteproc: Get rid of tedious error path
    https://git.kernel.org/andersson/remoteproc/c/226f5db4212438cdfe1a94652d74c6c01788a837

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
