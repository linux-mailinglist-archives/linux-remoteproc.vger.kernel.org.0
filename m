Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F81A2C5D40
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Nov 2020 22:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391121AbgKZVGu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Nov 2020 16:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390945AbgKZVGu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:50 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46623C0617A7
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:50 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b10so1211867pfo.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0fzZSP3VuvALU3rn9jJyyj4XDT1VCM3xuR6CeVfSK4=;
        b=oKXhRb7rgRQ8Ff9EtJYzAcI9JIJBalQFImYaa+IHstrrVGKyeUsId9/pRSs7VBxEpM
         CfBW0UCgA0J5xT/t90eZ4Xjw4bhCzbfRoQefGUdC5tBNWIMDntsiRYprxSmapZ9Sh8qy
         b9RRPwP+M836Y8JOcTBdTyjCKDyBG5D7fAzODfc/mvellMd67kKcWmPKwM19l1Xjr5xU
         ZtDCWs4lknP6tZsneZH6ifkAPRzXx3PNAzhl16fufpW8yQpE2A+s0wPaKZ/HbHr3dD1U
         6Q6IswulcAgUChgGeZ93HbyamFASpKZNNhKIMLDkZNInZVMxKTdrdoODNWfq1wi2Deio
         whcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0fzZSP3VuvALU3rn9jJyyj4XDT1VCM3xuR6CeVfSK4=;
        b=iOhy/w1rEmTykwpLnA+ZqrBjJcr13E/LN69Muqc5ONWNJ/QlyH2ykStPPyAZ4+AOqO
         kQISzrf09gyms57Meist6gqUhckDuiGO8XXbHTId6yOpVfJcLoZ22KM2m9R6766wwXOd
         jn/uTQDaF97asVBtxRH3h58qiTg97Y8C4xLzsLtBWdov7qLJNVpFC+35lZuRBWEXXkZV
         EEUQbQl3RfX82k98Pf50NA8E4Zz5qTwyMHdxejTjn/LBHQS1KgiD2+WQpf/b6u9Eq5Oa
         fys/xxnQ3KfPGpFkkGwcQbs8GhpKmFZlXiLi9WMRQPfkk6LSTL9NoTUNXXoqhOtivHGo
         +OxA==
X-Gm-Message-State: AOAM533NLVJpLW/pcHNnsk4CFpIdjkK18V77OkFooBk/6jd3oI7De5sC
        dvdO1sdTIKqq7sb5yahYGn102g==
X-Google-Smtp-Source: ABdhPJzXTmqMXkaYZRrrfJKztyJYpaaqKcM7twnog64qKN3eoCQYY3b7rEjmGEl0B69DmTDuJVSKgA==
X-Received: by 2002:a62:8448:0:b029:197:9ab7:9fdb with SMTP id k69-20020a6284480000b02901979ab79fdbmr4161012pfd.49.1606424809866;
        Thu, 26 Nov 2020 13:06:49 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:49 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 06/15] remoteproc: Properly deal with a kernel panic when attached
Date:   Thu, 26 Nov 2020 14:06:33 -0700
Message-Id: <20201126210642.897302-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The panic handler operation of registered remote processors
should also be called when remote processors have been
attached to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 300785a18f03..539667948bc8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2471,7 +2471,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(rproc, &rproc_list, node) {
-		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+		if (!rproc->ops->panic)
+			continue;
+
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			continue;
 
 		d = rproc->ops->panic(rproc);
-- 
2.25.1

