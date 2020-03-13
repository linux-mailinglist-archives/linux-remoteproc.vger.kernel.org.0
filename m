Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5E9183C19
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgCLWMV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:21 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36222 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:21 -0400
Received: by mail-pl1-f194.google.com with SMTP id g2so723096plo.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HLllXn7X6ZYAetG9wnBDeuGkqxnnfCDJmFR0GyYYgLc=;
        b=Deyw2YuyH9eOgoAIh+aVwVJshvhroUtWHNY0T8IX9ACTPxR5I+yIFbE5fit4eowwKQ
         3YjHLkmzYYUbrwQefnyodWtaFJrqjiEMzUAwkOrbLm8DA8dD5NPkCPeR36igseOXCKaX
         raJYY5t/FxTcbrjGU9jHKm6hA9PZcBuh3IKgvyLNxy9YFNguk1W2MskaAJxu9Lgz/hl2
         syyb6fJwMdNGcnF3ou/PO1yCZvn1mggZbkavR9nvGHVtZeLd5hsCM/Zz2NRcWwvNabg6
         Hkgl7FE3taQbMdIW9WSyH0hub7UgurKzNya4l1rNkB29Rk56+5dt3TNdhvQuovDF9Lun
         2s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HLllXn7X6ZYAetG9wnBDeuGkqxnnfCDJmFR0GyYYgLc=;
        b=pHNeS6k1F4/9yS1ffVrIYldX7S4YD80EkpksYD/CwMt5KBxliabd6PWmI61mkkGVQz
         6GJPdzp9KbTJFoe63veI82zgL3hs7p2LYAEbX2fWWLpWVfvdmiUYdb1rzvJzL0JmihCa
         QWySDKPWh47q5RWxtb+Z5GpEDy8jLEOlo0Mvstz1oDJ83UKu2C4ywiHvi7hmFva3GS1v
         2mrii/lLvyvwdg5EXZqAQtl4xKZvluSXaSZwhPsA+DyEYqsskx7unDgRqZ1rxSFwmLv4
         8tee0MZCVl+18lqTbZ6bC8kd69mx80zGOsKYY4nZCFH7gY0BRf72vdrNEXsG9sCQTc81
         cgug==
X-Gm-Message-State: ANhLgQ3zzRPf/y6uN0ougQf9HQ2JAFGL5IrCnEwnMo0AZYcO+9BTevFw
        l5YG+B/xWUMffmAcGTOhrxHmSw==
X-Google-Smtp-Source: ADFU+vtRhB8GTqHj6vHrODDI52dGnB+cfyE+xEIKo8Dx89XdlRgL6Be0UZV2qjcExIQa74VrcDIJdg==
X-Received: by 2002:a17:902:524:: with SMTP id 33mr10455071plf.241.1584051139951;
        Thu, 12 Mar 2020 15:12:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 18/18] remoteproc: stm32: add support for co-processor booted before kernel
Date:   Thu, 12 Mar 2020 16:11:58 -0600
Message-Id: <20200312221158.3613-19-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Fabien Dessenne <fabien.dessenne@st.com>

Refactoring of the work from Fabien Dessenne and Arnaud Pouliquen
originally published here [1].  Provided as an example only.

Compiled tested but will likely crash horribly.

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
---
 drivers/remoteproc/stm32_rproc.c | 207 ++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a18f88044111..c3d5bb214ea7 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -38,6 +38,15 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define RSC_TBL_SIZE		(1024)
+
+#define COPRO_STATE_OFF		0
+#define COPRO_STATE_INIT	1
+#define COPRO_STATE_CRUN	2
+#define COPRO_STATE_CSTOP	3
+#define COPRO_STATE_STANDBY	4
+#define COPRO_STATE_CRASH	5
+
 struct stm32_syscon {
 	struct regmap *map;
 	u32 reg;
@@ -70,12 +79,14 @@ struct stm32_rproc {
 	struct reset_control *rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
+	struct stm32_syscon copro_state;
 	int wdg_irq;
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	void __iomem *rsc_va;
 };
 
 static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
@@ -98,6 +109,28 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
 	return -EINVAL;
 }
 
+static int stm32_rproc_da_to_pa(struct rproc *rproc, u64 da, phys_addr_t *pa)
+{
+	unsigned int i;
+	struct stm32_rproc *ddata = rproc->priv;
+	struct stm32_rproc_mem *p_mem;
+
+	for (i = 0; i < ddata->nb_rmems; i++) {
+		p_mem = &ddata->rmems[i];
+
+		if (da < p_mem->dev_addr ||
+		    da >= p_mem->dev_addr + p_mem->size)
+			continue;
+		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
+		dev_dbg(rproc->dev.parent, "da %llx to pa %#x\n", da, *pa);
+		return 0;
+	}
+
+	dev_err(rproc->dev.parent, "can't translate da %llx\n", da);
+
+	return -EINVAL;
+}
+
 static int stm32_rproc_mem_alloc(struct rproc *rproc,
 				 struct rproc_mem_entry *mem)
 {
@@ -203,7 +236,17 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+static struct resource_table *
+stm32_rproc_elf_find_loaded_rsc_table_sync_mcu(struct rproc *rproc,
+					       const struct firmware *fw)
+{
+       struct stm32_rproc *ddata = rproc->priv;
+
+       return (struct resource_table *)ddata->rsc_va;
+}
+
+static int __stm32_rproc_parse_fw(struct rproc *rproc,
+				  const struct firmware *fw)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
@@ -256,9 +299,48 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 		index++;
 	}
 
+	return 0;
+}
+
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = __stm32_rproc_parse_fw(rproc, fw);
+
 	return stm32_rproc_elf_load_rsc_table(rproc, fw);
 }
 
