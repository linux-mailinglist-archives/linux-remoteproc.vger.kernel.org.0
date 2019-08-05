Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7FA81768
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Aug 2019 12:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbfHEKtt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 5 Aug 2019 06:49:49 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39528 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbfHEKtt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Aug 2019 06:49:49 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so36368717pls.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Aug 2019 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsidF0qi6Z2qBnCAOuW5bxrXb8326BK2qz06ZUf0X/w=;
        b=PrpXE5eiKZHvNEdDzMLbfYEYCjEAafeeZHIIHLqKxpKdY8Mi6Op1ZqHE6kfZcf9dKf
         SCfOPnNG0tBVCJrIS3Nf37dXAhjBpSVifnR0hk1jCRSn5BXq66eOKoVmWDRQC4rIhtPw
         UKOGu7TcYnqer4stogIL+ir8RvTJdkTrH3bug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsidF0qi6Z2qBnCAOuW5bxrXb8326BK2qz06ZUf0X/w=;
        b=GI6M1wFcP3m918da2dkeBJgj3/+/LQiJ4GuttYrrx+8qUqW1DcCXLHamMGyXpMhFlc
         V8dN9M8w+2AgRKdSwosnwp3TkBPhoJVkkyHZ6hkb1jt68X9MVeXP5N4LPCUhtzJmEEC8
         CsQ6Hl4uOQiETNs5HQRy88R7xpVstRlG7h6O6EZuXMYW73gwzkTTcvXKfvAnZfwoxUmC
         hv/cJcWsTO7V+yAYf9QHJl4VDec87XA2gasLHGz8d3YjhiQ/RySUydnJEYjNaV2hCoIU
         JDsQuVrm6jL6AIkwo2pJiOBTz281dzjcPnJLW3K3mxinwDLnTO2+HeflhomnLxFfA776
         T1yg==
X-Gm-Message-State: APjAAAW0sJP4ShzkGKPdJWiRtBCiI3qmeje5dHoGw0xy7L2D/WCRRaeN
        x8pmHG/GkEG+6TmTVleZaITrJLY2KiY=
X-Google-Smtp-Source: APXvYqzyB+3mcIng1GWeru39D53kbYEa54AYtiuR9pisKPZa1ZdF84J/4WUwwTBfBEGErTLOI4fQQQ==
X-Received: by 2002:a17:902:4501:: with SMTP id m1mr15300085pld.264.1565002188356;
        Mon, 05 Aug 2019 03:49:48 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id 65sm88693864pgf.30.2019.08.05.03.49.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 03:49:47 -0700 (PDT)
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
Subject: [PATCH v14 0/5] Add support for mt8183 SCP.
Date:   Mon,  5 Aug 2019 18:49:21 +0800
Message-Id: <20190805104932.96745-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
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
 drivers/remoteproc/mtk_scp_ipi.c              | 159 ++++
 drivers/rpmsg/Kconfig                         |   9 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 414 ++++++++++
 include/linux/remoteproc/mtk_scp.h            | 168 +++++
 include/linux/rpmsg/mtk_rpmsg.h               |  38 +
 13 files changed, 1661 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/remoteproc/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h

-- 
2.22.0.770.g0f2c4a37fd-goog

