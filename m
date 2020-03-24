Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEC8190BC4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 12:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgCXLB0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 07:01:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56552 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgCXLBY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 07:01:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OB1Mi1124053;
        Tue, 24 Mar 2020 06:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585047682;
        bh=SB0GTqoObITXOcnT7Ja9diuL++m4qw90FV+foZstRrU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xHj0vqNxrPrmkrqT0W3iaaLPcZd1oiOIcZM0/LTpJVPcQsBSTTaV5xhI1jze7dOY5
         H8ZWq/koAVt7w9+JKd3wJFRazeMbtB4at1BNF2D7zTJrhOAzIi/GtbBMM8XnIiLUeT
         XMitq/9OH6ZeGnEcqlp+AHrA/xpcVNRL1qtUHuaY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OB1MKV109535;
        Tue, 24 Mar 2020 06:01:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 06:01:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 06:01:22 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OB0rAw008648;
        Tue, 24 Mar 2020 06:01:20 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <afd@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv9 12/15] remoteproc/omap: Add support for runtime auto-suspend/resume
Date:   Tue, 24 Mar 2020 13:00:32 +0200
Message-ID: <20200324110035.29907-13-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324110035.29907-1-t-kristo@ti.com>
References: <20200324110035.29907-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

This patch enhances the PM support in the OMAP remoteproc driver to
support the runtime auto-suspend. A remoteproc may not be required to
be running all the time, and typically will need to be active only
during certain usecases. As such, to save power, it should be turned
off during potential long periods of inactivity between usecases.
This suspend and resume of the device is a relatively heavy process
in terms of latencies, so a remoteproc should be suspended only after
a certain period of prolonged inactivity. The OMAP remoteproc driver
leverages the runtime pm framework's auto_suspend feature to accomplish
this functionality. This feature is automatically enabled when a remote
processor has successfully booted. The 'autosuspend_delay_ms' for each
device dictates the inactivity period/time to wait for before
suspending the device.

The runtime auto-suspend design relies on marking the last busy time
on every communication (virtqueue kick) to and from the remote processor.
When there has been no activity for 'autosuspend_delay_ms' time, the
runtime PM framework invokes the driver's runtime pm suspend callback
to suspend the device. The remote processor will be woken up on the
initiation of the next communication message through the runtime pm
resume callback. The current auto-suspend design also allows a remote
processor to deny a auto-suspend attempt, if it wishes to, by sending a
NACK response to the initial suspend request message sent to the remote
processor as part of the suspend process. The auto-suspend request is
also only attempted if the remote processor is idled and in standby at
the time of inactivity timer expiry. This choice is made to avoid
unnecessary messaging, and the auto-suspend is simply rescheduled to
be attempted again after a further lapse of autosuspend_delay_ms.

The runtime pm callbacks functionality in this patch reuses most of the
core logic from the suspend/resume support code, and make use of an
additional auto_suspend flag to differentiate the logic in common code
from system suspend. The system suspend/resume sequences are also updated
to reflect the proper pm_runtime statuses, and also to really perform a
suspend/resume only if the remoteproc has not been auto-suspended at the
time of request. The remote processor is left in suspended state on a
system resume if it has been auto-suspended before, and will be woken up
only when a usecase needs to run.

The OMAP remoteproc driver currently uses a default value of 10 seconds
for all OMAP remoteprocs, and a different value can be chosen either by
choosing a positive value for the 'ti,autosuspend-delay-ms' under DT or
by updating the 'autosuspend_delay_ms' field at runtime through the
sysfs interface. A negative value is equivalent to disabling the runtime
suspend.
    Eg: To use 25 seconds for IPU2 on DRA7xx,
      echo 25000 > /sys/bus/platform/devices/55020000.ipu/power/autosuspend_delay_ms

The runtime suspend feature can also be similarly enabled or disabled by
writing 'auto' or 'on' to the device's 'control' power field. The default
is enabled.
    Eg: To disable auto-suspend for IPU2 on DRA7xx SoC,
      echo on > /sys/bus/platform/devices/55020000.ipu/power/control

Signed-off-by: Suman Anna <s-anna@ti.com>
[t-kristo@ti.com: converted to use ti-sysc instead of hwmod]
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Andrew F. Davis <afd@ti.com>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v9:
  * no changes

 drivers/remoteproc/omap_remoteproc.c | 212 +++++++++++++++++++++++++--
 1 file changed, 203 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index fc83dd851c39..b784f48e63d1 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -22,6 +22,7 @@
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <linux/remoteproc.h>
 #include <linux/mailbox_client.h>
