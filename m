Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067064D6F16
	for <lists+linux-remoteproc@lfdr.de>; Sat, 12 Mar 2022 14:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiCLNa7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 12 Mar 2022 08:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiCLNax (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 08:30:53 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420F4E3393
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:45 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C04CB3F366
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647091783;
        bh=wjZwot9f8/6VteNlj7+yTRpLXeLfeCZvZ3XmJn6m/ng=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=oK5qu66csdcGNegeXhUi8uXWfPPgRSEcFe8PoVRa5oKiA5ngbZJQVwjrwxyL1EDGB
         qqNa4U7GR4eAD2FSS6s8r4r+zlZV3Sz7zFzdnyLMetnb54GLEfi0DqedhY5lUXnieG
         6naCc5w7nLgZnSrsz00A4qckSxgwAVivgzIDnWlbvA2DqNIxXnA2KLpCeQBzQTeeuV
         GhvJLiD9DqpQ9Lq9cnMdPYXihL9KEA6XtiCSwXnOuEaBFWScTGNPF5GCQy6aFzhqLg
         W0cnn+xwenNw7JrbAQBL6Y/cCIx0qrqU62lEt4gRGo47UYCA6WZHzrnTWTKq857rDg
         caK6f/UCW3GSA==
Received: by mail-wm1-f71.google.com with SMTP id c126-20020a1c3584000000b00380dee8a62cso3514297wma.8
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wjZwot9f8/6VteNlj7+yTRpLXeLfeCZvZ3XmJn6m/ng=;
        b=woLNOxqPlZ3FH5vDCoxEALIyJEHpbmbCZD+cD+LK0ywQYKS7bylKaxoflTVLpHt67l
         Pj/npFhBw36fJ5mi4HhPIXIKCawf5GlCICn8R4hPHwQUbeBQQNw/IbWVvhwZlH1C21qy
         P0YWkJ7l8DnWc2gHQOc/7bXmBKUtPnqgd7zBnkal8ugR36GPgTYPYIrCs0vXI+r9mFQ3
         7pFXbVYj5/OvKU7xewb9n0mP7XrAquEIF6kxKD1CuZ6Ip31DgEACFMGvW429KaK0JXnd
         RMRLV1vhG1WwyF04VspGGWvoM5OlTUYYWwuMDnUDwwvIawmWyVH3TikTQ62ArtRzzspo
         mMCQ==
X-Gm-Message-State: AOAM530fA3yjQpA0L3NY1/jFbNMSdROtLw9FuYaAI2LQTCbqqG4160ai
        OpFeD8NlQdjhD2ynhudPmLobwrmWCxqjDyuIyMmGDhbPiyzFB0wZq41gqwxCtGBZCoAj0QlwKpd
        C6Zd7YwGR4Chdvv3y7aZg/FoBXpSRegBSbCs+J9RH159fqrA=
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id bk9-20020a0560001d8900b001edb6d5cbdamr10364651wrb.514.1647091772816;
        Sat, 12 Mar 2022 05:29:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyelFNDw+KjZ7SCVNW/uSQN6y5Cx82RSy4B7GdAXYbkw1fNE1IGPsgLOaQGJqZ3rrBpRaBuDg==
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id bk9-20020a0560001d8900b001edb6d5cbdamr10364629wrb.514.1647091772632;
        Sat, 12 Mar 2022 05:29:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 05:29:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
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
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org
Subject: [PATCH v4 10/11] slimbus: qcom-ngd: Fix kfree() of static memory on setting driver_override
Date:   Sat, 12 Mar 2022 14:28:55 +0100
Message-Id: <20220312132856.65163-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
index 7040293c2ee8..e5d9fdb81eb0 100644
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

