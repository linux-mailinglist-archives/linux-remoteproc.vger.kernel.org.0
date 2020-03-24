Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22704191C26
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgCXVqX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41704 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id t16so7961147plr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IuukOSyWIrqfCKsQH/r2/YhsUvldyW+QBECojjMioRI=;
        b=mpnsRTvRHOT6TJ220UZcITAv2yLm3274yOoI/zs/PoqStk4dXp0+Wvd6ZU4mCdEwLZ
         Yu0aOZbdZM6OO6dEsxDfc0RVDmhL+bjl5mYyaNPmanlid9d3A2OBl9vjTdtNdgO8W2/+
         ZJPeV02stxnyw+ZVWF7Twte5EAV6JJI+WFGBIVVQNhyzAT8lIcMyd5aMSWNo11fPUlpc
         3KxBMKF3FFBPHqL9WDwBl7Cet+DyC97rbS0rPrnoWgkjd9+1WRanbLLYaDL7TZ7avqOi
         eSodG2gQFXjBqHFsa7HD8PjOJwuFgRN/wvPK/CloKbUlCIU5sR3r/YluY4B8IG2FlAJz
         eWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IuukOSyWIrqfCKsQH/r2/YhsUvldyW+QBECojjMioRI=;
        b=Jr7EhOo6GL4Sb2pErI/ZArYCMd6XIocPwI+c6p2oj59uj/ajMoBCtLnHQRMh3cYit9
         ta1FdhotuAy23oOJ/5n0KclYwBPQ6RRXe3kDPp166uSYtxuwczDYQi86ZrnIiyIGvgKI
         hH79G4zYiNvcD7Ti3JO5oZRXxgmIHsUHwVP8/d1RxV5QBJyX1lQ3PWFuUJqDPzpw6g30
         gNpRQYuMWH0Fs4LJEbTJXYOFlBj21sDG54fDvBDgbDqwVn4fsbTk6Tqujbg9h2reIq4I
         KC+JjxxH5ieAlATyn40YNjGNNbBo8Hk2HHgbRGim80VHfTZz9GjYcwUWn7rgljkgPrPV
         NTcA==
X-Gm-Message-State: ANhLgQ0kY4lA3Dq/ndryGm9b+CYi4C9I6/e2IS1mZZPBL8xudp8sDJLD
        yVOFvYGcFSRlK3qk64vsGXDaug==
X-Google-Smtp-Source: ADFU+vs8c/teB+/skfc7k72remy0g0+OE/dwictW1sV0wgW0GmkLNk5e6Vh2Wu48xjx6rqiDhVqpJw==
X-Received: by 2002:a17:902:820a:: with SMTP id x10mr57134pln.179.1585086382671;
        Tue, 24 Mar 2020 14:46:22 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:22 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU synchronisation when changing state
Date:   Tue, 24 Mar 2020 15:46:02 -0600
Message-Id: <20200324214603.14979-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch deals with state changes when synchronising with an MCU. More
specifically it prevents the MCU from being started if it already has been
started by another entity.  Similarly it prevents the AP from stopping the
MCU if it hasn't been given the capability by platform firmware.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 4956577ad4b4..741a3c152b82 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%s\n", rproc_state_string[state]);
 }
 
+static int rproc_can_shutdown(struct rproc *rproc)
+{
+	/* The MCU is not running, obviously an invalid operation. */
+	if (rproc->state != RPROC_RUNNING)
+		return false;
+
+	/*
+	 * The MCU is not running (see above) and the remoteproc core is the
+	 * lifecycle manager, no problem calling for a shutdown.
+	 */
+	if (!rproc_sync_with_mcu(rproc))
+		return true;
+
+	/*
+	 * The MCU has been loaded by another entity (see above) and the
+	 * platform code has _not_ given us the capability of stopping it.
+	 */
+	if (!rproc->sync_ops->stop)
+		return false;
+
+	return true;
+}
+
 /* Change remote processor state via sysfs */
 static ssize_t state_store(struct device *dev,
 			      struct device_attribute *attr,
@@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
 		if (rproc->state == RPROC_RUNNING)
 			return -EBUSY;
 
+		/*
+		 * In synchronisation mode, booting the MCU is the
+		 * responsibility of an external entity.
+		 */
+		if (rproc_sync_with_mcu(rproc))
+			return -EINVAL;
+
 		ret = rproc_boot(rproc);
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (!rproc_can_shutdown(rproc))
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
-- 
2.20.1