@@ -37,6 +38,9 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 
+/* default auto-suspend delay (ms) */
+#define DEFAULT_AUTOSUSPEND_DELAY		10000
+
 /**
  * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
  * @syscon: regmap handle for the system control configuration module
@@ -83,6 +87,8 @@ struct omap_rproc_timer {
  * @num_mems: number of internal memory regions
  * @num_timers: number of rproc timer(s)
  * @timers: timer(s) info used by rproc
+ * @autosuspend_delay: auto-suspend delay value to be used for runtime pm
+ * @need_resume: if true a resume is needed in the system resume callback
  * @rproc: rproc handle
  * @reset: reset handle
  * @pm_comp: completion primitive to sync for suspend response
@@ -97,6 +103,8 @@ struct omap_rproc {
 	int num_mems;
 	int num_timers;
 	struct omap_rproc_timer *timers;
+	int autosuspend_delay;
+	bool need_resume;
 	struct rproc *rproc;
 	struct reset_control *reset;
 	struct completion pm_comp;
@@ -407,11 +415,23 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
+	/* wake up the rproc before kicking it */
+	ret = pm_runtime_get_sync(dev);
+	if (WARN_ON(ret < 0)) {
+		dev_err(dev, "pm_runtime_get_sync() failed during kick, ret = %d\n",
+			ret);
+		pm_runtime_put_noidle(dev);
+		return;
+	}
+
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(oproc->mbox, (void *)vqid);
 	if (ret < 0)
 		dev_err(dev, "failed to send mailbox message, status = %d\n",
 			ret);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 /**
@@ -502,6 +522,18 @@ static int omap_rproc_start(struct rproc *rproc)
 		goto disable_timers;
 	}
 
+	/*
+	 * remote processor is up, so update the runtime pm status and
+	 * enable the auto-suspend. The device usage count is incremented
+	 * manually for balancing it for auto-suspend
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 disable_timers:
@@ -514,20 +546,52 @@ static int omap_rproc_start(struct rproc *rproc)
 /* power off the remote processor */
 static int omap_rproc_stop(struct rproc *rproc)
 {
+	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	int ret;
 
+	/*
+	 * cancel any possible scheduled runtime suspend by incrementing
+	 * the device usage count, and resuming the device. The remoteproc
+	 * also needs to be woken up if suspended, to avoid the remoteproc
+	 * OS to continue to remember any context that it has saved, and
+	 * avoid potential issues in misindentifying a subsequent device
+	 * reboot as a power restore boot
+	 */
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
 	ret = reset_control_assert(oproc->reset);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = omap_rproc_disable_timers(rproc, true);
 	if (ret)
-		return ret;
+		goto enable_device;
 
 	mbox_free_channel(oproc->mbox);
 
+	/*
+	 * update the runtime pm states and status now that the remoteproc
+	 * has stopped
+	 */
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+
 	return 0;
+
+enable_device:
+	reset_control_deassert(oproc->reset);
+out:
+	/* schedule the next auto-suspend */
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	return ret;
 }
 
 /**
@@ -584,17 +648,19 @@ static bool _is_rproc_in_standby(struct omap_rproc *oproc)
 
 /* 1 sec is long enough time to let the remoteproc side suspend the device */
 #define DEF_SUSPEND_TIMEOUT 1000
-static int _omap_rproc_suspend(struct rproc *rproc)
+static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
 {
 	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
 	unsigned long ta = jiffies + to;
+	u32 suspend_msg = auto_suspend ?
+				RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
 	int ret;
 
 	reinit_completion(&oproc->pm_comp);
 	oproc->suspend_acked = false;
-	ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_SUSPEND_SYSTEM);
+	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
 	if (ret < 0) {
 		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
 		return ret;
@@ -638,32 +704,62 @@ static int _omap_rproc_suspend(struct rproc *rproc)
 		goto enable_device;
 	}
 
+	/*
+	 * IOMMUs would have to be disabled specifically for runtime suspend.
+	 * They are handled automatically through System PM callbacks for
+	 * regular system suspend
+	 */
+	if (auto_suspend) {
+		ret = omap_iommu_domain_deactivate(rproc->domain);
+		if (ret) {
+			dev_err(dev, "iommu domain deactivate failed %d\n",
+				ret);
+			goto enable_timers;
+		}
+	}
+
 	return 0;
 
+enable_timers:
+	/* ignore errors on re-enabling code */
+	omap_rproc_enable_timers(rproc, false);
 enable_device:
 	reset_control_deassert(oproc->reset);
 	return ret;
 }
 
-static int _omap_rproc_resume(struct rproc *rproc)
+static int _omap_rproc_resume(struct rproc *rproc, bool auto_suspend)
 {
 	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	int ret;
 
+	/*
+	 * IOMMUs would have to be enabled specifically for runtime resume.
+	 * They would have been already enabled automatically through System
+	 * PM callbacks for regular system resume
+	 */
+	if (auto_suspend) {
+		ret = omap_iommu_domain_activate(rproc->domain);
+		if (ret) {
+			dev_err(dev, "omap_iommu activate failed %d\n", ret);
+			goto out;
+		}
+	}
+
 	/* boot address could be lost after suspend, so restore it */
 	if (oproc->boot_data) {
 		ret = omap_rproc_write_dsp_boot_addr(rproc);
 		if (ret) {
 			dev_err(dev, "boot address restore failed %d\n", ret);
-			goto out;
+			goto suspend_iommu;
 		}
 	}
 
 	ret = omap_rproc_enable_timers(rproc, false);
 	if (ret) {
 		dev_err(dev, "enabling timers during resume failed %d\n", ret);
-		goto out;
+		goto suspend_iommu;
 	}
 
 	ret = reset_control_deassert(oproc->reset);
@@ -676,6 +772,9 @@ static int _omap_rproc_resume(struct rproc *rproc)
 
 disable_timers:
 	omap_rproc_disable_timers(rproc, false);
+suspend_iommu:
+	if (auto_suspend)
+		omap_iommu_domain_deactivate(rproc->domain);
 out:
 	return ret;
 }
