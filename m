Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E4F21CCEC
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Jul 2020 03:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgGMB4H (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 12 Jul 2020 21:56:07 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33366 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726261AbgGMB4H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 12 Jul 2020 21:56:07 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 24DAEECCCE5C44844222;
        Mon, 13 Jul 2020 09:56:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Jul 2020 09:55:54 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] remoteproc: qcom: Add missing slab.h
Date:   Mon, 13 Jul 2020 10:00:03 +0800
Message-ID: <20200713020003.134039-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

drivers/remoteproc/qcom_common.c: In function ‘qcom_ssr_get_subsys’:
drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of function ‘kzalloc’; did you mean ‘vzalloc’?
[-Werror=implicit-function-declaration]
  info = kzalloc(sizeof(*info), GFP_KERNEL);
         ^~~~~~~
         vzalloc

kzalloc() is declared in linux/slab.h, add include to fix build issue.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/remoteproc/qcom_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 2f45f0c79914e..085fd73fa23ae 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -15,6 +15,7 @@
 #include <linux/remoteproc/qcom_rproc.h>
 #include <linux/rpmsg/qcom_glink.h>
 #include <linux/rpmsg/qcom_smd.h>
+#include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
 #include "remoteproc_internal.h"
-- 
2.26.2

