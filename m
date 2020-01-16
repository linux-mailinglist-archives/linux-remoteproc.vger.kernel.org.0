Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D5D13DC94
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Jan 2020 14:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgAPNyX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Jan 2020 08:54:23 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52552 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgAPNyW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Jan 2020 08:54:22 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GDsKY2062486;
        Thu, 16 Jan 2020 07:54:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579182860;
        bh=yz0NzKBE4EvKm/vypOD8zblGA2ieZAJ4+fFUY20iA8Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=x1Fzf6vURYFeLEjR1rD1O1cEjkw7WEShPHe0XoPBxW9Cr2a1RhFAzaLJDDcr4i1Lv
         j/zAP2xI41Z6hnkEihB0dD8IPgvqGkPblgfujeubwb0fTM3T38RWJH1JE8luyLDu5N
         eQVBlg/qRVgaN3zna5NADyEHe1mrMB2FS0eo9CF4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GDsK2i022633
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 07:54:20 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 07:54:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 07:54:19 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GDrqdd048732;
        Thu, 16 Jan 2020 07:54:17 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv5 11/14] remoteproc/omap: add support for system suspend/resume
Date:   Thu, 16 Jan 2020 15:53:29 +0200
Message-ID: <20200116135332.7819-12-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116135332.7819-1-t-kristo@ti.com>
References: <20200116135332.7819-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

This patch adds the support for system suspend/resume to the
OMAP remoteproc driver so that the OMAP remoteproc devices can
be suspended/resumed during a system suspend/resume. The support
is added through the driver PM .suspend/.resume callbacks, and
requires appropriate support from the OS running on the remote
processors.

The IPU & DSP remote processors typically have their own private
modules like registers, internal memories, caches etc. The context
of these modules need to be saved and restored properly for a
suspend/resume to work. These are in general not accessible from
the MPU, so the remote processors themselves have to implement
the logic for the context save & restore of these modules.

The OMAP remoteproc driver initiates a suspend by sending a mailbox
message requesting the remote processor to save its context and
enter into an idle/standby state. The remote processor should
usually stop whatever processing it is doing to switch to a context
save mode. The OMAP remoteproc driver detects the completion of
the context save by checking the module standby status for the
remoteproc device. It also stops any resources used by the remote
processors like the timers. The timers need to be running only
when the processor is active and executing, and need to be stopped
otherwise to allow the timer driver to reach low-power states. The
IOMMUs are automatically suspended by the PM core during the late
suspend stage, after the remoteproc suspend process is completed by
putting the remote processor cores into reset. Thereafter, the Linux
kernel can put the domain into further lower power states as possible.

The resume sequence undoes the operations performed in the PM suspend
callback, by starting the timers and finally releasing the processors
from reset. This requires that the remote processor side OS be able to
distinguish a power-resume boot from a power-on/cold boot, restore the
context of its private modules saved during the suspend phase, and
resume executing code from where it was suspended. The IOMMUs would
have been resumed by the PM core during early resume, so they are
already enabled by the time remoteproc resume callback gets invoked.

The remote processors should save their context into System RAM (DDR),
as any internal memories are not guaranteed to retain context as it
depends on the lowest power domain that the remote processor device
is put into. The management of the DDR contents will be managed by
the Linux kernel.

Signed-off-by: Suman Anna <s-anna@ti.com>
[t-kristo@ti.com: converted to use ti-sysc instead of hwmod]
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
v5:
  - add error check for reset_control_deassert under rproc_suspend
  - removed CONFIG_PM_SLEEP macro usage

 drivers/remoteproc/omap_remoteproc.c | 188 +++++++++++++++++++++++++++
 drivers/remoteproc/omap_remoteproc.h |  18 ++-
 2 files changed, 204 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 293996af4797..452ef6070175 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -15,13 +15,17 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/clk.h>
+#include <linux/clk/ti.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/remoteproc.h>
 #include <linux/mailbox_client.h>
+#include <linux/omap-iommu.h>
 #include <linux/omap-mailbox.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
