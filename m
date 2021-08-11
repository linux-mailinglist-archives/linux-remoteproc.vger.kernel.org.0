Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD843E9126
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Aug 2021 14:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhHKMcB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 11 Aug 2021 08:32:01 -0400
Received: from mx21.baidu.com ([220.181.3.85]:42478 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229833AbhHKMb6 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Aug 2021 08:31:58 -0400
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
        by Forcepoint Email with ESMTPS id 7413F8ABFC7C79D36C2A;
        Wed, 11 Aug 2021 20:31:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 11 Aug 2021 20:31:32 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 11 Aug 2021 20:31:31 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] rpmsg: virtio: Remove unused including <linux/of_device.h>
Date:   Wed, 11 Aug 2021 20:31:25 +0800
Message-ID: <20210811123125.143-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove including <linux/of_device.h> that don't need it.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 8e49a3bacfc7..a0634ef0420b 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -17,7 +17,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/rpmsg/ns.h>
-- 
2.25.1

