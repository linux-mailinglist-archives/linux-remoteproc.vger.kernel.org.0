Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FE52EB824
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Jan 2021 03:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbhAFCj1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 Jan 2021 21:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbhAFCj1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 21:39:27 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890FFC06135B
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jan 2021 18:38:18 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id p187so1415028iod.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jan 2021 18:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+/PreIeRIyJhWTmPHlg8PaigpleetNErd1NQtA8DC0=;
        b=IyvuCntzbEM634mTKWfcIUbPNY54uF5i9qHiaIcpKFuFY/8w6hJVosc25DZdhpVjYL
         XcODW3DeDH5uHjt1a7ou4U3UnfBsvAZ+perIDuIgtlrsFyUSKjQ6PiNlo0ECTMP9f7f6
         EEKoUOzTc0H3PtCgKB/47ASuD3rBkD2Nhr891ZrR85rOvN0+MP+VmlfnYOXLkjqlu88i
         iSlvs7zVNnjvqZyGCYA2SlBFupkiC9Kw535IViGkT2xNk0+zeBCswExyoXHZ+ndyMBq4
         4Cm1npywEliUS4rI2N6QXfcoiej83OjGCZnHv1n0v4ng7uBKK0OoiOAWxcx+WRV0XQMT
         2+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+/PreIeRIyJhWTmPHlg8PaigpleetNErd1NQtA8DC0=;
        b=hVgFzrfzQHeF+i0eW3KDb0XoeEMqfAP9vDKSc9/wuvdmcpxwtVd2zSXbct7IQhlv+N
         fhi9IHkdeihf504h6nEbf4dusMj8/O91khdtLz2/AWsjh6xBHtdO0D9cv2ESSbCnzEZN
         6KmjlTaiGBFrokb+qSmRvd/vQ9BnwA25p5Zv8rM5MSEDEWPfDim/uTIc1nYw5CfvnEn6
         EWqk/W+M2j+rvHL+hVRgzqV9zLLsfKsUtim/CV88knN/sOCgrGkAjJ4ALacneKEMDQus
         RMnw/t3fmZT1+o36gImvz/wQrt9Twy3Ouwo5TNkLT+AaSs2rBVNEorQGEXQlall+G+RQ
         6s4g==
X-Gm-Message-State: AOAM533HvCxoVOi7Fdmuc1UaEVAER9VhPaBQpJHCzz6vWVoh7UTrKyNG
        5/eNz2G4a47JDWo9L447ukGOjg==
X-Google-Smtp-Source: ABdhPJxfMczwuZHkwdxxG/JIVf5///s4L3iM2So+mqtXQM6+UPZahBIBGK9koryYqLSZ5Q2DrWGqng==
X-Received: by 2002:a6b:6d1a:: with SMTP id a26mr1566213iod.158.1609900698007;
        Tue, 05 Jan 2021 18:38:18 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x2sm631755ior.42.2021.01.05.18.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 18:38:17 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     davem@davemloft.net, kuba@kernel.org, ohad@wizery.com,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/3] soc: qcom: mdt_loader: define stubs for COMPILE_TEST
Date:   Tue,  5 Jan 2021 20:38:11 -0600
Message-Id: <20210106023812.2542-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106023812.2542-1-elder@linaro.org>
References: <20210106023812.2542-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Define stub functions for the exposed MDT functions in case
QCOM_MDT_LOADER is not configured.  This allows users of these
functions to link correctly for COMPILE_TEST builds without
QCOM_SCM enabled.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 include/linux/soc/qcom/mdt_loader.h | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index e600baec68253..afd47217996b0 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,8 @@
 struct device;
 struct firmware;
 
+#if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
+
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
@@ -23,4 +25,37 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  phys_addr_t *reloc_base);
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
 
+#else /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
+
+static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
+				const char *fw_name, int pas_id,
+				void *mem_region, phys_addr_t mem_phys,
+				size_t mem_size, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_mdt_load_no_init(struct device *dev,
+					const struct firmware *fw,
+					const char *fw_name, int pas_id,
+					void *mem_region, phys_addr_t mem_phys,
+					size_t mem_size,
+					phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
+static inline void *qcom_mdt_read_metadata(const struct firmware *fw,
+					   size_t *data_len)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+#endif /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
+
 #endif
-- 
2.20.1

