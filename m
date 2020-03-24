Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823B6191C6D
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgCXWDk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34705 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbgCXWDk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id t3so135512pgn.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=guFt8oGFuo3gPPM+xBh+k6k6Nv14RJK4O+Zn8ic0KVU=;
        b=c1QvcWyfWv7e1xyoWH+FMhYS2NsRqbKYi1wSUQtcFUs+xqznsPa7zQTrk8yzXFhTgB
         mk03JTELTSw5SYu8aOYb2Ae+HmBvBApatR4J07W8fQgDm0QVIrCVgWU6dpOakqOXJ5fg
         /dg2mAh00EMmerTh/WnqvicVLhzleeQps51nw7v1HAH/re7GoBAffN3fKVTPTx2YJGRY
         kWOisnyKs8rmFL+C7JRqOPoYMIRLWK3pgFuMfoZUllmxSsSwA7TnT6WisKG6wDzJvp8Q
         6a7m9LF5IkAouhJmQn9vWUJfR5FuNPusNoSk0biM/r4LkGc5V2vMUFRHaF20lM08Xwbj
         QeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=guFt8oGFuo3gPPM+xBh+k6k6Nv14RJK4O+Zn8ic0KVU=;
        b=IofSfrKZmHV73D0h3K3UOJivNiG0/aVJi4ATCOVbLejm8+0RFNccLGx8b2L9TRzwZh
         ecyqqKg0GkFSe1okV3GaFpFtPKa+o5nmGt6zCLO9bfKIOfDMPO0AQgUnzIWI944Hl4E5
         DcB2oJ5BPP3HZcN8GTNv/irZdXD6nGJDyPP7xG5pWlqr9WAgVlHEzUEWTudqYjlhKa6L
         UCvFIEEqOG94ziO/EeNKWShFnOuO96NeDscBS2aOGMkKDMV8vlp6QbLgcjicxyOf3F47
         vAFWAs/NOhULN3jsUmMnCUav+xnwKs0mgCzozpFs/piTtbaDyRem7JCSBiN/LibFIj0f
         6e9Q==
X-Gm-Message-State: ANhLgQ3wBu8ywEEj+F1pJ/myvnfVl1LftsLL/bbz1pSrdpkViJBq+Etr
        mtkcK034/efnFqKXEm3rXDfKXg==
X-Google-Smtp-Source: ADFU+vtTdxmv//ElJ3Ml9Jhfv4fLUxbT6lugU7ITWyt58qmRzcbWgRobP/bn9c4k4Sa/jJBRYiBbkA==
X-Received: by 2002:aa7:9e46:: with SMTP id z6mr32471807pfq.17.1585087418994;
        Tue, 24 Mar 2020 15:03:38 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:38 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 05/11] remoteproc: stm32: Parse syscon that will manage M4 synchronisation
Date:   Tue, 24 Mar 2020 16:03:23 -0600
Message-Id: <20200324220329.15523-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a3e278490bb4..7d5d4a7dbb04 100644
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
+        err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
+                                     &ddata->m4_state);
+        if (err) {
+		/* remember this */
+		ddata->m4_state.map = NULL;
+                /* no coprocessor state syscon (optional) */
+                dev_warn(dev, "m4 state not supported\n");
+
+		/* no need to go further */
+		return 0;
+        }
+
+	/* See if we can get the resource table */
+        err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
+                                     &ddata->rsctbl);
+	if (err) {
+		/* no rsc table syscon (optional) */
+		dev_warn(dev, "rsc tbl syscon not supported\n");
+	}
+
 	return 0;
 }
 
-- 
2.20.1

