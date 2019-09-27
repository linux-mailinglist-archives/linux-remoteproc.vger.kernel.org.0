Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64886BFFD0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 09:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfI0HLS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 03:11:18 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34078 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfI0HLS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 03:11:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so1029888pfa.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 00:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=FgzSnruuv7XNqxxD65EJ+AwZlRv0x29REgnPuXxLMeA=;
        b=WrhU2dyi93gFs4D+GbFw4lzLCuOSkkO5QsvfwR5+n6nP+AgAFlLabONZlVnlh1PNPC
         mlSiTWo6NZ3rzLkqubEFhiB4qFhzx8hgYOTuEZRdzwD2Ssoq3jCc9rh5J4d0pUs/Vojo
         ra6knN+QFYpr9LsbcUhNaKwIRm1IbfziceIPS1qk7Yt8QG+Y444uD5EHoCQGZFifG0N7
         61Y3F6doxu0gP+/SdEt1H9nHBf6LgoXt7jST1l1qRRfdXeyF6hcovCr7P12UbN3CUrsf
         injvUaBQp/zFbHxOnKMsh+tA8Vtsnwo5902kanTSvzDu05x+7MVABKWjkYwgAyQS3eJU
         bfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=FgzSnruuv7XNqxxD65EJ+AwZlRv0x29REgnPuXxLMeA=;
        b=iBO2QZGA4xVIUZQ8KHyGgMX4U5OHo7OqFeZupidanfCFe0saWEP4OzsaLi5kpZz1+E
         BWb1rrDOJGTIR+w0+d3KFJV/vxWNC6PuvwBIPFAJ+lcmLw5pbwJByQmqYI+KqpZdwIoU
         uI7hI7aG0hb3eT/NyLF04iAb+doKk4UBzI5ahYOSnjRTD4NSeQJNCjo6Lq7w3jYicqiW
         ilyO3fX/KbNkiOnXDap8Nm1feX73H6XEyZtjHWT/RQ7J+DKWH2pAI3P9uradh4b19KGf
         da152+UuPNT8U13C0COSLhJXQ2U82AIZQLI9qC0TwUSWxC/dhJUXEHPO0laCfzRXGX1H
         j3YQ==
X-Gm-Message-State: APjAAAXX8jGDshxsH+hj3WK3pLXriCr9hbW8I2wbA2PH+V7dzSAtnIPi
        tQqCd3TSL+XhTeCIXQyFp3Tu2w==
X-Google-Smtp-Source: APXvYqygS3OJTk4wBdVnOAShliAz6Ul346kFPpJ2oIYnl7YI5A5H+4Emlxq37Jj3K8vN/npKoMV6pw==
X-Received: by 2002:a63:461e:: with SMTP id t30mr7741315pga.141.1569568277748;
        Fri, 27 Sep 2019 00:11:17 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f74sm1733288pfa.34.2019.09.27.00.11.14
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 00:11:16 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] hwspinlock: sprd: Check the return value of clk_prepare_enable()
Date:   Fri, 27 Sep 2019 15:10:45 +0800
Message-Id: <b944d4a60b392fd9c72421a798281bf0134388ca.1569567749.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

We must check the return value of clk_prepare_enable() to make sure the
hardware spinlock controller can be enabled successfully, otherwise we
should return error.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 7a8534f..d210424 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -105,7 +105,9 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 		return PTR_ERR(sprd_hwlock->clk);
 	}
 
-	clk_prepare_enable(sprd_hwlock->clk);
+	ret = clk_prepare_enable(sprd_hwlock->clk);
+	if (ret)
+		return ret;
 
 	/* set the hwspinlock to record user id to identify subsystems */
 	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
-- 
1.7.9.5

