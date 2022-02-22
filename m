Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05CC94BF943
	for <lists+linux-remoteproc@lfdr.de>; Tue, 22 Feb 2022 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbiBVN3K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 22 Feb 2022 08:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiBVN3J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Feb 2022 08:29:09 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2B596838
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 05:28:44 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0D2D3FCAE
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536522;
        bh=bxf6nJLttPRsL7dBKXZgcCS/RsJRiJgMR1Ys1z/0BT0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=inPGJiFGhpmqpC1lplrkZmDrG4enItXj5xARB4lc5cdaeYCynhjHV2uOwA8PmECTy
         +p18O+fob5cZLtKcwYR5rkT35eF76SFdv5eeC3b+0QpiJFGGJdva3uMcBpI5pzJXut
         XR3oQR1k3OsUZzL10usZUAPNg4IdlM9iVm3K5096lfFrrjknmUjOtHlBfD+61UtmC7
         qR5tY01GVdFkcVaF/GJtQmL3SkJH9gEjIRuyNSbWhdUuk0ZDNnuLfU1+2ni/BpR71i
         f5/y3xmggk2fVxa9ZfH0oDnj0i9qPemKf9NkxtOmUV9HAV4pXPe8k/oIMl6caNXTPO
         Kbn9U5mt2m0xg==
Received: by mail-ed1-f70.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso11991908edh.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 05:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bxf6nJLttPRsL7dBKXZgcCS/RsJRiJgMR1Ys1z/0BT0=;
        b=yoGOQ6pU6I3KMCL44v6oMOPbOybqKHXckT+Avx3aL2/I0H8PcJ87sJuOjnUDVftBT9
         0/BnQ3Tbnl8ui+BAk/tPKnXAoxA+ZQyYuRnGuUMcFwQAcPLZv81qzh5DHrbTDJpXAgT7
         dGToM2tD/JxJ6LikjEkP/TXwy1EfZUflXLK1LVAkc2QMraQHRbO5yv4KuaWDpW68wQnx
         EODS+m7+pZEDyGX/hG/jTo2Q8hiuZ805SOFzaSYfrbUVviLbTkq70FZN+0j7191FXfR4
         9Td9rdyh6zBI87L04I5QCX5QKxwAfg1PzL+CEskZgSzrnDch+J4Q8Ptys+LYJ6oUtxCq
         ykpQ==
X-Gm-Message-State: AOAM533D2oCGVc618dufTbfo5j3+gUjS3uGQl981XLc8Rt1yNRfJ3l50
        KzqXD7Y+QWZ2kllpdfeT5I+IDQQnfvPrWCmT8OxWniabFLOEcMyAqNWG+7CmerJCtui9Nri5V58
        UKoJANwaBe0SBsPeVyAytDvxyuHzbN2LM0UIsAcutkT6BFZI=
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id q11-20020a170906a08b00b006cf65bce7demr19077968ejy.220.1645536521800;
        Tue, 22 Feb 2022 05:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUTH4XEfwD3KKh1b8myIZr/sth4y54qNnWupnWL+QunNk7jf61nPg0M2zH6cCPLQ41ESwuWQ==
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id q11-20020a170906a08b00b006cf65bce7demr19077951ejy.220.1645536521622;
        Tue, 22 Feb 2022 05:28:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org
Subject: [RFT PATCH 1/3] clk: imx: scu: fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:05 +0100
Message-Id: <20220222132707.266883-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver_override field from platform driver should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/imx/clk-scu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..78ed40a0e3e2 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,11 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	pdev->driver_override = kstrdup("imx-scu-clk", GFP_KERNEL);
+	if (!pdev->driver_override) {
+		platform_device_put(pdev);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

