Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C71E183C05
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgCLWMB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:01 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:46981 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:01 -0400
Received: by mail-pg1-f169.google.com with SMTP id y30so3739943pga.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/56wXDbOBMHDRi+zdA0kJcWwhcqGchdJd5+kI83Ri4=;
        b=r/2dMKKvbaI+2HIk04xRsWynBL2E343OVlO3zwuJKQQ8nPEHp+wQ4LzVnJr9o+VRfK
         G82KHuV+aZBtUfYLTItVaf9eQ2MPuQf6Y+kjyCiTVPqCiKjJ5+g7fIOrwTiwKpDiq/cw
         uLrQwATM5SfIsAX4G9DQvdX3s75RrxkMvZHAyJRH5/u/W75G2KFW8zms/pFkhazu0Sga
         XHDUovJD30a3cvH5cEuijebUyclv2Rgfp8Bzt3CmLYKzFYoKVQaLqEqBRJ54hpkdZxeq
         DAyXcyUfNRDj3wS1c7W/p8I+94VTFPAhNXGmeY+B+6BSlft5RDHOR8yrlJARsnPdSLik
         GR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/56wXDbOBMHDRi+zdA0kJcWwhcqGchdJd5+kI83Ri4=;
        b=pvCEEpkWKdz7E0AJPwSz+mnV2DQtM2GuKy0Rc9omrLZuu1p8gEOJr2jKLZeqDAOdIX
         /faL7muwIR2x5Y+XfyTIPdNNfpeyjKDviRY/jSLBjQ8CdcJ/BRxRc6PcY38EcR3aZxRO
         RoQoABpw4e/157/P8pBYnCJwadvo/bdpeq/oi3dfIck2Me7MMyQv2mJfuWFwGcHLk0Ji
         iurJeBoU+C3QzHQ/OSoEl80yFAyQoFrbw+bTW9chOpeZfCimLPT4h/C8mgjVCASAMIBv
         CwaLdQvxe/e1vq94N5fgOYdcEXdzkz0mkDk3MkoHQ49+Vw2kn+SD8aB5ZEIprUxSbYHD
         iJ7Q==
X-Gm-Message-State: ANhLgQ1YJzDcBG89+CUtO7AZEIHDcktVQxtfdKf21DdRJIZGNQoQGnC6
        xsUyyAuTcomk2lt3qavRuKqqWiWyhTM=
X-Google-Smtp-Source: ADFU+vtoNHbC1gHixFrOwnfaq892DBfWMA8v+cQBgAZJ6wpdU3gzLHXGqRYj1mNtU+9WVF/Mfn2n0w==
X-Received: by 2002:aa7:90cc:: with SMTP id k12mr8464266pfk.94.1584051120098;
        Thu, 12 Mar 2020 15:12:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:11:59 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 00/18] remoteproc: Add support for synchronisation with MCU 
Date:   Thu, 12 Mar 2020 16:11:40 -0600
Message-Id: <20200312221158.3613-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset is a new flavour of the work started by TI, ST and NXP to
add support for attaching with an MCU at kernel boot time rather than
starting it.

The name has been changed from "late attach" to "synchronisation" because
it offers the former as a subset of the latter.  It moves all the decision
making as to whether the remoteproc core should synchronise with an MCU
or boot from the platform code to the core, eliminating a lot of
duplication in the logic.  

In order to accomodate the infinite amount of possibilites and scenarios,
the platform code is given the opportunity to dictate how MCUs should be
handled at three different stages of the MCU lifecycle, that is when
the remoteproc core initiates, when an MCU is stopped from the sysfs
interface and when it crashes.  More stages can be added if and when we 
see fit.

The last patch in the set is a refactor of a patch sent by Arnaud and
Fabien.  It is provided as an example of how to use the new functionality.

Best regards,
Mathieu

Fabien Dessenne (1):
  remoteproc: stm32: add support for co-processor booted before kernel

Mathieu Poirier (17):
  remoteproc: Add new operation and state machine for MCU
    synchronisation
  remoteproc: Introduce function rproc_set_mcu_sync_state()
  remoteproc: Split firmware name allocation from rproc_alloc()
  remoteproc: Split rproc_ops allocation from rproc_alloc()
  remoteproc: Get rid of tedious error path
  remoteproc: Introduce function rproc_alloc_internals()
  remoteproc: Introduce function rproc_alloc_state_machine()
  remoteproc: Allocate synchronisation state machine
  remoteproc: Call the right core function based on synchronisation
    state
  remoteproc: Decouple firmware load and remoteproc booting
  remoteproc: Repurpose function rproc_trigger_auto_boot()
  remoteproc: Rename function rproc_fw_boot()
  remoteproc: Introducting new functions to start and stop an MCU
  remoteproc: Refactor function rproc_trigger_recovery()
  remoteproc: Correctly deal with MCU synchronisation when changing FW
    image
  remoteproc: Correctly deal with MCU synchronisation when changing
    state
  remoteproc: Make MCU synchronisation state changes on stop and crashed

 drivers/remoteproc/remoteproc_core.c     | 383 ++++++++++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
 drivers/remoteproc/remoteproc_internal.h |  90 ++++--
 drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
 drivers/remoteproc/stm32_rproc.c         | 207 +++++++++++-
 include/linux/remoteproc.h               |  28 +-
 6 files changed, 684 insertions(+), 112 deletions(-)

-- 
2.20.1

