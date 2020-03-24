Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A95191C1E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgCXVqQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:16 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42893 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgCXVqP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:15 -0400
Received: by mail-pl1-f194.google.com with SMTP id e1so2943691plt.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJHdU0ZEzYxJLygszYrGF0p3WNoeOx6WSquoQc0GbqY=;
        b=SoQHI0TzumallR0/Pxl7uAjuAyS/wWdU/IoX88zZubT2OOI0vd6RI3ivQSOIB+OZ9E
         9DMuIDuv7l03k+uQduoiT6TGTdXb4PYf1zHI10xx+JDsZg/8O1XW1JVkfmULYL6/bhRT
         2qHgyX9bzdNVPL70dDSskqykjvD6xyZa7VCYFbcU1wq5ks2k9WQwCZYJciQ1I7TyBJSF
         pQUkJkCOUZyTPYK7CP95auduA30fn5IVRepz4Aqt2Td9kj0EUO3exer+CLTDQZUVPzW5
         utRQzQgR1TRbwT2peyDrOSIz2yzDqGAtTwbGJz5neWt8MWJM4NS13qlcYzG0WTROt7ca
         9i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJHdU0ZEzYxJLygszYrGF0p3WNoeOx6WSquoQc0GbqY=;
        b=b98qt4OhIcFoYxgjIVvCZEbtu2QN3AWlhTwSwppgbQvruAWYbxBul94yjWl6buWYoL
         Zzbrf3jxHpoxAkcJsNr7BdYEl+VslaEglBHa79+pVm8xhPlUhx8vpqtVPnsG5SAlkJhi
         ih7t0XzLCLLGBITHidrTFqq8EHd2vZCRO3RSlGGflreUHSYmc1++i6JiLVb7x2BuIb2I
         5d81zaMzKhlypQr1eReFJCDMgMrg7YkiIHpwewi4nNNu+MzBzWK1RXDhb8fb896k/erH
         6FueD8HrlHCXWX6wq4SH6qRGlEsGAJEFXTPODSAJUDoOELYZ2lK9FmORXcLm7kH0Q7Jm
         gQKw==
X-Gm-Message-State: ANhLgQ0tEDJSeYEcIIdLH5AGUphRE51+j0fk7TaObQOe1x8OC42DpvTJ
        FYQsvjDdI19RmP7CjXMK6xexeQ==
X-Google-Smtp-Source: ADFU+vvzkoDyfmJEfZwfgeqvtbXSV2bEUaNmQ20D1HqnaMroA0yQkm7sVDpkyV3WcEQeO/HShuqE8w==
X-Received: by 2002:a17:902:9a08:: with SMTP id v8mr93321plp.192.1585086374974;
        Tue, 24 Mar 2020 14:46:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:14 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 09/17] remoteproc: Call the right core function based on synchronisation state
Date:   Tue, 24 Mar 2020 15:45:55 -0600
Message-Id: <20200324214603.14979-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Call the right core function based on whether we should synchronise
with an MCU or boot it from scratch.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_internal.h | 36 +++++++++++-------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 73ea32df0156..5f711ceb97ba 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -106,38 +106,41 @@ static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
 	}
 }
 
+#define RPROC_OPS_HELPER(__operation, ...)				\
+	do {								\
+		if (rproc_sync_with_mcu(rproc)) {			\
+			if (!rproc->sync_ops ||				\
+			    !rproc->sync_ops->__operation)		\
+				return 0;				\
+			return rproc->sync_ops->__operation(__VA_ARGS__); \
+		} else if (rproc->ops && rproc->ops->__operation)	\
+			return rproc->ops->__operation(__VA_ARGS__);	\
+	} while (0)							\
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->sanity_check)
-		return rproc->ops->sanity_check(rproc, fw);
-
+	RPROC_OPS_HELPER(sanity_check, rproc, fw);
 	return 0;
 }
 
 static inline
 u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->get_boot_addr)
-		return rproc->ops->get_boot_addr(rproc, fw);
-
+	RPROC_OPS_HELPER(get_boot_addr, rproc, fw);
 	return 0;
 }
 
 static inline
 int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->load)
-		return rproc->ops->load(rproc, fw);
-
+	RPROC_OPS_HELPER(load, rproc, fw);
 	return -EINVAL;
 }
 
 static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->parse_fw)
-		return rproc->ops->parse_fw(rproc, fw);
-
+	RPROC_OPS_HELPER(parse_fw, rproc, fw);
 	return 0;
 }
 
@@ -145,10 +148,7 @@ static inline
 int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
 		     int avail)
 {
-	if (rproc->ops->handle_rsc)
-		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
-					      avail);
-
+	RPROC_OPS_HELPER(handle_rsc, rproc, rsc_type, rsc, offset, avail);
 	return RSC_IGNORED;
 }
 
@@ -156,9 +156,7 @@ static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 						   const struct firmware *fw)
 {
-	if (rproc->ops->find_loaded_rsc_table)
-		return rproc->ops->find_loaded_rsc_table(rproc, fw);
-
+	RPROC_OPS_HELPER(find_loaded_rsc_table, rproc, fw);
 	return NULL;
 }
 
-- 
2.20.1