@@ -81,6 +85,9 @@ struct omap_rproc_timer {
  * @timers: timer(s) info used by rproc
  * @rproc: rproc handle
  * @reset: reset handle
+ * @pm_comp: completion primitive to sync for suspend response
+ * @fck: functional clock for the remoteproc
+ * @suspend_acked: state machine flag to store the suspend request ack
  */
 struct omap_rproc {
 	struct mbox_chan *mbox;
@@ -92,6 +99,9 @@ struct omap_rproc {
 	struct omap_rproc_timer *timers;
 	struct rproc *rproc;
 	struct reset_control *reset;
+	struct completion pm_comp;
+	struct clk *fck;
+	bool suspend_acked;
 };
 
 /**
@@ -367,6 +377,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", name);
 		break;
+	case RP_MBOX_SUSPEND_ACK:
+		/* Fall through */
+	case RP_MBOX_SUSPEND_CANCEL:
+		oproc->suspend_acked = msg == RP_MBOX_SUSPEND_ACK;
+		complete(&oproc->pm_comp);
+		break;
 	default:
 		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
 			return;
@@ -555,6 +571,165 @@ static const struct rproc_ops omap_rproc_ops = {
 	.da_to_va	= omap_rproc_da_to_va,
 };
 
+#ifdef CONFIG_PM
+static bool _is_rproc_in_standby(struct omap_rproc *oproc)
+{
+	return ti_clk_is_in_standby(oproc->fck);
+}
+
+/* 1 sec is long enough time to let the remoteproc side suspend the device */
+#define DEF_SUSPEND_TIMEOUT 1000
+static int _omap_rproc_suspend(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct omap_rproc *oproc = rproc->priv;
+	unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
+	unsigned long ta = jiffies + to;
+	int ret;
+
+	reinit_completion(&oproc->pm_comp);
+	oproc->suspend_acked = false;
+	ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_SUSPEND_SYSTEM);
+	if (ret < 0) {
+		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&oproc->pm_comp, to);
+	if (!oproc->suspend_acked)
+		return -EBUSY;
+
+	/*
+	 * The remoteproc side is returning the ACK message before saving the
+	 * context, because the context saving is performed within a SYS/BIOS
+	 * function, and it cannot have any inter-dependencies against the IPC
+	 * layer. Also, as the SYS/BIOS needs to preserve properly the processor
+	 * register set, sending this ACK or signalling the completion of the
+	 * context save through a shared memory variable can never be the
+	 * absolute last thing to be executed on the remoteproc side, and the
+	 * MPU cannot use the ACK message as a sync point to put the remoteproc
+	 * into reset. The only way to ensure that the remote processor has
+	 * completed saving the context is to check that the module has reached
+	 * STANDBY state (after saving the context, the SYS/BIOS executes the
+	 * appropriate target-specific WFI instruction causing the module to
+	 * enter STANDBY).
+	 */
+	while (!_is_rproc_in_standby(oproc)) {
+		if (time_after(jiffies, ta))
+			return -ETIME;
+		schedule();
+	}
+
+	reset_control_assert(oproc->reset);
+
+	ret = omap_rproc_disable_timers(rproc, false);
+	if (ret) {
+		dev_err(dev, "disabling timers during suspend failed %d\n",
+			ret);
+		goto enable_device;
+	}
+
+	return 0;
+
+enable_device:
+	reset_control_deassert(oproc->reset);
+	return ret;
+}
+
+static int _omap_rproc_resume(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct omap_rproc *oproc = rproc->priv;
+	int ret;
+
+	/* boot address could be lost after suspend, so restore it */
+	if (oproc->boot_data) {
+		ret = omap_rproc_write_dsp_boot_addr(rproc);
+		if (ret) {
+			dev_err(dev, "boot address restore failed %d\n", ret);
+			goto out;
+		}
+	}
+
+	ret = omap_rproc_enable_timers(rproc, false);
+	if (ret) {
+		dev_err(dev, "enabling timers during resume failed %d\n", ret);
+		goto out;
+	}
+
+	ret = reset_control_deassert(oproc->reset);
+	if (ret) {
+		dev_err(dev, "reset deassert failed %d\n", ret);
+		goto disable_timers;
+	}
+
+	return 0;
+
+disable_timers:
+	omap_rproc_disable_timers(rproc, false);
+
+out:
+	return ret;
+}
+
+static int __maybe_unused omap_rproc_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	mutex_lock(&rproc->lock);
+	if (rproc->state == RPROC_OFFLINE)
+		goto out;
+
+	if (rproc->state == RPROC_SUSPENDED)
+		goto out;
+
+	if (rproc->state != RPROC_RUNNING) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = _omap_rproc_suspend(rproc);
+	if (ret) {
+		dev_err(dev, "suspend failed %d\n", ret);
+		goto out;
+	}
+
+	rproc->state = RPROC_SUSPENDED;
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+
+static int __maybe_unused omap_rproc_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	mutex_lock(&rproc->lock);
+	if (rproc->state == RPROC_OFFLINE)
+		goto out;
+
+	if (rproc->state != RPROC_SUSPENDED) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = _omap_rproc_resume(rproc);
+	if (ret) {
+		dev_err(dev, "resume failed %d\n", ret);
+		goto out;
+	}
+
+	rproc->state = RPROC_RUNNING;
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+#endif /* CONFIG_PM */
+
 static const struct omap_rproc_mem_data ipu_mems[] = {
 	{ .name = "l2ram", .dev_addr = 0x20000000 },
 	{ },
@@ -797,6 +972,14 @@ static int omap_rproc_probe(struct platform_device *pdev)
 			oproc->num_timers);
 	}
 
