Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371964DB44A
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Mar 2022 16:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350338AbiCPPKb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 16 Mar 2022 11:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355094AbiCPPKW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Mar 2022 11:10:22 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD4A673C2
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 08:09:05 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33C903F607
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647443344;
        bh=T7JLnH9mqiYxWSJ2Xi+hqpmFTONALX95DZP9Prs/CTQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=i2Xb9MhzTdE+lE9OaTOdm5lssR7LIHkhHZcQk+GxGLVjMfzP4q1EpOl3OmDLCn2Hs
         xU9kPLuL9sHGb7idnp2OtNcmSuB4xVMRzL3HzTHZdNW1ymEgq4viYGLlH0hz/iM2kF
         OUHlYcrpm53zPfWgiyUoaW6Zazou2yZE2B49ntkQLPLldE016K5wwGugtm6h2iFTWP
         IuRj79EG5Tb2kM6rxrh0JB9pk8XmeNKc7VUJQpofWCNT6Q3E+wN7lypAPutcjtoM2C
         vPsjUybK5SbgBJvpheJtVoNPys+5w99huk6JJGlK7Q5kLoDEsM/xD372DKnYJDkptG
         cyKm6ONJJSLhw==
Received: by mail-wr1-f72.google.com with SMTP id a5-20020adfc445000000b00203dcb13954so652658wrg.23
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T7JLnH9mqiYxWSJ2Xi+hqpmFTONALX95DZP9Prs/CTQ=;
        b=E83BNnRSLvlyYyEKAFHHq3lRNI3qb+YI4CvyvqBV4rRsNik4Jk2e4txeTSWdlTiSZ6
         +KXv69hWzBAVWifnmcxIUXxlsFIqP/zIRt6OAvtj487iK77P0uUnk2hFr4/fwadLjhlk
         cWr9pBApu6W7Xsv+b+OLgP+CurETN07IoH80ySwN6p3L2PQMigUECppkryh751yWD88H
         ktssLLFY1kMHvLFZmF2wVR7PmERiLqZ3NO4UcMg386AlWUqhrg6UzvMV4v+lz9+gK86D
         DRjXR4erm/helUxShSnUEpieqwRL+NGy0NkSGsSo/tKVi27jUtJYCNxriANLnGL0FVwO
         SsyQ==
X-Gm-Message-State: AOAM532dQ8H7HKejPBjtY1WwmjM9NCBegPjG/myJ1Y42bxH1PDx1DwmD
        ud704AmIIxitfhU9DFtOLFEmfQ3OtbJuSyFRbUh4wDsyO9VNj8eRvdRhaRG6xRJjrCAzj3haCHp
        d2hlQGdjTdGNWiH4yG4H47pabtCbFq/7tI1o7NTLuiV0sKI4=
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id 98-20020adf816b000000b002037faea245mr273628wrm.619.1647443343715;
        Wed, 16 Mar 2022 08:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiZS5X9++Ir6ARAdY07waJfT3FXmo4jW7vzpJuptfIiZFzTOsJAweK7fuoToT0HCAq1Xxe+Q==
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id 98-20020adf816b000000b002037faea245mr273589wrm.619.1647443343503;
        Wed, 16 Mar 2022 08:09:03 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:09:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 10/11] slimbus: qcom-ngd: Fix kfree() of static memory on setting driver_override
Date:   Wed, 16 Mar 2022 16:08:02 +0100
Message-Id: <20220316150803.421897-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0f29a08b4c09..0aa8408464ad 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1434,6 +1434,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 	const struct of_device_id *match;
 	struct device_node *node;
 	u32 id;
+	int ret;
 
 	match = of_match_node(qcom_slim_ngd_dt_match, parent->of_node);
 	data = match->data;
@@ -1455,7 +1456,17 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		}
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
-		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
+
+		ret = driver_set_override(&ngd->pdev->dev,
+					  &ngd->pdev->driver_override,
+					  QCOM_SLIM_NGD_DRV_NAME,
+					  strlen(QCOM_SLIM_NGD_DRV_NAME));
+		if (ret) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return ret;
+		}
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-- 
2.32.0

