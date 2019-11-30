Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2036E10DED5
	for <lists+linux-remoteproc@lfdr.de>; Sat, 30 Nov 2019 20:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfK3TOx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 30 Nov 2019 14:14:53 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41824 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfK3TOw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 30 Nov 2019 14:14:52 -0500
Received: by mail-pl1-f193.google.com with SMTP id t8so14215350plr.8
        for <linux-remoteproc@vger.kernel.org>; Sat, 30 Nov 2019 11:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=PBLl0kGQgoYrFdeAWUlAxcj7qJOOfrAStPaEScVpRMU=;
        b=n3bLAvu6YzI15zkqHwPU+arzD7OjNEiIMhVH5pb6HeHwgf1Hvt/pptO2tMo6elzCxs
         C6Xr0Yv+ZFm8FtXp4rrzrbXo+PZFBmjzxKzpxTFPZqyY7YQOBXykcNdp8In5/IqqnIqj
         NNyszJfxt1gOzsZOIv7MDoFc6FWZGJCZ9qDzzofOlUKs77lcevEwR4qdm5Sb0s/SQJq5
         HLAwgSg6EGqA3+wpyx/KHMnrd7/Aj4x//apt0O2Qsp+2Q37JMFb2Zwpy4LOMatn5IPoU
         PumQgmF0q1rYwjdYsiETXiUXcpQPSN9BvAgxaA/XAlI+5TsLWJcnwuzoy5jWv81dhPs+
         pndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=PBLl0kGQgoYrFdeAWUlAxcj7qJOOfrAStPaEScVpRMU=;
        b=RVmWxa3PXtPpxVA6qQIsaiqmvpoMR6kkDX53xWnM+5CVTPUzikEGDDc/mMg3BLhyYt
         jB2mOl1laXyKovTQzj/P0s4oeXvxQIXBbRSgbncU6L0SeAOQGv/9qKDXWfUqLime/TqX
         u1FRUCgyfxEnxj4Eq08GPuD5pIJT9KGgZJ23jBg+7kNTaCErjxMxUniez4QUmwPV8BVM
         bFW8etq/BZvdOHeEuFf5a7uhxP220TQYAO9cx/cCDRloFW6PmMjTDbeavg04jDlvkjc5
         A1de8JfVYGMJiQ9zAcH3XnowBp0uvyyE8ziWo3tZJWiKRzTyTkMyiT3Skjb44BZ2id97
         AB1w==
X-Gm-Message-State: APjAAAUJK2pMCC/8KdELRa1ox5YYDLgZaePqyuwkkT37rPPU6xee6kjT
        XI5PIVI5mgSpNPULdghoRoAVAw==
X-Google-Smtp-Source: APXvYqz0+V1mbsfP5WotQqQljxyUj7dIYMuraKlaXpwb87lXoUZtR9qkXz1dECcyA4nQ8fMgd83Sbw==
X-Received: by 2002:a17:90a:26ec:: with SMTP id m99mr26421050pje.130.1575141291280;
        Sat, 30 Nov 2019 11:14:51 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e11sm12897591pgh.54.2019.11.30.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 11:14:50 -0800 (PST)
Date:   Sat, 30 Nov 2019 11:14:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v5.5
Message-ID: <20191130191448.GC151303@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.5

for you to fetch changes up to 9d399f0c52951c1acf972bf98ea55ba8798fea7a:

  hwspinlock: u8500_hsem: Remove redundant PM runtime implementation (2019-11-08 16:42:26 -0800)

----------------------------------------------------------------
hwspinlock updates for v5.5

This contains a number of cleanups to the core and several drivers, in
particular removing the requirement for drivers to implement pm_runtime.

It also udpates the location of the git tree in MAINTAINERS.

----------------------------------------------------------------
Baolin Wang (11):
      hwspinlock: u8500_hsem: Change to use devm_platform_ioremap_resource()
      hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
      hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register hwlock controller
      hwspinlock: sprd: Change to use devm_platform_ioremap_resource()
      hwspinlock: sprd: Check the return value of clk_prepare_enable()
      hwspinlock: sprd: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()
      hwspinlock: sprd: Use devm_hwspin_lock_register() to register hwlock controller
      hwspinlock: Remove BUG_ON() from the hwspinlock core
      hwspinlock: Let the PM runtime can be optional
      hwspinlock: sprd: Remove redundant PM runtime implementation
      hwspinlock: u8500_hsem: Remove redundant PM runtime implementation

Bjorn Andersson (1):
      MAINTAINERS: hwspinlock: update git tree location

 MAINTAINERS                          |  2 +-
 drivers/hwspinlock/hwspinlock_core.c | 16 +++++------
 drivers/hwspinlock/sprd_hwspinlock.c | 48 +++++++++++++++-----------------
 drivers/hwspinlock/u8500_hsem.c      | 53 ++++++++----------------------------
 4 files changed, 42 insertions(+), 77 deletions(-)

