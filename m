Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 281B810E4AB
	for <lists+linux-remoteproc@lfdr.de>; Mon,  2 Dec 2019 03:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfLBCu0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 1 Dec 2019 21:50:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:34130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727551AbfLBCuX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 1 Dec 2019 21:50:23 -0500
Subject: Re: [GIT PULL] remoteproc updates for v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575255022;
        bh=9mz7sfd/iwMm6o1YtBSZ/q8SBevzoDumK4LTsIiTl34=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HxR0K39Hkg8ACc1loh8NLK7XikaOAmrwO4o6fjTrqQ8CqHeNUOF953EqjFFCXeLuI
         xBCE0kbMTnPw1Sm8sf3KpBUeqhjsiODcLAiuuJ8wC1ebzieGFZrnuZ53bDOtgqw6EW
         eCuOs/1CZ12/io77NtrJ/dz5LpzIqGNYSoQWbcmY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191130191330.GA151303@yoga>
References: <20191130191330.GA151303@yoga>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191130191330.GA151303@yoga>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git
 tags/rproc-v5.5
X-PR-Tracked-Commit-Id: e3cb40d4d80516a8f4e9afaebe4d672821a2c97b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e3b06d3bbdfb875ec6ad5e5fa5d86b0e79ea065
Message-Id: <157525502260.1709.2295268985988170536.pr-tracker-bot@kernel.org>
Date:   Mon, 02 Dec 2019 02:50:22 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Clement Leger <cleger@kalray.eu>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Sat, 30 Nov 2019 11:13:30 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e3b06d3bbdfb875ec6ad5e5fa5d86b0e79ea065

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
