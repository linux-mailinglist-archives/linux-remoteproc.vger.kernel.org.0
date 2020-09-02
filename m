Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B533C25AC87
	for <lists+linux-remoteproc@lfdr.de>; Wed,  2 Sep 2020 16:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgIBOHF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Sep 2020 10:07:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:10799 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726521AbgIBOGs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 10:06:48 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 73C3263CD800FB392089;
        Wed,  2 Sep 2020 22:06:45 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
 22:06:35 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>, <s-anna@ti.com>,
        <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] remoteproc: k3-dsp: Fix return value check in k3_dsp_rproc_of_get_memories()
Date:   Wed, 2 Sep 2020 22:06:14 +0800
Message-ID: <20200902140614.28636-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In case of error, the function devm_ioremap_wc() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 87218f96c21a ("remoteproc: k3-dsp: Add support for C71x DSPs")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 9011e477290c..f373df35d7d0 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -445,10 +445,10 @@ static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
 
 		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
 							 resource_size(res));
-		if (IS_ERR(kproc->mem[i].cpu_addr)) {
+		if (!kproc->mem[i].cpu_addr) {
 			dev_err(dev, "failed to map %s memory\n",
 				data->mems[i].name);
-			return PTR_ERR(kproc->mem[i].cpu_addr);
+			return -EBUSY;
 		}
 		kproc->mem[i].bus_addr = res->start;
 		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
-- 
2.17.1


