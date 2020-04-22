Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D930A1B50A4
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Apr 2020 01:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgDVXIK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Apr 2020 19:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725839AbgDVXIJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 19:08:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43885C03C1AA
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 16:08:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id np7so1649303pjb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 16:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ArROpAk6/OFm/ez5Uo9l28XbbULD17tF98w60ra2Vi8=;
        b=gv89tcQPRXlNJNGrQiV+m2G9DKOjCc262kmlFxBszHuzeoiWhdWG4OCqmk/sedBKcg
         JTzVVOWZbOaY8bT/G6OnfXSvcLYKs5A3bSrZ/AdqRQVLB/LOnnBIMWr8lFLF4T6+Xtn8
         RxSEPKqBtxIHv8OLiqZ4JGP93yBKqwHslN7EUMUL9ee1a3ouosAeGCBYGi+t13BqJUaW
         Si7dSAssE4mf94jaXp1Pe30gfv3zqOYXQOOlRd3DwPdS41y6/FfEyEaJWMA2Mih253m8
         yR0JNTQN+r7PazhMj+GKXwXKXTrC5pG68j/Oqd7B4Ka2PxD5eDDoBDJ7MffPGVvK1nNf
         THug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ArROpAk6/OFm/ez5Uo9l28XbbULD17tF98w60ra2Vi8=;
        b=EABrljoaNcu5AbL9nCyFwdmk+0rsw9j4Z71ug78w7uQo1jIVzb8ep7KLmLgDq8W5SV
         btTaMeDVgiZkYoGny+0D+f0k65c1/7VHFuj8O7Veq21o+jVH9HPVD5nYt3Bz0gjCdse4
         l1bq6auKoDN+GGhWhgkLsOjIzejtdYRNs83iGjFlVF6MOVoDbn8s6NDaKJpd55c8gEZ8
         v/WU+PB1dUWDpuENMhiC46ogbNhmHu54sVlcJ5Axz1wfT7ue2v7ojOyJTXKMjvhOGgOA
         sb1xkOHRXjSYwmmcwT0v8Yum0mi9hPrzyeWtLHS8Ef7Lmsf7ZVbAT8nu4MUcU1nHZdTu
         mcKw==
X-Gm-Message-State: AGi0PubmJILy0ohf/ZX8Jsu1+pufZq/nfyFpviAjKHJ7RPNv96PIm+NQ
        jVPzHiiUnKedrkyeEhRDDAn1Qg==
X-Google-Smtp-Source: APiQypKdavy8VuGj9OPbA1SloQuWUfYm9s+txwLnuKWP2L4onHGFPWc6YXuPxnjY8GMYtNzb9G3Gqw==
X-Received: by 2002:a17:902:784c:: with SMTP id e12mr984699pln.191.1587596887624;
        Wed, 22 Apr 2020 16:08:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p62sm554472pfb.93.2020.04.22.16.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 16:08:06 -0700 (PDT)
Date:   Wed, 22 Apr 2020 16:08:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] remoteproc fixes for v5.7
Message-ID: <20200422230833.GA2112870@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.7-fixes

for you to fetch changes up to c2781e4d9bc6d925dfc1ff833dfdaf12b69679de:

  remoteproc: mtk_scp: use dma_addr_t for DMA API (2020-04-16 15:53:15 -0700)

----------------------------------------------------------------
remoteproc fixes for v5.7

This fixes a regression in the probe error path of the Qualcomm modem
remoteproc driver and a mix up of phy_addr_t and dma_addr_t in the
Mediatek SCP control driver.

----------------------------------------------------------------
Alex Elder (2):
      remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
      remoteproc: qcom_q6v5_mss: fix q6v5_probe() error paths

Arnd Bergmann (1):
      remoteproc: mtk_scp: use dma_addr_t for DMA API

 drivers/remoteproc/mtk_common.h    |  2 +-
 drivers/remoteproc/mtk_scp.c       |  6 +++---
 drivers/remoteproc/qcom_q6v5_mss.c | 33 ++++++++++++++++++++-------------
 3 files changed, 24 insertions(+), 17 deletions(-)
