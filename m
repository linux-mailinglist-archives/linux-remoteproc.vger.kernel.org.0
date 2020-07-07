Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55480217A67
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgGGVbP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgGGVbP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:15 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2025DC061755
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:15 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so228572pjc.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2x+L8FUv9bI+crByz6/Ejtn3DTdscAGUJ17rPzAIyTM=;
        b=Uar/WVI5Uzn3sX7rG1DAuVylL5XgU7OFLcnSATfNdujh9l6dnFFSiueycjbskupllK
         celMxqY20h+WdblDasjQ1F38BszhI2do0gEHIlktty4KSV0cOnRKxhIon51VNKznyIec
         dfjSilPFBTh9IwRVFg7h+U0KJJNmXLwLR8y6O5q5t8M7D1nNA8n9EojU8azxptnVypny
         fv4+hH3JNyOLDCE7T4FTrp4aEYsq9aKCeO71waT+yZ8tQKUjsnBdfCq7T1oxa8kdcdHx
         +bophkIFyqn/1lEPOQBj6LzZix1MN8GBkXBH9dLEVXOIzFJ6CyTGtpVRVVpiQVnFTjMX
         BWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2x+L8FUv9bI+crByz6/Ejtn3DTdscAGUJ17rPzAIyTM=;
        b=YJNdDvemEX26n5MlQGmwYPEBF2Wu5w+Z4K6OSAjeXYrQuanujZseiCwLfAESr/U3PB
         tkoCEVKOqBEBhGyCzTV/Y8c8KROE39vJioP7tahEVcboA9dIZ/rfS2umj8RExbCqG3KD
         FpSS/aB6IKdDVfBA7RKZdPeW59rumpC4b6R2Zc95Pe1UVUTsx9IZ1PCv3MPvA5cfOmso
         kinEM94mjRwsv8VrNu7Clh7o29EQ7eOz8mQG2B8c9CjimAohw2HHCP2MWl3hSkOcFUgX
         3f15GOGOHbWBvzGpd7FrmvoxMGQCUsvM7dcuds2Bge9J3eeDAG976I6RKmxt7uWncr78
         VglA==
X-Gm-Message-State: AOAM532g6GhMOM+YqFlewp/w8wQwUvzNOVqIw0eye61G/Gd7CyigxQTi
        bFT7OanI7DKfVTDan0J63ORcrQ==
X-Google-Smtp-Source: ABdhPJxj36Ux6T1EDbfBl8b9cg/WZBuy2kEOSrmZQ9rkYWPCm3sFJTgo+Y9ZkjXG8JajBiUvgf4rxw==
X-Received: by 2002:a17:902:a410:: with SMTP id p16mr46001431plq.283.1594157474673;
        Tue, 07 Jul 2020 14:31:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:14 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 00/11] remoteproc: stm32: Add support for attaching to M4
Date:   Tue,  7 Jul 2020 15:31:01 -0600
Message-Id: <20200707213112.928383-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This set applies on top of [1] and refactors the STM32 platform code in
order to attach to the M4 remote processor when it has been started by the
boot loader.

New to V5:
1) Added Bjorn's reviewed-by to patch 06.
2) Removed Loic's reviewed-by from patch 08, it has changed too much.

Patches that need to be reviewed: 7, 8, 9 and 10.

Tested on ST's mp157c development board.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=314523

Mathieu Poirier (11):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Properly set co-processor state when attaching
  remoteproc: Make function rproc_resource_cleanup() public
  remoteproc: stm32: Split function stm32_rproc_parse_fw()
  remoteproc: stm32: Properly handle the resource table when attaching
  remoteproc: stm32: Introduce new attach() operation
  remoteproc: stm32: Update M4 state in stm32_rproc_stop()

 drivers/remoteproc/remoteproc_core.c |   3 +-
 drivers/remoteproc/stm32_rproc.c     | 214 ++++++++++++++++++++++++---
 include/linux/remoteproc.h           |   1 +
 3 files changed, 198 insertions(+), 20 deletions(-)

-- 
2.25.1

