Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC19191C6E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgCXWDl (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38350 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbgCXWDl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id x7so125358pgh.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRsPqWT6vmGZz/3jq1BhRl7LiRSK/M8TMnFnWtPZ1Kg=;
        b=ZRI7+w8EIpIM7WTHHJFrqA99kQVHK8QWr1zfP0VNdd1KrGgyWykMrUXSgwptl9G7E1
         mtbFApOujppNm+I7w6iUkEzEZHqG5n2rzp2mIP5WQRJKyk0olVXWijhyMUZXrFj5fho9
         Nleoz2vH4Wl1dEwYo1Nd6BFOMeQIOJ+eByz9fV2S12uNJUJlAKQ6cFzZrztxbCYDLYW+
         INV5c0/u85N6tfABErEzddZbxxO1v+2Cyh8WQg+U6dlIhxLr5mXc3cvEHFasYxEpNSpn
         F+rMVCld5kQcz2PR8NRFNO1k9lQlmJXxnsZCf57uHGLQjFcRudCL5VUH/B7GLmoOvc8t
         ZMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRsPqWT6vmGZz/3jq1BhRl7LiRSK/M8TMnFnWtPZ1Kg=;
        b=dnmq2lzFtlU0nerRgzfABNQI96byP5MVlxdNpdNKjwCfrjLspwA2QYF2pDaCXg3BgH
         0dXnKod5BY7peIBjHtPv/mfzB6xPNMOzKLlTsxJ6dhGaFejm/2Hyl3Bcw1/uThtu+awc
         02LrMNWmTqlIK1D6R9ByGQ7qG+ZvMOz934S6rwRI3ABzWC04YLSnOY+A5BpuYTfVhlf8
         ITwwynQKL9mKYPDsF9cs597D3sANy9m4kcM4dPkYlylIagiTZ2vuy4QgXq4Qle6EsTp5
         NNt8SE4bTNf3juiRgAnU6c179cW5Ka8/Z+UXDke1EKJkymhl42uzaE7r7T7+L/46jiYu
         TBZw==
X-Gm-Message-State: ANhLgQ1w27mP897mB3zS6owHGeKzZaF0hsaoDUqWsWABrigijE7e1t8b
        phEYSRoZ4GtD/g76Owo79eIufltikR8=
X-Google-Smtp-Source: ADFU+vuRQtWfgQEtf/qFi9xkFs1QtZKM9ng21j1xrRMcaYotaAClGZZgCIPIkYFN/b588cAUk4dNUg==
X-Received: by 2002:aa7:9e4d:: with SMTP id z13mr32215089pfq.6.1585087420015;
        Tue, 24 Mar 2020 15:03:40 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:39 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
Date:   Tue, 24 Mar 2020 16:03:24 -0600
Message-Id: <20200324220329.15523-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/stm32_rproc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7d5d4a7dbb04..b8af15dd0510 100644
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
 
@@ -660,6 +680,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_ddata;
 
+	ret = stm32_rproc_get_m4_status(ddata, &state);
+	if (ret) {
+		/*
+		 * We couldn't get the coprocessor's state, assume
+		 * it is not running.
+		 */
+		state = M4_STATE_OFF;
+	}
+
 	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
 	if (!rproc) {
 		ret = -ENOMEM;
-- 
2.20.1

