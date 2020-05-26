Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7373E1B8092
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbgDXUZa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbgDXUZU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F694C09B048
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a31so2454899pje.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zs8zqxSLmCFU6lZYzSjBYa2nEV+/JbKTSnr0oNB1H9M=;
        b=OBm+YaG5e7Hf79gRnIDBZNaKsh8b7ZMTm3+BICnzVBFchzziucaX2vdz1Hv2U4wWWp
         EcT/3bMOuXUFNAWq5WKuengPx+5y2fcGvHKhTvEZzrMcAp9+kNgx8ULtRQaj1VsNvOpQ
         qj2Yrg8Vn3xU5CSUU+C/M0KviqQ0YKH++EEcCiL3V5CUSo5gfl6Zuwp+cdPpX1BkMt1+
         BCTEf18ioZntEnAvgClbjfDXsHKPgGNrXVRhyrUUGe3RotINDtjIgWezMoHtIKkprwEm
         52k/IRykm18cYzv6tyXkxGpk0acftWHy4zSTQ2/lKYv3MiF+lIksGYegWWlFFILFYXqk
         pNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zs8zqxSLmCFU6lZYzSjBYa2nEV+/JbKTSnr0oNB1H9M=;
        b=Gen048UlIOjYhnkEIJPEUGBX3jhvXkhEd0LiBaJNLr9voLQC8pZ4a3XQ2dzfVizWfz
         QVXLY4DhePWOGxPYK7Xlx5+7MFrJ0rwqSQF80P5G9+V51qe65EFZfKYGhffpPa7oprvh
         aFYo3+FEV+KYRff6+NfaRv5vODYAy2GCx+4Z8GxnB8YQY9iDkIB7p/d1ECy59RLj23dT
         k3jXVuUaOc6cq60knXRmNNU2yOIcl4c5AM3bQ1kupaxseacAuJLVF7rcBcMRz38uUu+0
         KGDtuOLl3Nota2ScpEDZJ/HefzOXVzIMQhADHY83mSHYNtDP517T5JRVbl/hjzBMmsqX
         nMSQ==
X-Gm-Message-State: AGi0PuYXibjO4VtD2Sb6JoESWxuBY3EpeTIV2pGjREpbYWq2N572SymF
        FnRvOFXqF+5v2cH6VFNwVPh5hg==
X-Google-Smtp-Source: APiQypJU8nTXTveTpL95Js1RKNrdGMPxwTFKK6UCZMwcjKNmAhFJgR4kBO2M3JrCnfwpW1TsGUDwwg==
X-Received: by 2002:a17:90a:82:: with SMTP id a2mr8752961pja.47.1587759920159;
        Fri, 24 Apr 2020 13:25:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/12] remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
Date:   Fri, 24 Apr 2020 14:25:04 -0600
Message-Id: <20200424202505.29562-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce new elf find loaded resource table rproc_ops functions to be
used when synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b8ae8aed5585..dcae6103e3df 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -319,6 +319,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
 	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
 }
 
+static struct resource_table *
+stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
+					   const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+
+	return (struct resource_table *)ddata->rsc_va;
+}
+
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -593,6 +602,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
 	.stop		= stm32_rproc_stop,
 	.parse_fw       = stm32_rproc_sync_parse_fw,
+	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.20.1

