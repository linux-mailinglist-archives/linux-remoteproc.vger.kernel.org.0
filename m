Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED1F183C14
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgCLWMP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46215 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id y30so3740239pga.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/xfDWgWz4t2faWkW26xyNxR8CH/uChKJRUAVNNVX8A=;
        b=sQFmU7K79cej6jvKQClZa/2Wn5rYkfXSzv5khzyi48/WbWS8snbiuZm9vZZppDUkdL
         tabnn+XpOjlWbY8V50yTDfdLkhiVjG3ScmXfW0kUIAATDrWddtw8QrP8uzrDkdm9MtB7
         aQZAw/r2jbvh770qCgc20hc+QSa2U3vDb+VBox3DKuS42iW3JeVYNS+CxKC2GbWgrkSe
         rJBry985hjqEgqVn2BCQzZ+CC1lhxJOavXy0TWDAgpa6/8gNcutovvkoI6kE1ohjV7Nb
         UYbXTdo1QNYwdLZPZbQNo9JNyhJKXBpKabyX/lEV0SejrK57OaOCH6PIIfr6bHudozFB
         pmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/xfDWgWz4t2faWkW26xyNxR8CH/uChKJRUAVNNVX8A=;
        b=PSiOP8crKYb2ejF59NMC5lXKuaFYGykU0vO/enax6iH2lz8PClGA362yLYnW8BRN7i
         5wPB0y2hV/8xxQvm+bxct3Z0O1Bjrl+o5Akm+eebJowIhGgyoromcvYdzQSPyxAzXJBA
         uhvbCpIblz0WLYuUWh1rNBHYB8fdezv4c48xgyYU2g+oIHy4+IoXl74LbdwHu/3Jaidt
         isQcwJFUqWhTtELLzZucxH2U/RY5i5dxQ2pp1QxYJZLkqEIYY4jttk3aL8eoZy1/A8jE
         HBADafBOrV3jRZ/JZVXNSvyfFpd65nx3pdx7GnY3MsDLzanmWQFGkKZ2AwrtcMP2pTVk
         gZfg==
X-Gm-Message-State: ANhLgQ2NiW3uy+uxU2SnHXM5n52YqSwaIyr6Z7uowIXq6yTDEX8KFu6F
        okGKTNDA7+Lt09Qpk5gX80Tgxw==
X-Google-Smtp-Source: ADFU+vvO2Fk8U07HkOm4KBwBtGa1TYecjIEL5/MieQy2GHTXhqqga3xito501sg3G34MJbGLVgsGjw==
X-Received: by 2002:aa7:9588:: with SMTP id z8mr9919549pfj.240.1584051134333;
        Thu, 12 Mar 2020 15:12:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:13 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 13/18] remoteproc: Introducting new functions to start and stop an MCU
Date:   Thu, 12 Mar 2020 16:11:53 -0600
Message-Id: <20200312221158.3613-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add new functions to replace direct calling of rproc->ops->start() and
rproc->ops->stop().  That way different behaviour can be played out
when booting an MCU or synchronising with it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     |  6 +++---
 drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 36c4d0f13ae9..806201af9470 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1330,7 +1330,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	}
 
 	/* power up the remote processor */
-	ret = rproc->ops->start(rproc);
+	ret = rproc_start_hw(rproc);
 	if (ret) {
 		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
 		goto unprepare_subdevices;
@@ -1351,7 +1351,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 stop_rproc:
-	rproc->ops->stop(rproc);
+	rproc_stop_hw(rproc);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
@@ -1483,7 +1483,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc->table_ptr = rproc->cached_table;
 
 	/* power off the remote processor */
-	ret = rproc->ops->stop(rproc);
+	ret = rproc_stop_hw(rproc);
 	if (ret) {
 		dev_err(dev, "can't stop rproc: %d\n", ret);
 		return ret;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 53d63ee2c8bf..73a71ae12c01 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -159,4 +159,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 	return NULL;
 }
 
+static inline int rproc_start_hw(struct rproc *rproc)
+{
+	RPROC_OPS_HELPER(start, rproc);
+	return -EINVAL;
+}
+
+static inline int rproc_stop_hw(struct rproc *rproc)
+{
+	RPROC_OPS_HELPER(stop, rproc);
+	return -EINVAL;
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
-- 
2.20.1

