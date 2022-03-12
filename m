Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92144D6F24
	for <lists+linux-remoteproc@lfdr.de>; Sat, 12 Mar 2022 14:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiCLNar (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 12 Mar 2022 08:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiCLNag (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 08:30:36 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D226EB2A
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:29 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CFE2C3F79D
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647091767;
        bh=Z+Z1CBBLpVo7KqzVCsMaZv4r7Tw7oQzghpWsDjTy8tg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=v/mQMmxKbbrXG5pNNwGR/zTSn5u2d9dmcOTwKIeUAdtqFy0u5QjfrvHaLdIsqP82v
         5GCK5p6u6fXVcpD+Yg121mC0TCd8wgbrV2NfTyH73NnMyxyPTEuxt2sbQyxfBlpmSb
         ev8NvDYr4zvDERgtQ+DKOO+dFUzSVffIYsjk2Wb2xQNcdiK0y2P+95eK4ExrCKGCPF
         Y7EQ/7h1mn4NMLnrxuhQCW0w3MZc65gUN1mpte3bzLrnU5S9Y2/L3G9JJX08eYBayw
         mLIbiWRsjeAZfdHUT9xf8ypC5VDoFjmOV35VMCxLL62vmsBqtpD9PIjJ+RToKNGxsl
         aXgVb/tfA2GOw==
Received: by mail-wm1-f71.google.com with SMTP id q189-20020a1c43c6000000b003898de01de4so1318267wma.7
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 05:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+Z1CBBLpVo7KqzVCsMaZv4r7Tw7oQzghpWsDjTy8tg=;
        b=5mgJzJb/ps/dNcn4TtWE9vIrW3chHXzxJ9BbOfHsnpu7STTFDeAUWzXWCb3mN0Kabx
         gIHWEtUttxUt1lGudUU2IbbOj8ifldffhkUhNCfvBiPgl0GfVUVIZD4jYuEuFUC0PPa2
         ZcM+KCnOCTZlDVd16BQboZDf6HhVFfmP198xWeM22KzNC+jKoVBuxagsL2fn+FoSewTo
         h0ylAjcpKhpidtR7cecGyMQlSQciUtG8XYwHN8jcTLrxIekUJeopP9dwlBPVZnZEMFF2
         ajzx+o2LRStpxH/ijePGbzckXZ+TqK8qcSH3jnXnvbPgI7izjaE7tDh1Pwuu3uQTgd1A
         O1EQ==
X-Gm-Message-State: AOAM533CJQRAzMio89Ez2Oqn3l21Zr7KqhOYWsfdiQMEsk40LG0Oeile
        Yg1bkgplCvCZ7ecSxRtgjs/7fkA9DoXExyhmT8U6NhkRslkBpGl8UhkAma1Sngm7TR9fibZ2TQw
        ZBshg9EbRP+PQNsPXZnW08fBQFZsuew99pJoWE//e/9XO0R0=
X-Received: by 2002:a05:6000:1a8e:b0:202:8714:d312 with SMTP id f14-20020a0560001a8e00b002028714d312mr10815817wry.683.1647091763726;
        Sat, 12 Mar 2022 05:29:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjYZfFJ+GUQwy/f/MdbbiQp6L99Sn+ofXO+Q8l7XBFVGS1E/0dNsBqx+eOeH3/7jrINWLOsQ==
X-Received: by 2002:a05:6000:1a8e:b0:202:8714:d312 with SMTP id f14-20020a0560001a8e00b002028714d312mr10815805wry.683.1647091763553;
        Sat, 12 Mar 2022 05:29:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 05:29:23 -0800 (PST)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 06/11] s390/cio: Use driver_set_override() instead of open-coding
Date:   Sat, 12 Mar 2022 14:28:51 +0100
Message-Id: <20220312132856.65163-7-krzysztof.kozlowski@canonical.com>
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
Acked-by: Vineeth Vijayan <vneethv@linux.ibm.com>
---
 drivers/s390/cio/cio.h |  6 +++++-
 drivers/s390/cio/css.c | 28 ++++------------------------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c645..fa8df50bb49e 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,7 +103,11 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 } __attribute__ ((aligned(8)));
 
 DECLARE_PER_CPU_ALIGNED(struct irb, cio_irb);
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index fa8293335077..913b6ddd040b 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -338,31 +338,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct subchannel *sch = to_subchannel(dev);
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
-	old = sch->driver_override;
-	if (strlen(driver_override)) {
-		sch->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		sch->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &sch->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

