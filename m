Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F65173FAE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 Feb 2020 19:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgB1SeH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 28 Feb 2020 13:34:07 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:40726 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgB1SeH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Feb 2020 13:34:07 -0500
Received: by mail-yw1-f67.google.com with SMTP id i126so4222930ywe.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Feb 2020 10:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VeDGK1DiIdZtOrN6jbdO+ELiBjixQ8axv7+HJNQG5oA=;
        b=RM8lTbkh0pyorHIuPOfxmMVRhdFj7HaQ15++AS2/440X2YXK012m8+JOjFjB2maihP
         fLfm+YyuxpbUl+Kl4ia/DxxO3LS9t1JwDoR3lS8e/BCuN6D8Y1R7G0QNlvpMajuLe1IB
         Xcddy97cj71R2+UEYuxIH0b8ddRhBgRteNpX/DQIbxl5xXoEFWtRRdfWmTnn60avD8Z7
         Ir08Q+ZS9whrKd29OxhkJXCxB+TFKbtMm+cc6IUc8HBWfOFrGa7caLpvWpp9oln2Ys96
         6jg13fAlLczHhZP7E6DzMvbZJ6OfamslRDJrcNqpuaIvgkdpwgHbtGiP5R6KjVfTYCUR
         KsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VeDGK1DiIdZtOrN6jbdO+ELiBjixQ8axv7+HJNQG5oA=;
        b=S7B4Raj31yx4mi+86iM6v4PBJ8YiLCbUjg6XazxrDpWSP27qN8bJAOpB2RDJgMVpcK
         N3gQVUBJZ1iEHE8mLJ8cByAwcX8dlQxKnVO+XH3HGvHizbeADuv7rOqqHN2YgnCJm8yv
         0tZBSoG1J5WuGDoDa3bPvhJoyXDDKOHK279TCf3xhvqctqqYGcFhZNkRBTJ32xDtdxM4
         Aq0LWvDDSr0dUXRhuQnyf+mdMCSiCTVzTnU64KP7kzCz9Ajj0iJQv/Sm24fHktUuISMF
         JU3cpxpXBEN+yH3SERNBn/EeaH5rhyFPjymVRKHIjIyt9Kp2wqzIzCXoBVh7hOMbErZY
         bjoA==
X-Gm-Message-State: APjAAAV0W7DApQm7N4mB/pxh47F1ikWtWEXAjanu+uEIU05K8oDVaV7d
        AEGdus6UP/gYUOytBl6gptEGBw==
X-Google-Smtp-Source: APXvYqziFPUBR8YJ5qjsnsAx4FXUg+cg5+ZJp/RfibCbaSSFf516TjuQSNhgFXljctpfBkfnewR3vA==
X-Received: by 2002:a25:dcb:: with SMTP id 194mr2990013ybn.304.1582914846582;
        Fri, 28 Feb 2020 10:34:06 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o127sm4409884ywf.43.2020.02.28.10.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:34:06 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] remoteproc: qcom: fix q6v5 probe error paths
Date:   Fri, 28 Feb 2020 12:33:58 -0600
Message-Id: <20200228183359.16229-4-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove the remoteproc subdevices if an error occurs after they have
been added.

Have cleanup activity done in q6v5_remove() be done in the reverse
order they are set up in q6v5_probe() (and the same order they're
done in the q6v5_probe() error path).  Use a local variable for
the remoteproc pointer, which is used repeatedly.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index a1cc9cbe038f..97093f4f58e1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1667,15 +1667,21 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
 	if (IS_ERR(qproc->sysmon)) {
 		ret = PTR_ERR(qproc->sysmon);
-		goto detach_proxy_pds;
+		goto remove_ssr_subdev;
 	}
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto detach_proxy_pds;
+		goto remove_sysmon_subdev;
 
 	return 0;
 
+remove_sysmon_subdev:
+	qcom_remove_sysmon_subdev(qproc->sysmon);
+remove_ssr_subdev:
+	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
+	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
+	qcom_remove_glink_subdev(qproc->rproc, &qproc->glink_subdev);
 detach_proxy_pds:
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 detach_active_pds:
@@ -1689,18 +1695,19 @@ static int q6v5_probe(struct platform_device *pdev)
 static int q6v5_remove(struct platform_device *pdev)
 {
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
+	struct rproc *rproc = qproc->rproc;
 
-	rproc_del(qproc->rproc);
+	rproc_del(rproc);
 
 	qcom_remove_sysmon_subdev(qproc->sysmon);
-	qcom_remove_glink_subdev(qproc->rproc, &qproc->glink_subdev);
-	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
-	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
+	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
+	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
+	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 
-	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
+	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 
-	rproc_free(qproc->rproc);
+	rproc_free(rproc);
 
 	return 0;
 }
-- 
2.20.1

