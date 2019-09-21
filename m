Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B6EB9EEA
	for <lists+linux-remoteproc@lfdr.de>; Sat, 21 Sep 2019 18:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407817AbfIUQ7Q (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 21 Sep 2019 12:59:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46484 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407816AbfIUQ7Q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 21 Sep 2019 12:59:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so6503703pfg.13
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Sep 2019 09:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=1Vsw/Kwe855ZOEjTjZQRqZEGEiYIH5SmCcRItz4Mfv4=;
        b=pOEzBynTl9ocsWqj1CBoXBE6ScW1nZf0Vc/2KXzL9kXrfb/K2Ie0vffyry8GzDtE0y
         XxkOG7Wg5S3Z04+jAMlJP5tpS8WINW45hMu10S3crXMhN3Gws+tyhQxBJqp4bs6Y+FSU
         Sp3u8YK7jdWZ3j9kPcMTMVsr8azIF57tWhTpmZdt7W7ca4xUHZZIjxg3vh+UCIN+WqyP
         +YKX15wRBDDiH62CYn6BQEn73PclHZd+U5m8av2OYIIVrkX6cXJ9D0jYUwxo3fz5veSB
         i7XPBdtr8G7fdBlVm++IGqathaqln0pfp3u+SLGK8gcWg+0y8I3SykJ5H2xveHEF8ryK
         mz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=1Vsw/Kwe855ZOEjTjZQRqZEGEiYIH5SmCcRItz4Mfv4=;
        b=fPtNGSO7bhbb4qnBqy4na2fnljLIuDIWgEHUabsgTYdEYnHnGDHalXLV8gZaY6g4DC
         8X8GHG0o4ChPij7x5KP/jDDNhQB7acEtzuK8zK14lWjxtgi+GG6WDi8fHvMHsyTKMvLW
         TEQnXlYIR+mKdZdYJHkGu8IN+GE13lbTQRk19Ovg7X5TILHoHawCMnAjvloSvg9/0MdP
         Z1wjdr9OV0LgjfZ9oTNjvZzqAwiAjNSovqX4K9jiJe80NrQgLS+7IfGpIUGkHdG75u7+
         pMdnigobdWB/unIVgjGNR6T7Qp2qsItwUUIRW2V+e9OpQX/cV11VdcpRTc6d+WqXtVuu
         1HBQ==
X-Gm-Message-State: APjAAAXUzaJ3cRCvdS8pMd9A7IA34k1225MZBAMdL5M0ggJcVvoXFOpq
        IZrHD/ayL5ymPPaPJR5aebLPGw==
X-Google-Smtp-Source: APXvYqwYam/FZK0CRDEIWbaGDLMeC0qB74nO9A1eZI87p4s8Pwp0HAxwUWbDqfAZXcfL0ecSG1sHQQ==
X-Received: by 2002:a62:aa0d:: with SMTP id e13mr24471756pff.4.1569085155428;
        Sat, 21 Sep 2019 09:59:15 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k15sm35036pfa.65.2019.09.21.09.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 09:59:14 -0700 (PDT)
Date:   Sat, 21 Sep 2019 09:59:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [GIT PULL] rpmsg updates for v5.4
Message-ID: <20190921165912.GB6693@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc tags/rpmsg-v5.4

for you to fetch changes up to 9fe69a725e238ac279027f0132e50617a63b847d:

  rpmsg: glink-smem: Name the edge based on parent remoteproc (2019-09-17 15:33:31 -0700)

----------------------------------------------------------------
rpmsg updates for v5.4

This contains updates to make the rpmsg sample driver more useful, fixes
the naming of GLINK devices to avoid naming collisions and a few minor
bug fixes.  It also updates MAINTAINERS to reflect the move to
kernel.org.

----------------------------------------------------------------
Bjorn Andersson (1):
      rpmsg: glink-smem: Name the edge based on parent remoteproc

Gustavo A. R. Silva (1):
      rpmsg: glink: Use struct_size() helper

Pierre-Louis Bossart (2):
      rpmsg: core: fix comments
      MAINTAINERS: rpmsg: fix git tree location

Suman Anna (3):
      samples/rpmsg: Replace print_hex_dump() with print_hex_dump_debug()
      samples/rpmsg: Introduce a module parameter for message count
      rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"

 MAINTAINERS                         |  2 +-
 drivers/rpmsg/qcom_glink_native.c   |  2 +-
 drivers/rpmsg/qcom_glink_smem.c     |  2 +-
 drivers/rpmsg/rpmsg_core.c          |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h      |  5 +++--
 drivers/rpmsg/virtio_rpmsg_bus.c    |  2 +-
 samples/rpmsg/rpmsg_client_sample.c | 10 ++++++----
 7 files changed, 17 insertions(+), 14 deletions(-)
