Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606DA350006
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Mar 2021 14:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhCaMR7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 31 Mar 2021 08:17:59 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15413 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbhCaMRd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Mar 2021 08:17:33 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9QJN6b5nzlWsM;
        Wed, 31 Mar 2021 20:15:48 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 20:17:23 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Peng Fan <peng.fan@nxp.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] remoteproc: imx_rproc: fix build error without CONFIG_MAILBOX
Date:   Wed, 31 Mar 2021 12:27:09 +0000
Message-ID: <20210331122709.3935521-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fix build error when CONFIG_MAILBOX is not set:

arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_kick':
imx_rproc.c:(.text+0x328): undefined reference to `mbox_send_message'
arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_probe':
imx_rproc.c:(.text+0x52c): undefined reference to `mbox_request_channel_byname'
arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x548): undefined reference to `mbox_request_channel_byname'
arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x76c): undefined reference to `mbox_free_channel'
arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x774): undefined reference to `mbox_free_channel'
arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x7c4): undefined reference to `mbox_free_channel'
arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_remove':
imx_rproc.c:(.text+0x86c): undefined reference to `mbox_free_channel'
arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x874): undefined reference to `mbox_free_channel'
make: *** [Makefile:1292: vmlinux] Error 1

Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 7cf3d1b40c55..e68fcedc999c 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -26,6 +26,7 @@ config REMOTEPROC_CDEV
 config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
+	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
 	  processor framework.

