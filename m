Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7B8191C25
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgCXVqW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:22 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39376 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:22 -0400
Received: by mail-pj1-f66.google.com with SMTP id ck23so113227pjb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OyAEH5Ogm2ev5rgwlfYAIWzzoyq+qykv1xNnTlFgbyA=;
        b=ku+B2AEOOyrxmvBlN58Rgf+mxOpy6pPBJuv31u6NOiSeqxUdlv6InRNbC6odzvNoxz
         7P3DHYZ5XLabGHpZeKgsSXgfjAAmmTenelGzoVGnqL2vhBwEnIo+dyQ2MbIE3YNGcoxW
         j4c8zCnTl8QB/LoP4ybFraBKb+iIu35OkbG7ofW1jJcorACVtlgEUuMFHWLhatdt/QQC
         IxH86amdJ7Txsr+VevPtIFfr0hA4tpu36WsKMBw6VuS4uDLZmdPkTifdnfOpMJ6uR+hf
         GoIz2BU38hY0XqB1RtqaYuQX6jMYxmhD2f8853zoCRPFSI1GrM+ORfH4MhRP7iWFiGkA
         X+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OyAEH5Ogm2ev5rgwlfYAIWzzoyq+qykv1xNnTlFgbyA=;
        b=nifupguqyzjcjr4W7qroePf3NcN58brpX3T82huwROfADWe3LaWRzO/XaAhlUzrjGk
         E9uGN2aX4bgTclsStVRStq6JPmy7oVxOcwB5ETITG0hsHxY7ncLw6ZJcJRS9+x+jgEbk
         kDaW4acbWhyalfYZL4K1n9+FzvwbxJex4VazHH82hyxrKshZEtjQo/t4eqFb9yd+FR9j
         CsCq1mWclcY2cePa9T/1MzDuoB7zNg2AzmwEaHtUB+1UjPwo8iQH2DbFd4CTlmvL7aPp
         Se+Ba/tlttVfAZVIg4MgBQsmP6HaeawUFFtBzHMba9z675FfMz09vrpVMZcYwq6s5f9h
         n9/g==
X-Gm-Message-State: ANhLgQ1qsfpFBL2szck7JwUlY0STlYjOnRv+9bxHRW45QGe8w3yHWXO9
        eShlbj+nuvmrSKYsi8fRZkG5zyV6irU=
X-Google-Smtp-Source: ADFU+vty9ozgiD40V2y1ZJAXbVDd23tHN3Gc6AC9+vw8i28gq9L+f4TITvGt246q+vJw8uyKe1nRSw==
X-Received: by 2002:a17:90a:e50e:: with SMTP id t14mr7432906pjy.98.1585086381651;
        Tue, 24 Mar 2020 14:46:21 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:21 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 15/17] remoteproc: Correctly deal with MCU synchronisation when changing FW image
Date:   Tue, 24 Mar 2020 15:46:01 -0600
Message-Id: <20200324214603.14979-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
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

