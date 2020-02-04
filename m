Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABA515157C
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Feb 2020 06:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgBDFfA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Feb 2020 00:35:00 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40084 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgBDFe7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Feb 2020 00:34:59 -0500
Received: by mail-pg1-f195.google.com with SMTP id z7so287521pgk.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Feb 2020 21:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yDxEzOkKubOgEgaxiXFZGk+/s3twCjegVTvLoi4kxec=;
        b=BAWnIKC3K2Vf/wj4xU15Xj5aZC1N19QXXylMswEUYDBHsZ8XmkTXyieJoN9N78vI0c
         DNvlP6L91ESULTg262+vU1RxFJwU2VS/8FiNPjqxI4a+6IRuxF4DBDQAKFTJXAtZy7ke
         nsDcgtfEE4/F3jsblfOAUEkmtNwUpTIZ5QBtC+NxfV6Q23lLr2XiKPiSmVFtFoCVJosD
         4ARUGn0iPnivCsqVdLrtB5MOOS0NyuZjT6E4C3xvbeL+0kVCeNDE4B/riXJUiUZ98q21
         kuzegoU+U/xfucD7tY+4BYFXjVFsdnzSKRTxaP7+LF86pMf4p8uus1c5e6IeXqkKCVN5
         LEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yDxEzOkKubOgEgaxiXFZGk+/s3twCjegVTvLoi4kxec=;
        b=iFKU+sNETdxDnDju6g5jvDG8O7CPkW3/LEmUkM5MwRJ0RiPLquXvidS2VDUBkVYMRr
         rJjk61+n4OobhDFwmmI7cZBf+kNEU+UPFRRMMxhP71rEEIWW2qEiUyk2b1jjY49PCzik
         xXq46RbR3jQg0W3Jcgr5a+ddVbaqHj0L3qpyyfoteyChA20bovfBe9KO4UXjoUWpXBqF
         IUnuQ97wg+Vud6pR1JkYsZTzLyAR540+FhDNxT/7KHsme7rijICbkL7k5s+h5zjJ72rT
         geiyriG+wm/NOy24fGBhJs3j5MpUGAVmY8Iw8/uuqy0U8v1BqHwSih0D3tOnJLM1vD/z
         bBRQ==
X-Gm-Message-State: APjAAAUcW9Xiv4vqGplJhMqVrsdSWgVy6QrBmkGMl7sEiYGls/Y6IWfE
        wodSgvXl85GoQI5hepwuAsqdD5Txths=
X-Google-Smtp-Source: APXvYqyTy5OPKQN5nbbZaJ2PXAhUwxG7ur1aECaCG8zlwokLJr4CWDyMyGlf3maXHHAN+DvGF0MC3g==
X-Received: by 2002:a63:fa0b:: with SMTP id y11mr21305094pgh.137.1580794498804;
        Mon, 03 Feb 2020 21:34:58 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i9sm22935845pfk.24.2020.02.03.21.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 21:34:58 -0800 (PST)
Date:   Mon, 3 Feb 2020 21:34:55 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [GIT PULL] hwspinlock updates for v5.6
Message-ID: <20200204053455.GA130281@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.6

for you to fetch changes up to cb36017a8b1b582bcb7063e44c598c3e36aa0228:

  hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock controller (2020-01-21 16:16:36 -0800)

----------------------------------------------------------------
hwspinlock updates for v5.6

This continues the transition of drivers to device managed resources and
removal of unnecessary PM runtime integration, with cleanups to the
SIRF, OMAP and Qualcomm hwspinlock drivers. It also adds Baolin as
reviewer in MAINTAINERS.

----------------------------------------------------------------
Baolin Wang (8):
      MAINTAINERS: Add myself as reviewer for the hwspinlock subsystem
      hwspinlock: qcom: Remove redundant PM runtime functions
      hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock controller
      hwspinlock: omap: Change to use devm_platform_ioremap_resource()
      hwspinlock: omap: Use devm_kzalloc() to allocate memory
      hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
      hwspinlock: sirf: Remove redundant PM runtime functions
      hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock controller

Yangtao Li (1):
      hwspinlock: stm32: convert to devm_platform_ioremap_resource

 MAINTAINERS                           |  1 +
 drivers/hwspinlock/omap_hwspinlock.c  | 32 +++++++++---------------
 drivers/hwspinlock/qcom_hwspinlock.c  | 28 ++-------------------
 drivers/hwspinlock/sirf_hwspinlock.c  | 46 ++++++-----------------------------
 drivers/hwspinlock/stm32_hwspinlock.c |  4 +--
 5 files changed, 22 insertions(+), 89 deletions(-)
