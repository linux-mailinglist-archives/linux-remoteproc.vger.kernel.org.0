Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC2A7191C71
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgCXWDp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41439 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgCXWDp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id t16so7977964plr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=53Pt2UxbJ0AcOc/SylPuZOGJYQb+/r7CHW3XYFqP5OA=;
        b=nxVkTqdqwjdMkgPNQ7QHDCWeVZvkhTf7gxg2URNe2pUB7oAok5uoZRzxFtXBCdCQfZ
         zKI8sfraQ1GOmBjST6CQjcSqIeZDXwluxn6VwvH6QXLNQ5MuGP29r7Vu8q06yLSKEdvq
         WBmPwVqczfRVs52CKVDiCZFjseANmXnaDIdOcB9psAaJRm6oOM2DFCVkKBcmFxXXTHLD
         ifcQH9CfkBRifq9JHDk0LZ/Zd+5hwgS2zu4eCidBDZIgUk5KSR8BOkDDFMMqfIJSEOPJ
         atXg3CYo9q1VG/Yb7xQqJhg/q393kaNw7MhfVHSD5uZUtvxB5aoTZ7mQShf/HedOebAX
         S1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53Pt2UxbJ0AcOc/SylPuZOGJYQb+/r7CHW3XYFqP5OA=;
        b=qGBqL7piLUxHT64xaenxmUTRuvoVxxJYS/I5aSe2HSuYx1KM2e0KUz5eyB+WaYx3wy
         N+12NDn/fyIP0kdxn2kA+brhW9NvmS95xvSEzE/mfWh5xJC9rkQKEZz0vZdyg4l88Jjf
         9KmuFXWvS+1ofXOUcsdAISPhzKB/mVkCYOinJeQHFBMIUBooZ08R84KhUlTTRAcNlRvt
         +X23B+C8Yau+B9kYkFXgmdJ3niCPQqT9oKBdI5CdKzhOrmSBkeFP4sbJeNIN/hvRoJ+S
         tUyq1CDwBJaTXofFeaEP+qvUa7hEig2g8+2xo1tRRZ6KLG5M/W012vAfwQ6J4dC9Ggte
         v6oA==
X-Gm-Message-State: ANhLgQ2sozrYEO2nfqWNoRUGxxxipuu39vzeo8oBHgyAXdpk0pl2BB5e
        mBH7Dcd5Kp9hON9myWa+BTodtg==
X-Google-Smtp-Source: ADFU+vt8xHIO05Qv970vtKtT+VAk08PdzIHKwwZoTykDGE8HkfCJD2ViyHtaFGkBFnwXjvsSHjLdCw==
X-Received: by 2002:a17:90a:f50b:: with SMTP id cs11mr16254pjb.145.1585087423798;
        Tue, 24 Mar 2020 15:03:43 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:43 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 09/11] remoteproc: stm32: Introduce new parse fw ops for synchronisation
Date:   Tue, 24 Mar 2020 16:03:27 -0600
Message-Id: <20200324220329.15523-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce new parse firmware rproc_ops functions to be used when
synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 49 +++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 734605a9223e..4268d71f191d 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -215,7 +215,34 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+static int stm32_rproc_sync_elf_load_rsc_table(struct rproc *rproc,
+					       const struct firmware *fw)
+{
+	struct resource_table *table = NULL;
+	struct stm32_rproc *ddata = rproc->priv;
+
+	if (ddata->rsc_va) {
+		table = (struct resource_table *)ddata->rsc_va;
+		/* Assuming that the resource table fits in 1kB is fair */
+		rproc->cached_table = kmemdup(table, RSC_TBL_SIZE, GFP_KERNEL);
+		if (!rproc->cached_table)
+			return -ENOMEM;
+
+		rproc->table_ptr = rproc->cached_table;
+		rproc->table_sz = RSC_TBL_SIZE;
+		return 0;
+	}
+
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+	rproc->table_sz = 0;
+
+	dev_warn(&rproc->dev, "no resource table found for this firmware\n");
+	return 0;
+}
+
+static int stm32_rproc_parse_memory_regions(struct rproc *rproc,
+					    const struct firmware *fw)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
@@ -268,9 +295,28 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 		index++;
 	}
 
+	return 0;
+}
+
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret = stm32_rproc_parse_memory_regions(rproc, fw);
+	if (ret)
+		return ret;
+
 	return stm32_rproc_elf_load_rsc_table(rproc, fw);
 }
 
+static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
+				     const struct firmware *fw)
+{
+	int ret = stm32_rproc_parse_memory_regions(rproc, fw);
+	if (ret)
+		return ret;
+
+	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
+}
+
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -557,6 +603,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
 	.stop		= stm32_rproc_sync_stop,
 	.kick		= stm32_rproc_kick,
+	.parse_fw	= stm32_rproc_sync_parse_fw,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.20.1

