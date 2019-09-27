Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E89F1BFFCE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 09:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfI0HLP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 03:11:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33176 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfI0HLO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 03:11:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id i30so2995989pgl.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=v4CYbDgI+ZExVL7Ey3SHDVJYdquQ6nNneks9sNV/1zM=;
        b=fGAQuYaUuJS0onXta9DcP5iWkDlCdRyhW6e05Srzg1F77NNnN1B8+yp3U3Ne3I2eke
         3VznwdYIPtImlztVmwSxvWqx0oVEZ9/fik0CGbbk7JzqXeuS0/aJRlseVEL9V38qbbgr
         hI7W36dxeFE5xEkU74/b9n1KW+FHDOsMtcCv9vBKX7SWKSQsFd/pJzb0S6bPJ7Jko5Ke
         F+S+yrbazWCAk2was1TAONqtYf3BZ2Y10J+z2iUDT8FfzKv6D4lyXuVCDlRDkN65qUBi
         yHFTJpHRHShe2hjBe+uLONkIhf/yP2V2Eequ5BmO+hyexkwSQd22M6KtsRzI7ehL6PQQ
         ZmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=v4CYbDgI+ZExVL7Ey3SHDVJYdquQ6nNneks9sNV/1zM=;
        b=cySrifeaRWfMsSSVcTYme+sOtFjULDlIvdQQZkcvznltq2AGxKKBO0UK6fJRX3rGl3
         o3fi2WT3WcTR130HPBx28Uw9d8fi7ivlyw2jIz35G65Ft5+Hs8dXy+jtOGenS07bzf8H
         8qEmgggOXrfIi9uAqz6VsIcB35G2CjzW3Ct99XaQFzdIfNn4U5x3KF5b+w5esAHlJHCn
         AArPD8mFDRfK+ejl7Bwz2pWN9jWtwamPDK0Ci4oLqXG/VNZQhV7ClptXODZDR7L8kl9f
         OGco+Yu2ebxFc2XLNxGh1VDXm1RRlyYA2xKawmdPc/4edPxw7iCsg3iS2IjLp0pNzNtn
         b07g==
X-Gm-Message-State: APjAAAV09ZGxj4HUz4ova1XnDyFsPHLGBDXDP40YPfkekGDASWAIxeeo
        YxNF/oqvvOz4DCMWiNFW9KFHEA==
X-Google-Smtp-Source: APXvYqyjLyv0T6+Soc8rfhuCL36fszrICz2GNTzWHVICEtG9+dfgEtnvtmGxPXAFCsekAXIAbgksJw==
X-Received: by 2002:a17:90b:8d1:: with SMTP id ds17mr8096278pjb.105.1569568274050;
        Fri, 27 Sep 2019 00:11:14 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f74sm1733288pfa.34.2019.09.27.00.11.11
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 00:11:13 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] hwspinlock: sprd: Change to use devm_platform_ioremap_resource()
Date:   Fri, 27 Sep 2019 15:10:44 +0800
Message-Id: <00916cd2409a5607fc4023a4cae351f1b2e84d8a.1569567749.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index dc42bf5..7a8534f 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -83,7 +83,6 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
 	struct hwspinlock *lock;
-	struct resource *res;
 	int i, ret;
 
 	if (!pdev->dev.of_node)
@@ -96,8 +95,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	if (!sprd_hwlock)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sprd_hwlock->base = devm_ioremap_resource(&pdev->dev, res);
+	sprd_hwlock->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sprd_hwlock->base))
 		return PTR_ERR(sprd_hwlock->base);
 
-- 
1.7.9.5

