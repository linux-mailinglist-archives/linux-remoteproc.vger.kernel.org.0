Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0213A191C16
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXVqG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38690 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id w3so7968551plz.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iv6rRtEP+bRkW7uvNj2mfW0ZDeHFl0Qz+5PvkhDZSYw=;
        b=FDzjtt7BrLF+v73mrdL8MfuE90ZXCQLg0GxBpYz7gH87pj9AtFMs0/8+yBB4UQdUNs
         91vT94iZJfn0h0ACewn9XC6oFADtG7r1iWGHlRDBwgSyx76AqGqZQvN5aLQhmRfYBxkA
         YIfcPbaOXyd90LjLorQnshT2UxrCuQdTxG1h8kjhaekJmxS+ywS8dN6fYR9jYTAclRqJ
         3gz9rw/4/++oQWNTndTyy71knVIB3ErxodJpRCU6m9VdDFoOW7Pz9+bI9NXzM3CF0hbJ
         3QD7RsGjCCPNo3gYn2h83Q2UiJ3su1yvWdqjuNOqFTND4X6FDK5O+skpuNOA+gXJJFYO
         uRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iv6rRtEP+bRkW7uvNj2mfW0ZDeHFl0Qz+5PvkhDZSYw=;
        b=Bti/hkEomBETDqYqSk+xN0Mu6yqcdKvWfmG/LdpuqGXGnS5MHm/D609MkbyZ3hD5N0
         EmVZr1eLwFpjhIsnbOaMcmQ1y81sqwYToVCleUx/erbBEy8b+tZk2yd1sELyTmwvtMVB
         T6/e222v5RSH0wNbaHItjIJ2TSMoIazKFQvyBOCHAjJlxxBIbNjuea3uMbvjX2DRqGmY
         sNItSoqiZTs+i3FW/P2efe9u4xlGZE/uaMMFwXxNO+TYf3uBHZ8u+LsRC95r+NEUGAd1
         wgvarL17+CtE7CgnCKIg5CPSVwXw9UNyTIhjiskeNl2WVpvWwv7ubWStdzoxe8buQuZo
         A7XQ==
X-Gm-Message-State: ANhLgQ029fdbJKJb6gYQ3Q7OTSMGf7N4n4Yf5Q3IiZBCBTUlrQlEpp2n
        9nalRSo9A4k8lcDW+SXMyLALlg==
X-Google-Smtp-Source: ADFU+vtg/sfNW//zcNqJZrL1DQETFEudqy0+lJaHi0JlKC8qGgEvuixRrJgXgcLhFZaVI8swpcfpRw==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr60724pla.97.1585086364978;
        Tue, 24 Mar 2020 14:46:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:04 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 00/17] remoteproc: Add support for synchronisation with MCU 
Date:   Tue, 24 Mar 2020 15:45:46 -0600
Message-Id: <20200324214603.14979-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is the second revision of this set that tries to address the
problem of synchronising with an MCU with as much flexibility as
possible.

New in this revision is a fix for a couple of bugs I found while
testing things.  First with the helper macro in patch 09 and the
suppression of a boot message when synchronising with an MCU
in patch 12.  I have completely removed what used to be patch 18,
the example on how to use the new API.  This will be the subject
of an upcoming patchset.

Tested on ST's mp157c platform.  Applies on v5.6-rc7 to keep things
simple.

Comments would be much appreciated.

Thanks,
Mathieu

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

 drivers/remoteproc/remoteproc_core.c     | 387 ++++++++++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
 drivers/remoteproc/remoteproc_internal.h |  91 ++++--
 drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
 include/linux/remoteproc.h               |  28 +-
 5 files changed, 487 insertions(+), 107 deletions(-)

-- 
2.20.1

