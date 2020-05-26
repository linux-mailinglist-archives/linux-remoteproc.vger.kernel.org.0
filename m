Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D1B1AB2EA
	for <lists+linux-remoteproc@lfdr.de>; Wed, 15 Apr 2020 23:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442111AbgDOUtK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 15 Apr 2020 16:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438465AbgDOUtH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 16:49:07 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3081C061A10
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:05 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 2so496969pgp.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X7xQkJUM4QmV6qWTvIaQsCBAO/ir+/c43EdRMlg0Sws=;
        b=pmJsR3vMADCiEuC3ZKRoEyvjBq1QZzx97rLn6fPaWryt3MHuayJKUFwHlbhn+r8AOD
         asA55ORUfRTr3uD7Q8z5p/QyDbS08f1zy+UqpNFmm0Z3Z2mTsv4lxEG9RcsMpX3HwB+W
         yGRd3o+f6FGE+AfWv93DKCskICeFWSVVkACz3I6GXLhAuWf7SA6qS+F3kBGN0iZUl6fT
         K3nvktHz9RuwTFri9hLNzEvNvsKE44ncHhAOSUuUI/OYE2a53l+EK4nYw5oAspI/6Jri
         VNQJHC/lEOsTzMPMsNv9CdwmyoHA4fVuurHkJ+CIrwKnGKenxFE0KxZu+PeQbcOJMxuX
         tPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X7xQkJUM4QmV6qWTvIaQsCBAO/ir+/c43EdRMlg0Sws=;
        b=RJgvNMZTIcRUR1f0YFhSnlrT+3gtbl/EOL4658+biSk0NxpW3Gglk0OePsmFqo7MKR
         /gDjx9Mv5QkzXKaC7+FQ0AnZVHKjyYVQhI5XybSrnqe/V/CjtFdIgyWerL0dlAghzwKS
         ByjEEphc/GrjuaUSJ1YcVGOcuIK3M3m9Ik4P0SKK1/EAQxugqrhSvAGFr0zTC8x3xjDE
         lJs5KHhxzZfuEHBF361/Wk8Dsc6ROW1nh3+B4AZMpORWVg9mSqvDxS1NKOsQtNhseUNV
         y8tEBrD0VQ9rUl35I3JO2N5G3/oU3TZeUZDs47ZsaKmiGJUaXBSSKyynF+m4G9uUyTSy
         kqIg==
X-Gm-Message-State: AGi0PuaMp3KHs2TJzUEM8kv2cWs72coPJwYDVl2WbmUql7hExwD7ivpm
        IIuF8lCa1UMMBOqrpfhzYNy4sA==
X-Google-Smtp-Source: APiQypIxyHNKa0iKE7i1LVCf7LxJgykFFNIGEKKj5IapE5xxqMj1NRd3bFf0osSuuOi8WmOUMH0hcw==
X-Received: by 2002:a63:2686:: with SMTP id m128mr16210074pgm.283.1586983745414;
        Wed, 15 Apr 2020 13:49:05 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i13sm14461861pfa.113.2020.04.15.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:49:05 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] remoteproc: Simplify default name allocation
Date:   Wed, 15 Apr 2020 14:48:54 -0600
Message-Id: <20200415204858.2448-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In an effort to cleanup firmware name allocation, replace the
cumbersome mechanic used to allocate a default firmware name with
function kasprintf().

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4dee63f319ba..9899467fa1cf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1982,24 +1982,19 @@ static const struct device_type rproc_type = {
 static int rproc_alloc_firmware(struct rproc *rproc,
 				const char *name, const char *firmware)
 {
-	char *p, *template = "rproc-%s-fw";
-	int name_len;
+	char *p;
 
-	if (!firmware) {
+	if (!firmware)
 		/*
 		 * If the caller didn't pass in a firmware name then
 		 * construct a default name.
 		 */
-		name_len = strlen(name) + strlen(template) - 2 + 1;
-		p = kmalloc(name_len, GFP_KERNEL);
-		if (!p)
-			return -ENOMEM;
-		snprintf(p, name_len, template, name);
-	} else {
+		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
+	else
 		p = kstrdup(firmware, GFP_KERNEL);
-		if (!p)
-			return -ENOMEM;
-	}
+
+	if (!p)
+		return -ENOMEM;
 
 	rproc->firmware = p;
 
-- 
2.20.1

