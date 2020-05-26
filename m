Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD85F1B8077
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgDXUZI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDXUZH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:07 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBABCC09B048
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so4338964pjb.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/73dacrr5ih6hdF656dZ5NCkiqG8RDgJvTOSmKNoCEs=;
        b=r4xd9ee3KSRA3FkjbDp5pdoFm4oqf1ju1oMdUPs/LsELEPXvZTvfKG3lRQumA6wtBK
         x+11xAVPcf4GVSmDPoM6yZhyVTuH0Z88Wj15SecjCXvbdLCQXKiBGWk1zgiHGuKnIsre
         UznblhiyO2NnxvzlnO09WN491gJDC0If/15xLvatdvan6jKISKDaqChXy4yQAJGt+f50
         VV6RFOYRhf5L8brlwXTCehm8v5IOrJMhuIjG9/XiPVBz9bS1pgKSjPdg5Ru3DBHI3jSp
         vP5N7sSdSals8yTBFMtInrHk4tK9aYrw5h5cXjxkEnbVe9enZ5IwrJ0WDfRkBsA68auS
         3eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/73dacrr5ih6hdF656dZ5NCkiqG8RDgJvTOSmKNoCEs=;
        b=qGONhQFa2OVHquT75Gh3mm252SkJsnCwD120K6hH/VcTLSNQkEwdgi7DnwGAl/Os9D
         G32yuSiGBxkji18WP0Gq1xKTXWNiXT3ghwrytukkdMJLrE2hiU7zZXLGbuEJGCtZFnZE
         jBPnr93H2G/0WaKAJEnIAHQyul0rCegyVD1Hr5JKDrsDL5N10uIpDIhobNkK9B6mUCcq
         /5vSQAxkeeHrBCUEIyD7YPjyV93sfdNwaFgEKJNSkxWGPgrnMnebrsnDt23QRv2hi4O4
         7ewNh/I5g3vMFU8BB0MVCYazSyS/LTFvsIUtNkZdQVe2Cqu8qS7z0ndHPjEmhTdkAjnI
         NZiQ==
X-Gm-Message-State: AGi0PuadWItOldcofb+KYqNeNq3meTUgqbZt//S7SywCSRjlAvGtnc8O
        BZKOb7AOBMXioDK9q2Zemtpm5A==
X-Google-Smtp-Source: APiQypLieWB+6wi/jnde8vnz/b1lgyl0vak4oSUed0SccGbaG2k63/PSP2q2PkRgO3eDH/w4o71TWg==
X-Received: by 2002:a17:90a:26a2:: with SMTP id m31mr8258040pje.128.1587759907264;
        Fri, 24 Apr 2020 13:25:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:06 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] remoteproc: stm32: Add support for synchronising with M4 
Date:   Fri, 24 Apr 2020 14:24:53 -0600
Message-Id: <20200424202505.29562-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset needs to be applied on top of this one [1].

It refactors the STM32 platform code in order to introduce support for
synchronising with the M4 remote processor that would have been started by
the boot loader or another entity.

It carries the same functionatlity as the previeous revision but account
for changes in the remoteproc core to support synchronisation scenarios.
Some RB tags have been removed when the content of the patch has strayed 
too far from the original version. See patch 3, 8, 9 and 12 for more
details.

Tested on ST's mp157c board.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=277049
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Mathieu Poirier (12):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Get coprocessor state
  remoteproc: stm32: Get loaded resource table for synchronisation
  remoteproc: stm32: Introduce new start ops for synchronisation
  remoteproc: stm32: Update M4 state in stm32_rproc_stop()
  remoteproc: stm32: Introduce new parse fw ops for synchronisation
  remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
  remoteproc: stm32: Set synchronisation state machine if needed

 drivers/remoteproc/stm32_rproc.c | 262 ++++++++++++++++++++++++++++---
 1 file changed, 244 insertions(+), 18 deletions(-)

-- 
2.20.1

