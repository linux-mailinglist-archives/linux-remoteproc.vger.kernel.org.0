Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED2724214A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Aug 2020 22:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgHKU1W (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Aug 2020 16:27:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgHKU1W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 16:27:22 -0400
Subject: Re: [GIT PULL] rpmsg updates for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597177641;
        bh=wVlYOKzby7gO7RECzcBPbA8Hm0bfz43GeglDMXV4mAE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nbI6igaqtKfId79z26+SOOb3dKYWJ3S9OExm1tEf+wCCg62XaI8k8d/BIPVKOSLPL
         xLUF9kZ6I6Orn3W56ekLOZ+pJXzlpDZeMqmZDsNS3TGaStDSAczNKGHRZIbJxDnw2y
         lE9bgkLaazDPWmWGIqjd244cofIjeXdELNTE8lNI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200811052801.404208-1-bjorn.andersson@linaro.org>
References: <20200811052801.404208-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200811052801.404208-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.9
X-PR-Tracked-Commit-Id: 111d1089700cdb752681ef44f54ab6137736f5c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dded87afdacf8fe129fe13fe61d0a21e2afff3f6
Message-Id: <159717764166.9233.10489762359962840800.pr-tracker-bot@kernel.org>
Date:   Tue, 11 Aug 2020 20:27:21 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon, 10 Aug 2020 22:28:01 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dded87afdacf8fe129fe13fe61d0a21e2afff3f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
