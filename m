Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD111C4948
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 May 2020 23:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgEDV6e (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 4 May 2020 17:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726291AbgEDV6d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 May 2020 17:58:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46205C061A0F
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2020 14:58:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e6so82268pjt.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2020 14:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=orFzK+6AOl9Sz0N2w3p5SSg3SPmMkMh0jb6dZXjNAFs=;
        b=jaPlGZnfWYrtPVx1maSVT3ArUEpaiEnh3c5ZYrfq6i/L+ifNSf6JbnomP03mqRSMlK
         f6euoaI0SsW6zum8kWp1BwzoyyU4+Rtk8PuOXa6bK1D+feYt40M45ssIJw7l1Rv9TP11
         i3rEpDQKvKAqkXO4usqwzOmXuBrbD3OJUmNpE5K0dE949Jv5XBxA4ds/5xWq/0LgfyEV
         Oryrwp3mDWT5j4mxQUWqg9ZykXAU9ti2XWi7Ck6lXcXr8btQAt77sqGm2e0VUMybPOTx
         EXmnSJpcI3MzUz7/olOQC1I2nzSN4HHH3eGTuukCMtgAOlnj4oM7BeP/4IPLLtp1StWS
         vmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=orFzK+6AOl9Sz0N2w3p5SSg3SPmMkMh0jb6dZXjNAFs=;
        b=P18z01zGUmLCH+GsCII5JuAslG18DZHz4b4+1tuy8GeeU4QbNt37WCgTkGxW0o8fkL
         0JmpxRfoqRu/SXdV6iHfgm6iiRVq7kVypvjZ+Vz7UobF7Ti3KDQe13CPmhmlCHz93Iw9
         9L3VfuFUAAcILvJV/pklQmNXfQThRCj7mkwGT9CuR3uWxzfmKUsi/URwaSxAUVmGtwDp
         TOuLMukGshiM+TEtR7vLVPIUyT6MPxLmv+JFgh80t+gdPkB9wUpoBMrsH2xZiGR6vXCG
         mheEZJSgIXBcIRXSXPN+64Y1GIym4IvMiEGlhn7PZYlGfil2tyAuqG4peKZ16FeNb3pM
         COjw==
X-Gm-Message-State: AGi0PuYPv57IIM929C1swAi1T0yn6R5SeBSp9jZs3iQ4F4WKf1mu9tTX
        clc3uH6veCCfyKHBbLLqwbRAwy2vcm4=
X-Google-Smtp-Source: APiQypL2uSjObUfnCx6WaMS/6lC8/Rl10vfxTuETATlgRxuCgRXqZQTNSsEMYetk9Sm/POFvW5sndw==
X-Received: by 2002:a17:90a:e28c:: with SMTP id d12mr3714pjz.19.1588629512778;
        Mon, 04 May 2020 14:58:32 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g10sm60185pfk.103.2020.05.04.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 14:58:32 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] rpmsg: core: Add wildcard match for name service
Date:   Mon,  4 May 2020 15:58:29 -0600
Message-Id: <20200504215830.31394-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504215830.31394-1-mathieu.poirier@linaro.org>
References: <20200504215830.31394-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adding the capability to supplement the base definition published
by an rpmsg_driver with a postfix description so that it is possible
for several entity to use the same service.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_core.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index a6361cad608b..5e01e8dede6b 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -399,7 +399,25 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
 				  const struct rpmsg_device_id *id)
 {
-	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
+	size_t len = min_t(size_t, strlen(id->name), RPMSG_NAME_SIZE);
+
+	/*
+	 * Allow for wildcard matches.  For example if rpmsg_driver::id_table
+	 * is:
+	 *
+	 * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
+	 *      { .name = "rpmsg-client-sample" },
+	 *      { },
+	 * }
+	 *
+	 * Then it is possible to support "rpmsg-client-sample*", i.e:
+	 *	rpmsg-client-sample
+	 *	rpmsg-client-sample_instance0
+	 *	rpmsg-client-sample_instance1
+	 *	...
+	 *	rpmsg-client-sample_instanceX
+	 */
+	return strncmp(id->name, rpdev->id.name, len) == 0;
 }
 
 /* match rpmsg channel and rpmsg driver */
-- 
2.20.1

