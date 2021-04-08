Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0A335873B
	for <lists+linux-remoteproc@lfdr.de>; Thu,  8 Apr 2021 16:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhDHOfD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 8 Apr 2021 10:35:03 -0400
Received: from m12-11.163.com ([220.181.12.11]:39708 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhDHOfC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Apr 2021 10:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Cacx6
        cwEprhq0gPa/mEYy1Brd/gFq94w3n5KIQaFV7M=; b=M4qysGFJ3kxt6PHjuGBLn
        tmlGXwm3Szj3cXnsPAYi2fNQykqyPBF8PUCd3arfq+aLYCE46a/+ADR6Xj7+37+v
        LQYPJAYGu4+xZCeP5HKlB6vv02qamXg5zO9fA6KPCRIhRGfuAJ5iQ56pl1jAljMH
        mD8w4LbMZWmbbQ1hBcmphY=
Received: from yangjunlin.ccdomain.com (unknown [119.137.53.45])
        by smtp7 (Coremail) with SMTP id C8CowAD375diFG9gN7jrWA--.29003S2;
        Thu, 08 Apr 2021 22:34:12 +0800 (CST)
From:   angkery <angkery@163.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] remoteproc: qcom: wcss: Remove unnecessary PTR_ERR()
Date:   Thu,  8 Apr 2021 22:33:22 +0800
Message-Id: <20210408143322.1647-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAD375diFG9gN7jrWA--.29003S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr43KFykZryfuryrXryDGFg_yoW5tFy7p3
        9ruFW5trykJrW8Gr9xZrs7Z3Wfuw1xJFW8Cw47Jas3Ca4Yyr4UAa15Xr10vFWFqrWrWay3
        ZF48Z3yUC3W2gFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjxRhUUUUU=
X-Originating-IP: [119.137.53.45]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbBRgRuI13l-Mdu0gAAsw
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Junlin Yang <yangjunlin@yulong.com>

Remove unnecessary PTR_ERR(), it has been assigned to ret before,
so return ret directly.

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 71ec1a4..7581983 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -913,7 +913,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->gcc_abhs_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get gcc abhs clock");
-		return PTR_ERR(wcss->gcc_abhs_cbcr);
+		return ret;
 	}
 
 	wcss->gcc_axim_cbcr = devm_clk_get(wcss->dev, "gcc_axim_cbcr");
@@ -921,7 +921,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->gcc_axim_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get gcc axim clock\n");
-		return PTR_ERR(wcss->gcc_axim_cbcr);
+		return ret;
 	}
 
 	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
@@ -930,7 +930,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->ahbfabric_cbcr_clk);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get ahbfabric clock\n");
-		return PTR_ERR(wcss->ahbfabric_cbcr_clk);
+		return ret;
 	}
 
 	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "tcsr_lcc_cbc");
@@ -938,7 +938,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->lcc_csr_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get csr cbcr clk\n");
-		return PTR_ERR(wcss->lcc_csr_cbcr);
+		return ret;
 	}
 
 	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
@@ -947,7 +947,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->ahbs_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get ahbs_cbcr clk\n");
-		return PTR_ERR(wcss->ahbs_cbcr);
+		return ret;
 	}
 
 	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
@@ -956,7 +956,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->tcm_slave_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get tcm cbcr clk\n");
-		return PTR_ERR(wcss->tcm_slave_cbcr);
+		return ret;
 	}
 
 	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "lcc_abhm_cbc");
@@ -964,7 +964,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get abhm cbcr clk\n");
-		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+		return ret;
 	}
 
 	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "lcc_axim_cbc");
@@ -972,7 +972,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->qdsp6ss_axim_cbcr);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get axim cbcr clk\n");
-		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+		return ret;
 	}
 
 	wcss->lcc_bcr_sleep = devm_clk_get(wcss->dev, "lcc_bcr_sleep");
@@ -980,7 +980,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		ret = PTR_ERR(wcss->lcc_bcr_sleep);
 		if (ret != -EPROBE_DEFER)
 			dev_err(wcss->dev, "failed to get bcr cbcr clk\n");
-		return PTR_ERR(wcss->lcc_bcr_sleep);
+		return ret;
 	}
 
 	return 0;
-- 
1.9.1

