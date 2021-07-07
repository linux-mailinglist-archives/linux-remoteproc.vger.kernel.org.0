Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0B03BEFC4
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Jul 2021 20:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhGGSru (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Jul 2021 14:47:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:49440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhGGSru (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 14:47:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B947D61CCB;
        Wed,  7 Jul 2021 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625683509;
        bh=n2ytj7Q8ttsMBNsLx7MKUH51+Lq+ZgIQ0pjVD1Rn7D8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=E2LNlXIGJBN/jE2iUd7jdEi5hAWx0h5N7UQ7RtZST1nDMkJRfw/h+KJb4ZZrP6Bdt
         z7jtfgL4hRiAxBp8uUjN0gNW4O+znuj/8lyyWSiytPirj87KL0h59gIxH5gZmXh9qU
         esaFL+fa8IdK8L4lcv8sN/lCBk/j571gEanAcgqLBIblqPerxIvqUGl0sjJtCeTPYo
         o0a6UbzGmjrMDqtKDWuwG/8ufFuyHKq1iNuHaTKdPXdMePxJs6gR1NhtMNvg/EVkyw
         bV2umaAkNFasWBJr57zRU5nASe3a8NNB8DMh6cMfT+2IeIye3lI45X4YarLQbYXbPw
         IvUzTrECWTXfg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B35A06094F;
        Wed,  7 Jul 2021 18:45:09 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock updates for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210706210244.1229537-1-bjorn.andersson@linaro.org>
References: <20210706210244.1229537-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210706210244.1229537-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.14
X-PR-Tracked-Commit-Id: 234462bc7f2303afce4b61125d2107ecd7611bff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5e6d1261e2090df1325e762669c8eab6d4fb2fb
Message-Id: <162568350972.3837.12389258737967362281.pr-tracker-bot@kernel.org>
Date:   Wed, 07 Jul 2021 18:45:09 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Suman Anna <s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue,  6 Jul 2021 16:02:44 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5e6d1261e2090df1325e762669c8eab6d4fb2fb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
