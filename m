Return-Path: <linux-remoteproc+bounces-7521-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN00GVV38WkxhAEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7521-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 05:13:25 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D605648E9CF
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 05:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB25B311CC30
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2026 03:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF24377551;
	Wed, 29 Apr 2026 03:08:30 +0000 (UTC)
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A5340A6B;
	Wed, 29 Apr 2026 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432110; cv=none; b=Se+4UU3KuFJ2gdeKjWyuK4DN5dU7JSgnwX9VQfMBsrEcjN8yHLZZ1EMFyeCeyugtUs5575buycUJ4C8QFex4Tks7Z4iVDzO6l5+wVwu+zWWOpb+jUJUK7BKP3NJw3Z9AGLFRekjmJfJkQwid4QgIkw/dFOHO1PXAaTPBv1Y6ooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432110; c=relaxed/simple;
	bh=djqJt+vqzs5d1JAPEVi2B4EbcoLUWfnMy05XmKe/1SE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V40DNSI6+KIL4vniHjgPIADoAwEEjAFscMACQNyMEB79TmjEd5GS++nvTRS2mrsL4UxQKSno+yXx6uNG/8ZwHmALjo8rh+9ctFDYyg1SpceNBQ35mvd7Lb/tUSGxZa7Swr8Fk44aRUh/dCuupV22IeiKkWNy1gulnDMo97g6ogg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 93DC81A1F61;
	Wed, 29 Apr 2026 05:08:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5CDC71A19DD;
	Wed, 29 Apr 2026 05:08:23 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 73737180026F;
	Wed, 29 Apr 2026 11:08:21 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 4/5] arm64: dts: imx93: Cortex-A Core remoteproc device node
Date: Wed, 29 Apr 2026 11:10:46 +0800
Message-Id: <20260429031047.30893-5-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: D605648E9CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7521-lists,linux-remoteproc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[Jiafei.Pan@nxp.com,linux-remoteproc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.330];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[d0000000:email,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a5000000:email]

Create device tree for i.MX93 14x14 evk and 11x11 evk, add Cortex-A Core
remoteproc device nodes in these device tree.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-11x11-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../imx93-14x14-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  | 14 +++++++
 4 files changed, 94 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c99..f067e5c44dae 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -460,12 +460,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-multicore-rtos.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
 imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-multicore-rtos.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..9fb2b94b83b4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-11x11-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..b2481bf19b4a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-14x14-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
new file mode 100644
index 000000000000..9d9a60404d2b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/ {
+	ca55_1: remoteproc-ca55-1 {
+		compatible = "fsl,imx-rproc-psci";
+		/* bitmask:0b10, assign A55 Core 1 */
+		fsl,cpus-bits = <0x2>;
+		memory-region = <&rtos_ca55_reserved>;
+	};
+};
+
-- 
2.43.0


