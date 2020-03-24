Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7AC1191C22
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXVqT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34607 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbgCXVqT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so114736pgn.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0aC0W/518gjnn+FmK3AUNBAeb9XjXBNzVkVSx2D1XV4=;
        b=gvMG5SoAo4dcUk97Xr5oa52WsIphapj8PJlJj06zeoEbCNK99QJjmWkPCFGPK/1FXj
         6wveLkR2bnULAtJLjgof+/MGPp0JpwYidPVq+JccBVtPoITcC1mxH7KBl4ot4GmAfmn1
         4ioV8V3aI6wjJj7sV0WMAVp5R9DH6kHHBzgyaB5wFZEAIG3nvJIEMaPpLx2dKQrDPZWl
         cZWroPS3cvzzXkAP2cx2+UKiyvmCWMWYJtqSoPVc3QjCVNhGQH4m8n4+OSvLwfD7Omef
         WI+XdnIUJ72BDEJm4pVUktY7Y5iSWyB2f4Gl+k4+iOw3kYg1o5WKaYaGFm10KLlXoC/2
         ucrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0aC0W/518gjnn+FmK3AUNBAeb9XjXBNzVkVSx2D1XV4=;
        b=j/zPu1mjwq3HbdWjVzMS7VlV8bYu+jWymGG3eAdCVpfQFZlHLkyImvU+wTUhgCotgr
         2ioZAB+tnWaNbL8JpitfeDMlaLyqfj1SPLXpRSsOoo2wGhst3ZRhHpJuz0iEwoKYQaPd
         uq2VD0pik8wEwgwUGC1lf13kylyExlirwDbkgKa2GY8893gqlkB4tSrQEsZP+5wmVl15
         3F+Qavz8CHUowm+AtO4pkvunQ9eDJ8je63JpHLBT22+lqaADy5paH74qj1WaY7UmVx3P
         SWutJtlKY2fVE+qfXbst6lU4oIRQnL42QDbQfaCT18lqiZBCqzv7mfqK5x/0raJdkkrc
         /6Cw==
X-Gm-Message-State: ANhLgQ2nN4uQ/LG0nKqFEWc+Fl+97kDprokbrjQhcEyAIopMaDMMQcQW
        6TQB4CVXoCxbn1Dkj7kQtuTjKg==
X-Google-Smtp-Source: ADFU+vtUBtc3SqH18/USFJViwQ5ySwBzzIPJfBGZC+nxK84vxpsKWnS6uRBaRQ/dYKyJnDCALOamCQ==
X-Received: by 2002:a63:c84c:: with SMTP id l12mr13984307pgi.225.1585086378357;
        Tue, 24 Mar 2020 14:46:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:18 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 12/17] remoteproc: Rename function rproc_fw_boot()
Date:   Tue, 24 Mar 2020 15:45:58 -0600
Message-Id: <20200324214603.14979-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Renaming function rproc_fw_boot() in order to better reflect the work
that is done when supporting scenarios where the remoteproc core is
synchronising with an MCU.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d57b47b0d6be..488723fcb142 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1363,7 +1363,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 /*
  * take a firmware and boot a remote processor with it.
  */
-static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
+static int rproc_actuate_platform(struct rproc *rproc,
+				  const struct firmware *fw)
 {
 	struct device *dev = &rproc->dev;
 	const char *name = rproc->firmware;
@@ -1373,7 +1374,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
+	if (!rproc_sync_with_mcu(rproc))
+		dev_info(dev, "Booting fw image %s, size %zd\n",
+			 name, fw->size);
 
 	/*
 	 * if enabling an IOMMU isn't relevant for this rproc, this is
@@ -1756,7 +1759,7 @@ static int rproc_actuate(struct rproc *rproc,
 		 firmware_p ? "powering up" : "syncing with",
 		 rproc->name);
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+	ret = rproc_actuate_platform(rproc, firmware_p);
 	if (ret)
 		atomic_dec(&rproc->power);
 
-- 
2.20.1

