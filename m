Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F316E190BBD
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 12:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgCXLBQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 07:01:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50362 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCXLBP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 07:01:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OB1Em1081867;
        Tue, 24 Mar 2020 06:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585047674;
        bh=8SxSrpe4npDjzFpqbnelunTquFDWz2uny4bN9MI6tVU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=axZ9+p1v9fX3fGlAkL2QUvncWaJx9BJkWmzUnk3vCDntjnLMbkd/8rFu7L960MsYv
         QplYG3jsV61JsqqCpG5wNIOv9wjkoVbQzLX3ZkPdZdpuwiqyg5hMGqVsI+PToMM/oW
         zm8Ae6yEmpGyeE9/6jOuXxycIDG+Fh9krje3/6Io=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OB1Elt109423;
        Tue, 24 Mar 2020 06:01:14 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 06:01:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 06:01:13 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OB0rAs008648;
        Tue, 24 Mar 2020 06:01:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <afd@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv9 08/15] remoteproc/omap: Remove the platform_data header
Date:   Tue, 24 Mar 2020 13:00:28 +0200
Message-ID: <20200324110035.29907-9-t-kristo@ti.com>
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

The platform data header for OMAP remoteproc is no longer used for
anything post ti-sysc and DT conversion, so just remove it completely.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Acked-by: Suman Anna <s-anna@ti.com>
Reviewed-by: Andrew F. Davis <afd@ti.com>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v9:
  * no changes

 include/linux/platform_data/remoteproc-omap.h | 51 -------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 include/linux/platform_data/remoteproc-omap.h

diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
deleted file mode 100644
index 7e3a16097672..000000000000
--- a/include/linux/platform_data/remoteproc-omap.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Remote Processor - omap-specific bits
- *
- * Copyright (C) 2011 Texas Instruments, Inc.
- * Copyright (C) 2011 Google, Inc.
- */
-
-#ifndef _PLAT_REMOTEPROC_H
-#define _PLAT_REMOTEPROC_H
-
-struct rproc_ops;
-struct platform_device;
-
-/*
- * struct omap_rproc_pdata - omap remoteproc's platform data
- * @name: the remoteproc's name
- * @oh_name: omap hwmod device
- * @oh_name_opt: optional, secondary omap hwmod device
- * @firmware: name of firmware file to load
- * @mbox_name: name of omap mailbox device to use with this rproc
- * @ops: start/stop rproc handlers
- * @device_enable: omap-specific handler for enabling a device
- * @device_shutdown: omap-specific handler for shutting down a device
- * @set_bootaddr: omap-specific handler for setting the rproc boot address
- */
-struct omap_rproc_pdata {
-	const char *name;
-	const char *oh_name;
-	const char *oh_name_opt;
-	const char *firmware;
-	const char *mbox_name;
-	const struct rproc_ops *ops;
-	int (*device_enable)(struct platform_device *pdev);
-	int (*device_shutdown)(struct platform_device *pdev);
-	void (*set_bootaddr)(u32);
-};
-
-#if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
-
-void __init omap_rproc_reserve_cma(void);
-
-#else
-
-static inline void __init omap_rproc_reserve_cma(void)
-{
-}
-
-#endif
-
-#endif /* _PLAT_REMOTEPROC_H */
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
