Return-Path: <linux-remoteproc+bounces-3752-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A3AB4B66
	for <lists+linux-remoteproc@lfdr.de>; Tue, 13 May 2025 07:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 371B83A848B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 13 May 2025 05:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84FD2040AB;
	Tue, 13 May 2025 05:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bZzQ7Wcz"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909C7DA7F;
	Tue, 13 May 2025 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115248; cv=none; b=rkBIoOCSB/3Cr5n1qpDUWBmzcpTBRrFSu915FI+qfSSOGiyWeosHZSNWt+lUZ2PwY1ofphtpMH1wEfSLQ4jEls9/wGoO+nTRJIdDgNKM9hWmM+twpLCnlHmmb0TXcKNIdkg4TGOjEgm/TZegYLz3HRTDSNbrrjNn5TDWjbjE8kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115248; c=relaxed/simple;
	bh=84H6ry/WNdWRYFlV/fBZbjfw3FR/6vaGgy2WNwMmqjQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAt88TbDYFv4FU4UDrD2KwU+7qT2HfVtk9esvcdHgOtXY5Pp05lSMxY7n9WqAfeDfkvBXCV0U3MJppYA0vXZZNrp+FPcWm301TF3unvEP+Oovim3z2MMhZDLWNbRXsukyLz2751huECqNVXWXUWCX0o2QHDLG3YplMgwcg/7toQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bZzQ7Wcz; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54D5lJAv2764585;
	Tue, 13 May 2025 00:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115240;
	bh=UWYzz22DYwLubR/JbG6VUMqRPCfwDnwidK3OoxAqaXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bZzQ7WczGI8fZumUvp35SfSLP4Z1DQ8q/rc+BJFSx86z7z6PhgKCs7V9gfVxs/pGv
	 QDtX8xfXuiY3TQ1Rmin1rkKwOlVZaBHwGhqeWAICYGVDk091rIu0t/DEE/YVhe+gK4
	 X32vlYfFlfBLAEu8Q8LTTxtfHpXYHO8Z+Q6AzBb0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54D5lJGO652456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 00:47:19 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:47:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:47:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqd131001;
	Tue, 13 May 2025 00:47:15 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 30/36] remoteproc: k3: Refactor .detach rproc ops into common driver
Date: Tue, 13 May 2025 11:15:04 +0530
Message-ID: <20250513054510.3439842-31-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The .detach rproc ops implementations in TI K3 R5, DSP and M4
remoteproc drivers are NOPs. Refactor the implementations into
ti_k3_common.c driver as k3_rproc_detach() and register this common
function as .detach ops in R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-30-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-28-b-padhi@ti.com/

v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-21-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 10 ++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 11 +----------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 14 +-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 11 +----------
 5 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index ffd6639e6d63c..5c976fb570d0f 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -308,5 +308,15 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
 int k3_rproc_attach(struct rproc *rproc) { return 0; }
 EXPORT_SYMBOL_GPL(k3_rproc_attach);
 
+/*
+ * Detach from a running remote processor (IPC-only mode)
+ *
+ * The rproc detach callback is a NOP. The remote processor is not stopped and
+ * will be left in booted state in IPC-only mode. This callback is invoked only
+ * in IPC-only mode and exists for sanity sake
+ */
+int k3_rproc_detach(struct rproc *rproc) { return 0; }
+EXPORT_SYMBOL_GPL(k3_rproc_detach);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index c369715b2d768..42358bf5aae94 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -103,4 +103,5 @@ int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
 int k3_rproc_attach(struct rproc *rproc);
+int k3_rproc_detach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 12858c7f1958d..a62a69d9f80ed 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,15 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Detach from a running DSP remote processor (IPC-only mode)
- *
- * This rproc detach callback is a NOP. The DSP core is not stopped and will be
- * left to continue to run its booted firmware. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
- */
-static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
@@ -162,7 +153,7 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start			= k3_dsp_rproc_start,
 	.stop			= k3_rproc_stop,
 	.attach			= k3_rproc_attach,
-	.detach			= k3_dsp_rproc_detach,
+	.detach			= k3_rproc_detach,
 	.kick			= k3_rproc_kick,
 	.da_to_va		= k3_dsp_rproc_da_to_va,
 	.get_loaded_rsc_table	= k3_dsp_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 7f3c8d3d1398b..d75362717155d 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,25 +244,13 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Detach from a running M4 remote processor (IPC-only mode)
- *
- * This rproc detach callback performs the opposite operation to attach
- * callback, the M4 core is not stopped and will be left to continue to
- * run its booted firmware. This callback is invoked only in IPC-only mode.
- */
-static int k3_m4_rproc_detach(struct rproc *rproc)
-{
-	return 0;
-}
-
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
 	.stop = k3_rproc_stop,
 	.attach = k3_rproc_attach,
-	.detach = k3_m4_rproc_detach,
+	.detach = k3_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 7c0434093ca50..ecd6e6b15d608 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -559,15 +559,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * Detach from a running R5F remote processor (IPC-only mode)
- *
- * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
- * left in booted state in IPC-only mode. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
- */
-static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
@@ -1049,7 +1040,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 		kproc->rproc->ops->start = NULL;
 		kproc->rproc->ops->stop = NULL;
 		kproc->rproc->ops->attach = k3_rproc_attach;
-		kproc->rproc->ops->detach = k3_r5_rproc_detach;
+		kproc->rproc->ops->detach = k3_rproc_detach;
 		kproc->rproc->ops->get_loaded_rsc_table =
 						k3_r5_get_loaded_rsc_table;
 	} else if (!c_state) {
-- 
2.34.1


