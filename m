Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685644C5B8D
	for <lists+linux-remoteproc@lfdr.de>; Sun, 27 Feb 2022 14:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiB0Nxj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 27 Feb 2022 08:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbiB0Nxf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Feb 2022 08:53:35 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D0513F0F
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:52 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D51B740296
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645969969;
        bh=pRyoy0wYqVh1vMWkfgiwvfL+uC0PF+MUz+uOlTyWlM0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=VtSqodw296hHzS5Le9GXIUsO7GrmUwkFqj3exMhPtVmV2PH047f2xOl1p9qT9S5e7
         yqhX0ft2Bon6HHKCotL7GaQKyEQ6T5KaCLoefMTOo3J5LEIEsYmdcAmAJMh2yaFLng
         xeXC2UY5JC3Q+iF1qNLEskBDa+wdKta6w1xYGpvefmmrHjBbjF/RiXsWvNqEMOM3d3
         /CR5GmOJiBnPLqWvF4g37HBJCbR8esAAhV8L9KON1yk+dRXpqHMbi+fJTr/zPycn0N
         D+SoBsKAnZAuGiv1n0lZmi5TZaDzlsexwP03nUf5YqEHnSvs9iydM8rhRWnY5zNN8Z
         FBi4bLw7tRBRQ==
Received: by mail-lj1-f199.google.com with SMTP id v5-20020a2ea605000000b00246322afc8cso4466932ljp.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pRyoy0wYqVh1vMWkfgiwvfL+uC0PF+MUz+uOlTyWlM0=;
        b=ylrUs0cgpU6P9QwL2icTM+UnUcMOwYXx2dzzxKVhoyvyAL/SmksQO6qXP+VMCdmY+g
         Svl8CjsaR+LcgXRAuLwVVXfx3PGkyu1kur47BBjk0ismlcgZEWMM4XRBUW6Is2tPzOEy
         9PCeupG3iqE434R15nfFlgiUvoxLa9Z6NuQnCLwfEA/V3mny7WzKX6JwmWijUzXzb0l7
         2ZW36a1iWk0LVVU+zI7Qmn/0dChQe3IYqMAbedIQlRaO3O4bqp2R4gQrThX+hYatenE+
         kwRZY2uwzh8UvrOfWjipO3W8QMebObHxS80AVkJ22gbDUkKB4eY0WvX1wAZEEZfM+A6C
         HsLA==
X-Gm-Message-State: AOAM532bhNTetvrApeuA98eWfZyO1uJaV0Elf4I/8XZobnyFpN70YSkw
        63s1SAFtEFTRHfHCSk8LXToYTi2HEUjF+8NEYDu+Xe/17tWG0igXF1OxQMY0QebSvCvsALmli8+
        j4m9O4NrjiFGfO2Di2/KHPa97dN1GJ8IFjf9L1tcMqzIvf3I=
X-Received: by 2002:a05:6402:1a55:b0:410:a4b4:2a9d with SMTP id bf21-20020a0564021a5500b00410a4b42a9dmr15356221edb.45.1645969957664;
        Sun, 27 Feb 2022 05:52:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMCUVqX+GQTf3SH7q4WKAqDIKbuRWwlLyTqLEz2lVHwA8GB9LJKefEiix56LpqtlrzGflkbw==
X-Received: by 2002:a05:6402:1a55:b0:410:a4b4:2a9d with SMTP id bf21-20020a0564021a5500b00410a4b42a9dmr15356182edb.45.1645969957475;
        Sun, 27 Feb 2022 05:52:37 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:52:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
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
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 04/11] hv: Use driver_set_override() instead of open-coding
Date:   Sun, 27 Feb 2022 14:52:07 +0100
Message-Id: <20220227135214.145599-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use a helper for seting driver_override to reduce amount of duplicated
code. Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/hv/vmbus_drv.c | 28 ++++------------------------
 include/linux/hyperv.h |  7 ++++++-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 12a2b37e87f3..a0ff4139c3d2 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -575,31 +575,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct hv_device *hv_dev = device_to_hv_device(dev);
-	char *driver_override, *old, *cp;
-
-	/* We need to keep extra room for a newline */
-	if (count >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	device_lock(dev);
-	old = hv_dev->driver_override;
-	if (strlen(driver_override)) {
-		hv_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		hv_dev->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &hv_dev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index fe2e0179ed51..beea11874be2 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1257,7 +1257,12 @@ struct hv_device {
 	u16 device_id;
 
 	struct device device;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 
 	struct vmbus_channel *channel;
 	struct kset	     *channels_kset;
-- 
2.32.0

