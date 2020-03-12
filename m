Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5396183C08
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCLWME (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34819 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWME (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id 7so3761871pgr.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r/B04jVPNZTcs3aQnGZX3vp28LZDLa2t2zmjCbTooYI=;
        b=Ek4JJAUTssPJkj2RkBPhViJS7YTAWApGGvcDEJPyfVjwRi4qYdcmYKSDA+y/oD3dex
         q2hTJ6OEOPKVCPi8GPp4CF4LAhMke1Cb1v6Tbc+Pm5K3zBzlUWfvs1gsylfZgJB2bYh4
         dQdpaNJHV5+KkcW5V1eicGEtoJ45KIyMzGYXILKiAzp+7r4661o+97lpfIMdkYxsfNaC
         IG9WQnwPboo9rUHFvUxlS0eJTx1SNjitlX8Ikv6V61uzPGxH58gkFMWwCHWbo0oqw8kY
         R6T3ZWVG7fsN4Iw3nx0j8MNzHoiu9mxyVvAvSgvNRSIIVnuzrqoOp/9z53Fx0017tFPh
         3JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/B04jVPNZTcs3aQnGZX3vp28LZDLa2t2zmjCbTooYI=;
        b=JPDBw8YUVc9uvcHoPpx+IWNw8NLJhHy2zf4vl0LiylIcWlR090qgyfrYE4T8POPGbM
         diIV1TBhUuOCMZkP1nsN26t1h3RvJyBIR3H13nFqabFJylvGHu0/DKvfgIw4DOPv8yQf
         D334YXZ8isz0ht1QiOsDjLd/AnX0aZp8q2drZ76mfgCNKlN3TqVfn0iV7F/c2gNnd8PW
         58wvykxvZqOIOJYvH1r226zy+jSPbs9v1JH1DKwhcE0nApB3j1Gmy5g29+UU2YbY8jvh
         BaNLuILyZJSZ1mIA/IirCvBOt+Rh0Mz0DDl9KZ+kWauZpMYbCyvi+NCXDqSWXZAKUtBN
         8ErA==
X-Gm-Message-State: ANhLgQ2Iuf9HhKfFlJJoJOfBs6UvRP2NtIR14sMQXJWpp6hWeTV/AFGS
        2up0YHP75LKL754dgyQTJEE1TA==
X-Google-Smtp-Source: ADFU+vuL5LJ12AY0ITSMBqKuOY02SWZG2pIYxohw4cmlu1tTrGfERNtDnoiyJ+9GPC5hotC+P2ZMPQ==
X-Received: by 2002:aa7:9888:: with SMTP id r8mr8306988pfl.293.1584051123326;
        Thu, 12 Mar 2020 15:12:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:02 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 03/18] remoteproc: Split firmware name allocation from rproc_alloc()
Date:   Thu, 12 Mar 2020 16:11:43 -0600
Message-Id: <20200312221158.3613-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make the firmware name allocation a function on its own in order to
introduce more flexibility to function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..c0871f69929b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1962,6 +1962,36 @@ static const struct device_type rproc_type = {
 	.release	= rproc_type_release,
 };
 
+static int rproc_alloc_firmware(struct rproc *rproc,
+				const char *name, const char *firmware)
+{
+	char *p, *template = "rproc-%s-fw";
+	int name_len;
+
+	if (!rproc || !name)
+		return -EINVAL;
+
+	if (!firmware) {
+		/*
+		 * If the caller didn't pass in a firmware name then
+		 * construct a default name.
+		 */
+		name_len = strlen(name) + strlen(template) - 2 + 1;
+		p = kmalloc(name_len, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+		snprintf(p, name_len, template, name);
+	} else {
+		p = kstrdup(firmware, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+	}
+
+	rproc->firmware = p;
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const char *firmware, int len)
 {
 	struct rproc *rproc;
-	char *p, *template = "rproc-%s-fw";
-	int name_len;
 
 	if (!dev || !name || !ops)
 		return NULL;
 
-	if (!firmware) {
-		/*
-		 * If the caller didn't pass in a firmware name then
-		 * construct a default name.
-		 */
-		name_len = strlen(name) + strlen(template) - 2 + 1;
-		p = kmalloc(name_len, GFP_KERNEL);
-		if (!p)
-			return NULL;
-		snprintf(p, name_len, template, name);
-	} else {
-		p = kstrdup(firmware, GFP_KERNEL);
-		if (!p)
-			return NULL;
-	}
-
 	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
-	if (!rproc) {
-		kfree(p);
+	if (!rproc)
 		return NULL;
-	}
+
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto free_rproc;
 
 	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
 	if (!rproc->ops) {
-		kfree(p);
+		kfree(rproc->firmware);
 		kfree(rproc);
 		return NULL;
 	}
 
-	rproc->firmware = p;
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
+
+free_rproc:
+	kfree(rproc);
+	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
 
-- 
2.20.1

