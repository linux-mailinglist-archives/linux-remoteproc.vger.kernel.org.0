Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D781A8E49
	for <lists+linux-remoteproc@lfdr.de>; Wed, 15 Apr 2020 00:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634200AbgDNWKF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 18:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634193AbgDNWJ7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 18:09:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D478C061A0C;
        Tue, 14 Apr 2020 15:09:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3ADDE2A1AC1
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] hwspinlock: Simplify Kconfig
Date:   Tue, 14 Apr 2020 19:09:43 -0300
Message-Id: <20200414220943.6203-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Every hwspinlock driver is expected to depend on the
hwspinlock core, so it's possible to simplify the
Kconfig, factoring out the HWSPINLOCK dependency.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/hwspinlock/Kconfig | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 826a1054100d..32cd26352f38 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -6,9 +6,10 @@
 menuconfig HWSPINLOCK
 	bool "Hardware Spinlock drivers"
 
+if HWSPINLOCK
+
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
-	depends on HWSPINLOCK
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
 	help
 	  Say y here to support the OMAP Hardware Spinlock device (firstly
@@ -18,7 +19,6 @@ config HWSPINLOCK_OMAP
 
 config HWSPINLOCK_QCOM
 	tristate "Qualcomm Hardware Spinlock device"
-	depends on HWSPINLOCK
 	depends on ARCH_QCOM || COMPILE_TEST
 	select MFD_SYSCON
 	help
@@ -30,7 +30,6 @@ config HWSPINLOCK_QCOM
 
 config HWSPINLOCK_SIRF
 	tristate "SIRF Hardware Spinlock device"
-	depends on HWSPINLOCK
 	depends on ARCH_SIRF || COMPILE_TEST
 	help
 	  Say y here to support the SIRF Hardware Spinlock device, which
@@ -43,7 +42,6 @@ config HWSPINLOCK_SIRF
 config HWSPINLOCK_SPRD
 	tristate "SPRD Hardware Spinlock device"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on HWSPINLOCK
 	help
 	  Say y here to support the SPRD Hardware Spinlock device.
 
@@ -52,7 +50,6 @@ config HWSPINLOCK_SPRD
 config HWSPINLOCK_STM32
 	tristate "STM32 Hardware Spinlock device"
 	depends on MACH_STM32MP157 || COMPILE_TEST
-	depends on HWSPINLOCK
 	help
 	  Say y here to support the STM32 Hardware Spinlock device.
 
@@ -60,7 +57,6 @@ config HWSPINLOCK_STM32
 
 config HSEM_U8500
 	tristate "STE Hardware Semaphore functionality"
-	depends on HWSPINLOCK
 	depends on ARCH_U8500 || COMPILE_TEST
 	help
 	  Say y here to support the STE Hardware Semaphore functionality, which
@@ -68,3 +64,5 @@ config HSEM_U8500
 	  SoC.
 
 	  If unsure, say N.
+
+endif # HWSPINLOCK
-- 
2.26.0.rc2

