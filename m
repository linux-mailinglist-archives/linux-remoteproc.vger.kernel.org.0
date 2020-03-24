Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A22191C24
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgCXVqW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:22 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37181 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbgCXVqW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:22 -0400
Received: by mail-pj1-f66.google.com with SMTP id o12so117466pjs.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r2iAuvZgT/vJ5kezK/zxo0dCdsSjLaGw8q76btUTT/Y=;
        b=qwNweu48IVdvuGMdb87/sFUcTFHpTKxprQOFQ+RUovMeiyhUkUaW97nOykXqm6kxmK
         HvgtqOabVYxBw+QLDaFjE8/iTnFvpgOu0mwQnneyoC88LZNrOZZYsH3peoJ2uTwncdkM
         4NxeWavzid2gyAxdXDvUPaL1moPwqthGKo18UsW5wAgUj0uSTHzpuwcNrwqeS/yiWH/3
         jidOo96MG8jUvry6IfQGuLJJCaukN4Tz2Pn0hSkcYmnXfEm6lZ3Eli4qyOxnXfVO/k6L
         XrgsZ2wkiE4HazU1IGULB0d5N4P31osijuKlhsEF3oqJHrEYu8hhgzQUPpt9l/69l7Ze
         CMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2iAuvZgT/vJ5kezK/zxo0dCdsSjLaGw8q76btUTT/Y=;
        b=lRd+BgTSQRwyyXvu+rA5kcz5GYPBsLuD8XmcPeLclacGeNl5e2kVAhQHIpyzhJ1dBA
         nPQbr7plBiei9eVMOwNzuS79wis6P81WuXk9rpJdn6TARgT5F/aOOsmcHZRTUVdX8zNt
         EOyvEV65sc7NkVjqAkvHpAE+a/X0vMPdIGY956WWzAPAf0s9UEgANPAbr3/o6UIHJ3PO
         jkdRzZSHLwMrlmm10mvlZNrppS8Tz4QCrKUU+7LVMDbZaNZgl63ewJRB4LAGe9ZAhlJr
         DJQetsL2C9GDt3nXSP+Bm05+m1NKJ+QhtkZF+2LbN9IoRqyjw28YAOUYxldEYTHe9cUJ
         qkQw==
X-Gm-Message-State: ANhLgQ38EwEZx5fmBqWqrGc1TA/3JPvNkZeXvfpPPl/iQDLs8V7uCWWb
        O6KPt9py/ezcbqIk3AaR3JU6PQ==
X-Google-Smtp-Source: ADFU+vsOjaugijeD6atzcjc3w+WVUWXGRjxQRBbF0YM6Oad8cecV8jgmvjnWlu370MhHooKWmFArNw==
X-Received: by 2002:a17:90a:c715:: with SMTP id o21mr8059051pjt.160.1585086380559;
        Tue, 24 Mar 2020 14:46:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:20 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 14/17] remoteproc: Refactor function rproc_trigger_recovery()
Date:   Tue, 24 Mar 2020 15:46:00 -0600
Message-Id: <20200324214603.14979-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_trigger_recovery() in order to avoid
reloading the fw image when synchronising with an MCU rather than
booting it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d3c4d7e6ca25..dbb0a8467205 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1661,7 +1661,7 @@ static void rproc_coredump(struct rproc *rproc)
  */
 int rproc_trigger_recovery(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p = NULL;
 	struct device *dev = &rproc->dev;
 	int ret;
 
@@ -1678,14 +1678,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* generate coredump */
 	rproc_coredump(rproc);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto unlock_mutex;
+	/* load firmware if need be */
+	if (!rproc_sync_with_mcu(rproc)) {
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto unlock_mutex;
+		}
 	}
 
-	/* boot the remote processor up again */
+	/* boot up or synchronise with the remote processor again */
 	ret = rproc_start(rproc, firmware_p);
 
 	release_firmware(firmware_p);
-- 
2.20.1

