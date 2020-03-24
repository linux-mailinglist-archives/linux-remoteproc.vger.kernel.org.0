Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 453F9191C73
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgCXWDr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45241 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbgCXWDq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:46 -0400
Received: by mail-pf1-f196.google.com with SMTP id j10so10011726pfi.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpQ6DnVKReCVQYB7WrPmTF5WmM2Jp/tQZ5tQKf9eucg=;
        b=b8VH10bjVHWs3gk4X1Hb+zvtzwCIwi9N+T9wf9apMhAj51QYYmvu8ZAMpS97n+hw74
         UROYpYZGi+uP8jr6ZHUwAQFUJkzPgzp4zw+Y3G0mGB6NMqf0LIao9Sqcnq5LfGJvLIPy
         jlJXXxpQ7ebBiOFJRVCiOo90UX2W3LFiGw866GWvyh/WW202ZRogMs6HBF7z94HnvLFD
         1jqsC7jIXODFUdzPg5JLZ4+pbgKXflvjnxGumfgXFQzqpnkvUb6/HXGGH7bN8RZ5TK4z
         G4I9zJhMB98NQj7x2GojLZNEgv84vmaw9CXSQ2KvJtcI8cX6E6gnweknLFDWRGTHbIrF
         Ywxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dpQ6DnVKReCVQYB7WrPmTF5WmM2Jp/tQZ5tQKf9eucg=;
        b=L4wzb8jphD/jm8TkuJrEJAW4QQidY4Rgr2v3fEHxgpChdF8MK2hNxyeXJg/72jo1jG
         oAPFUaG39oEEq+YJta8ypvj9Hm5Na9J4d2CfD+0ZhH87FfZ0VAIIIlHfex5B/wy0H9ck
         AcZcX537xN1J1jNZNqhcn5byqPLoQ0QduxUZHYvE7sfiOfMVINoLz08Kv8WBEYBvx/59
         /dZGOKeKiGo6V9p/NOiOY6tli/CktNTFJOitaW9F/pf5ijjwEDXRpucmF/Ywe37FrGTy
         kKsAZzani91AThYZePxju0weBGwZqgEpMJzY7m7s+aNcO12uwWwLhR237wOsY4DTeMQN
         VZtw==
X-Gm-Message-State: ANhLgQ1DZYFSFoI3O5d16u+rkous1s7bMtrcRvnmJqeBfaK029JrYen2
        Vq6wIgUg+IFkL1NMf/oBtQkoHQ==
X-Google-Smtp-Source: ADFU+vtA0Wpdsd6L18vppl4CAKw+SExpj66BPvCiR3yMofb89yJcVQTOV2JgIaDXdkcvPAi/OYS7Nw==
X-Received: by 2002:a62:5c07:: with SMTP id q7mr32300396pfb.200.1585087425979;
        Tue, 24 Mar 2020 15:03:45 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:45 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 11/11] remoteproc: stm32: Allocate rproc for synchronisation with MCU
Date:   Tue, 24 Mar 2020 16:03:29 -0600
Message-Id: <20200324220329.15523-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allocate remote processor structure with state machine if the MCU
has already been started by an external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 07be306c0fb1..f320ef9ee286 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -608,7 +608,7 @@ static struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
-static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
+static struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
 	.stop		= stm32_rproc_sync_stop,
 	.kick		= stm32_rproc_kick,
@@ -616,6 +616,12 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
+static struct rproc_sync_states st_sync_states = {
+	.on_init = true, /* sync with MCU when the kernel boots */
+	.after_stop = false, /* don't resync with MCU if stopped from sysfs */
+	.after_crash = false, /* don't resync with MCU after a crash */
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
 	{},
@@ -847,15 +853,22 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
 		if (ret)
 			goto free_ddata;
+
+		rproc = rproc_alloc_state_machine(dev, np->name, &st_rproc_ops,
+						  &st_rproc_sync_ops,
+						  &st_sync_states, NULL,
+						  sizeof(*ddata));
+	} else {
+		rproc = rproc_alloc(dev, np->name, &st_rproc_ops,
+				    NULL, sizeof(*ddata));
+		rproc->auto_boot = auto_boot;
 	}
 
-	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
 	if (!rproc) {
 		ret = -ENOMEM;
 		goto free_ddata;
 	}
 
-	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.20.1

