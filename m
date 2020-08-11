Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C50C242146
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Aug 2020 22:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgHKU1Z (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Aug 2020 16:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgHKU1Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 16:27:24 -0400
Subject: Re: [GIT PULL] hwspinlock updates for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597177643;
        bh=Fh35tu6KdlcAgV+RF5NXn55IaK3ovCiVDr25Ah1KA+I=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HYxs75ban3/DUy2QgPM9YE63z4QOxbLQxo8LjFr75aUqP+nETvZmkPPpzNMOpYMQF
         mDW9LqvuFJ62SXybVm7o+cUa/XtuqWbNPSLxqi1RfGsE7Mu1sn1kCyX2nVT8tMR5C1
         Pdg+06dnIV59kyT/93OZu6gf5Qx8/wXgY6LVAlWg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200811052900.404638-1-bjorn.andersson@linaro.org>
References: <20200811052900.404638-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200811052900.404638-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.9
X-PR-Tracked-Commit-Id: 35efb0e1d5c60e334ea719586ff2509fde2e613b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c636eef2ee3696f261a35f34989842701a107895
Message-Id: <159717764384.9233.2091317091094808509.pr-tracker-bot@kernel.org>
Date:   Tue, 11 Aug 2020 20:27:23 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon, 10 Aug 2020 22:29:00 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c636eef2ee3696f261a35f34989842701a107895

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
