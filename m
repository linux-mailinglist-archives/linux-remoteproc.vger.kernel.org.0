Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F94C44647
	for <lists+linux-remoteproc@lfdr.de>; Thu, 13 Jun 2019 18:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404219AbfFMQub (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 13 Jun 2019 12:50:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46521 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfFMEHU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jun 2019 00:07:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so10920995pfy.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jun 2019 21:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n29uyDPPBK7egYyDUR+aysMwNcE/QINJ0iF/ZuZPx80=;
        b=F5wghJXV7SMKXC9UGRyLMlm+HH/tNwdpxWoG3y3t/L5tC64i1UrDjkPdASW+/1eEM/
         33id3padmrJT8YrSec5Qkd0Qd8GTIuM+GQfblbourirrBmolMdNWA50G8zmdT8KHvRWj
         0aLL2rQVL4wis+E+e+FTZyG7u90IttXmEUgJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n29uyDPPBK7egYyDUR+aysMwNcE/QINJ0iF/ZuZPx80=;
        b=hTEwJc5g9Yf67HkHwfIGruXf1yzOGlqzS93lg9n6tU/5PlhCRVVb52tqbMg9FIaZtC
         z29gbf1qQA4TuNmKpSMKfiR5BQBjONv7RFivPqLsUMyQx/eb2WgptquohVlVzxMaO0Ru
         KYDqS7OOyUj2l9Td96C0zrtVdfZdNcPsUJis78YPfPtWl/SlIxhSHRlF/H2FfTqU0o2A
         kH48RCOQuwOs7D+2Np/tiyO+yA0d5GzLvxm6i9nsQWPrfRKkjBMTQa4mmEByZRv/MP9S
         w9/7lUmrGmu4Dtz0/zVufdpaIvF69bDPfbNJggFXMW05/G1/P53h3GK6IvrOtT98cHuN
         8yJA==
X-Gm-Message-State: APjAAAV2DpG5olWin1KCfg0/LUJ4Py0/2YMIBcuVPRzqjXHlp5SA8nrw
        8B51TtnPKvH0RUWqun5lsAL4Ig==
X-Google-Smtp-Source: APXvYqyqFWkg2GEQ3OnDD7tik2joj+QzIoaT73yaw8afEjZ07HT1I0a0oyimnt6HBsbB/CndmNHMMQ==
X-Received: by 2002:a17:90a:2488:: with SMTP id i8mr2684275pje.123.1560398839210;
        Wed, 12 Jun 2019 21:07:19 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id a13sm956849pgh.6.2019.06.12.21.07.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 21:07:18 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Erin Lo <erin.lo@mediatek.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR
        (REMOTEPROC) SUBSYSTEM), Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v11 0/5] Add support for mt8183 SCP.
Date:   Thu, 13 Jun 2019 12:06:47 +0800
Message-Id: <20190613040708.97488-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for controlling and communicating with mt8183's system
control processor (SCP), using the remoteproc & rpmsg framework.
And also add a cros_ec driver for CrOS EC host command over rpmsg.

The overall structure of the series is:
* remoteproc/mtk_scp.c: Control the start / stop of SCP (Patch 2, 3).
* remoteproc/mtk_scp_ipi.c: Communicates to SCP using inter-processor
  interrupt (IPI) and shared memory (Patch 2, 3).
* rpmsg/mtk_rpmsg.c: Wrapper to wrap the IPI communication into a rpmsg
  device. Supports name service for SCP firmware to
  announce channels (Patch 4).
* add scp dts node to mt8183 platform (Patch 5).

This series (In particular, Patch 5) is based on
https://patchwork.kernel.org/cover/10962385/.

Changes from v10:
 - Drop applied cros_ec_rpmsg patches.
 - Add clock reset before loading SCP firmware.
 - Fix some type mismatch warnings when printing debug messages.

Changes from v9:
 - Remove reserve-memory-vpu_share node.
 - Remove change to cros_ec_commands.h (That is already in
   https://lore.kernel.org/lkml/20190518063949.GY4319@dell/T/)

Changes from v8:
 - Rebased onto https://patchwork.kernel.org/cover/10962385/.
 - Drop merged cros_ec_rpmsg patch, and add scp dts node patch.
 - Add more reserved memory region.

Changes from v7:
 - Rebase onto https://lore.kernel.org/patchwork/patch/1059196/.
 - Fix clock enable/disable timing for SCP driver.
 - Add more SCP IPI ID.

Changes from v6:
 - Decouple mtk_rpmsg from mtk_scp.
 - Change data of EC response to be aligned to 4 bytes.

Changes from v5:
 - Add device tree binding document for cros_ec_rpmsg.
 - Better document in comments for cros_ec_rpmsg.
 - Remove dependency on CONFIG_ in binding tree document.

Changes from v4:
 - Merge patch 6 (Load ELF firmware) into patch 2, so the driver loads
   ELF firmware by default, and no longer accept plain binary.
 - rpmsg_device listed in device tree (as a child of the SCP node) would
   have it's device tree node mapped to the rpmsg_device, so the rpmsg
   driver can use the properties on device tree.

Changes from v3:
 - Make writing to SCP SRAM aligned.
 - Add a new patch (Patch 6) to load ELF instead of bin firmware.
 - Add host event support for EC driver.
 - Fix some bugs found in testing (missing spin_lock_init,
   rproc_subdev_unprepare to rproc_subdev_stop).
 - Fix some coding style issue found by checkpatch.pl.

Changes from v2:
 - Fold patch 3 into patch 2 in v2.
 - Move IPI id around to support cross-testing for old and new firmware.
 - Finish more TODO items.

Changes from v1:
 - Extract functions and rename variables in mtk_scp.c.
 - Do cleanup properly in mtk_rpmsg.c, which also removes the problem of
   short-lived work items.
 - Code format fix based on feedback for cros_ec_rpmsg.c.
 - Extract feature detection for SCP into separate patch (Patch 6).

Eddie Huang (1):
  arm64: dts: mt8183: add scp node

Erin Lo (3):
  dt-bindings: Add a binding for Mediatek SCP
  remoteproc/mediatek: add SCP support for mt8183
  remoteproc: mt8183: add reserved memory manager API

Pi-Hsun Shih (1):
  rpmsg: add rpmsg support for mt8183 SCP.

 .../bindings/remoteproc/mtk,scp.txt           |  36 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  11 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  12 +
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_common.h               |  79 ++
 drivers/remoteproc/mtk_scp.c                  | 683 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c              | 163 +++++
 drivers/rpmsg/Kconfig                         |   9 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 396 ++++++++++
 include/linux/platform_data/mtk_scp.h         | 167 +++++
 include/linux/rpmsg/mtk_rpmsg.h               |  30 +
 13 files changed, 1598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/platform_data/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h

-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

