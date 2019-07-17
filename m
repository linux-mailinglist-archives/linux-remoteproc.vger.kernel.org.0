Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 345556C1D0
	for <lists+linux-remoteproc@lfdr.de>; Wed, 17 Jul 2019 22:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbfGQUAT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 Jul 2019 16:00:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:51022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbfGQUAT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Jul 2019 16:00:19 -0400
Subject: Re: [GIT PULL] remoteproc updates for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563393618;
        bh=knhfaFZd0TqXne+8pNDBzyf7X4NQ0jrDNN7luHAxe9I=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=G8yooQ74FCyJAGjZgbVRhCZqAVY11HdyQkvf6PtmVw0hmEtMDNPWJjuI/zx7/tJ6X
         1YrgKe23PdY0sFls/Vtsqlrobv8f8v8lDq07rqRIvrSVwIToMTUyYEXZj5k05uXCpy
         aCG/GhF+U7MZcMtMWnFGeBOauLKMX2rOsJ/2p/uE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190716190129.GB8572@tuxbook-pro>
References: <20190716190129.GB8572@tuxbook-pro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190716190129.GB8572@tuxbook-pro>
X-PR-Tracked-Remote: git://github.com/andersson/remoteproc tags/rproc-v5.3
X-PR-Tracked-Commit-Id: 93f1d3e4b59cf2e7ef31eaf1131480897b040e97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fdcec00405fae0befdd7bbcbe738b7325e5746fb
Message-Id: <156339361817.17916.10568508783957541563.pr-tracker-bot@kernel.org>
Date:   Wed, 17 Jul 2019 20:00:18 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Clement Leger <cleger@kalray.eu>,
        Fabio Estevam <festevam@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Robert P. J. Day" <rpjday@crashcourse.ca>,
        YueHaibing <yuehaibing@huawei.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue, 16 Jul 2019 12:01:29 -0700:

> git://github.com/andersson/remoteproc tags/rproc-v5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fdcec00405fae0befdd7bbcbe738b7325e5746fb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
