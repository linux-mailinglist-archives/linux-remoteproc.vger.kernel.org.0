Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B2617A38A
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Mar 2020 12:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgCELB3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Mar 2020 06:01:29 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:36762 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgCELB2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Mar 2020 06:01:28 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 9D8DC1D41BA6;
        Thu,  5 Mar 2020 14:01:24 +0300 (MSK)
Received: from mxback3q.mail.yandex.net (mxback3q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:4545:437c])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id 98EF661E0005;
        Thu,  5 Mar 2020 14:01:24 +0300 (MSK)
Received: from vla5-445dc1c4c112.qloud-c.yandex.net (vla5-445dc1c4c112.qloud-c.yandex.net [2a02:6b8:c18:3609:0:640:445d:c1c4])
        by mxback3q.mail.yandex.net (mxback/Yandex) with ESMTP id CVq7KWrbAs-1OsWvCOO;
        Thu, 05 Mar 2020 14:01:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1583406084;
        bh=AmGytnTEiyii3t9aAlHB2Wa9X2zWuijNdHr8kpI5/zU=;
        h=In-Reply-To:Subject:To:From:Message-Id:Cc:References:Date;
        b=kv+GDHGHnRCM+bqjVuKrZU1rEdLwMAyivNmpo5p5QhV0/6CAZ1459XpAE0a0aIVt1
         UxGXUuzKGzvY5WrKdhmRW6fcr6SlIgrW9AN4qPgBMx8/6WLgixyJpasdKD4COzK3PS
         PnSL6/+ktF25U9CKS2J4fgQYpbyz+MVVgogbsxFU=
Authentication-Results: mxback3q.mail.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla5-445dc1c4c112.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8hWJyQQZRL-1NW85aJi;
        Thu, 05 Mar 2020 14:01:23 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <NShubin@topcon.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] remoteproc: Fix NULL pointer dereference in rproc_virtio_notify
Date:   Thu,  5 Mar 2020 14:02:17 +0300
Message-Id: <20200305110218.8799-1-NShubin@topcon.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228110804.25822-1-nikita.shubin@maquefel.me>
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Undefined rproc_ops .kick method in remoteproc driver will result in
"Unable to handle kernel NULL pointer dereference" if:

 1) .kick method wasn't defined in driver
 2) resource_table exists in firmware and has "Virtio device entry" defined

 Observed on imx_rproc driver on imx7d hardware, full stack strace:

