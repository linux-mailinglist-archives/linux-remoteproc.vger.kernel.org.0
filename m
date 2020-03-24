Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9FFC191C1C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgCXVqN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41694 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXVqN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id t16so7960975plr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFxiWY+kpD9874R08QypyBmwovyVbSqxX8VrEMv/frg=;
        b=U3Sw+BPDHoIngWOvz6mMg/pNvs6kzx09JYkMiHCX3n+D7oJTPBU4Hv9x9CA3rn1Fgw
         74TRVbrUQd8xgBjT2EAZMz/3D6IYCzpH6xiLfQIA/MGLNSkQKEnlV2NJnb9Uahg3/uEy
         phW9N20KNgmn1fqOxzY+tPGATBTXVGrkotaT4IbTDg1hiRhRyz8w1xtr0NIyQMcgvl0L
         /DSR7w1XVmcpCQPiNvtx/a7GvvwSRLZYX7hWw+LUV+hFgYqr6XN5e5ad/zSkSAkymdqW
         9fJg8gQlDxJrM3yyxImXGAcV5tHk9j38jLSc3Q3gGPL+12jDbTo6fVUcxA65C1AvU4ks
         Jfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFxiWY+kpD9874R08QypyBmwovyVbSqxX8VrEMv/frg=;
        b=Z8N0sS/RsBH/KTzT1wgy/ucBD7v1uvP3MdvPKvpcyaBhVnOLoeZRdfMuyv8PLAxDBH
         WZdxQS5qe/XD/zeJf2mHLi4IrP6FRj4fB78aa7qDzshjEduKdpFp8GgTHlircVSOBdm1
         y068yW+SqjpcYjdju2PRf+vM+ZAzyyswGQhcVE8xhTuLktSvNN89ccjno/CctG8ne0G3
         AM5Zf7aFusSeEv/6lP3u0WO2KYvzNB6XUdidA8gweFpbkh5WZ7/ukzwwcqGwDluBO2S+
         1vNMyk084JoR4Dw+8soFkjzxgPbMuibr0mgc+lQvMO3vZbQ21r366SvFZpmMIDNADdbI
         HUHA==
X-Gm-Message-State: ANhLgQ27rJu7XhSmRZfxv6f7jUakPvKJXd54y1F49UpV2ncUTN4+hxSC
        gwTS1eI5NYLaDBB9zlZXU2oMJQ==
X-Google-Smtp-Source: ADFU+vs5DjXBMVZA0ts8TKazTWYB6TRYdbFXAQPeEUdrbFhFEQqQ9Lc51682BJXJ7jMhGJndXmt8jQ==
X-Received: by 2002:a17:90a:2149:: with SMTP id a67mr7858031pje.190.1585086371678;
        Tue, 24 Mar 2020 14:46:11 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:11 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 06/17] remoteproc: Introduce function rproc_alloc_internals()
Date:   Tue, 24 Mar 2020 15:45:52 -0600
Message-Id: <20200324214603.14979-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In preparation to allocate the synchronisation operation and state
machine, spin off a new function in order to keep rproc_alloc() as
clean as possible.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ee277bc5556c..9da245734db6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static int rproc_alloc_internals(struct rproc *rproc, const char *name,
+				 const struct rproc_ops *boot_ops,
+				 const char *firmware, int len)
+{
+	int ret;
+
+	/* We have a boot_ops so allocate firmware name and operations */
+	if (boot_ops) {
+		ret = rproc_alloc_firmware(rproc, name, firmware);
+		if (ret)
+			return ret;
+
+		ret = rproc_alloc_ops(rproc, boot_ops);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto out;
-
-	if (rproc_alloc_ops(rproc, ops))
+	if (rproc_alloc_internals(rproc, name, ops,
+				  firmware, len))
 		goto out;
 
 	/* Assign a unique device index and name */
-- 
2.20.1

