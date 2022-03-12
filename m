Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C164D6EEA
	for <lists+linux-remoteproc@lfdr.de>; Sat, 12 Mar 2022 14:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiCLNaf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 12 Mar 2022 08:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiCLNac (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 08:30:32 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB79D4CD64
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:26 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1CEA34003E
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647091762;
        bh=Fv0wjNs2b5QtUq9euXNEr2b5kaqy1J/ffW8/38DamY4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=mPjUjCr/sXPduunZA5U1ieudS6S3bu8S9hQfHnJGzWaj9tJYu0BaUTICc1nB35jaH
         SrOkRVIeVBSxgNrGbbJFUOL6BJnAkhNgPocUErpBhHMw5v32hhlBBa+ZwhWz7b/DXi
         OjE84IApfO11JU/z9H8ORTSLZt/SCnl5yl43OkkwguAtP0fHmuqOliL6pYxD352FZN
         9IGjNRw0vmC2WELNmxSg3Ct0eg1be9pUk/QAn0hOPTydDRciU+vlhaSPx1jmKERIww
         JiqSOrhU/MvFazxC1h/xJ/CBsI48oNb1Z9EilYhWQaT1vIEnAeUKCPW5jFdaUz9o3p
         oocdXDFgUOyaA==
Received: by mail-wm1-f70.google.com with SMTP id h206-20020a1c21d7000000b003552c13626cso6906608wmh.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fv0wjNs2b5QtUq9euXNEr2b5kaqy1J/ffW8/38DamY4=;
        b=1wNWFvccUVf9X0rGukEOmPRyz/ucH46P1/iR5YcKb2QMNHv0Ipi6Q4vbuxD0rDDUmj
         cENWZP5k17RButsqewkZBqqbgxWYg2GCRfY4j2Q5LikQVBWxq9LLwGS1ppk0t2VagC2t
         7vS1BVT+anK9mECWVHOSAGXhTQKOniockvj9Ui4ntiCGu06/88sXypawxkB4GcXIRYtN
         gWOYaXymb8qTOsgfVjkFH9SxHoNdPdkBO2LRRLfDR4ov7gib34Jt2UfPDssj0qZi5mdr
         z/XBbvqHRYT0OdFR1F4YvPvlrTAwsPeQgKZ1E451VeH5TqtKcYsa8UP4HHSy40jsVDTP
         zODA==
X-Gm-Message-State: AOAM530NuGZbn94ES2FQ/EQFmKOl/4Hr5ZZ1jHmgccUhhX0G7JVazptK
        akYawZV+tkISVXII1uMJ8u/E5PdK3zHE5yf4wcu4IuYfDuFX6pvbjw1ChsAWpbIrBzzNB+KDdTX
        GtrQQTMWy85cbkNJ6PJCHYnqR3AxF3Vq0EmLdBd5b6p3Bg4s=
X-Received: by 2002:a5d:458b:0:b0:1f1:f876:48e2 with SMTP id p11-20020a5d458b000000b001f1f87648e2mr10681298wrq.76.1647091760272;
        Sat, 12 Mar 2022 05:29:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDBzysSy5dJPpClWLlHuYPvBegFX8iikOsVYCIkiLzfLC7xpzwCpZjF6/7zZtW5qI29WBIOg==
X-Received: by 2002:a5d:458b:0:b0:1f1:f876:48e2 with SMTP id p11-20020a5d458b000000b001f1f87648e2mr10681251wrq.76.1647091760021;
        Sat, 12 Mar 2022 05:29:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 05:29:19 -0800 (PST)
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
        Michael Kelley <mikelley@microsoft.com>
Subject: [PATCH v4 04/11] hv: Use driver_set_override() instead of open-coding
Date:   Sat, 12 Mar 2022 14:28:49 +0100
Message-Id: <20220312132856.65163-5-krzysztof.kozlowski@canonical.com>
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

Use a helper to set driver_override to reduce amount of duplicated code.
Make the driver_override field const char, because it is not modified by
the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/hv/vmbus_drv.c | 28 ++++------------------------
 include/linux/hyperv.h |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 60ee8b329f9e..66213ce5579d 100644
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
index fe2e0179ed51..12e2336b23b7 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1257,7 +1257,11 @@ struct hv_device {
 	u16 device_id;
 
 	struct device device;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 
 	struct vmbus_channel *channel;
 	struct kset	     *channels_kset;
-- 
2.32.0

