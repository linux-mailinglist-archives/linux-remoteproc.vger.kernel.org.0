Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1C6C011C
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfI0I2K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 04:28:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42417 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfI0I2K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 04:28:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id e5so782137pls.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=kup3jsm2T4Dp1CMpcneLGkz+TmvPB+cIre+Bt8N3oes=;
        b=rpICZtHUVuixBVO9d63gc3dXlVxb5YYThUJCocG9ApQJYbNo/LxFKtQU5BHzYCzDwc
         wCoL5g5ttpMFs/gbhX3z9ojugOa2fWlQFa7Rd0LuJWQlT+IQe4lH4qxsWUOIMVSwqUXT
         uTT4JjV0ZBtr/GFzstQh90Zi5rpxlUijH+SZbUin3I289fbhcDde8eQaG1MamGu5F0NA
         wl2mgKMeTLY+dmDZmccS56NY/VpJT6knhUULKFmcsBQ6XqF6r8Wdez3brkUpGhmQgTpU
         HxHA3lwnbreMfHFCPN3M+6mSIcAEFwH/l6t4MELLMgZMOTXY+TMC3qRQLibaDWs44W2H
         c71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=kup3jsm2T4Dp1CMpcneLGkz+TmvPB+cIre+Bt8N3oes=;
        b=Vjkz9Fg6mCgsQFH5kx5yQwGL6AVpE8G0VRMNbNoNsOCQRg5dkTjWnGVn9ijo9zpPe4
         RgUzRRrG0GvvERCL6NzoX11G4C8Js90XNEZ2riEUC5SerN8zhtyt+3Eraui9H36MorFE
         UwYJ44x+WL3ftNoeP2Co8H5km/8mp5dSVBAgwYmMsES7Eq8K1ByYmne1zUWdKuXTNuLJ
         nxVYq9g8nosD02YoxvbxwkY5eLM7Qux6rG+SkfzKHY/XcBmLo+X+wGQk9SxK38jva5Wy
         Dz5tKqrL6foo9x5zrDv9eT+lnImm7M5+mzvQCoT7YS6Jl0RvA+s5T4LUOXwkjlufqnhy
         2ujA==
X-Gm-Message-State: APjAAAVAj8uvxc1lNQe/w3iFpzu4tkuyHZukiS75CtfxIvFDqPqMrz68
        UHTthH4f+zy+GYm2Yrw5cZsacQ==
X-Google-Smtp-Source: APXvYqwYq8FcmeV1WLMy2kTsH58CPZftMErROYm+5CSFzop11lr8v6sNzDkPXayoOGA7AOSxCrihcQ==
X-Received: by 2002:a17:902:a985:: with SMTP id bh5mr3242251plb.107.1569572889229;
        Fri, 27 Sep 2019 01:28:09 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 6sm2043521pfa.162.2019.09.27.01.28.06
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 01:28:08 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     linus.walleij@linaro.org, ohad@wizery.com,
        bjorn.andersson@linaro.org
Cc:     baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwspinlock: u8500_hsem: Change to use devm_platform_ioremap_resource()
Date:   Fri, 27 Sep 2019 16:27:41 +0800
Message-Id: <e991666ead56cac30a7ef9cec85e802b57d47458.1569572448.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 572ca79..c247a87 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -88,7 +88,6 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	struct hwspinlock_pdata *pdata = pdev->dev.platform_data;
 	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
-	struct resource *res;
 	void __iomem *io_base;
 	int i, ret, num_locks = U8500_MAX_SEMAPHORE;
 	ulong val;
@@ -96,13 +95,9 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	io_base = ioremap(res->start, resource_size(res));
-	if (!io_base)
-		return -ENOMEM;
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
 
 	/* make sure protocol 1 is selected */
 	val = readl(io_base + HSEM_CTRL_REG);
@@ -112,10 +107,8 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
 	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
-	if (!bank) {
-		ret = -ENOMEM;
-		goto iounmap_base;
-	}
+	if (!bank)
+		return -ENOMEM;
 
 	platform_set_drvdata(pdev, bank);
 
@@ -135,8 +128,6 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 reg_fail:
 	pm_runtime_disable(&pdev->dev);
 	kfree(bank);
-iounmap_base:
-	iounmap(io_base);
 	return ret;
 }
 
@@ -156,7 +147,6 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-	iounmap(io_base);
 	kfree(bank);
 
 	return 0;
-- 
1.7.9.5

