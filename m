Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DE91EA8A3
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jun 2020 19:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgFARvn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jun 2020 13:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgFARvm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:42 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522BAC05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:41 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y18so252909plr.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlrUKklQ4wWdbnRY/ut1RE+n38DuD/sUC9c4AFrauXE=;
        b=FPnJ+2iquw+8js0IWILUf5shb1WdAiPhMfhoogI3ZHlWPUX2RdYAta2sliwALjQwFL
         CFzTVo1pTBwJnhOHFA2dZ3NARW6KzRdq8uRxgn79DZGw7hP4RwQZcst1Om6VcVPZR+1A
         mf60HQym79P7n0ZfkX4/C49gRg3IsjqcL2MfUNBz2sOXWI6cBob/k12FXm0S5192M2jn
         UdZ2JRqXAzuVuWzjwd4hGiZ/Db5NCQ2rUEprJgs00cdXWyUKrAadPmxzrNqZUo/mcrPR
         gfmh51A0Nka5JUh9RGFN0ZAaFDMEQslDMPevjJjr11LXU+hpph5bUBW2jhBQtDpxK5zD
         Jt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlrUKklQ4wWdbnRY/ut1RE+n38DuD/sUC9c4AFrauXE=;
        b=dkLsA32JS63kLGxJ89KaOe6G/HZs2CXuB41fQ/XLlPV84hL9gD+nlmR78sDyzXvXO3
         PIBuMnAr13f9Am6CKWBmpKspkqLFDk+dbEgm4Ket1ongzA0KgzfoHb5gqH9CVU0P3E4O
         0oB70xC72gPLDDXRlrB1lz41GpJ0VvWmWpmkP4KBAVBMhhLhhXW4PGKSOCfnsDtlybFx
         29Qxlk4IGgHe9+OJN/hkJ1GMrQNqXztX2fopN/QbgjHmlkxMwXI5dIwItyku/lb73Qb7
         6rTlLsMFJYL2vN9dmWVDW6d4q/uQNLhz9vPOmRKOngZFGDQjCjl7kmDTx0auMeTDgzkh
         +7Qw==
X-Gm-Message-State: AOAM533NahLKrd3avJ5rMrO2KYs8n11xR0q7JYiS+svFoJysW0EbROkR
        GwGERJ9szO2CV9sb/GmX049Y9g==
X-Google-Smtp-Source: ABdhPJzrmAlwErX9nfKyZG414r2Y+njbOGMCox8QTVlu/FwCy6ZPrMJHkVn6d1CJrGbUfkkgRPJ5Xg==
X-Received: by 2002:a17:902:bb86:: with SMTP id m6mr20919601pls.341.1591033900861;
        Mon, 01 Jun 2020 10:51:40 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:40 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 0/9] remoteproc: Add support for attaching with rproc 
Date:   Mon,  1 Jun 2020 11:51:30 -0600
Message-Id: <20200601175139.22097-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This fourth iteration implements a solution that is fairly different from
what was proposed in V3 and earlier versions.  Three aspects have been 
revisited:

1) Only the scenario where the remoteproc core is attaching to the remote
   processor is implemented.  Other scenarios where actions need to be 
   taken when the remote processor is stopped or crashes will be
   considered in subsequent versions.

2) The introduction of a new RPROC_DETACHED state to be set by platform
   drivers when needing to attach to an already running remote processor.

3) New functions are introduced to replicate the functionality provided by
   rproc_fw_boot() and rproc_start(), minus operations related to firmware
   management. 

Enhancement to the documentation has been left out intentionally until it
is agreed to move forward with this implementation.

Applies cleanly on rproc-next(7dcef3988eed) and will be rebased on v5.8-rc1
when it comes out in two weeks.

Thanks,
Mathieu

Mathieu Poirier (9):
  remoteproc: Add new RPROC_DETACHED state
  remoteproc: Add new attach() remoteproc operation
  remoteproc: Introducing function rproc_attach()
  remoteproc: Introducing function rproc_actuate()
  remoteproc: Introducing function rproc_validate()
  remoteproc: Refactor function rproc_boot()
  remoteproc: Refactor function rproc_trigger_auto_boot()
  remoteproc: Refactor function rproc_free_vring()
  remoteproc: Properly handle firmware name when attaching

 drivers/remoteproc/remoteproc_core.c     | 226 +++++++++++++++++++++--
 drivers/remoteproc/remoteproc_internal.h |   8 +
 drivers/remoteproc/remoteproc_sysfs.c    |  17 +-
 include/linux/remoteproc.h               |   9 +-
 4 files changed, 243 insertions(+), 17 deletions(-)

-- 
2.20.1

