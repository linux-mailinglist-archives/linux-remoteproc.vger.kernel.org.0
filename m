Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D25F217A81
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbgGGVb0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbgGGVb0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:26 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE858C08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:25 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x8so16370224plm.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3MkMxDqQZF9df+GyPlu1Irl7dXZajvYnpAazQKi4w4c=;
        b=WTt3hIc6Py2kVbwkTQ4rCdEyC2oJTZ+O4xsQJ75S+N9iURw1LDQFuEUPdzKRA9ZpJk
         c7bC3KG/MgkJQKlhK4jyzBUzBOw3QMj1qUa7oBQ3XEaMdrgUd33K/yWA3e2Gs+jTM8/k
         KpLJC8D4Dkf2a/36QwFqGYoRVbtwc1/0VKy6G2XbqejOnDFgRDY/P0NnFmPvXB4qaZRl
         5iEUgwpAczAjS2EKzdMrkV3+R7ycAdqv2tbGdczrtwt1IHPWNnGPabgo8Q7J4EICWUPC
         SI4YiPGo/E1tK562de9FkJpD3ERHiyZh0gQVGCD9r/sc+pOYYpVX87Fp5MdTasHZiecd
         2d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3MkMxDqQZF9df+GyPlu1Irl7dXZajvYnpAazQKi4w4c=;
        b=KZ+gjm4IIPMulFbQtRPcpb1YguwL+e7CmeCc6Ooc2U8cjtIWKU9xdt71bB/BUWIELM
         Jf/f3ZbRRrFuPcbKP26pX9ODKCAg2i/I0PYXduXpQEsxiswQHtkUTPjG0ufa8WiaZTch
         PfdB9qzNSCXt/umNT6zc1lrkL6Pd/SwYSsheWIstpNTnI3AoQhuH00b3i7af+qsU14Tq
         DbDUb643Mz3/HpSvK1UU18SGnedASkQm2I1UdAzt+LfVj/Ee9o5IEjj15dF0kskrtwxJ
         vCY7pXJRz4DQBkDw5VVn+q6Ry4BSfgSsz325LXajLBlFPjrai+zX1f4iYLBSyVSclwl8
         JyZg==
X-Gm-Message-State: AOAM531GSB1EzPwXDN985pduphL9/0Cm75+Xd94SeMrm78Zxlt0XDspN
        8PPzKzIktG0tc8wA3jub4q0SPg==
X-Google-Smtp-Source: ABdhPJwziK8hMsl5BvCHueS39dMBhLvae+e2m7D3oHV135yRIArFjYjcAOsDvYhZGCgLyQ+Ga+EYtA==
X-Received: by 2002:a17:902:9a43:: with SMTP id x3mr47666841plv.108.1594157485429;
        Tue, 07 Jul 2020 14:31:25 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:25 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 09/11] remoteproc: stm32: Properly handle the resource table when attaching
Date:   Tue,  7 Jul 2020 15:31:10 -0600
Message-Id: <20200707213112.928383-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Properly set the remote processor's resource table based on where it was
loaded by the external entity when attaching to a remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 75 ++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 9ab58fae252f..882229f3b1c9 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -39,6 +39,8 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define RSC_TBL_SIZE		1024
+
 #define M4_STATE_OFF		0
 #define M4_STATE_INI		1
 #define M4_STATE_CRUN		2
@@ -86,6 +88,7 @@ struct stm32_rproc {
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	void __iomem *rsc_va;
 };
 
 static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
@@ -669,6 +672,74 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
 	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
 }
 
+static int stm32_rproc_da_to_pa(struct platform_device *pdev,
+				struct stm32_rproc *ddata,
+				u64 da, phys_addr_t *pa)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_rproc_mem *p_mem;
+	unsigned int i;
+
+	for (i = 0; i < ddata->nb_rmems; i++) {
+		p_mem = &ddata->rmems[i];
+
+		if (da < p_mem->dev_addr ||
+		    da >= p_mem->dev_addr + p_mem->size)
+			continue;
+
+		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
+		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
+
+		return 0;
+	}
+
+	dev_err(dev, "can't translate da %llx\n", da);
+
+	return -EINVAL;
+}
+
+static int stm32_rproc_get_loaded_rsc_table(struct platform_device *pdev,
+					    struct rproc *rproc,
+					    struct stm32_rproc *ddata)
+{
+	struct device *dev = &pdev->dev;
+	phys_addr_t rsc_pa;
+	u32 rsc_da;
+	int err;
+
+	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
+	if (err) {
+		dev_err(dev, "failed to read rsc tbl addr\n");
+		return err;
+	}
+
+	if (!rsc_da)
+		/* no rsc table */
+		return 0;
+
+	err = stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
+	if (err)
+		return err;
+
+	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
+	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&rsc_pa, RSC_TBL_SIZE);
+		ddata->rsc_va = NULL;
+		return -ENOMEM;
+	}
+
+	/*
+	 * The resource table is already loaded in device memory, no need
+	 * to work with a cached table.
+	 */
+	rproc->cached_table = NULL;
+	/* Assuming the resource table fits in 1kB is fair */
+	rproc->table_sz = RSC_TBL_SIZE;
+	rproc->table_ptr = (struct resource_table *)ddata->rsc_va;
+
+	return 0;
+}
 
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
@@ -709,6 +780,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		ret = stm32_rproc_parse_memory_regions(rproc);
 		if (ret)
 			goto free_resources;
+
+		ret = stm32_rproc_get_loaded_rsc_table(pdev, rproc, ddata);
+		if (ret)
+			goto free_resources;
 	}
 
 	rproc->has_iommu = false;
-- 
2.25.1

