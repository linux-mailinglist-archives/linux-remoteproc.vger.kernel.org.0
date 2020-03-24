Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440F5191C1A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCXVqL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37643 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXVqK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id a32so106206pga.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyGNEy80rIASHKptaoZBDFRWFD26JE8tajXEfFmZUNs=;
        b=dMa9+bshXwAoSHMdHxTd/WhFunA87+SrSIJeg8sgJ6RnQV8fnO9hPBHt5ugjOoYR+V
         d5810Y7J2kLN+yz74eTmJ86YTjn+LTXs0XhiHXtjB/MoGCa7OGj1oRfSrrIN1YRZ843/
         fPTyyTySo/ELXv3+3mP+5AjypG4FOqoMpmbEMDtSFCXIaDIC+S1j5xyoxfmOLn8YmDvC
         /+rXRawVIE1VmeUW+M2QJf7QZ3Ih5sVnL/yi0lT1HY14wS0ie9gDsyGJoO7VkG0a35WM
         N/msUAqwGiON2JH9pEP0TJkvUsQR8K+/Sl/mJSUprzCbw/ZLb1RqRrkeWCJfTrYIZ3jT
         AnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyGNEy80rIASHKptaoZBDFRWFD26JE8tajXEfFmZUNs=;
        b=s359+K2eJgiOUCN72UdAKD80IMxpfDL8EI/KVD8Pk0fCvfvVi5tfo+LfXuXJ5QvT/T
         d+uRGYJZeRZmdVZPCKuR7E02pAo7f44BoG6TTjCAeq8qRYTlg5yHHQfwdhhw8SxTetRo
         QKK4ZYaCb/SgpTXiFOjuZy5U07HGkRPKD9zeYfmBTqC/bvOc46md03guKTZs3XY81Xzg
         rdIe7eDNGlka19hZecdQ+08aA05Eyj9bWudEhjh8XNyae+0WVlVeJ85WcQvAz3EBvef0
         vmjCEcA8ecTZJSDaGVHHyRc9htxcKXIN64xMFhj44Zjl+Td4JEKuvL79HG5njehCOcLW
         34Uw==
X-Gm-Message-State: ANhLgQ3hKJdVCImcn2+EGixoQzygKu98y9oV0GE//Rdy0y2WR0Sf07nD
        TZ2E6pwBCYRnLZS8Ds+Wg5S2QpAOsWo=
X-Google-Smtp-Source: ADFU+vsmPg/XKVUqu/uf9NfrZ/qPB1KL42SAJ3OriL7u2EXSc5HThVgABy81sYpa90yOfXp9M+5H5Q==
X-Received: by 2002:a62:6503:: with SMTP id z3mr32439163pfb.232.1585086369525;
        Tue, 24 Mar 2020 14:46:09 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:09 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 04/17] remoteproc: Split rproc_ops allocation from rproc_alloc()
Date:   Tue, 24 Mar 2020 15:45:50 -0600
Message-Id: <20200324214603.14979-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
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

