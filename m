Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E85191C1F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCXVqQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:16 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41695 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXVqQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:16 -0400
Received: by mail-pl1-f196.google.com with SMTP id t16so7961000plr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pt7wDr4fqIMluK1YQKun6+ciCQDmnXKa037aAN4VvN0=;
        b=wTAWnzLuPmePidvDl9kAOIEBDrW8lXosgGmRTY1Hx//4/vJZb4MDxK7GpWDHYA8aqo
         RCNJcDhebM2Oyhw3MmbqtH+FFoIcsdFhDl6wWR2h1cXC/zDyNpfggvLDg420ERV6OvDz
         JFvHKIlgyhWXovscywCiQtTy2ylRoOJJsqIPsDfvcyGtT9KvXZTQGy/RiBj45kG0qozB
         qNS9hp8VsmzGjty2SqnNBIfxpf0/surBUv+2PDLTm5Hc+nvIYf2uUMihbRCicsYD2qKk
         xk1EUyndvdlglOkvfGMeo1EeISJi91MIlIkIGgL4qWlGO5Jmnj/ey4GSqudZF+De/BT6
         yDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pt7wDr4fqIMluK1YQKun6+ciCQDmnXKa037aAN4VvN0=;
        b=fdvyupNRTBAJaoTmD8P2JFwq5ibaeVy7g/MmpRej5+XAo+G0wv/VQ6kAyl0TZxuqjT
         vM9VXzT7bPzAtZ1Zls6iFm3H7rBj4cZIoE/tKqb2QZzxRk9PV+rsqXlXuTzlRY8gcUsd
         8MiMuPtzGXajc6vrilJFQidBtgX3HmOL3c8WeBiSif5Y/W77ylV9/b5TyoVo6TwBgV3T
         DxcAPhKQUgYBnZfaY6rsdYPJLpwc4W8t5+RqiEU0yl98B6s1TI7C4Ggnvdo8ZTk+JX/7
         XfykarMP84HmMgly8WErkOvvk42ICPfsKeFxEVj2YShDQxo7RzC91FtphpsdQCfTfyZd
         txmA==
X-Gm-Message-State: ANhLgQ0fCp45Fu+cI29x2lhlJgGfllTyURjyN88gXazCWnEsFIHG/5lX
        0G1P/6m69b8AUED0szm3sA9UoA==
X-Google-Smtp-Source: ADFU+vuf964a96E6184jdAQb674Wqwxqy8meb0XjBg4DfdGwERMV/H+u6sg8Be5Xn50lxM6h2Rdx5g==
X-Received: by 2002:a17:90a:c790:: with SMTP id gn16mr7873039pjb.146.1585086373922;
        Tue, 24 Mar 2020 14:46:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:13 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 08/17] remoteproc: Allocate synchronisation state machine
Date:   Tue, 24 Mar 2020 15:45:54 -0600
Message-Id: <20200324214603.14979-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch allocates a synchronisation state machine, either provided or
not by users, in order to enact the proper behavior requested by the
platform or specific scenarios.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 02dbb826aa29..1578a9c70422 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
 	kfree(rproc->sync_ops);
+	kfree(rproc->sync_states);
 	kfree(rproc);
 }
 
@@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_sync_states(struct rproc *rproc,
+				   const struct rproc_ops *boot_ops,
+				   const struct rproc_ops *sync_ops,
+				   struct rproc_sync_states *sync_states)
+{
+	struct rproc_sync_states *st;
+
+	/* At least one set of operation is needed */
+	if (!boot_ops && !sync_ops)
+		return -EINVAL;
+
+	/* We have a synchronisation state machine, no need to build one */
+	if (sync_states) {
+		st = kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
+		if (!st)
+			return -ENOMEM;
+
+		/* Nothing else to do */
+		goto out;
+	}
+
+	/* Allocate synchronisation state machine */
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	/*
+	 * We have a boot_ops and no sync_ops - build a state machine that
+	 * does _not_ synchronise with an MCU.
+	 */
+	if (boot_ops && !sync_ops) {
+		st->on_init = st->after_stop = st->after_crash = false;
+		goto out;
+	}
+
+	/*
+	 * We have a sync_ops and an no boot_ops - build a state machine that
+	 * _only_ synchronises with an MCU.
+	 */
+	if (sync_ops && !boot_ops) {
+		st->on_init = st->after_stop = st->after_crash = true;
+		goto out;
+	}
+
+out:
+	rproc->sync_with_mcu = st->on_init;
+	/* And the synchronisation state machine to use */
+	rproc->sync_states = st;
+	/* Tell the core what to do when initialising */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
+	return 0;
+}
+
 static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 				 const struct rproc_ops *boot_ops,
 				 const struct rproc_ops *sync_ops,
@@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 			return ret;
 	}
 
-	return 0;
+	/* Finally allocate the synchronisation state machine */
+	ret = rproc_alloc_sync_states(rproc, boot_ops, sync_ops, sync_states);
+
+	return ret;
 }
 
 /**
-- 
2.20.1

