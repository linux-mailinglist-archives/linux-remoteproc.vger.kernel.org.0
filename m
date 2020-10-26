Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239B5298B74
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Oct 2020 12:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773182AbgJZLL3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 26 Oct 2020 07:11:29 -0400
Received: from muru.com ([72.249.23.125]:46618 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773179AbgJZLL3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 07:11:29 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 646A28196;
        Mon, 26 Oct 2020 11:11:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 8/9] soc: ti: pm33xx: Enable basic PM runtime support for genpd
Date:   Mon, 26 Oct 2020 13:10:48 +0200
Message-Id: <20201026111049.54835-9-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

To prepare for moving to use genpd, let's enable basic PM
runtime support.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/pm33xx.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -19,6 +19,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_data/pm33xx.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/rtc.h>
 #include <linux/rtc/rtc-omap.h>
 #include <linux/sizes.h>
@@ -555,16 +556,26 @@ static int am33xx_pm_probe(struct platform_device *pdev)
 	suspend_wfi_flags |= WFI_FLAG_WAKE_M3;
 #endif /* CONFIG_SUSPEND */
 
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		goto err_pm_runtime_disable;
+	}
+
 	ret = pm_ops->init(am33xx_do_sram_idle);
 	if (ret) {
 		dev_err(dev, "Unable to call core pm init!\n");
 		ret = -ENODEV;
-		goto err_put_wkup_m3_ipc;
+		goto err_pm_runtime_put;
 	}
 
 	return 0;
 
-err_put_wkup_m3_ipc:
+err_pm_runtime_put:
+	pm_runtime_put_sync(dev);
+err_pm_runtime_disable:
+	pm_runtime_disable(dev);
 	wkup_m3_ipc_put(m3_ipc);
 err_free_sram:
 	am33xx_pm_free_sram();
@@ -574,6 +585,8 @@ static int am33xx_pm_probe(struct platform_device *pdev)
 
 static int am33xx_pm_remove(struct platform_device *pdev)
 {
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	if (pm_ops->deinit)
 		pm_ops->deinit();
 	suspend_set_ops(NULL);
-- 
2.29.1
