Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DFC33C13
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Jun 2019 01:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfFCXql (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 3 Jun 2019 19:46:41 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42975 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfFCXql (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Jun 2019 19:46:41 -0400
Received: by mail-qk1-f194.google.com with SMTP id b18so1653644qkc.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Jun 2019 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2dSjbafvPtEBGE038u8RdQI0AXPbouyyv6QWvEDjTY4=;
        b=VfMZSsd97RwqXPxfrt12O/z92Mnpp8cmSUH7mebChhDRFt0IzXolCVCXuUXRt44rOP
         j+Wjsqnb+frbp1TFCVczNQKJ9xwC2Q/HRkBcjCkK8hfKTFRl4pDu6cO/EtT7SwkTkXuF
         AoYGZDnNffq1Ofo3bIo3CSp9jCt0JLFXVC1HQF0sLRNRr/maCL+Zg4TSyGGlWYqBa/Wl
         ++0t6aE1/T3zF9yJxNhpUIy+QYD6cKPk08sk33YTmkbc8Nz7A/GqgVjhbCFWdSDt98LO
         lzXrJj6zmCrEWvAcoTa0wMQRxF+CMiXQgT56yARSrderlUasL4RCeVi31J8N+ND/G5Ee
         anLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2dSjbafvPtEBGE038u8RdQI0AXPbouyyv6QWvEDjTY4=;
        b=bkhO15nYyqWx2JP/q8yn9Bkv25uX0m2DjzmenkRPdLi26w8MRN/sn0j0Ott8G10lwM
         ztElGxknemyOc+rkHT5WXOIQ49DbAsX9seOWDo856JCs+kcEaDULd0prQbFuXrDoVXXb
         ZHMrZfm03lVR6PiidhoWZlm2nXB+02HKyGTpZwcyLQONsxCMsAUJK3xmWBjvCb7e8/QV
         uAqJ6jO0Vdg0SaVx4UdHAKo7/Xs2keYD67npkTrUffk4bPrw6e15dv/pAvYJO0lW8gUM
         nHSOeETPXsCYtWGBpznAxB04WdsI8VbG7Cu+ta0kMcJcQQvV2rGDyRIipQYKVgt+P21R
         rQxQ==
X-Gm-Message-State: APjAAAUWQgqlLjjtCiq/2HXhTlZwEmj7WoM1D1Qgs0xFDAzzWhcEXioh
        oi+ZztaVDa4ib0nF5OqCpxY=
X-Google-Smtp-Source: APXvYqy7NPZ4haH/Ns495GxUUCg5BqTH4DBArm+KFZIbKOuAUzdphiEOBTTDlIp0iaCZ+r6TlMw9vw==
X-Received: by 2002:a05:620a:3da:: with SMTP id r26mr7289719qkm.279.1559605599914;
        Mon, 03 Jun 2019 16:46:39 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8::2])
        by smtp.gmail.com with ESMTPSA id l40sm2487175qtc.51.2019.06.03.16.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 16:46:39 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, o.rempel@pengutronix.de,
        linux-remoteproc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] remoteproc: imx: Fix typo in "failed"
Date:   Mon,  3 Jun 2019 20:46:28 -0300
Message-Id: <20190603234628.10924-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603234628.10924-1-festevam@gmail.com>
References: <20190603234628.10924-1-festevam@gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There are several places where "failed" is spelled incorrectly.

Fix them all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/remoteproc/imx_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 54c07fd3f204..7e0804c72677 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -168,7 +168,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_start);
 	if (ret)
-		dev_err(dev, "Filed to enable M4!\n");
+		dev_err(dev, "Failed to enable M4!\n");
 
 	return ret;
 }
@@ -183,7 +183,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_stop);
 	if (ret)
-		dev_err(dev, "Filed to stop M4!\n");
+		dev_err(dev, "Failed to stop M4!\n");
 
 	return ret;
 }
@@ -206,7 +206,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 		}
 	}
 
-	dev_warn(priv->dev, "Translation filed: da = 0x%llx len = 0x%x\n",
+	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
 		 da, len);
 	return -ENOENT;
 }
@@ -352,7 +352,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
-		dev_err(dev, "filed on imx_rproc_addr_init\n");
+		dev_err(dev, "failed on imx_rproc_addr_init\n");
 		goto err_put_rproc;
 	}
 
-- 
2.17.1

