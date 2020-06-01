Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D781EAF28
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jun 2020 21:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgFAR4J (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jun 2020 13:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbgFAR4H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:56:07 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3B1C08C5CB
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:56:06 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y18so257245plr.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWgUrN+UJxeOnEn8O9BSntxA58isuMWyp3M6ttChdiM=;
        b=jEjCzgdu5MsL5KccNh8vxCzKIljzLYVxhF3CBPDDYzqJeFnwEgyE8ZgD0pRMbJAhkG
         JDFcly9sdSc6Jmt3XMaBExC/AbuJ4wqIMhj+/Vywvdp2RGTqWD7BXg+NhFODVOe2vDS7
         G5RTS985vDgtn5vBmfAqKzRnMZRbNI0p6JBtZnbhnvLKdelLH3H8kDXIyjtwYCu7Wccc
         uViDjvO9CCj9SHisEwviLNpAowii6v9jDA27zw/pqj39NxoPRW16fmxdmTezuDFagk0o
         R++/uvxlwxMGzUjBApiUUQ34SB129LvaYp9iVl0PwBhb5wbUwyAUYofiiomx3kLMqLnN
         JE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWgUrN+UJxeOnEn8O9BSntxA58isuMWyp3M6ttChdiM=;
        b=lLldUQX+sRU8UrtC3gWEZwMb+zv5hHqfAmH1N8l/rOzx/P9Mrd2n4EZvuonQJAsY62
         qo54d9lIVx1S8n91rn7Yn/KXtgPBayBSaJLGLyaheZVShSAwDulZ49BQW1IitAZVlUcd
         pE//u+TeZ1pxgEQjELdnoUG9KyuCjSBS4d+HWeqZ9lxO1ICtWdFZbLFNBzayH1DOhoFE
         pw2ySB95v6vY8nTzvF3lZHXpCNejB/BcFRYFKXVZprwxxANXhWb+Ldoa7Co7yV73tXsf
         iczrsm7Lcmkjrs6c1P8eFTN3E9qN0SS8gSrKmJTf65WrrnLxbSWXQ5ShDH+9HRBYMliv
         wlTw==
X-Gm-Message-State: AOAM531baNYQ/Z7WMlHHPZMyExTCvFjRPIZyqlnIq0sHls+RAWgOn+Yz
        NewLNNhBmuvIq+zN3jtBYLi7zQ==
X-Google-Smtp-Source: ABdhPJz6Uzgkggx9J2O27bgymb95HzErcAQMVBeWDG+YypocdNA0Y4UMUYMBvXdoeRv4M7+EppSTbg==
X-Received: by 2002:a17:90a:a515:: with SMTP id a21mr628227pjq.158.1591034166120;
        Mon, 01 Jun 2020 10:56:06 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:56:05 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 09/11] remoteproc: stm32: Properly handle the resource table when attaching
Date:   Mon,  1 Jun 2020 11:55:50 -0600
Message-Id: <20200601175552.22286-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
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
index 9316ce3b03c2..7c8789164af7 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -38,6 +38,8 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define RSC_TBL_SIZE		1024
+
 #define M4_STATE_OFF		0
 #define M4_STATE_INI		1
 #define M4_STATE_CRUN		2
@@ -85,6 +87,7 @@ struct stm32_rproc {
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	void __iomem *rsc_va;
 };
 
 static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
@@ -668,6 +671,74 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
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
@@ -708,6 +779,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
2.20.1

