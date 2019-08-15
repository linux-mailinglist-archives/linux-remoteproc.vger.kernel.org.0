Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F57D8E552
	for <lists+linux-remoteproc@lfdr.de>; Thu, 15 Aug 2019 09:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730579AbfHOHQm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 15 Aug 2019 03:16:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38050 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfHOHQm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Aug 2019 03:16:42 -0400
Received: by mail-pf1-f194.google.com with SMTP id o70so936669pfg.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Aug 2019 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5f8KXoDAyC3GiScQEWx3+hem8uLIFg9V9KZILhkXgo=;
        b=GFfaGEIODCSVdkKe7WEXKBQbRwDMHVEO4VbVgXsMEL9Ru50ISVc2oAWtyWx5wyGi7H
         GJr/+HATsNCT6SY53BDaEzkiwEPnVSMURjTYqZgcpR5fnJ4pt2g95uqucT0mmUjsjL6y
         ivNboEsYJmza8IS79PEt6ENyAJ8qUrz4783s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5f8KXoDAyC3GiScQEWx3+hem8uLIFg9V9KZILhkXgo=;
        b=KXB0FnDV/a5FC9qQQByzWREO3cn79h1XdIVdMJv4MkeR4qfEaazHZeu4CNAmc4JY9v
         4ehUXDXYjUKsaP4/cJJvaVHgUjxyMXCpoBL8Yl9/Nyx3tk5PZu3sXGACJYx6Bu76ZUf4
         WuM5VCv10VGkxjERT9I03tKyb2wMTBKux5Tq8p+0PAcMjDDzVr0JlcFnt2VWJrkMelc8
         PDspg1OLVb9KYP3C5+DXSHQ/wSddv4rSPW4sb45K/vomitheukAN554FmEQiDTDedmos
         dNkrIt7jr4LsFEZxICJ+ZHsqWwb1twqK+do5296ZNGbj8YnWUsqXGVUgB6lBgUUSK5j6
         fn2A==
X-Gm-Message-State: APjAAAXipsXxOMHn0RSSg1BcXBKkrqhiuQHix0fuwzSB2esTDqXA9W7C
        DQ1lz/DVEZm4mwfwmiRpZldrcQ==
X-Google-Smtp-Source: APXvYqwy9le1UizWA3SSSD7ratSCaYjvvJydzJy93Cxi+fw1djduxV0s35o8JfSUj7Z2PaWLhjl69w==
X-Received: by 2002:a17:90a:e392:: with SMTP id b18mr969478pjz.140.1565853401279;
        Thu, 15 Aug 2019 00:16:41 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id v6sm1768727pff.78.2019.08.15.00.16.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 00:16:40 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR
        (REMOTEPROC) SUBSYSTEM)
Subject: [PATCH v16 0/5] Add support for mt8183 SCP.
Date:   Thu, 15 Aug 2019 15:16:24 +0800
Message-Id: <20190815071635.168671-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
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

Changes from v15:
 - Fix a bug on incorrect usage of wait_event_timeout return value.

Changes from v14:
 - Fix a typo on variable in DEBUG section.

Changes from v13:
 - Move include/linux/platform_data/mtk_scp.h to
   include/linux/remoteproc/mtk_scp.h.
 - Rename scp_get_reserve_* to scp_get_reserved_*.
 - Add lock for access of scp->ipi_desc.
 - Lock the whole ipi_send function.
 - Move more setting of cache size from SCP firmware to kernel driver,
   to prevent problem while loading firmware onto DRAM.
 - Minor fixes addressing comment.

Changes from v12:
 - Initialize cache before firmware load, to avoid problem while loading
   large firmware.
 - Disable watchdog before stopping SCP, to avoid extra warning message.
 - Fix new warnings by checkpatch.

Changes from v11:
 - Fixed a bug that mtk_rpmsg_endpoint is not properly cleaned up if
   rproc_boot fails.
 - Add missing documentation in comment.

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
 drivers/remoteproc/mtk_common.h               |  92 +++
 drivers/remoteproc/mtk_scp.c                  | 710 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c              | 161 ++++
 drivers/rpmsg/Kconfig                         |   9 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 414 ++++++++++
 include/linux/remoteproc/mtk_scp.h            | 168 +++++
 include/linux/rpmsg/mtk_rpmsg.h               |  38 +
 13 files changed, 1663 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/remoteproc/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h

-- 
2.23.0.rc1.153.gdeed80330f-goog

