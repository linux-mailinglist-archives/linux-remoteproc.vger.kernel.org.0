Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577EA1B7F9B
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Apr 2020 22:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgDXUBr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Apr 2020 16:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgDXUBp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:01:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD6EC09B04C
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h12so2929634pjz.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3pq49DfqQ/ckFGrpIA0ri6MxM3SY7oSpR206BKLReM=;
        b=RvBfnECVGRBFpGe7Ml1Sb2DYgUm31X/1Kjs0QSoP53VSoyWHlDvTjMyAdwfQtgb1oB
         SIP7ucvumIlGe4Y8w4/v3uT0T+RmsjazOXm8eGhHN0k6RqG4V9Y12YJh1rMYAFjZOaOr
         yEoXM9t068vePXtUfnFdQnYlomkH4HvyckiRCRWDdT4ZebgMerXokHQM+EIKuDannvo/
         tlo7GCM6f+jdWZySjce0E3R/1+8QLDtDhMg3mPNo514RtgaxIFzjcr1hRSONYkAfQEky
         0UGT8WfuhaoNOwKAWAt09wqGaKCpSc/TlJl8uI+7x608sAA2ZrhtlF3AajBQyyWTWSpv
         HQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3pq49DfqQ/ckFGrpIA0ri6MxM3SY7oSpR206BKLReM=;
        b=lmgUywk5Kbwlqv8LHdqQAs4QoE6WORTb0cZ2wtnPf1cRUJs3LmDykLMeypyTcwre56
         SzajR7dX4c4dwpMdzCjVig/e+MEi37vBqO2xelpQt4KLszoECamlsQStKGbti2UIsUKr
         6IjEINYDahJj4TxG6VLIJFvpOaNVKTJIPm9fBX/MryiZ35btYVzB30xYPhgnbYIaDgPW
         x1UHOOd/HvNoKR5B+4GKg4mrOfVcwNlLr0sswFTzSSMUwQDiZy4qPZQ+Kdtcu51CT0bt
         8UMXw20OVSKVzj5uVK6Pg83BsYXzkWH04TPfz2+jS79Uj/muSa5f5uokslV3+DqfZEbR
         RkuA==
X-Gm-Message-State: AGi0PuajxMY51XCE38QUM16TR49O4luWCX/qKaqsDxJAyWnWS2GKsUCM
        DvEsSRSRBWjCwB0/Ep/eP9a3UA==
X-Google-Smtp-Source: APiQypI4vcIlb92FluKaP2+RUFEleVp9k5T2KYJQcvG3Ppxjwx90KAeEDkP8AdnSbiXOHlPI5IJZBA==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr8187396pjw.158.1587758503926;
        Fri, 24 Apr 2020 13:01:43 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:43 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/14] remoteproc: Refactor function rproc_fw_boot()
Date:   Fri, 24 Apr 2020 14:01:26 -0600
Message-Id: <20200424200135.28825-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_fw_boot() in order to better reflect the work
that is done when supporting scenarios where the remoteproc core is
synchronising with a remote processor.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a02593b75bec..e90a21de9de1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1370,9 +1370,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 }
 
 /*
- * take a firmware and boot a remote processor with it.
+ * boot or synchronise with a remote processor.
  */
-static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
+static int rproc_actuate_device(struct rproc *rproc, const struct firmware *fw)
 {
 	struct device *dev = &rproc->dev;
 	const char *name = rproc->firmware;
@@ -1382,7 +1382,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
+	if (!rproc_needs_syncing(rproc))
+		dev_info(dev, "Booting fw image %s, size %zd\n",
+			 name, fw->size);
 
 	/*
 	 * if enabling an IOMMU isn't relevant for this rproc, this is
@@ -1818,7 +1820,7 @@ int rproc_boot(struct rproc *rproc)
 		}
 	}
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+	ret = rproc_actuate_device(rproc, firmware_p);
 
 	release_firmware(firmware_p);
 
-- 
2.20.1

