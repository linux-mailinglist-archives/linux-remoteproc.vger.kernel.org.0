Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1000E2C5D52
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Nov 2020 22:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391640AbgKZVG6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Nov 2020 16:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391620AbgKZVG5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:57 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE01C0613D4
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:57 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so2639928pfn.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1P3NOdCqAdCJq/BOuunpYV7qT3SyZVIkKnqupYZ7/no=;
        b=LlMmf89n/RaE6fIA2xiG8wudKfbZ9qECYcET3zyzPcMVC2R3jZQWZ8m0OZny6TMBzE
         kr1HA8Fzoz8eoyA3AEFca6Eup4zYcinQuC0FVbLBt3KavqxuptgPUXctZPzVYzcJ5QMV
         DjmN76HZIt5NJC35aU+IModI+fjoutBo/SGE38ZlQ0LgVoJYfQf+N+15ZPUFcn33WMDG
         dJ0QBHxlk0yOv1VYcbHEBAAcQy+8xRtzb+78uszO1Al2bmeARNAUbMAYZ6e2vEFqI5oQ
         svfPdXVQzFEwrgoZ2Whpc/bTJ4+Oxf7x0w8rfRQ62uCBYm5/nsAa7blYl6bYiQTqJqYA
         CkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1P3NOdCqAdCJq/BOuunpYV7qT3SyZVIkKnqupYZ7/no=;
        b=IZBd6RSe5P2n/g1lC5VVdbE2kymyrmYpH+O8h5TUBbfAugFTrBtFP6jmxVFOn1zHu9
         1zdnbcleHC6PVZhDMjXzgksAH9LpSd4uHMdC/3hq1NsbAvSYBNfvlMNO1ce4HTT8Qb5G
         NmYYWUEuyeXHqTamsFPNwRUmwNm3w/YDcs445/Ms3B2fc3PfCamMlcYZx5KXEon333Bg
         vciwqBBmDn2VQn7JdkcJYF67DjyFafC6I97Ye/bTF6a7o9ndllzI3HIdgAgen1qwsVU2
         +Zvzkcy5TtcvQ+fIiCuUKaiqv6AiB1tTHQBFfKP9Mcl96XXgAFqoTI4ZwV9Fxg5MmaFg
         43Bg==
X-Gm-Message-State: AOAM533GVFMaizP5EayifWIEYfvRaQlSHqNdiG83D7PBlcjcrobmD1z1
        ncxcZEWYGpY2gJAuTeYBCpv4AQ==
X-Google-Smtp-Source: ABdhPJzlp4aXFdip8MwMPU2FTh/7dRG0pw1BC7ipYUjOvGyLn9HOurFQaI4MihAN3LrFK1KK67A2qw==
X-Received: by 2002:a17:90b:784:: with SMTP id l4mr5752881pjz.56.1606424817036;
        Thu, 26 Nov 2020 13:06:57 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:56 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 13/15] remoteproc: Properly deal with a start request when attached
Date:   Thu, 26 Nov 2020 14:06:40 -0700
Message-Id: <20201126210642.897302-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch takes into account scenarios where a remote processor
has been attached to when receiving a "start" command from sysfs.

As with the "running" case, the command can't be carried out if the
remote processor is already in operation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
 drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index d06f8d4919c7..61541bc7d26c 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -32,7 +32,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 		return -EFAULT;
 
 	if (!strncmp(cmd, "start", len)) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 3696f2ccc785..7d281cfe3e03 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -194,7 +194,8 @@ static ssize_t state_store(struct device *dev,
 	int ret = 0;
 
 	if (sysfs_streq(buf, "start")) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
-- 
2.25.1

