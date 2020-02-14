Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D35815F068
	for <lists+linux-remoteproc@lfdr.de>; Fri, 14 Feb 2020 18:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388428AbgBNP6A (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 14 Feb 2020 10:58:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388033AbgBNP57 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 14 Feb 2020 10:57:59 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 531E122314;
        Fri, 14 Feb 2020 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581695879;
        bh=hJpTG0cA0Qyjfs8Wam/B6OJISPBTcrtGIB1DwmrP8Kw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MN5FC6hHORC5PlLUBxQzVxlFZaG774/3epf/oZxrRFLnS9PyS3VRgbZXjqiGvV1c/
         WE3qN1LaFhlQkK1EQsZ0aa4Cp6VdADchUqevfnssPkUzZVOdVHW3dpRuDT8yzQhQvc
         F5JAnL01XDhbCYOd6oabMEafHkDW3VFltBQPGb90=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Brandon Maier <brandon.maier@rockwellcollins.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 423/542] remoteproc: Initialize rproc_class before use
Date:   Fri, 14 Feb 2020 10:46:55 -0500
Message-Id: <20200214154854.6746-423-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Brandon Maier <brandon.maier@rockwellcollins.com>

[ Upstream commit a8f40111d184098cd2b3dc0c7170c42250a5fa09 ]

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
Link: https://lore.kernel.org/r/20190530225223.136420-1-brandon.maier@rockwellcollins.com
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 307df98347ba2..8115f945151b3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2223,7 +2223,7 @@ static int __init remoteproc_init(void)
 
 	return 0;
 }
-module_init(remoteproc_init);
+subsys_initcall(remoteproc_init);
 
 static void __exit remoteproc_exit(void)
 {
-- 
2.20.1