@@ -684,6 +783,7 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct omap_rproc *oproc = rproc->priv;
 	int ret = 0;
 
 	mutex_lock(&rproc->lock);
@@ -698,13 +798,19 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
 		goto out;
 	}
 
-	ret = _omap_rproc_suspend(rproc);
+	ret = _omap_rproc_suspend(rproc, false);
 	if (ret) {
 		dev_err(dev, "suspend failed %d\n", ret);
 		goto out;
 	}
 
+	/*
+	 * remoteproc is running at the time of system suspend, so remember
+	 * it so as to wake it up during system resume
+	 */
+	oproc->need_resume = true;
 	rproc->state = RPROC_SUSPENDED;
+
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -714,6 +820,7 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct omap_rproc *oproc = rproc->priv;
 	int ret = 0;
 
 	mutex_lock(&rproc->lock);
@@ -725,12 +832,91 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
 		goto out;
 	}
 
-	ret = _omap_rproc_resume(rproc);
+	/*
+	 * remoteproc was auto-suspended at the time of system suspend,
+	 * so no need to wake-up the processor (leave it in suspended
+	 * state, will be woken up during a subsequent runtime_resume)
+	 */
+	if (!oproc->need_resume)
+		goto out;
+
+	ret = _omap_rproc_resume(rproc, false);
 	if (ret) {
 		dev_err(dev, "resume failed %d\n", ret);
 		goto out;
 	}
 
+	oproc->need_resume = false;
+	rproc->state = RPROC_RUNNING;
+
+	pm_runtime_mark_last_busy(dev);
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+
+static int omap_rproc_runtime_suspend(struct device *dev)
+{
+	struct rproc *rproc = dev_get_drvdata(dev);
+	struct omap_rproc *oproc = rproc->priv;
+	int ret;
+
+	mutex_lock(&rproc->lock);
+	if (rproc->state == RPROC_CRASHED) {
+		dev_dbg(dev, "rproc cannot be runtime suspended when crashed!\n");
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (WARN_ON(rproc->state != RPROC_RUNNING)) {
+		dev_err(dev, "rproc cannot be runtime suspended when not running!\n");
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/*
+	 * do not even attempt suspend if the remote processor is not
+	 * idled for runtime auto-suspend
+	 */
+	if (!_is_rproc_in_standby(oproc)) {
+		ret = -EBUSY;
+		goto abort;
+	}
+
+	ret = _omap_rproc_suspend(rproc, true);
+	if (ret)
+		goto abort;
+
+	rproc->state = RPROC_SUSPENDED;
+	mutex_unlock(&rproc->lock);
+	return 0;
+
+abort:
+	pm_runtime_mark_last_busy(dev);
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+
+static int omap_rproc_runtime_resume(struct device *dev)
+{
+	struct rproc *rproc = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&rproc->lock);
+	if (WARN_ON(rproc->state != RPROC_SUSPENDED)) {
+		dev_err(dev, "rproc cannot be runtime resumed if not suspended! state=%d\n",
+			rproc->state);
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = _omap_rproc_resume(rproc, true);
+	if (ret) {
+		dev_err(dev, "runtime resume failed %d\n", ret);
+		goto out;
+	}
+
 	rproc->state = RPROC_RUNNING;
 out:
 	mutex_unlock(&rproc->lock);
@@ -997,6 +1183,12 @@ static int omap_rproc_probe(struct platform_device *pdev)
 		goto free_rproc;
 
 	init_completion(&oproc->pm_comp);
+	oproc->autosuspend_delay = DEFAULT_AUTOSUSPEND_DELAY;
+
+	of_property_read_u32(pdev->dev.of_node, "ti,autosuspend-delay-ms",
+			     &oproc->autosuspend_delay);
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, oproc->autosuspend_delay);
 
 	oproc->fck = devm_clk_get(&pdev->dev, 0);
 	if (IS_ERR(oproc->fck)) {
@@ -1039,6 +1231,8 @@ static int omap_rproc_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops omap_rproc_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(omap_rproc_suspend, omap_rproc_resume)
+	SET_RUNTIME_PM_OPS(omap_rproc_runtime_suspend,
+			   omap_rproc_runtime_resume, NULL)
 };
 
 static struct platform_driver omap_rproc_driver = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