[   13.180049][  T415] 8<--- cut here ---
[   13.190558][  T415] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[   13.212544][  T415] pgd = (ptrval)
[   13.217052][  T415] [00000000] *pgd=00000000
[   13.224692][  T415] Internal error: Oops: 80000005 [#1] PREEMPT SMP ARM
[   13.231318][  T415] Modules linked in: rpmsg_char imx_rproc virtio_rpmsg_bus rpmsg_core [last unloaded: imx_rproc]
[   13.241687][  T415] CPU: 0 PID: 415 Comm: unload-load.sh Not tainted 5.5.2-00002-g707df13bbbdd #6
[   13.250561][  T415] Hardware name: Freescale i.MX7 Dual (Device Tree)
[   13.257009][  T415] PC is at 0x0
[   13.260249][  T415] LR is at rproc_virtio_notify+0x2c/0x54
[   13.265738][  T415] pc : [<00000000>]    lr : [<8050f6b0>]    psr: 60010113
[   13.272702][  T415] sp : b8d47c48  ip : 00000001  fp : bc04de00
[   13.278625][  T415] r10: bc04c000  r9 : 00000cc0  r8 : b8d46000
[   13.284548][  T415] r7 : 00000000  r6 : b898f200  r5 : 00000000  r4 : b8a29800
[   13.291773][  T415] r3 : 00000000  r2 : 990a3ad4  r1 : 00000000  r0 : b8a29800
[   13.299000][  T415] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   13.306833][  T415] Control: 10c5387d  Table: b8b4806a  DAC: 00000051
[   13.313278][  T415] Process unload-load.sh (pid: 415, stack limit = 0x(ptrval))
[   13.320591][  T415] Stack: (0xb8d47c48 to 0xb8d48000)
[   13.325651][  T415] 7c40:                   b895b680 00000001 b898f200 803c6430 b895bc80 7f00ae18
[   13.334531][  T415] 7c60: 00000035 00000000 00000000 b9393200 80b3ed80 00004000 b9393268 bbf5a9a2
[   13.343410][  T415] 7c80: 00000e00 00000200 00000000 7f00aff0 7f00a014 b895b680 b895b800 990a3ad4
[   13.352290][  T415] 7ca0: 00000001 b898f210 b898f200 00000000 00000000 7f00e000 00000001 00000000
[   13.361170][  T415] 7cc0: 00000000 803c62e0 80b2169c 802a0924 b898f210 00000000 00000000 b898f210
[   13.370049][  T415] 7ce0: 80b9ba44 00000000 80b9ba48 00000000 7f00e000 00000008 80b2169c 80400114
[   13.378929][  T415] 7d00: 80b2169c 8061fd64 b898f210 7f00e000 80400744 b8d46000 80b21634 80b21634
[   13.387809][  T415] 7d20: 80b2169c 80400614 80b21634 80400718 7f00e000 00000000 b8d47d7c 80400744
[   13.396689][  T415] 7d40: b8d46000 80b21634 80b21634 803fe338 b898f254 b80fe76c b8d32e38 990a3ad4
[   13.405569][  T415] 7d60: fffffff3 b898f210 b8d46000 00000001 b898f254 803ffe7c 80857a90 b898f210
[   13.414449][  T415] 7d80: 00000001 990a3ad4 b8d46000 b898f210 b898f210 80b17aec b8a29c20 803ff0a4
[   13.423328][  T415] 7da0: b898f210 00000000 b8d46000 803fb8e0 b898f200 00000000 80b17aec b898f210
[   13.432209][  T415] 7dc0: b8a29c20 990a3ad4 b895b900 b898f200 8050fb7c 80b17aec b898f210 b8a29c20
[   13.441088][  T415] 7de0: b8a29800 b895b900 b8a29a04 803c5ec0 b8a29c00 b898f200 b8a29a20 00000007
[   13.449968][  T415] 7e00: b8a29c20 8050fd78 b8a29800 00000000 b8a29a20 b8a29c04 b8a29820 b8a299d0
[   13.458848][  T415] 7e20: b895b900 8050e5a4 b8a29800 b8a299d8 b8d46000 b8a299e0 b8a29820 b8a299d0
[   13.467728][  T415] 7e40: b895b900 8050e008 000041ed 00000000 b8b8c440 b8a299d8 b8a299e0 b8a299d8
[   13.476608][  T415] 7e60: b8b8c440 990a3ad4 00000000 b8a29820 b8b8c400 00000006 b8a29800 b895b880
[   13.485487][  T415] 7e80: b8d47f78 00000000 00000000 8050f4b4 00000006 b895b890 b8b8c400 008fbea0
[   13.494367][  T415] 7ea0: b895b880 8029f530 00000000 00000000 b8d46000 00000006 b8d46000 008fbea0
[   13.503246][  T415] 7ec0: 8029f434 00000000 b8d46000 00000000 00000000 8021e2e4 0000000a 8061fd0c
[   13.512125][  T415] 7ee0: 0000000a b8af0c00 0000000a b8af0c40 00000001 b8af0c40 00000000 8061f910
[   13.521005][  T415] 7f00: 0000000a 80240af4 00000002 b8d46000 00000000 8061fd0c 00000002 80232d7c
[   13.529884][  T415] 7f20: 00000000 b8d46000 00000000 990a3ad4 00000000 00000006 b8a62d80 008fbea0
[   13.538764][  T415] 7f40: b8d47f78 00000000 b8d46000 00000000 00000000 802210c0 b88f2900 00000000
[   13.547644][  T415] 7f60: b8a62d80 b8a62d80 b8d46000 00000006 008fbea0 80221320 00000000 00000000
[   13.556524][  T415] 7f80: b8af0c00 990a3ad4 0000006c 008fbea0 76f1cda0 00000004 80101204 00000004
[   13.565403][  T415] 7fa0: 00000000 80101000 0000006c 008fbea0 00000001 008fbea0 00000006 00000000
[   13.574283][  T415] 7fc0: 0000006c 008fbea0 76f1cda0 00000004 00000006 00000006 00000000 00000000
[   13.583162][  T415] 7fe0: 00000004 7ebaf7d0 76eb4c0b 76e3f206 600d0030 00000001 00000000 00000000
[   13.592056][  T415] [<8050f6b0>] (rproc_virtio_notify) from [<803c6430>] (virtqueue_notify+0x1c/0x34)
[   13.601298][  T415] [<803c6430>] (virtqueue_notify) from [<7f00ae18>] (rpmsg_probe+0x280/0x380 [virtio_rpmsg_bus])
[   13.611663][  T415] [<7f00ae18>] (rpmsg_probe [virtio_rpmsg_bus]) from [<803c62e0>] (virtio_dev_probe+0x1f8/0x2c4)
[   13.622022][  T415] [<803c62e0>] (virtio_dev_probe) from [<80400114>] (really_probe+0x200/0x450)
[   13.630817][  T415] [<80400114>] (really_probe) from [<80400614>] (driver_probe_device+0x16c/0x1ac)
[   13.639873][  T415] [<80400614>] (driver_probe_device) from [<803fe338>] (bus_for_each_drv+0x84/0xc8)
[   13.649102][  T415] [<803fe338>] (bus_for_each_drv) from [<803ffe7c>] (__device_attach+0xd4/0x164)
[   13.658069][  T415] [<803ffe7c>] (__device_attach) from [<803ff0a4>] (bus_probe_device+0x84/0x8c)
[   13.666950][  T415] [<803ff0a4>] (bus_probe_device) from [<803fb8e0>] (device_add+0x444/0x768)
[   13.675572][  T415] [<803fb8e0>] (device_add) from [<803c5ec0>] (register_virtio_device+0xa4/0xfc)
[   13.684541][  T415] [<803c5ec0>] (register_virtio_device) from [<8050fd78>] (rproc_add_virtio_dev+0xcc/0x1b8)
[   13.694466][  T415] [<8050fd78>] (rproc_add_virtio_dev) from [<8050e5a4>] (rproc_start+0x148/0x200)
[   13.703521][  T415] [<8050e5a4>] (rproc_start) from [<8050e008>] (rproc_boot+0x384/0x5c0)
[   13.711708][  T415] [<8050e008>] (rproc_boot) from [<8050f4b4>] (state_store+0x3c/0xc8)
[   13.719723][  T415] [<8050f4b4>] (state_store) from [<8029f530>] (kernfs_fop_write+0xfc/0x214)
[   13.728348][  T415] [<8029f530>] (kernfs_fop_write) from [<8021e2e4>] (__vfs_write+0x30/0x1cc)
[   13.736971][  T415] [<8021e2e4>] (__vfs_write) from [<802210c0>] (vfs_write+0xac/0x17c)
[   13.744985][  T415] [<802210c0>] (vfs_write) from [<80221320>] (ksys_write+0x64/0xe4)
[   13.752825][  T415] [<80221320>] (ksys_write) from [<80101000>] (ret_fast_syscall+0x0/0x54)
[   13.761178][  T415] Exception stack(0xb8d47fa8 to 0xb8d47ff0)
[   13.766932][  T415] 7fa0:                   0000006c 008fbea0 00000001 008fbea0 00000006 00000000
[   13.775811][  T415] 7fc0: 0000006c 008fbea0 76f1cda0 00000004 00000006 00000006 00000000 00000000
[   13.784687][  T415] 7fe0: 00000004 7ebaf7d0 76eb4c0b 76e3f206
[   13.790442][  T415] Code: bad PC value
[   13.839214][  T415] ---[ end trace 1fe21ecfc9f28852 ]---


