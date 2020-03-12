Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B91183C16
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgCLWMS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34837 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id 7so3762162pgr.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OyAEH5Ogm2ev5rgwlfYAIWzzoyq+qykv1xNnTlFgbyA=;
        b=IAiyvPZm32U6z3XsX+mSpRQZ1E4PFzGOC2cu6jj0rBvvPG+/l7nAckIiCw7wQJgC98
         Fi/SKwJbo7crVx3LjE9LntdIikWlspWBYb93YO6fW5sz/8vjINy87ShsaY/SV6JHxZZt
         fOEqjC349KXOZg8A7WSBLdabyEc/XvboFmyF9ES3aEG790AbSlUhmWhYbfWGQYc96x/C
         GmlZwlInVtlqtp03QrJoSxSkZnpkurbvJUP+5ut2+yzbf4RdPadjLrIhHpLQgRLT/Z3z
         LkcD+8+DURX1Jp1mPudG/+iH8T/ipNUoycUsrdHQxRQAmx1hVQHHppAwGFudwBS7e8rl
         yI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OyAEH5Ogm2ev5rgwlfYAIWzzoyq+qykv1xNnTlFgbyA=;
        b=XBn/xF1SFN8aywChR80yNkUaBWZfTW7dNXcDPiV7ZAg+7rSl4RQjdwltMPYDKC1tg/
         OuOx64Mn+BLPEEPahC1CFnlvYBgGG8FL/nLq/58T078bTHO8JCO9KZub8J4PMvA7Hevt
         792lIiPnv3LLktMmUeuUIPrsvgYW5wiHbIlK8ahJ8X60OmxOyqGXuVyMIuL5cTTnUC4r
         IIEt1DVpRVfYkb7jvGo9u8IFSkDNG2zwKgjTh5m5JotWeCHiyjZGUK3yPFO0D/ZnOu0p
         rM1nc0xL7JEgVU+e00ZXdY8wWkYCmFiyNcR1Ai+8EgkdGv9ILlnT0QSr/ZgMnxXMonhA
         JB9g==
X-Gm-Message-State: ANhLgQ3hEff717yGvVDcz1KJugfFwuD6N6LCkAEagPHI0jJ+i0E8lno7
        fVx9qXOTZYgIEsJsK+Gb/SALlQ==
X-Google-Smtp-Source: ADFU+vuzHxWCeYNEf7MKu4lwaKllQEoaRR90gNFZmapLIbQ+eCMrF6mBzJcaTMLeXJU7qnJbT2Rxgw==
X-Received: by 2002:a63:5547:: with SMTP id f7mr10046223pgm.166.1584051136698;
        Thu, 12 Mar 2020 15:12:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:16 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 15/18] remoteproc: Correctly deal with MCU synchronisation when changing FW image
Date:   Thu, 12 Mar 2020 16:11:55 -0600
Message-Id: <20200312221158.3613-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch prevents the firmware image from being displayed or changed when
the remoteproc core is synchronising with an MCU. This is needed since
there is no guarantee about the nature of the firmware image that is loaded
by the external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7f8536b73295..4956577ad4b4 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -13,9 +13,20 @@
 static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	ssize_t ret;
 	struct rproc *rproc = to_rproc(dev);
 
-	return sprintf(buf, "%s\n", rproc->firmware);
+	/*
+	 * In most instances there is no guarantee about the firmware
+	 * that was loaded by the external entity.  As such simply don't
+	 * print anything.
+	 */
+	if (rproc_sync_with_mcu(rproc))
+		ret = sprintf(buf, "\n");
+	else
+		ret = sprintf(buf, "%s\n", rproc->firmware);
+
+	return ret;
 }
 
 /* Change firmware name via sysfs */
@@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
 		return -EINVAL;
 	}
 
+	/*
+	 * There is no point in trying to change the firmware if the MCU
+	 * is currently running or if loading of the image is done by
+	 * another entity.
+	 */
+	if (rproc_sync_with_mcu(rproc)) {
+		dev_err(dev,
+			"can't change firmware while synchronising with MCU\n");
+		err = -EBUSY;
+		goto out;
+	}
+
 	if (rproc->state != RPROC_OFFLINE) {
 		dev_err(dev, "can't change firmware while running\n");
 		err = -EBUSY;
-- 
2.20.1

