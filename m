Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6121A183C09
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgCLWMF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:05 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45878 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:05 -0400
Received: by mail-pl1-f194.google.com with SMTP id b22so3211167pls.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyGNEy80rIASHKptaoZBDFRWFD26JE8tajXEfFmZUNs=;
        b=mnNIgAZhEkfbNmRvCDD4nxOEirRmHbxfaHD8eciCjCFfz3M+xZs56gFH0ufssr11JT
         DTTYTO3Dlm4F2mXINtStBj956pa7sqKeoMBDhldS8UPWxqJL1CAn5QaOzkcsURtZRXSG
         wmlMvnA9NpXWqxpErVQMeRyjbS2YBU2vPJ9unukW+FX5YoXajD+XRyv6g9wkNd6wiJxE
         FZcDtjb8DF7yAsU5xQ2p9XeBMgDkqirYR9ouwrtizmACkpSEfxRzqmtvRHaTAuh0JuVg
         unl0OHI+RzQ/07UNa7KV5AsCs24x8IvL7oRywW0/fRNpvD1TyPEpXL7uJQ0UQSyKn1ZS
         lKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyGNEy80rIASHKptaoZBDFRWFD26JE8tajXEfFmZUNs=;
        b=XkLCRHujX/MizMGxcXJevqoDMeDJFPxtM5ct0J2E9GHD5riCsQ8eyIL76IzKLnkLgh
         aaoySLxGJFx025CJpKDolHBUkswifBfnZEvdZFGTpU2qi5WPQnF8tJrpuxQ2nJcdyw5/
         P4YdtI+ZaDxBOvwbhrs5tJHjqIPGZRf3wmSU3Q73jtiT9qJfZaS4iqJfE/8OOFJIxuqq
         zDjeJJuWbDFM7Jdbs7UiJy8vdUUXtwDZot7tAXCUFBS2HNpDRSWvfRn9NlMrZ17a8Nfx
         PQ+JrRUYzl0x/mgXr88nKaiO9+y98xuzixpVoOUk5KolkFXTNsLIv7zxowPjJuD5mPDc
         t5Dg==
X-Gm-Message-State: ANhLgQ2K01mlQAb3rX8Gr8vBWifc3gLct1CBLTFTo3isRmovU+a/sUyK
        rjNow8nyRBtdRAussUNcDor00A==
X-Google-Smtp-Source: ADFU+vtueOVa1s9hQyYUTvQKGMxHGyEZiB1f2gB5sMbQyHQUKTN5wdooFevVmnDcmdURovjj7LZXcA==
X-Received: by 2002:a17:902:34f:: with SMTP id 73mr9577679pld.50.1584051124344;
        Thu, 12 Mar 2020 15:12:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:04 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 04/18] remoteproc: Split rproc_ops allocation from rproc_alloc()
Date:   Thu, 12 Mar 2020 16:11:44 -0600
Message-Id: <20200312221158.3613-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make the rproc_ops allocation a function on its own in order to
introduce more flexibility to function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 45 ++++++++++++++++++----------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c0871f69929b..d22e557f27ed 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1992,6 +1992,32 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
+{
+	if (!rproc)
+		return -EINVAL;
+
+	/* Nothing to do if there isn't and ops to work with */
+	if (!ops)
+		return 0;
+
+	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
+	if (!rproc->ops)
+		return -ENOMEM;
+
+	/* Default to ELF loader if no load function is specified */
+	if (!rproc->ops->load) {
+		rproc->ops->load = rproc_elf_load_segments;
+		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
+		rproc->ops->find_loaded_rsc_table =
+						rproc_elf_find_loaded_rsc_table;
+		rproc->ops->sanity_check = rproc_elf_sanity_check;
+		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
+	}
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2031,12 +2057,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_firmware(rproc, name, firmware))
 		goto free_rproc;
 
-	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
-	if (!rproc->ops) {
-		kfree(rproc->firmware);
-		kfree(rproc);
-		return NULL;
-	}
+	if (rproc_alloc_ops(rproc, ops))
+		goto free_firmware;
 
 	rproc->name = name;
 	rproc->priv = &rproc[1];
@@ -2060,15 +2082,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	atomic_set(&rproc->power, 0);
 
-	/* Default to ELF loader if no load function is specified */
-	if (!rproc->ops->load) {
-		rproc->ops->load = rproc_elf_load_segments;
-		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
-		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
-		rproc->ops->sanity_check = rproc_elf_sanity_check;
-		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
-	}
-
 	mutex_init(&rproc->lock);
 
 	idr_init(&rproc->notifyids);
@@ -2086,6 +2099,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	return rproc;
 
+free_firmware:
+	kfree(rproc->firmware);
 free_rproc:
 	kfree(rproc);
 	return NULL;
-- 
2.20.1

