Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC89349CEC8
	for <lists+linux-remoteproc@lfdr.de>; Wed, 26 Jan 2022 16:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbiAZPmf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Jan 2022 10:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243019AbiAZPmf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Jan 2022 10:42:35 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E67EC06173B
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jan 2022 07:42:35 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso29879884otr.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jan 2022 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cPQS12uSWYnFGnhtpSTB886lFMXticcPVlcnwUZfGgo=;
        b=gb+oNW+UwiOppNImknwwtREBg/q9GsHXZB9zw/PKXpeXSn2bCNFuSDdE2sWTQTyRiD
         ChJKxoM0mdVfccM/qDGwOP98d0uuzY0WdJqHuCiCLnfRywNrjXW0aoX51xTlDqHAvo2k
         010Gf0gFu89mubjoX1OPUKV+/yVjqz9g8/cx+DaLjF0G0A9JecfF3xwaUntU/bIbvrzW
         zLKyi6SjFbOZPds9TA/M7zv9+tcm9wMqgrONUNVoZEcy0sPi9D/XTDjMcwfnEs6+3JzV
         egKJ/1F+gqt26ucnD6S9R0Ol2su3GyrLGyCob8mLr/c9FUpf8rM6eW6LVWmvk1jXU9IK
         KLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cPQS12uSWYnFGnhtpSTB886lFMXticcPVlcnwUZfGgo=;
        b=RQ9Vc3BFN46MKVzb23SlHPEbi+SowPAQjHrEqPD9VjSoPl/FWhXVcOd55Phar+6Pxj
         Cr/VPZNvogLkmGlSpKbQbWbO8ECa1oQ606kB/5wNdLsCwvLA5ljEnoVx9VF9StR4UJ5f
         MpeGqVWWXlFyb9/ATkAdAcizbhDu+f1wEm5nklOVT0r1q9HX4WY6W5vBEp0wWE4XBINJ
         2NWkUOi02LD9GUNOqcTKJ8UvdNUz5gCyqqTEA8UARbmncHSHu9MnEGxv0oBLrT3AcAwR
         2Z98Kom+ymcz5HK/xnrTMZ9pLLQ4MkoqFH1dPpnyiBLQjXwxGWzEShOPmXHDQp5c3A7D
         DdAg==
X-Gm-Message-State: AOAM530e3YaWVUBV7LiE1Pz4uBMvIS161jCVhcpf6/5QIQpv5HHhkikc
        Fn25v9U7jorFEK4WK3hd5e/0wQ==
X-Google-Smtp-Source: ABdhPJwjPY7ie/8+qZsvxLOotN8dmaMBgBqAzhHBtM69ChDYAHZyddQsF+U/Tfqf2CWewTMkukvNtw==
X-Received: by 2002:a05:6830:18d8:: with SMTP id v24mr11412283ote.123.1643211754754;
        Wed, 26 Jan 2022 07:42:34 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j11sm8770285otj.30.2022.01.26.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 07:42:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>
Subject: [GIT PULL] rpmsg fixes for v5.17-rc1
Date:   Wed, 26 Jan 2022 09:42:33 -0600
Message-Id: <20220126154233.2453010-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 8066c615cb69b7da8a94f59379847b037b3a5e46:

  rpmsg: core: Clean up resources on announce_create failure. (2021-12-08 10:16:50 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.17-fixes

for you to fetch changes up to 7a534ae89e34e9b51acb5a63dd0f88308178b46a:

  rpmsg: char: Fix race between the release of rpmsg_eptdev and cdev (2022-01-17 16:39:58 -0600)

----------------------------------------------------------------
rpmsg fixes for v5.17-rc1

The cdev cleanup in the rpmsg_char driver was not performed properly,
resulting in unpredicable behaviour when the parent remote processor is
stopped with any of the cdevs open by a client.

The two patches transitions the implementation to use cdev_device_add()
and cdev_del_device(), to capture the relationship between the two
objects, and relocates the incorrectly placed cdev_del().

----------------------------------------------------------------
Matthias Kaehlcke (1):
      rpmsg: char: Fix race between the release of rpmsg_eptdev and cdev

Sujit Kautkar (1):
      rpmsg: char: Fix race between the release of rpmsg_ctrldev and cdev

 drivers/rpmsg/rpmsg_char.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)
