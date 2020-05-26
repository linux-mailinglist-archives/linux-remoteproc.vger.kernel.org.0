Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C101B8097
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgDXUZP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729460AbgDXUZN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:13 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EF6C09B04C
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n24so4143012plp.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8pkHvjPLwA96bIGz2NSSF7mXbbhD0VV71pWPGube4rE=;
        b=bBYjk7oGchLHLu2fhyb+5w8E3eMQmDXLajYwnSEoNKZRaYmkH0vi8FbFTDbUvVRsr8
         1kQ/9bmhSE9nEd0h8GciZnigyFT77H7YY3aEtLzrHHMfMG/paQO+0fWET24ArhZqHg3c
         vqdwlGoPskGInUqnaGxRnd2S8rBW6Fmj3W7VsY8JPtJkKnY/T5nKIfI7iR74vB69yuvV
         LmlaLQ8SiaFPpCkXS+0veavIxJ+YUQQsis25rSSvRTKWi/soBPN2Bdaf8IYVJ0TNJuqM
         zs5BXVrG20QdavJxkRWBiRJ0w9dkN4jxu1vN6mAggY6wBIiWECeO1jFR6r+iMr8S6B1k
         HarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pkHvjPLwA96bIGz2NSSF7mXbbhD0VV71pWPGube4rE=;
        b=gVqOV3wctADM5H41YQgCkOsSNXm5Z4t9cHGc7fomczxu6hM/82G2nXF9dmgOnfBI8U
         6TqBOvp9InZQS1nADQP8TpBM+yjJipEQE8BAFdk7gJQsCv8nj3FRP3rRkDP3TCFfvKsW
         AnZJnWIh/irDGgjYBSGlqVpKB3FmmX7hCbr+2FOktQd5HewqzvQAOGZUc72//M+lnWNl
         DqlqesNvKCxj0cEH85V8Vzok87sDG7hI4JT9RhkPFy+iyM0lGB0f7OwaDP1GjZtUB83E
         Jk7iSJ7iYwiVEVUatcRPZXY+aMjyCM8J49GMwaGsUiKbYKYckQH+OaRixrLHxqxhTo83
         Biig==
X-Gm-Message-State: AGi0PuZtziGLvGwPgCL/36VObVlXAjt6mBX43HBSrIJw5L1JI1/tytNL
        kCo9WNu/xYAZ0p61KyC3q33W4Q==
X-Google-Smtp-Source: APiQypI45S+tU5qGacvuJcZRdZ1Rko8UnR0Z/uIU3/5Gk8Rmx2uzncC3GiqshF8IMa1UpBS4OILd+Q==
X-Received: by 2002:a17:90a:101:: with SMTP id b1mr8385987pjb.154.1587759913129;
        Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:12 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] remoteproc: stm32: Parse syscon that will manage M4 synchronisation
Date:   Fri, 24 Apr 2020 14:24:58 -0600
Message-Id: <20200424202505.29562-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Get from the DT the syncon to probe the state of the remote processor
and the location of the resource table.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 658439d4b00a..a285f338bed8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -70,6 +70,8 @@ struct stm32_rproc {
 	struct reset_control *rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
+	struct stm32_syscon m4_state;
+	struct stm32_syscon rsctbl;
 	int wdg_irq;
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
@@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
+	/*
+	 * See if we can check the M4 status, i.e if it was started
+	 * from the boot loader or not.
+	 */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
+				     &ddata->m4_state);
+	if (err) {
+		/* remember this */
+		ddata->m4_state.map = NULL;
+		/* no coprocessor state syscon (optional) */
+		dev_warn(dev, "m4 state not supported\n");
+
+		/* no need to go further */
+		return 0;
+	}
+
+	/* See if we can get the resource table */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
+				     &ddata->rsctbl);
+	if (err) {
+		/* no rsc table syscon (optional) */
+		dev_warn(dev, "rsc tbl syscon not supported\n");
+	}
+
 	return 0;
 }
 
-- 
2.20.1

