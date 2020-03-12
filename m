Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9180183C17
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgCLWMT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34897 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:19 -0400
Received: by mail-pl1-f195.google.com with SMTP id g6so3232954plt.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IuukOSyWIrqfCKsQH/r2/YhsUvldyW+QBECojjMioRI=;
        b=Iy5l2iYj7jO97/P92FWBPKeXjiQZPbKDyiRIks/MGQb1ySBbyjKfuoH0ts8yzwcGZQ
         RTyeG2vPfD5Ncvnnpqq2TGjL7ImalLa2N7PBFIA16aBejnXq/Ait2fJwZqw8Ukz+r8yz
         xxol6HjX9nsNLLnANDj9ed3NWJ5SP9HN8Irn0vm8TU9TUcYYs6qzOusNdKzbuw1yvyEf
         EwWpUBQ/CKHk7PfzQnfNqd9z3dG/NSlnmH8TfPhgu/k5oJg1ZEhJWzGs8hIrbTbELlhU
         6P18+sr8Pt5uOJW2AE4ztnLsNW0/nWbK8quoZsGpcC2OCtwWf3alu3Eq9tK8Zs+2/Xog
         FKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IuukOSyWIrqfCKsQH/r2/YhsUvldyW+QBECojjMioRI=;
        b=uAifkA/q+HRijD2oS4TYLuuPtlBhfOuxnrUph1HM1ekcrcHRNHfWQP6njLAtbsopRH
         wFnq/90bN8blfvAmfWphBzgphwcORz8Dky8o7EUgS+EuNye6VQhzmiBeOmBDmyZ4M4Q2
         fE/KdtYSL6hGPFHCAjOSww8flamzjxRUDEAvA9tXUoi75d+PDVXSQUVJDmmTVGaYjRGU
         LkjpC1764+n1ndVmmi74M5BZ/fMvMpKF1oB3fvZn0fLc6zGEVXCYbkpxoSr6kouF/pip
         VplmXkOUztB2vhxNk9w+PzIRYcFZvO4Cx028kWhQuH2A9dJgmeVw5Ww+gYiCxAq6EAF+
         JSjw==
X-Gm-Message-State: ANhLgQ0Xyrq6lhWaMf0nwicqf6R5W0107ORWn+ij3ijvMO7AG/X+LA8+
        BD+g/3E6utAxO8LEAqJJcXuULQ==
X-Google-Smtp-Source: ADFU+vsbQ2dvj1TmYBF5mPI0cjX6DqtNLwkAh1mSpyn/9hbynvmkMeAJKtp34ZM5Wwl+CsjiMEq2ug==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id h7mr6563697pjs.107.1584051137869;
        Thu, 12 Mar 2020 15:12:17 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:17 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 16/18] remoteproc: Correctly deal with MCU synchronisation when changing state
Date:   Thu, 12 Mar 2020 16:11:56 -0600
Message-Id: <20200312221158.3613-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
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

