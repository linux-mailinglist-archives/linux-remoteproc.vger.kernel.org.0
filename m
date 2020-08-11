Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9815E242149
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Aug 2020 22:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHKU1X (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Aug 2020 16:27:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgHKU1X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 16:27:23 -0400
Subject: Re: [GIT PULL] remoteproc updates for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597177642;
        bh=nutYRSF7y6l/bwrSwD24SJ2UKaP+M5t5tkEW8UWPdAw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=RUBVRy1yLdV6LLzDvIzsnxfHUqmfK82uTa2u01T3COtKJtsASJlw+NBRSWjlWt6X2
         j+JhzaR9XtT+bmADP1blQa5GBxROJNPYsVN2zBE1c0CVgUvLVvIfF09Ycfawen7b5h
         TjV5kRAWp5Qi1Xrg02kyZSgt9KxOcpJZNCpULY7M=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200811052832.404425-1-bjorn.andersson@linaro.org>
References: <20200811052832.404425-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200811052832.404425-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.9
X-PR-Tracked-Commit-Id: 62b8f9e99329c92286534d05dac9dc0a6e0ba0cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 617e7481d7bfb807273d0f1b1983de032a725220
Message-Id: <159717764274.9233.12439561140755588312.pr-tracker-bot@kernel.org>
Date:   Tue, 11 Aug 2020 20:27:22 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>, Suman Anna <s-anna@ti.com>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Alex Elder <elder@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon, 10 Aug 2020 22:28:32 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/617e7481d7bfb807273d0f1b1983de032a725220

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
