Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F6D19B9B9
	for <lists+linux-remoteproc@lfdr.de>; Thu,  2 Apr 2020 03:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732664AbgDBBIm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 21:08:42 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54158 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732462AbgDBBIm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 21:08:42 -0400
Received: by mail-pj1-f67.google.com with SMTP id l36so864046pjb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 18:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ugT5XXd14ijtpN2Hcg23GtWvr136nCMP/a+tddTYftg=;
        b=x2FfgDffWuPCb3iqPQXusSrJ2Jg4mJneLdYc+zcx3YcUfkDozfKVRcZxzTlXYSCZ9X
         2ANIQ6LekB022DMzPxuDeE5vhgGldCLzqQVQ8/X1DYICNdizfTFK7jQKtejzJTx2GUlT
         XA++HCSYvvdPjtX8Qzw8IqS+Wei8/s8bWqRecBQqtoJxKzXgzJf8cnTxxGZJlxeZ6G+M
         29JZdenCUaYZ9XCW7g5FFY02Lrly/JDPRFU7F8haXacZxvftfBAst3pWm3WM/uCn8u2p
         Gc1nDEeaTFetizm8iUIxOGx3IaX4EMDm/D7H4Ds78laUuXB6KGFMzCicbT/mcsCMzUO9
         2tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ugT5XXd14ijtpN2Hcg23GtWvr136nCMP/a+tddTYftg=;
        b=BUU0kJizF6qjOTxqU49YsJO1AF6zON0XhJqxihW+6nbXcvBdkukENLC1JC1Vmrr+6v
         //185euyH45Fw6lXFJCQj8yBkFNKmWAxpAdsdwch7g+0NbWZR7sMr1Cw/asu3cTkZJY2
         qL5djRGPSvqqBWmQUjssakr+o/bGwlup5eRmQ1dTc1pNg46ZBd8dT0Rft/9tcqkQJ9+K
         l5AKcUSWpkpX110yq7EsYqUtQRnX32TZDIl7ztAoYNQtmXkeTDZzt21ctU3JdXmqL8se
         HmakgLYh8TqjwAzbwknfhAkug14H6VFD8+e5KoyhLJvbx5yKL8eIvypQZpGHvOzvdGWP
         bZqQ==
X-Gm-Message-State: AGi0PuaNcDxmz5+MSJmhSQPOUfjZ0eGHwxot2Qvb/LKtTXd0rAOCyYLI
        i5UiJMBIu2hGOy/3SCwnbnI7ww==
X-Google-Smtp-Source: APiQypIFgAZ5m3lls8sFY57ACWOX7DXY3R/lYBPHIct2oj/PeLwE5hdc+/QpiPC7fmbj6sxlT3JBjA==
X-Received: by 2002:a17:90a:cc14:: with SMTP id b20mr944517pju.75.1585789720512;
        Wed, 01 Apr 2020 18:08:40 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u13sm2281011pgp.49.2020.04.01.18.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 18:08:40 -0700 (PDT)
Date:   Wed, 1 Apr 2020 18:08:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [GIT PULL] hwspinlock updates for v5.7
Message-ID: <20200402010837.GB751391@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.7

for you to fetch changes up to ef17f5193edd42e8913c93d0b601c101c56a15bb:

  hwspinlock: hwspinlock_internal.h: Replace zero-length array with flexible-array member (2020-03-25 22:30:46 -0700)

----------------------------------------------------------------
hwspinlock updates for v5.7

This marks all hwspinlock driver COMPILE_TESTable and replaces the zero-length
array in hwspinlock_device with a flexible-array member.

----------------------------------------------------------------
Baolin Wang (1):
      hwspinlock: Allow drivers to be built with COMPILE_TEST

Gustavo A. R. Silva (1):
      hwspinlock: hwspinlock_internal.h: Replace zero-length array with flexible-array member

 drivers/hwspinlock/Kconfig               | 12 ++++++------
 drivers/hwspinlock/hwspinlock_internal.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
