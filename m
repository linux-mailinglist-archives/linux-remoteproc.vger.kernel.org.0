Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B2A191C68
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgCXWDf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34696 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXWDd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:33 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so135379pgn.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QK3Q4IJ5+bfcoIpUk5yWLQGLzAn/Qrc/CqhaJC1lwu0=;
        b=hdPI3KSdLv6ov4dP30+wzlFiykPBPWuieSrmRRVALwPL75slVS3RxllnmSXl6BDW1D
         Zo9rkmp11l/moWHNdsY9PEiwYLd6K5apeNcTuX6VuBGpGXzXRZ8o0oU1jJHro0rUsSY6
         2exKqyuaNwpZKd+mfpPWVelu1BjthEIrCSqDpfnRCSIk9pMdq7DrEZYvSLz3R2UPeV9x
         9TxCavCMeK0iRkYfo2Adq+1tKmJ55KNedujpQKu+RvKmuUIQR63Hxc/O/FefjXXLKm8k
         n0t4JR5sQCgWWfAdI8sljHvJ8Vzz0sh4UcKFTA5L0T9416gvhTElR2NdmLTzwXyYAYAg
         cXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QK3Q4IJ5+bfcoIpUk5yWLQGLzAn/Qrc/CqhaJC1lwu0=;
        b=fANK4fV77J977Qq+VHEj7MmXOxpQF1X7e/fFtC2tcfMCGhzrf0h1sWEAzH0M1pBaLy
         jvCJhVlxkHCYppjuO/EvvU2lQ9+UulBqLJtrZUfUHsearEnL0uoIDGDtX5SNwUjCLZFY
         Z36zC98G5dPMfZ92Ir5o4Le8aE8/PLwX+ZqWk1oK2p0/ikFxmHWlIZTy4mh/zWnbV0lq
         ur+OjONGR47maNQkaeCIYTws9nmJW3DiY5FQfw6FeSsRb9vbwgF5i6UOZR1UqknrfsVI
         8TwpU6EdNiCm/Pgu66pdV+wcISiNTQXKqY7vvpEeAtO0vMacMNqXFWYnXwFRsXu/C0X0
         tCdw==
X-Gm-Message-State: ANhLgQ1raWTHJ0xrw+k53hc9vZnh8eALEx1SyBuYV8ffb9ogsjA4iAe0
        s2kAPGRFeLgEPN1FreVzFUwPYQ==
X-Google-Smtp-Source: ADFU+vvgQGYub+32HlN8f4EeLIpS2M7s3j/HZWSIb5gV50Xw+Y/uv2ZdhF/yuriABqrgUsfxktSNbg==
X-Received: by 2002:a63:ec44:: with SMTP id r4mr28571080pgj.425.1585087412831;
        Tue, 24 Mar 2020 15:03:32 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:32 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 00/11] remoteproc: stm32: Add support for synchronisation with MCU 
Date:   Tue, 24 Mar 2020 16:03:18 -0600
Message-Id: <20200324220329.15523-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset needs to be applied on top of this one [1].

It refactors the STM32 platform code in order to introduce support for
synchronising with an MCU that would have been started by another entity.

Most of the code is taken from work that Arnaud has already published [2].

On top of making sure the classic case where the remoteproc core is in
charge of the MCU's lifecyle is still functional, this set also tested that
it can synchronise with the MCU on ST's mp157c board. 

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Mathieu Poirier (11):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Get coprocessor state
  remoteproc: stm32: Get loaded resource table for synchronisation
  remoteproc: stm32: Introduce new start and stop ops for
    synchronisation
  remoteproc: stm32: Introduce new parse fw ops for synchronisation
  remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
  remoteproc: stm32: Allocate rproc for synchronisation with MCU

 drivers/remoteproc/stm32_rproc.c | 285 ++++++++++++++++++++++++++++---
 1 file changed, 265 insertions(+), 20 deletions(-)

-- 
2.20.1

