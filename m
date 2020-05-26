Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B527D1B8098
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729480AbgDXUZQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729431AbgDXUZP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:15 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1174C09B04E
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so1634043pfx.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zvzC6gFPrPdzFl23lN2WuH5nBg+m021+fv4zS7XCe30=;
        b=JeSlOzJKUAlEQUUjc556FCSgmbLt7CRMMtZBI1ImTGOTQhqVQ47j1XgWFoD7gm7l3G
         G2OyjQRAXMotr3RA+1MdoK9ggCmO/iFqzu9YHxQkHfOhYqo39Rp0RCPnIK8k8nrt/pb/
         tF7s+f7d591EiuvECYRAcbhuxwo3yLUpfrYnofrrg7WWWeZ8WjLLRuO2i3xz4j8B1jpX
         ENW4ZcVeUz+SrLcKK49KaAZ9/fUlBMlMTuOMcsFFrcDL/ZKi5HXmg1P8Yi6jcGAgf7Or
         ZUHmtP4ISsKMs/b84P2+NxEV7oiNwQ/OtOIETDBID/tue4ztejeiC3HPuVEvEJj9sgwx
         Ghjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zvzC6gFPrPdzFl23lN2WuH5nBg+m021+fv4zS7XCe30=;
        b=LxKqfcM8sK+F5XBea5BCR2ioCilIwUc5AzsBoDW0aB+E4TRWYQjasSTgcfT69lVTbW
         ZIHZSTmRi5qPfOCIYXMZTVA4JfT4+tQ1fpyXUxaaSunJhAhpAfPxiroK0Bk0Evgms6rF
         P7CPyf6JShMABdZt7bHxI1N7RUk8HKsRfLR9/pvZGcZCsLfX9xWBJYjhP32FoAYqq90C
         4TRenrQH/M+51CDwrgcjU1oUzPY26Z7jNDGUST14F3voUEhZ/pxdGCXX+W7UQDb9JWdr
         KqrdvZUUJfNHTAuCpxD6ZEtf92yNdhSNGTbkZ/Fczyp/n14aZiOtf1HD9VMzVvF6J4pu
         3mrQ==
X-Gm-Message-State: AGi0PuY+dRE8FrKUM6cEpdPE5mU3b0OrU5KKKglViwAZoyyzRCi4pGA0
        4pl3rOIANU9SwJUxyC9IYZmUeg==
X-Google-Smtp-Source: APiQypL/FJQ9p9P0ruo1sUrpqRRDWLFXA2JvJ7Rs260rkeJu2EjUNFy/ALDcgjJW5wPGudCeO89+Yg==
X-Received: by 2002:a63:1e1f:: with SMTP id e31mr3966444pge.393.1587759914468;
        Fri, 24 Apr 2020 13:25:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/12] remoteproc: stm32: Get coprocessor state
Date:   Fri, 24 Apr 2020 14:24:59 -0600
Message-Id: <20200424202505.29562-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce the required mechanic to get the state of the M4 when the
remoteproc core is initialising.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a285f338bed8..89fbd2ffac93 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -38,6 +38,15 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define RSC_TBL_SIZE		(1024)
+
+#define M4_STATE_OFF		0
+#define M4_STATE_INI		1
+#define M4_STATE_CRUN		2
+#define M4_STATE_CSTOP		3
+#define M4_STATE_STANDBY	4
+#define M4_STATE_CRASH		5
+
 struct stm32_syscon {
 	struct regmap *map;
 	u32 reg;
@@ -635,12 +644,23 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
+				     unsigned int *state)
+{
+	/* See stm32_rproc_parse_dt() */
+	if (!ddata->m4_state.map)
+		return -EINVAL;
+
+	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
+}
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	unsigned int state;
 	bool auto_boot = false;
 	int ret;
 
@@ -664,6 +684,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = stm32_rproc_get_m4_status(ddata, &state);
+	if (ret) {
+		/*
+		 * We couldn't get the coprocessor's state, assume
+		 * it is not running.
+		 */
+		state = M4_STATE_OFF;
+	}
+
 	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.20.1