+	init_completion(&oproc->pm_comp);
+
+	oproc->fck = devm_clk_get(&pdev->dev, 0);
+	if (IS_ERR(oproc->fck)) {
+		ret = PTR_ERR(oproc->fck);
+		goto free_rproc;
+	}
+
 	ret = of_reserved_mem_device_init(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "device does not have specific CMA pool\n");
@@ -829,11 +1012,16 @@ static int omap_rproc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dev_pm_ops omap_rproc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(omap_rproc_suspend, omap_rproc_resume)
+};
+
 static struct platform_driver omap_rproc_driver = {
 	.probe = omap_rproc_probe,
 	.remove = omap_rproc_remove,
 	.driver = {
 		.name = "omap-rproc",
+		.pm = &omap_rproc_pm_ops,
 		.of_match_table = omap_rproc_of_match,
 	},
 };
diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
index 72f656c93caa..13f17d9135c0 100644
--- a/drivers/remoteproc/omap_remoteproc.h
+++ b/drivers/remoteproc/omap_remoteproc.h
@@ -1,7 +1,7 @@
 /*
  * Remote processor messaging
  *
- * Copyright (C) 2011 Texas Instruments, Inc.
+ * Copyright (C) 2011-2020 Texas Instruments, Inc.
  * Copyright (C) 2011 Google, Inc.
  * All rights reserved.
  *
@@ -57,6 +57,16 @@
  * @RP_MBOX_ABORT_REQUEST: a "please crash" request, used for testing the
  * recovery mechanism (to some extent).
  *
+ * @RP_MBOX_SUSPEND_AUTO: auto suspend request for the remote processor
+ *
+ * @RP_MBOX_SUSPEND_SYSTEM: system suspend request for the remote processor
+ *
+ * @RP_MBOX_SUSPEND_ACK: successful response from remote processor for a
+ * suspend request
+ *
+ * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
+ * on a suspend request
+ *
  * Introduce new message definitions if any here.
  *
  * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
@@ -70,7 +80,11 @@ enum omap_rp_mbox_messages {
 	RP_MBOX_ECHO_REQUEST	= 0xFFFFFF03,
 	RP_MBOX_ECHO_REPLY	= 0xFFFFFF04,
 	RP_MBOX_ABORT_REQUEST	= 0xFFFFFF05,
-	RP_MBOX_END_MSG		= 0xFFFFFF06,
+	RP_MBOX_SUSPEND_AUTO	= 0xFFFFFF10,
+	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
+	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
+	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
+	RP_MBOX_END_MSG		= 0xFFFFFF14,
 };
 
 #endif /* _OMAP_RPMSG_H */
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