+static int stm32_rproc_parse_fw_sync_mcu(struct rproc *rproc,
+					 const struct firmware *fw)
+{
+	struct resource_table *table = NULL;
+	struct stm32_rproc *ddata = rproc->priv;
+	int ret;
+
+	ret = __stm32_rproc_parse_fw(rproc, fw);
+
+	if (ddata->rsc_va) {
+		table = (struct resource_table *)ddata->rsc_va;
+		/* Assuming that the resource table fits in 1kB is fair */
+		rproc->cached_table = kmemdup(table, RSC_TBL_SIZE, GFP_KERNEL);
+		if (!rproc->cached_table)
+			return -ENOMEM;
+
+		rproc->table_ptr = rproc->cached_table;
+		rproc->table_sz = RSC_TBL_SIZE;
+		return 0;
+	}
+
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+	rproc->table_sz = 0;
+
+	dev_warn(&rproc->dev, "no resource table found for this firmware\n");
+	return 0;
+}
+
+
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct rproc *rproc = data;
@@ -429,6 +511,19 @@ static int stm32_rproc_start(struct rproc *rproc)
 		}
 	}
 
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
+static int stm32_rproc_start_sync_mcu(struct rproc *rproc)
+{
+	int err;
+
+	stm32_rproc_add_coredump_trace(rproc);
+
+	/*
+	 * If M4 previously started by bootloader, just guarantee holdboot
+	 * is set to catch any crash.
+	 */
 	err = stm32_rproc_set_hold_boot(rproc, false);
 	if (err)
 		return err;
@@ -476,6 +571,28 @@ static int stm32_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
+static int stm32_rproc_stop_sync_mcu(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	int err;
+
+	err = stm32_rproc_stop(rproc);
+	if (err)
+		return err;
+
+	/* update copro state to OFF */
+	err = regmap_update_bits(ddata->copro_state.map,
+				 ddata->copro_state.reg,
+				 ddata->copro_state.mask,
+				 COPRO_STATE_OFF);
+	if (err) {
+		dev_err(&rproc->dev, "failed to set copro state\n");
+		return err;
+	}
+
+	return 0;
+}
+
 static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -498,6 +615,14 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 	}
 }
 
+static struct rproc_ops st_rproc_ops_sync_mcu = {
+	.start		= stm32_rproc_start_sync_mcu,
+	.stop		= stm32_rproc_stop_sync_mcu,
+	.kick		= stm32_rproc_kick,
+	.parse_fw	= stm32_rproc_parse_fw_sync_mcu,
+	.find_loaded_rsc_table = stm32_rproc_elf_find_loaded_rsc_table_sync_mcu,
+};
+
 static struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
@@ -543,8 +668,10 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct stm32_rproc *ddata = rproc->priv;
-	struct stm32_syscon tz;
-	unsigned int tzen;
+	struct stm32_syscon tz, rsctbl;
+	phys_addr_t rsc_pa;
+	u32 rsc_da;
+	unsigned int tzen, state;
 	int err, irq;
 
 	irq = platform_get_irq(pdev, 0);
@@ -602,11 +729,72 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	err = stm32_rproc_get_syscon(np, "st,syscfg-pdds", &ddata->pdds);
 	if (err)
-		dev_warn(dev, "failed to get pdds\n");
+		dev_warn(dev, "pdds not supported\n");
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	err = stm32_rproc_of_memory_translations(rproc);
+	if (err)
+		return err;
+
+	/* check if the coprocessor has been started from the bootloader */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-copro-state",
+				     &ddata->copro_state);
+	if (err) {
+		/* no copro_state syscon (optional) */
+		dev_warn(dev, "copro_state not supported\n");
+		goto bail;
+	}
+
+	err = regmap_read(ddata->copro_state.map, ddata->copro_state.reg,
+			  &state);
+	if (err) {
+		dev_err(&rproc->dev, "failed to read copro state\n");
+		return err;
+	}
+
+	if (state == COPRO_STATE_CRUN) {
+		if (stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl", &rsctbl)) {
+			/* no rsc table syscon (optional) */
+			dev_warn(dev, "rsc tbl syscon not supported\n");
+			goto bail;
+		}
+
+		err = regmap_read(rsctbl.map, rsctbl.reg, &rsc_da);
+		if (err) {
+			dev_err(&rproc->dev, "failed to read rsc tbl addr\n");
+			return err;
+		}
+		if (!rsc_da)
+			/* no rsc table */
+			goto bail;
+
+		err = stm32_rproc_da_to_pa(rproc, rsc_da, &rsc_pa);
+		if (err)
+			return err;
+
+		ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
+		if (IS_ERR_OR_NULL(ddata->rsc_va)) {
+			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+				&rsc_pa, RSC_TBL_SIZE);
+			ddata->rsc_va = NULL;
+			return -ENOMEM;
+		}
+	}
+bail:
+	return 0;
+}
+
+static struct rproc_sync_states stm32_sync_states = {
+	.on_init = true, /* sync with MCU when the kernel boots */
+	.after_stop = false, /* don't sync with MCU if stopped from sysfs */
+	.after_crash = false,/* don't sync with MCU after a crash */
+};
+
+static bool stm32_sync_with_mcu(struct platform_device *pdev)
+{
+	/* Find something platform specific here */
+	return true;
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
@@ -621,7 +809,14 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
+	if (stm32_sync_with_mcu(pdev))
+		rproc = rproc_alloc(dev, np->name, &st_rproc_ops,
+				    NULL, sizeof(*ddata));
+	else
+		rproc = rproc_alloc_state_machine(dev, np->name, &st_rproc_ops,
+						  &st_rproc_ops_sync_mcu,
+						  &stm32_sync_states, NULL,
+						  sizeof(*ddata));
 	if (!rproc)
 		return -ENOMEM;
 
-- 
2.20.1

