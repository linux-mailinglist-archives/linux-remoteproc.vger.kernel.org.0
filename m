Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD39191C6C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgCXWDj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36467 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbgCXWDj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id i13so10035681pfe.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CtvrAu1ne+DSrciXhJ4DGNMZef5eMvYJ7Dz7YK+J18s=;
        b=jn48v702rLRzTGt9j2DJcPSv1ky1MNddFrTRGWcJNXpDtI0yXer/DWmT+NLuiCIIgQ
         WsqCRPdYtSBk6b+/EKx1hK7QvtKZQaCXdEaDm0D38hRgQIeRzihQd5dIDUqN9qNdpvoW
         h4nXL79HosDLwXcRA9nBSYn7gBhbQTLANlDqdOWtLbDHQ5zSJpC4XnOakVKSWh8tXl3D
         nCjwcuaaGoljJ9gf6ufObA1FLpoxoH3FlfousKPkJjtW2rDUkHi30XhyU4KLALLEVH0W
         k/hpYQVu8Ou2vnbf9kXN8wRtrp2CQmR4e0z8Zt3E10dpYfF7yLuoXa3xVQxd9pnecl8Y
         16fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtvrAu1ne+DSrciXhJ4DGNMZef5eMvYJ7Dz7YK+J18s=;
        b=IXNuss+AFvTX8QkvB5L0v0fEVdzsm/8meJUdMy+X3C7RcABAcwJFcZaoWBT7NXdr5/
         vqiyrqPEwm8leYFROMcTLv5ZTLwPLWg7jMdsKKWWJdJKHpKR/dlasNIo2leZCks97ReX
         QLvZOEb4rn7keFWp+cNg92FyPm2EG5EhohE0rVxy9iaUcc+uH0yjdFlsGG4GTMHnmDhq
         9qp6A8xyfOolWPSOKYGyyjDihcOgni7L4pU2zTzMkePf+u3mTU8fBL3ywIsdK31cbySj
         4pLGW5MbJIizu6h55wiHTbNKQgi1ZcEujysPcqy+E2ZVjwjHntfuwVwTMIY53NjJJzju
         vtwg==
X-Gm-Message-State: ANhLgQ0XlkhE+IB7slTtM0X0q21v13eHRGFNG6Oc4piudhg4Ws12m+Mp
        vnanzUJGenMxhVoGk9frua1Jcw==
X-Google-Smtp-Source: ADFU+vtheaFsfEkbtzFt0/y69dOfwA7mT0o3NqKwiEAcCkqdvJu40Szr8XQHAFk/KScRa5UKhmU2Yg==
X-Received: by 2002:aa7:9e82:: with SMTP id p2mr32163065pfq.46.1585087417903;
        Tue, 24 Mar 2020 15:03:37 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:37 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 04/11] remoteproc: stm32: Remove memory translation from DT parsing
Date:   Tue, 24 Mar 2020 16:03:22 -0600
Message-Id: <20200324220329.15523-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Other than one has to be done after the other, there is no correlation
between memory translation and DT parsing.  As move function
stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
stm32_rproc_parse_dt() can be extended to look for synchronisation
related binding in a clean way.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index ca60c917e218..a3e278490bb4 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(pdev, ddata);
+	return 0;
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
@@ -630,6 +630,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_ddata;
 
+	ret = stm32_rproc_of_memory_translations(pdev, ddata);
+	if (ret)
+		goto free_ddata;
+
 	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
 	if (!rproc) {
 		ret = -ENOMEM;
-- 
2.20.1

