Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF73E157FA6
	for <lists+linux-remoteproc@lfdr.de>; Mon, 10 Feb 2020 17:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgBJQYA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 10 Feb 2020 11:24:00 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58736 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgBJQYA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Feb 2020 11:24:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C36D227E07AE;
        Mon, 10 Feb 2020 17:23:57 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 92pGaWYukCCm; Mon, 10 Feb 2020 17:23:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 612C127E080F;
        Mon, 10 Feb 2020 17:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 612C127E080F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1581351837;
        bh=nwK7X/lb2Nf8ob+usF2VaPSLo0e6JxxOiA+G/4/pOi4=;
        h=From:To:Date:Message-Id;
        b=gqbL/U/cOwi2cVxOLEU8gLkteMomIYM6yN5rbrKusg2RUUz1U41iYsdivpV0cjTbF
         CVsEcRXalxmrh6P/AqV0fbQ0T+2soXcRa6QBZaRVLghEVIFlVvCzvW9+b4mgi0nDPt
         4AoL6WW1xx4GbDLP+3SMygzk1D3Tz7YYcdBY3Ukg=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id e_CFCBZU2Ida; Mon, 10 Feb 2020 17:23:57 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 3DE1327E079C;
        Mon, 10 Feb 2020 17:23:57 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Clement Leger <cleger@kalray.eu>
Subject: [PATCH v4 2/5] remoteproc: Use u64 type for boot_addr
Date:   Mon, 10 Feb 2020 17:22:06 +0100
Message-Id: <20200210162209.23149-3-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

elf64 entry is defined as a u64. Since boot_addr is used to store the
elf entry point, change boot_addr type to u64 to support both elf32
and elf64. In the same time, fix users that were using this variable.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 drivers/remoteproc/remoteproc_internal.h   | 2 +-
 drivers/remoteproc/st_remoteproc.c         | 2 +-
 include/linux/remoteproc.h                 | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 606aae166eba..c2a9783cfb9a 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -102,7 +102,7 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
  * Note that the boot address is not a configurable property of all remote
  * processors. Some will always boot at a specific hard-coded address.
  */
-u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
+u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
 	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
 
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 004867061721..eeb26434220e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -55,7 +55,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
 
 int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
-u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
+u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
 struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index ee13d23b43a9..a3268d95a50e 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -190,7 +190,7 @@ static int st_rproc_start(struct rproc *rproc)
 		}
 	}
 
-	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
+	dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
 
 	return 0;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f84bd5fe0211..82cebca9344c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -382,7 +382,7 @@ struct rproc_ops {
 				struct rproc *rproc, const struct firmware *fw);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
-	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 };
 
 /**
@@ -498,7 +498,7 @@ struct rproc {
 	int num_traces;
 	struct list_head carveouts;
 	struct list_head mappings;
-	u32 bootaddr;
+	u64 bootaddr;
 	struct list_head rvdevs;
 	struct list_head subdevs;
 	struct idr notifyids;
-- 
2.15.0.276.g89ea799

