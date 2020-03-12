Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55F6183C0E
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgCLWML (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40965 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id z65so3946790pfz.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sBTPlRpGe/+85skyuSnsqWL2n7rjq2O/jQYsM8CMr4=;
        b=S4PtbD4oQAgUhOROL2L30qhN38KlsoV4ov3C2TQX91scgVZMMLoPTRsvzC4PdhMHAG
         n17ZjGdrytIz++w51QruwqLzyzey7TWxPqw6NbtQpyhP3osly4/BHRYxPWtK5Vqqb4ym
         F7H5I3QLqm+3jXeC7x6yPtIyFquLyt+NEFeL0Yijn8vjbdC51zcMnmCKTHmey15LifDj
         XCFoM71R7W8o69TN+fqvUkfG1df5JPgnSlQvA2q5Sy8VcjYxik3eSL4GplmvHzhEvWBv
         IVp/j5cUyT4cBWPLrjNfEywyr6VV34kmevRsbPKrGSx5KrrQDOlQ+AFDMvg1XhF6tbow
         DEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sBTPlRpGe/+85skyuSnsqWL2n7rjq2O/jQYsM8CMr4=;
        b=ZozMgkOzcMr3y4ir5Wbh25XHBHcy1uM8GxLwk5iVK5cTr/5rQn4EAxexgBIWat3eZc
         +OIugOXp7jJTZdT7BSyjqZCHE3gX6bza1aozn4KDyJ7KzNAoU5VXCSofD4ZbNEux+ClH
         LKMQ3inavGzC6C/vcoDMPF+LKYRzGLIVdDBES2oodCV9t8FtBY24Db6jIAGvSFUh0QKw
         p8J4HuWYhEtImrgK90x9lLV87s92IXqYsGHOY9D10zPiU26uJB0JNzjNg6PNRjO/GNXs
         7S2r/UqSz+HUB90f6hKmlJrQld4NQ7eIevQECQQN5hH09vWoFEFMpjyns54rLT59Xe6D
         kMdw==
X-Gm-Message-State: ANhLgQ0cz0oF2ceFKYax//TFz5slDGt8HYPrViioCbaEyV1c9p35S0xR
        FsG4mC05pMiOqtQRY4wPAnS+ow==
X-Google-Smtp-Source: ADFU+vv425DJJoNxhoQvLTcPZv2X8FmBvawwcZ6QywDLMyXBiwgww7/CjuEy9WlQWrx3u9lsF2+i8Q==
X-Received: by 2002:a63:ea4e:: with SMTP id l14mr9907712pgk.431.1584051129939;
        Thu, 12 Mar 2020 15:12:09 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:09 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 09/18] remoteproc: Call the right core function based on synchronisation state
Date:   Thu, 12 Mar 2020 16:11:49 -0600
Message-Id: <20200312221158.3613-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_internal.h | 35 +++++++++++-------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 73ea32df0156..53d63ee2c8bf 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -106,38 +106,40 @@ static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
 	}
 }
 
+#define RPROC_OPS_HELPER(__operation, ...)				\
+	do {								\
+		if (rproc_sync_with_mcu(rproc) &&			\
+		    rproc->sync_ops &&					\
+		    rproc->sync_ops->__operation)			\
+			return rproc->sync_ops->__operation(__VA_ARGS__); \
+		else if (rproc->ops && rproc->ops->__operation)		\
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
 
@@ -145,10 +147,7 @@ static inline
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
 
@@ -156,9 +155,7 @@ static inline
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

