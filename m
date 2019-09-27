Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20E85C0120
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 10:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfI0I2U (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 04:28:20 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43935 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfI0I2R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 04:28:17 -0400
Received: by mail-pl1-f194.google.com with SMTP id f21so780031plj.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=nZvAywOUGdc+nGEJgKwNfZF/qVh73K5ZWBaGt6yR3wY=;
        b=g9A2VhoKoQRJQ8A/yxKiLRnba6H4pummdVWULOO9J5NHWXt5KisX96YWWyo1QvzxPp
         UpeqQbf4GpP1ehd/+rQcixZniIXYm0qCyx8tAhvNGMt0HWYdpt458yK1U/fA4F/3DGHM
         MK7AS60vGn54vJKXzjidUoX6MaIA/acYx5Ya8Z92bH0isTldnqytXSrSDm9imHmGX8jh
         L3tAvsTKvYHO8gQ6Zz3FnkS5FHWMEDWed+eScwvqYi6KPhlzIpSrcK1RumZRNOyPp9FY
         TyCty9tp9SwH+sJMcYKdKFs67f6yoEWcBjY7w0R4WgDjpkljQ801OL58ghqXXr2jcebj
         mOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=nZvAywOUGdc+nGEJgKwNfZF/qVh73K5ZWBaGt6yR3wY=;
        b=to6DkNhOXZxrnubonUOeO8Hd30MUmQBHRh9o3WhYNjsFqXAiSfK8POp//NvtacwQvc
         t8nhdNJFyLfeqC2qoi1fyR+J+a8oOdDj+TFHtejV1oEm3Aan8dc7OuLl7KR+3rz9l6aO
         wQf/ov7EdTMewtuDqqhU7bDtrYuAGD0eDwBZgPONh1/EK4lyeBVvXT7msp+Z6WsFCYVH
         NJjiPxc4ePQ1lrIGhl4WBBc5IAVbi1YFlXIzPlH3QaYYLguTVyOyY2+XPk15pSS/JnkF
         RUk0alUkCWEofz5dYnAhXqboPZLojPVgQ/lAsxyl/y2cOwqmgxsJhMk6whnQ8PHp6mOq
         xNfA==
X-Gm-Message-State: APjAAAU9Vlc/PygOTpg9R9glcwbuZ4wakIyhLSykIoqwqKL9PgsUVNRp
        ir0kw2ywh2sF2q8lHDVLkieBYgp8LmijzA==
X-Google-Smtp-Source: APXvYqxYsH15T/gDxZi0i3gJliAlf/e2oUvzKKDi12hmwme2MB2Wn3J+nY/EfRcajagLVlzVyg9RuQ==
X-Received: by 2002:a17:902:b20a:: with SMTP id t10mr3218500plr.277.1569572895591;
        Fri, 27 Sep 2019 01:28:15 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 6sm2043521pfa.162.2019.09.27.01.28.12
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 01:28:14 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     linus.walleij@linaro.org, ohad@wizery.com,
        bjorn.andersson@linaro.org
Cc:     baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Fri, 27 Sep 2019 16:27:43 +0800
Message-Id: <a6b18f17b995bceaf2fc0129866301dd8f46bee4.1569572448.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 0e8d4ff..b31141a 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -119,8 +119,8 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	/* no pm needed for HSem but required to comply with hwspilock core */
 	pm_runtime_enable(&pdev->dev);
 
-	ret = hwspin_lock_register(bank, &pdev->dev, &u8500_hwspinlock_ops,
-						pdata->base_id, num_locks);
+	ret = devm_hwspin_lock_register(&pdev->dev, bank, &u8500_hwspinlock_ops,
+					pdata->base_id, num_locks);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
 		return ret;
@@ -133,17 +133,10 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
 	void __iomem *io_base = bank->lock[0].priv - HSEM_REGISTER_OFFSET;
-	int ret;
 
 	/* clear all interrupts */
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
-	ret = hwspin_lock_unregister(bank);
-	if (ret) {
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
-
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
1.7.9.5

