Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6B615AF0B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Feb 2020 18:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgBLRuV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Feb 2020 12:50:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43669 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLRuV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:50:21 -0500
Received: by mail-wr1-f67.google.com with SMTP id r11so3444339wrq.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Feb 2020 09:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mm3jma36b/b+ELTjp5Jw7M207elFeYTYodXaMvbkdAI=;
        b=ZgHCac9miLHfWYJfQHMOZFAxMnJfl/reXqQz0dlAexFjqEsrjFn1GH8G0+SEDUsoRr
         axhjHLNjcrXBtBEyv84ObuVroBNkvi0BDE/IZZTLOlCChVSYk/P2P/lhsmC8lKr31nq5
         kbmMLhF803xX9Nge3DEzcZzbnXLk6KqC4T4qUyKsAu5yKdJbBWE3JUFUTqQdCjEKGK2k
         5I7uTR/Wr7FqZRjk30fhIpdXuNvmcJFUzAIvY1WOWvsIHsAuHfj9EU0Sr+4CEEAr4St4
         yxUJ6zGPHnaCscVwAKfBAtXqCMf9rkc/Znm01klwyOpB/88oiws9NsN7lzqcxo9vpVhD
         2CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mm3jma36b/b+ELTjp5Jw7M207elFeYTYodXaMvbkdAI=;
        b=JRHwbQP5aUMmZPTS24/FYBxB/iNnUKhlAowPvGKtROwgdwWu3aANuLAHYWu8tmqpgl
         kCkS3FMNM6AGjfBSFjYszQAT0jmY1lBUxNrjOl2YO4EICqUg057HW5ysafD8VZ+AK6Ig
         tIFimZPCWvJ2sWoLDfXQvUApDYvH2lls8sR2KlX0WtX85j7HjMIg4dOe7Coirr8iIH1m
         zavnjuw0pQRRXNoh41x33EOKqT4XLeungALhbHtQNfj/dWOzEiZTHsEAujc5NYEtxaUg
         wem/va0omfy0sJy6FumqHv1TsGm/tr43OIgVRuUVRXNcLNK/oiQo80c0CaYHhfMKhCOQ
         icXw==
X-Gm-Message-State: APjAAAUy7Tr4WVQZj1QJ6kmft+fxks/jlSXXoN1QhvNLgOMMu/u20X6E
        rkrGpUHo7NgD0NsYaK+ql9ZeMw==
X-Google-Smtp-Source: APXvYqzjPVGSMO8FIf7L7OzFeikklYCuAjeWL7Ht7r4GxKgXZLVhnVeCWTf1XOcYrxbEaR4dgYsulQ==
X-Received: by 2002:adf:c453:: with SMTP id a19mr16551495wrg.341.1581529819344;
        Wed, 12 Feb 2020 09:50:19 -0800 (PST)
Received: from localhost.localdomain ([172.94.87.18])
        by smtp.gmail.com with ESMTPSA id b11sm1492536wrx.89.2020.02.12.09.50.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 12 Feb 2020 09:50:18 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        anibal.limon@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] remoteproc: qcom: wcnss: Add iris completion barrier
Date:   Wed, 12 Feb 2020 18:54:03 +0100
Message-Id: <1581530043-12112-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There is no guarantee that the iris pointer will be assigned before
remoteproc subsystem starts the wcnss rproc, actually it depends how
fast rproc subsystem is able to get the firmware to trigger the start.

This leads to sporadic wifi/bluetooth initialization issue on db410c
with the following output:
 remoteproc remoteproc1: powering up a204000.wcnss
 remoteproc remoteproc1: Booting fw image qcom/msm8916/wcnss.mdt...
 qcom-wcnss-pil a204000.wcnss: no iris registered
 remoteproc remoteproc1: can't start rproc a204000.wcnss: -22

This patch introduces a 'iris_assigned' completion barrier to fix
this issue. Maybe not the most elegant way, but it does the trick.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/remoteproc/qcom_wcnss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a0468b3..c888282 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -84,6 +84,7 @@ struct qcom_wcnss {
 
 	struct completion start_done;
 	struct completion stop_done;
+	struct completion iris_assigned;
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
@@ -138,6 +139,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
 
 	wcnss->iris = iris;
 	wcnss->use_48mhz_xo = use_48mhz_xo;
+	complete(&wcnss->iris_assigned);
 
 	mutex_unlock(&wcnss->iris_lock);
 }
@@ -213,6 +215,10 @@ static int wcnss_start(struct rproc *rproc)
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 	int ret;
 
+	/* Grant some time for iris registration */
+	wait_for_completion_timeout(&wcnss->iris_assigned,
+				    msecs_to_jiffies(5000));
+
 	mutex_lock(&wcnss->iris_lock);
 	if (!wcnss->iris) {
 		dev_err(wcnss->dev, "no iris registered\n");
@@ -494,6 +500,7 @@ static int wcnss_probe(struct platform_device *pdev)
 
 	init_completion(&wcnss->start_done);
 	init_completion(&wcnss->stop_done);
+	init_completion(&wcnss->iris_assigned);
 
 	mutex_init(&wcnss->iris_lock);
 
-- 
2.7.4

