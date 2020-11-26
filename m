Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A5A2C5D68
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Nov 2020 22:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388418AbgKZVGs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Nov 2020 16:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388256AbgKZVGr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:47 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AD1C061A47
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:47 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b63so2591596pfg.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h359vTbVwJlGrgkdHmv3KMar/l3F6onVc2vwd4+bMoM=;
        b=sbYeOUWmzzujt1T3Ghu7+LmmnBe3sUsp1le+rTdJX/snuOxA+fsT2eX9h7sYesj/Ga
         Ut79lCP2xNmRLwkKDupPvx13q/bJFwjdWkeX0WBfwDO2c06litT2gemYS0eu1MNSxVjd
         cZc4iqYF7KD2Bx+VwKRlVUsaoWVojMmmiu5UAUVbJlfaW6rUIL4Ylv09ej9847yLAelJ
         XKKtJGlgNN5pm5k37MhiHVI1aLdQc0DWATdSW9BF7ZIvv9VGh+8WlD8dPZ+msbTjf7wU
         V+m5KtCIW1jBWJiCgk9leRGR0BwYEUh6zVnPsf11l/tKQI7oMvhBrLtN83fvreFpqcaT
         pZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h359vTbVwJlGrgkdHmv3KMar/l3F6onVc2vwd4+bMoM=;
        b=NHB4nupbDNzU+BMJ+U+oaiHeRwQ2MXwUcG6kv0Jo1xo6s5CEwijLRhM8r0Z0e0WMkm
         m64j60dBjbEuw+kWWRQE+ZGQSVQ8nLq5UIF1cps/5ZFDKRw/5TM7/i2A8X0QijklDrVW
         ikmu8ru3KuMWEqAJ7MV+LbTDBa2w7td3In5CO/kmfMc09PpNkyqi8jHyNNcpaYFFyxl1
         SC+bSIro6V/Bf2/9f8VOupk+CMpQhmIl4CIcu3gT5FuLXJtRk3o3aNO1OfLhAkflkeNo
         IVWkuQO1/gLyzB7nx3rlWtH8W6F9OTlkVLD60bFtUCAng0suWXT9HMquZZ2cYIkYMDwm
         a4rg==
X-Gm-Message-State: AOAM532pErPX9QWdmwDzJMmQe/g/XUZpC+rgnuLXvsJvSFdhldBkiNS+
        sGKaZ8Qu6GV98j+XjXr2iQEvMg==
X-Google-Smtp-Source: ABdhPJwzqu4sZRBg0AdcUdRbfqQZkeSOut+3MNHPvc3f5lLV4/sVzanhL0SJ0OQqsf4lZjbh7mnVWA==
X-Received: by 2002:a63:5418:: with SMTP id i24mr3841679pgb.165.1606424806763;
        Thu, 26 Nov 2020 13:06:46 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:46 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 03/15] remoteproc: Remove useless check in rproc_del()
Date:   Thu, 26 Nov 2020 14:06:30 -0700
Message-Id: <20201126210642.897302-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Whether started at probe() time or thereafter from the command
line, a remote processor needs to be shutdown before the final
cleanup phases can happen.  Otherwise the system may be left in
an unpredictable state where the remote processor is expecting
the remoteproc core to be providing services when in fact it
no longer exist.

Invariably calling rproc_shutdown() is fine since it will return
immediately if the remote processor has already been switched
off.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e8b901f34c91..a2b9cd541315 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2346,10 +2346,8 @@ int rproc_del(struct rproc *rproc)
 	if (!rproc)
 		return -EINVAL;
 
-	/* if rproc is marked always-on, rproc_add() booted it */
 	/* TODO: make sure this works with rproc->power > 1 */
-	if (rproc->auto_boot)
-		rproc_shutdown(rproc);
+	rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
-- 
2.25.1

