Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1853191C6F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgCXWDm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:42 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35909 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbgCXWDm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:42 -0400
Received: by mail-pj1-f67.google.com with SMTP id nu11so137639pjb.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wm2/c43XLKQLZdmKqDIyd+QRT6a53rrkW0k1kyN2WTo=;
        b=KHGQbZRyU0qKpPHYO7Iw891NZc86TZBYMcX5ix4jv6/Y+2gYE/v1msJhWxogEY3fsm
         IQlFC8Nf1l4Pm5oG4k/kJzl1gpAqFJsdGgUbqroyuF9vpD3xF7VhJgULxrN+eAa+vS8O
         nlqox4al9Ocbeo8l0hlnAyAzEA3mUls/f5gHTuJ+r++iFm2fyPoiZ8m5qEBu1p+sBaum
         5uMK7QlbFKsq13yX/qbiry+BMpzf9ilX/GZZmoXxqtwPX74bQSbiWmvyufPzmEZ4gUfq
         nHYcEYQc3V076Wmw++TwnnP+K3WPTHaKDH97Ww8rlqMK9MLtGvpJodTFjl5uaz3xClqy
         +CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wm2/c43XLKQLZdmKqDIyd+QRT6a53rrkW0k1kyN2WTo=;
        b=D7aFyMpyOBz4vEfr3bxXzCfCwLwolfU4mxwBDcSlxtitqql7b5w40xfoOvZoMtndc+
         iFdxSasgmruj+AotnZ1AKEnJ5NCGP4KV5134zmLgp5J5HDZgiVEBNStiVBiiu1+X2PX/
         DF2YKhT0/fimIvtJBNbWG3+Mp0nhaChFXMy3hG7rLo+3znWy5rA4LeIIPLS5pAh9XFxH
         X6kxJZNJ+rOoJJt52XQRj7xunwVkt5MQOCTHgeWeYSvVxivA/MDye5NdWpE1z2G8Txfy
         rs0XXpmXHflSp/0jf915sdOfc7c+Sp0JpxqOTHsKAcLAiotWyzetgTGd+MqzeRVDend5
         54hw==
X-Gm-Message-State: ANhLgQ2kLQJVdEfSNCxi0bj8+IZC4XLE9OSm3dGvoEcbt0Tz/BiMOOxe
        lWSIrYNn0L3Z8QKmkb539nYoUVBtmLA=
X-Google-Smtp-Source: ADFU+vvDIncx8bBiJdzpN8fICcVxfuZoti1nsG4BaSFLu5qEaZaJf/XjXtxHpq0BGBE7LKvrKkRCnA==
X-Received: by 2002:a17:90a:1784:: with SMTP id q4mr38680pja.174.1585087421115;
        Tue, 24 Mar 2020 15:03:41 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:40 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for synchronisation
Date:   Tue, 24 Mar 2020 16:03:25 -0600
Message-Id: <20200324220329.15523-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Get the resource table location when synchronising with the M4 so
that the remoteproc and rpmsg subsystem can be initialised properly.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b8af15dd0510..5bac0baf8f4c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -87,6 +87,7 @@ struct stm32_rproc {
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	void __iomem *rsc_va;
 };
 
 static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
@@ -654,6 +655,65 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
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
+	return 0;
+}
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -689,6 +749,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		state = M4_STATE_OFF;
 	}
 
+	if (state == M4_STATE_CRUN) {
+		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
+		if (ret)
+			goto free_ddata;
+	}
+
 	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
 	if (!rproc) {
 		ret = -ENOMEM;
-- 
2.20.1

