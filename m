Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3742A6AF76
	for <lists+linux-remoteproc@lfdr.de>; Tue, 16 Jul 2019 21:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbfGPTAf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 16 Jul 2019 15:00:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43537 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728438AbfGPTAe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Jul 2019 15:00:34 -0400
Received: by mail-pl1-f196.google.com with SMTP id 4so3625374pld.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jul 2019 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=1B56XSbDBuYHFMJ37XDtNgfqOsayMrPq/5G4MtUA+Fs=;
        b=pks5xS8wfiqunFbSMoh0q7jPy+49A5ZW0LtcnZeO8ou5TRp0xQE5mYpd3JiZbYtMcD
         3DnyQjLjnkohoRfMcZZ7ltkHfd/UaWdg5w/8uuBu3/m1AiWhqaBVnfmg3XiqMBo72vzF
         AcHodwjoVOtPYdE8/gbcOy1UGoYKk9XC8/brRwt4YZRlHhnfjN0PaPHX+ZoEKodwhCPk
         BUru/LlxbxZAd/zlN6PN5IY9VL4MUz5qaYhnu37Y++7nbGHpa8foR22vFOu6E0lHHiJt
         NnQFXCRRYkhmbkqqZQTtC2ECOxw2OsXzDClA+PcY33Ne++7K/aAcmMg5dkRLXCWFnPhb
         Zn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=1B56XSbDBuYHFMJ37XDtNgfqOsayMrPq/5G4MtUA+Fs=;
        b=VDRzv1//53X6vHAUd3M9vb+v3b/jXGC88naq6scr04qErVKTvAtCyO4k2LhqRYru8R
         u9momtW6VWLLA+CJJA6okvYdZfVRrblMOE8GVcLE8LadK+OmIrQ/894sW6MlylComQhc
         MwMBwNAp/nGOry1UQjfbQM01oKvp2An1ASZAmgsLc737KPWyLlPelZ7ZmXxfdKCItSjs
         F4B4BdTgb4s3jQi+V19FgCw5CuNNv+WllCn81xqBoFmNsYRjgX7YGY9i1+DE+YLkLtEA
         RDdpo5K3UN8riCfwPIMrJIsTxFCGtdsPET4PUopFwJSp9635hvewdXV1U+I/WZd3AXd0
         kVvQ==
X-Gm-Message-State: APjAAAURmJL9oD/NmNfCsdkRcQzzo4iy9QtWJ3aMDs784H32OkMuNNzM
        2hroDp22adanWTQGNsGdOz2KaQ==
X-Google-Smtp-Source: APXvYqyNWSxVhdaYi3K1840JkoJ+6FR1DAdx6nUmLsiCpG+eMmldhNRu1xegnqvVA7MTDBcS4R2NpQ==
X-Received: by 2002:a17:902:54f:: with SMTP id 73mr37054376plf.246.1563303634127;
        Tue, 16 Jul 2019 12:00:34 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a3sm10120371pfc.70.2019.07.16.12.00.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 12:00:33 -0700 (PDT)
Date:   Tue, 16 Jul 2019 12:01:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Suman Anna <s-anna@ti.com>
Subject: [GIT PULL] hwspinlock updates for v5.3
Message-ID: <20190716190153.GC8572@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v5.3

for you to fetch changes up to 360aa640a59f269b784848c0b2d6d462952750d9:

  hwspinlock: add the 'in_atomic' API (2019-06-29 21:08:14 -0700)

----------------------------------------------------------------
hwspinlock updates for v5.3

This contains support for hardware spinlock TI K3 AM65x and J721E family
of SoCs, support for using hwspinlocks from atomic context and better
error reporting when dealing with hardware disabled in DeviceTree.

----------------------------------------------------------------
Fabien Dessenne (4):
      hwspinlock: ignore disabled device
      hwspinlock: stm32: implement the relax() ops
      hwspinlock: document the hwspinlock 'raw' API
      hwspinlock: add the 'in_atomic' API

Suman Anna (3):
      dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
      hwspinlock/omap: Add support for TI K3 SoCs
      hwspinlock/omap: Add a trace during probe

 .../devicetree/bindings/hwlock/omap-hwspinlock.txt | 25 +++++--
 Documentation/hwspinlock.txt                       | 81 ++++++++++++++++++++++
 drivers/hwspinlock/Kconfig                         |  2 +-
 drivers/hwspinlock/hwspinlock_core.c               | 48 +++++++++----
 drivers/hwspinlock/omap_hwspinlock.c               |  4 ++
 drivers/hwspinlock/stm32_hwspinlock.c              |  7 ++
 include/linux/hwspinlock.h                         | 61 +++++++++++++++-
 7 files changed, 206 insertions(+), 22 deletions(-)
