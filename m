Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C9C1515F5
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Feb 2020 07:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgBDG0s (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Feb 2020 01:26:48 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50822 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgBDG0s (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Feb 2020 01:26:48 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so891553pjb.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Feb 2020 22:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9n+iEilQgwgwE8JFMeVrbJ2CZ9pJDHx5XtxEK2zVKro=;
        b=u6GrVEIG8+UBR2o/8hky44AtgWEJu/hSWHE6UO+Bo2wzW17lOk6Vm0IvB/k2xNmvUk
         z+5st6uz8ehnPkjJQwZYTB3CSzu+Z3oJQCazJWCes3PuRy4iD4AV0ec+fDyQEfKNCYMt
         a888D7r3Wu/QCu8D2P7f3eqUHkv/O/KhBV0NqLqYvagFwqgm4FbyLkfCe2yH9Vag2tZ7
         BHEQ97bOwhV7Y5B5ELu1XAjMKOmpohF2Th2i5rhVKfYQ5H0cm7rQqq/8yEMcua+LtGfL
         8jgWHab7K+n29et5+fhNtUpEEIeFmx0axqq2nNdne7CKNJAUU8t4OtY2gt3oGZZxYW/w
         XFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9n+iEilQgwgwE8JFMeVrbJ2CZ9pJDHx5XtxEK2zVKro=;
        b=Jo0C6NTNOxO3jy/7izMIfhL9ODQWd+9Vl5JUnJa1+aaur1dQUOidGI4+UlgV1IA6Qk
         s+/K1hpo14t91qslhlhXIhDGzUerNbiRWmPbqUXFf4FCBjOTHZHZdVXjJKwlibYmI0ee
         DlToPaU/hafwAjTZhcf545DJ4N9nscB74YsE18JFFvJ8KBhmkW+iX+wh0wn2P8HJJtDT
         g/iB6X529+HFlI5RRJv53bMDbkF/qhF2VRjm76dgD+gZTqRjSp5/5aofuc/zpK2Nlkha
         zBqrjnYRqv/TzcRDIhDkZA/8yxzp83g4rpMqR3Gk3DJdCq3fcXG0l+QgOQ440xXzbK2w
         hV6w==
X-Gm-Message-State: APjAAAXVH8pNq7vYvY/ZOHHJDqLDcZ3C3j9MZmTvBHuzaXUHKNOTry0C
        QAaLjLaQsE73DBMh6ZZXXEHOrw==
X-Google-Smtp-Source: APXvYqzlDyVn6Ye4duFE46q2xndT/Npv5RabzJq8m523NGOTCYL9sgiqsz+ngJOvLV+HIedeJyfA6A==
X-Received: by 2002:a17:90a:c78b:: with SMTP id gn11mr4266519pjb.97.1580797606636;
        Mon, 03 Feb 2020 22:26:46 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l69sm6901897pgd.1.2020.02.03.22.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 22:26:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v3 1/2] remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
Date:   Mon,  3 Feb 2020 22:26:40 -0800
Message-Id: <20200204062641.393949-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200204062641.393949-1-bjorn.andersson@linaro.org>
References: <20200204062641.393949-1-bjorn.andersson@linaro.org>
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

Changes since v2:
- The assignment of mpss memory back to Linux is rejected in the coredump case
  on production devices, so check the return value of q6v5_xfer_mem_ownership()
  before attempting to memcpy() the data.

 drivers/remoteproc/qcom_q6v5_mss.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 471128a2e723..25c03a26bf88 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -887,11 +887,6 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	}
 
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
-				      false, qproc->mpss_phys,
-				      qproc->mpss_size);
-	WARN_ON(ret);
-
 	q6v5_reset_assert(qproc);
 
 	q6v5_clk_disable(qproc->dev, qproc->reset_clks,
@@ -981,6 +976,10 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
+	/* Try to reset ownership back to Linux */
+	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+				qproc->mpss_phys, qproc->mpss_size);
+
 	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
 	qproc->mpss_reloc = mpss_reloc;
 	/* Load firmware segments */
@@ -1070,8 +1069,16 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
 
 	/* Unlock mba before copying segments */
-	if (!qproc->dump_mba_loaded)
+	if (!qproc->dump_mba_loaded) {
 		ret = q6v5_mba_load(qproc);
+		if (!ret) {
+			/* Try to reset ownership back to Linux */
+			ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
+						      false,
+						      qproc->mpss_phys,
+						      qproc->mpss_size);
+		}
+	}
 
 	if (!ptr || ret)
 		memset(dest, 0xff, segment->size);
@@ -1123,10 +1130,6 @@ static int q6v5_start(struct rproc *rproc)
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

