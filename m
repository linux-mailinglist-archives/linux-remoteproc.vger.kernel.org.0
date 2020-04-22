Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF0C1B3B55
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Apr 2020 11:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgDVJab (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Apr 2020 05:30:31 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:44798 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgDVJaa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 05:30:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 43C6E27E077B;
        Wed, 22 Apr 2020 11:30:29 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id z96kb9nd-C_x; Wed, 22 Apr 2020 11:30:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id BBDE027E0D15;
        Wed, 22 Apr 2020 11:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu BBDE027E0D15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1587547828;
        bh=2gt8HJBzXeg55yVyCzThSQUVTL5BQLX2DcsHeo5owWc=;
        h=From:To:Date:Message-Id;
        b=lSXlU6VNWNw0jqforv/DKZlz99CYGmDEtG7Wbuo8brWU9hrFSlWFgzZSd93pW7k0C
         kCpogp+dK1woDF7ocBVvBn5lh7BqHPMCRItEwQJRkWAFnploQ+mRoxv7e5sh5rB4Rx
         zjiU0OUn6R5tBzJf9zCMYp4bVB/Alnt5K3VyUcS4=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lD32-pm9U2hN; Wed, 22 Apr 2020 11:30:28 +0200 (CEST)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 9ABC527E077B;
        Wed, 22 Apr 2020 11:30:28 +0200 (CEST)
From:   Clement Leger <cleger@kalray.eu>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Clement Leger <cleger@kalray.eu>
Subject: [PATCH v3] remoteproc: remove rproc_elf32_sanity_check
Date:   Wed, 22 Apr 2020 11:30:17 +0200
Message-Id: <20200422093017.10985-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.17.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Since checks are present in the remoteproc elf loader before calling
da_to_va, loading a elf64 will work on 32bits flavors of kernel.
Indeed, if a segment size is larger than what size_t can hold, the
loader will return an error so the functionality is equivalent to
what exists today.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
Changes from v2 -> v3:
 - Rebase on rproc-next branch

Changes from v1 -> v2:
 - Remove possibity to override sanity_check operation

 drivers/remoteproc/remoteproc_core.c       |  3 +--
 drivers/remoteproc/remoteproc_elf_loader.c | 21 ---------------------
 drivers/remoteproc/remoteproc_internal.h   |  1 -
 drivers/remoteproc/st_remoteproc.c         |  2 +-
 drivers/remoteproc/st_slim_rproc.c         |  2 +-
 drivers/remoteproc/stm32_rproc.c           |  2 +-
 6 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 448262470fc7..206363723071 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2069,8 +2069,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	rproc->ops->load = rproc_elf_load_segments;
 	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
 	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
-	if (!rproc->ops->sanity_check)
-		rproc->ops->sanity_check = rproc_elf32_sanity_check;
+	rproc->ops->sanity_check = rproc_elf_sanity_check;
 	rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
 
 	return 0;
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 4869fb7d8fe4..df68d87752e4 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -112,27 +112,6 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 }
 EXPORT_SYMBOL(rproc_elf_sanity_check);
 
-/**
- * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
- * @rproc: the remote processor handle
- * @fw: the ELF32 firmware image
- *
- * Make sure this fw image is sane.
- */
-int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret = rproc_elf_sanity_check(rproc, fw);
-
-	if (ret)
-		return ret;
-
-	if (fw_elf_get_class(fw) == ELFCLASS32)
-		return 0;
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL(rproc_elf32_sanity_check);
-
 /**
  * rproc_elf_get_boot_addr() - Get rproc's boot address.
  * @rproc: the remote processor handle
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index b389dc79da81..31994715fd43 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -54,7 +54,6 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
 
-int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
 u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index a6cbfa452764..a3268d95a50e 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.parse_fw		= st_rproc_parse_fw,
 	.load			= rproc_elf_load_segments,
 	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
-	.sanity_check		= rproc_elf32_sanity_check,
+	.sanity_check		= rproc_elf_sanity_check,
 	.get_boot_addr		= rproc_elf_get_boot_addr,
 };
 
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 3cca8b65a8db..09bcb4d8b9e0 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops = {
 	.da_to_va       = slim_rproc_da_to_va,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.load		= rproc_elf_load_segments,
-	.sanity_check	= rproc_elf32_sanity_check,
+	.sanity_check	= rproc_elf_sanity_check,
 };
 
 /**
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0f9d02ca4f5a..f45b8d597da0 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops = {
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
-	.sanity_check	= rproc_elf32_sanity_check,
+	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
-- 
2.17.1

