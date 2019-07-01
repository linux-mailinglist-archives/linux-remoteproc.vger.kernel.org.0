Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A20FE3051F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 May 2019 01:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfE3XCL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 May 2019 19:02:11 -0400
Received: from da1vs02.rockwellcollins.com ([205.175.227.29]:29463 "EHLO
        da1vs02.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbfE3XCK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 May 2019 19:02:10 -0400
X-Greylist: delayed 571 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 May 2019 19:02:10 EDT
Received: from ofwda1n02.rockwellcollins.com (HELO ciulimr01.rockwellcollins.com) ([205.175.227.14])
  by da1vs02.rockwellcollins.com with ESMTP; 30 May 2019 17:52:40 -0500
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com [192.168.141.218])
        by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 3BF2C600DA;
        Thu, 30 May 2019 17:52:39 -0500 (CDT)
From:   Brandon Maier <brandon.maier@rockwellcollins.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org,
        clayton.shotwell@rockwellcollins.com,
        Brandon Maier <brandon.maier@rockwellcollins.com>
Subject: [PATCH] remoteproc: Initialize rproc_class before use
Date:   Thu, 30 May 2019 17:52:23 -0500
Message-Id: <20190530225223.136420-1-brandon.maier@rockwellcollins.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The remoteproc_core and remoteproc drivers all initialize with module_init().
However remoteproc drivers need the rproc_class during their probe. If one of
the remoteproc drivers runs init and gets through probe before
remoteproc_init() runs, a NULL pointer access of rproc_class's `glue_dirs`
spinlock occurs.

> Unable to handle kernel NULL pointer dereference at virtual address 000000dc
> pgd = c0004000
> [000000dc] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.14.106-rt56 #1
> Hardware name: Generic OMAP36xx (Flattened Device Tree)
> task: c6050000 task.stack: c604a000
> PC is at rt_spin_lock+0x40/0x6c
> LR is at rt_spin_lock+0x28/0x6c
> pc : [<c0523c90>]    lr : [<c0523c78>]    psr: 60000013
> sp : c604bdc0  ip : 00000000  fp : 00000000
> r10: 00000000  r9 : c61c7c10  r8 : c6269c20
> r7 : c0905888  r6 : c6269c20  r5 : 00000000  r4 : 000000d4
> r3 : 000000dc  r2 : c6050000  r1 : 00000002  r0 : 000000d4
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
...
> [<c0523c90>] (rt_spin_lock) from [<c03b65a4>] (get_device_parent+0x54/0x17c)
> [<c03b65a4>] (get_device_parent) from [<c03b6bec>] (device_add+0xe0/0x5b4)
> [<c03b6bec>] (device_add) from [<c042adf4>] (rproc_add+0x18/0xd8)
> [<c042adf4>] (rproc_add) from [<c01110e4>] (my_rproc_probe+0x158/0x204)
> [<c01110e4>] (my_rproc_probe) from [<c03bb6b8>] (platform_drv_probe+0x34/0x70)
> [<c03bb6b8>] (platform_drv_probe) from [<c03b9dd4>] (driver_probe_device+0x2c8/0x420)
> [<c03b9dd4>] (driver_probe_device) from [<c03ba02c>] (__driver_attach+0x100/0x11c)
> [<c03ba02c>] (__driver_attach) from [<c03b7d08>] (bus_for_each_dev+0x7c/0xc0)
> [<c03b7d08>] (bus_for_each_dev) from [<c03b910c>] (bus_add_driver+0x1cc/0x264)
> [<c03b910c>] (bus_add_driver) from [<c03ba714>] (driver_register+0x78/0xf8)
> [<c03ba714>] (driver_register) from [<c010181c>] (do_one_initcall+0x100/0x190)
> [<c010181c>] (do_one_initcall) from [<c0800de8>] (kernel_init_freeable+0x130/0x1d0)
> [<c0800de8>] (kernel_init_freeable) from [<c051eee8>] (kernel_init+0x8/0x114)
> [<c051eee8>] (kernel_init) from [<c01175b0>] (ret_from_fork+0x14/0x24)
> Code: e2843008 e3c2203f f5d3f000 e5922010 (e193cf9f)
> ---[ end trace 0000000000000002 ]---

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 48feebd6d0a2..83986531af83 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2217,7 +2217,7 @@ static int __init remoteproc_init(void)
 
 	return 0;
 }
-module_init(remoteproc_init);
+subsys_initcall(remoteproc_init);
 
 static void __exit remoteproc_exit(void)
 {
-- 
2.21.0

