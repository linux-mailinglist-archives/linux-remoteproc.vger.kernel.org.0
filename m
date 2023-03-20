Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A9C6C24B2
	for <lists+linux-remoteproc@lfdr.de>; Mon, 20 Mar 2023 23:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjCTWUw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Mar 2023 18:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjCTWUY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Mar 2023 18:20:24 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F2637B71
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Mar 2023 15:18:47 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i15so3858816pfo.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Mar 2023 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679350717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/LgoSGK+GmE6/EU93H8+NXO4ccsf9u+CovKfDKWumc=;
        b=Juoyvhyhe4EVorBJbKfJG5cW+0Su9a6XcIbbfOnxvZcr96R7XCEUjwKzp651fA4P3B
         xQTMyT2BESSeUn79Pnqz6OzC9LUrZzUtdLXqACH4HLqOKxrIL2/NZdJvjGJGXpsLtYAE
         nw/AVLyzWI6JfiCXqm/EczR9AWvVtpUC9CXwXegc3rAI8RNdOTls4xpkQza4+o/no/6Y
         7hr3Fti1zNNrz37wUl546X8sx1IB46mbLF2BrQqeqPEYcwljyanNJ2xpNTqfBtIq2KtA
         bFHJc5KVtP416bgv6YlM5DHuQ600W/290Wiq5+8gdOH8t14XYl3jAr9ENimoM/Yo8Xgd
         DXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/LgoSGK+GmE6/EU93H8+NXO4ccsf9u+CovKfDKWumc=;
        b=HlLR1V6/FrABCurt7FgDolCiaCeChAjyjKAquSzt5KnIticyslaQr1D73uNrgGmJ9n
         tRtVeyvH50ScFkXyIUcn1F2v+fLznvU5O8xqFTei2AAZpjpzacTu02+jI8KGaqssUHX6
         TT1FFJOmY/SUBlP4teS5yL0d9o9A4FwNCRgNzl3KqE7C+53HJ2lw3Jg5nBiAjObvXmkr
         kVG3Odwb2ANZs/AXZ8D/Xn3EwZkAMriQMGMHVxLu/sfFlHZKS/CbsJHcXU2XUD849E/d
         r/cicniGj4ZTxc5a5oyh4ohbGAOx6o0ojjmCHyIht7ymrGexPslTzxW68bnYp1mxoPD3
         zvJw==
X-Gm-Message-State: AO0yUKU6PoAnU6yP9nsvWRN2vAFSlukIsj1AyHGWZYYhaWz7WsXCSJqT
        QVpbubn2Ex0JcvMuXpfZfqAIJQ==
X-Google-Smtp-Source: AK7set9KHdWfT5WQ73Y09ku7vZjlXSifntdEtuo1i/gz6GfDAugJDKSdSdauloxms2X4Yf1Bm9z7HQ==
X-Received: by 2002:a62:7910:0:b0:625:d630:4e1b with SMTP id u16-20020a627910000000b00625d6304e1bmr293831pfc.31.1679350717432;
        Mon, 20 Mar 2023 15:18:37 -0700 (PDT)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:4ab5:5131:bafc:4428])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006259e883ee9sm4459196pff.189.2023.03.20.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:18:36 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     andersson@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, patrice.chotard@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        arnaud.pouliquen@st.com, hongxing.zhu@nxp.com, peng.fan@nxp.com,
        shengjiu.wang@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] retmoteproc: imx_dsp_rproc: Call of_node_put() on iteration error
Date:   Mon, 20 Mar 2023 16:18:26 -0600
Message-Id: <20230320221826.2728078-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
References: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Function of_phandle_iterator_next() calls of_node_put() on the last
device_node it iterated over, but when the loop exits prematurely it has
to be called explicitly.

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index b8f268d41773..21759d9e5b7b 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -650,15 +650,19 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 
 		rmem = of_reserved_mem_lookup(it.node);
 		if (!rmem) {
+			of_node_put(it.node);
 			dev_err(dev, "unable to acquire memory-region\n");
 			return -EINVAL;
 		}
 
-		if (imx_dsp_rproc_sys_to_da(priv, rmem->base, rmem->size, &da))
+		if (imx_dsp_rproc_sys_to_da(priv, rmem->base, rmem->size, &da)) {
+			of_node_put(it.node);
 			return -EINVAL;
+		}
 
 		cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
 		if (!cpu_addr) {
+			of_node_put(it.node);
 			dev_err(dev, "failed to map memory %p\n", &rmem->base);
 			return -ENOMEM;
 		}
@@ -667,10 +671,12 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)rmem->base,
 					   rmem->size, da, NULL, NULL, it.node->name);
 
-		if (mem)
+		if (mem) {
 			rproc_coredump_add_segment(rproc, da, rmem->size);
-		else
+		} else {
+			of_node_put(it.node);
 			return -ENOMEM;
+		}
 
 		rproc_add_carveout(rproc, mem);
 	}
-- 
2.25.1

