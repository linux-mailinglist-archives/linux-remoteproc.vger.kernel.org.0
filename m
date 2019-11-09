Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF231F5C61
	for <lists+linux-remoteproc@lfdr.de>; Sat,  9 Nov 2019 01:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729771AbfKIAkj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 Nov 2019 19:40:39 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45573 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729443AbfKIAkj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Nov 2019 19:40:39 -0500
Received: by mail-pf1-f195.google.com with SMTP id z4so6107368pfn.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Nov 2019 16:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4W4ty972DPX71Iw49mefl5BsapRNw/bFopLDHz4kFy0=;
        b=CFZtI7nAK1OzKUd0yQ8Ucz4zhcGHsvZXBa7pbCuF3Iw5ce+GN2RnxFaThLYdKjRr4N
         VUOWWPrciOcC6LB7ds6ZMWBV41BBKZCFw/huTrjo8WUNmqrA3hb8h+mdz9ssZnetIUJM
         W4TiVcCV5GVpmG2UJyCQhCOjLVGjLURU/WRYkl/Rf3eKyi0FcppC8jK7UFj4WqgslSPZ
         yvIKApcRA0PtNPP6198Oph7PibWznozNKCdeQWC/BD6ZgH3SRSH1RIKKudkonFZyP3gr
         N3zFICoIEtiVzPwzU8ablbXLkEPWGFrH05XlWnxra9TmzATq5qEUzYh5zABljevOW8mW
         uOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4W4ty972DPX71Iw49mefl5BsapRNw/bFopLDHz4kFy0=;
        b=UVAL4TZ936agfQl9y4TvmXdjX+op4BlFEAMfE+k4Hu9+vEqURo8CG36V5bePZQn6Fx
         fyNQbRlU3omWKAhq81filR4+1lRxQltc6eXuj9L8SvHa0v8Mxtvlsh71OAa7q1DimFPh
         UGbiMR2xKTbM04U5MqDt2CaVp/jBnO1mv4wjClB8QQamIsVtch2WxjQEesPra01EQwzE
         cmfArC2lVfuIBZkU3EjKdjIOSzBMmeZ5sQLtOlpwkv9lfIW9QDxwD/XlH1tHTS/FGOpJ
         jo11Ctm/SMRcO7zXpDymOtLSzno2E3jB4jDnAWZ6lk5cU2iPSJrqlC64cEbqznSV+NNk
         9ejQ==
X-Gm-Message-State: APjAAAXuB+0CAhMEzOHEmYnFyMDV9eiqz9ccKO70/TBpKthA8lZw/VfT
        24fg8lelwdQpVJgbt6tRgsoOXw==
X-Google-Smtp-Source: APXvYqx0C+iEkKIhWXyZR6uOecRU7twFYsNFXJH7rLx50NuekjzW7BE1mUO7lWsusLd1uAfena1VOw==
X-Received: by 2002:a63:5511:: with SMTP id j17mr4827052pgb.70.1573260038698;
        Fri, 08 Nov 2019 16:40:38 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y36sm6681461pgk.66.2019.11.08.16.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 16:40:38 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
Date:   Fri,  8 Nov 2019 16:40:32 -0800
Message-Id: <20191109004033.1496871-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191109004033.1496871-1-bjorn.andersson@linaro.org>
References: <20191109004033.1496871-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Trying to reclaim mpss memory while the mba is not running causes the
system to crash on devices with security fuses blown, so leave it
assigned to the remote on shutdown and recover it on a subsequent boot.

Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Assign memory back to Linux in coredump case

 drivers/remoteproc/qcom_q6v5_mss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index de919f2e8b94..efab574b2e12 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -875,11 +875,6 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	}
 
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
-				      false, qproc->mpss_phys,
-				      qproc->mpss_size);
-	WARN_ON(ret);
-
 	q6v5_reset_assert(qproc);
 
 	q6v5_clk_disable(qproc->dev, qproc->reset_clks,
@@ -969,6 +964,10 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
+	/* Try to reset ownership back to Linux */
+	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+				qproc->mpss_phys, qproc->mpss_size);
+
 	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
 	qproc->mpss_reloc = mpss_reloc;
 	/* Load firmware segments */
@@ -1058,9 +1057,14 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
 
 	/* Unlock mba before copying segments */
-	if (!qproc->dump_mba_loaded)
+	if (!qproc->dump_mba_loaded) {
 		ret = q6v5_mba_load(qproc);
 
+		/* Try to reset ownership back to Linux */
+		q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+					qproc->mpss_phys, qproc->mpss_size);
+	}
+
 	if (!ptr || ret)
 		memset(dest, 0xff, segment->size);
 	else
@@ -1111,10 +1115,6 @@ static int q6v5_start(struct rproc *rproc)
 	return 0;
 
 reclaim_mpss:
-	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
-						false, qproc->mpss_phys,
-						qproc->mpss_size);
-	WARN_ON(xfermemop_ret);
 	q6v5_mba_reclaim(qproc);
 
 	return ret;
-- 
2.23.0

