Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7BA6C24AE
	for <lists+linux-remoteproc@lfdr.de>; Mon, 20 Mar 2023 23:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjCTWUi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Mar 2023 18:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCTWUV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Mar 2023 18:20:21 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B63199C3
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Mar 2023 15:18:39 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id bn14so59127pgb.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Mar 2023 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679350714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SvawGG1lzE2m2LYlYl0Sje5AT1/P8cyqdj5Tvo8pXw=;
        b=PvsJCIxu/xbvlnlhZcbf+hp2aL49LnhKhuTqbalsm2KYp8FtnY4tziFYeq6PECIzcv
         7wi6KhU0/ObSDhiFpGp54opvLN9aTw9Wxivakpea5e66Hp5jxFO8z+vOmDN3Y7UHzaR4
         e8Zqc9Dn4od77y53Ps62VFI3Fqiz+C08ZRcMRPROfAa6acetGE+EqDK7pMA1L8lJsPE0
         fLoMHZufOKtY2UmiwA4oBVPyFh20qPih0+Trtn9bP3JI3L/v4pvBKGd6iINDctJAwTdt
         2wGNlFYVcKYBKwuhOu7maadGhWXFYBS9hWhBMXS9gXFGIq16h8VrJ3kYtrTXyx5cZtsD
         6sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SvawGG1lzE2m2LYlYl0Sje5AT1/P8cyqdj5Tvo8pXw=;
        b=pbke3+9AogfZgPWGALjB/mZF2H7cxGOX92GDUBA17ic03jV1jR0dERvqODzlvi6bfk
         bJxOiUD/TXVhpBL4ZT0LSNeBaJ2UXPMNVLTI5Nu8I47vq92UfAs69IzujRheoDX2OjIu
         kWikvi3SVcVy5cD4Nn9mP4+EOWgPQnYtQXgV9/j/cU2s2DFRYdeF2F01LBc6ouIoSlI5
         DLx/v0ezdgzMMnQCW1TEw8S3c+tMacm0ODq53dOYlp7/cQO6uH050+wrYaG8EEpnWymM
         rv62EKjN3AFBAT03IQmCTBYsW+MtifeLDVrd6WJoNx2ZqgYcKEGtSU5cF6LU9EOWtfwy
         GNuQ==
X-Gm-Message-State: AO0yUKX9UaJ4J+4kdVD9jyzMNtM27800vqEgpx+1bxcEk0t1T4JBcgYs
        rmivjKfid1aUugkb4XBRVBXj+A==
X-Google-Smtp-Source: AK7set91Y4YlRhjokRSS2Ws2BcWMaU/uCFjWar6nqsAqx2gZeqmqUwzvD0MsckqftgI7PPc4q9yzpA==
X-Received: by 2002:aa7:8614:0:b0:626:22e5:beb8 with SMTP id p20-20020aa78614000000b0062622e5beb8mr11549651pfn.3.1679350713845;
        Mon, 20 Mar 2023 15:18:33 -0700 (PDT)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:4ab5:5131:bafc:4428])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006259e883ee9sm4459196pff.189.2023.03.20.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:18:33 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     andersson@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, patrice.chotard@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        arnaud.pouliquen@st.com, hongxing.zhu@nxp.com, peng.fan@nxp.com,
        shengjiu.wang@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] remoteproc: rcar_rproc: Call of_node_put() on iteration error
Date:   Mon, 20 Mar 2023 16:18:24 -0600
Message-Id: <20230320221826.2728078-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
References: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Function of_phandle_iterator_next() calls of_node_put() on the last
device_node it iterated over, but when the loop exits prematurely it has
to be called explicitly.

Fixes: 285892a74f13 ("remoteproc: Add Renesas rcar driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/rcar_rproc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index aa86154109c7..1ff2a73ade90 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -62,13 +62,16 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 
 		rmem = of_reserved_mem_lookup(it.node);
 		if (!rmem) {
+			of_node_put(it.node);
 			dev_err(&rproc->dev,
 				"unable to acquire memory-region\n");
 			return -EINVAL;
 		}
 
-		if (rmem->base > U32_MAX)
+		if (rmem->base > U32_MAX) {
+			of_node_put(it.node);
 			return -EINVAL;
+		}
 
 		/* No need to translate pa to da, R-Car use same map */
 		da = rmem->base;
@@ -79,8 +82,10 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 					   rcar_rproc_mem_release,
 					   it.node->name);
 
-		if (!mem)
+		if (!mem) {
+			of_node_put(it.node);
 			return -ENOMEM;
+		}
 
 		rproc_add_carveout(rproc, mem);
 	}
-- 
2.25.1

