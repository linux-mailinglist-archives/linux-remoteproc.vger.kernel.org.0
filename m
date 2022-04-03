Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6C04F0C28
	for <lists+linux-remoteproc@lfdr.de>; Sun,  3 Apr 2022 20:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376300AbiDCSlf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 3 Apr 2022 14:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376262AbiDCSlO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 3 Apr 2022 14:41:14 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8F412AB7
        for <linux-remoteproc@vger.kernel.org>; Sun,  3 Apr 2022 11:38:34 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u16so11428310wru.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 03 Apr 2022 11:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MZB4AAiYpghp+j0HlvXqcm6S1oaOh86fqoD06sTrQvg=;
        b=kQuFtN1ZJ7ZEWNRiYUTzh4L+FIyF2IAzdImkdOzevIE5eiZGdn+q3FmReheaQqVDJw
         RskYuVoBzzQ6cYTz5auNikNGSNT7g2fh8d8+oViTwXZxppZ5YQYKGht/zN9zBCRcL02E
         Xm+/QT3ElgFG38vFFRgHTSvJU9bPYGfYW4WgdLmDCkgrhbn69muqQabUVjTEdPkdeV8k
         opstQvC0WN5quf+I8FeG2fNS4A2gmCh4D1RdmllqzfnGn7vdJZ3yheVSM/EaXuPEj9Vc
         2fvCQmg7oO6EkJmNRgXmdRFFjq7jHRIoBMc3kPYgrbpi1W67+iVi6RBE3Qwoc0qLLSWK
         Xisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MZB4AAiYpghp+j0HlvXqcm6S1oaOh86fqoD06sTrQvg=;
        b=8O+hIFHY3cjBfM3k6kuVSbE7tZl/p40crBdi07ic70HFutv9uwLK+rjPE5Icj/0Z6J
         tt8ci3n/swdwXMrWZuvLKjNoI242aDkPw2B3N7T0hjrm99hTNxFVzUniqIsOVmJc0X5Q
         x+qMJDwdgKRFHRxgL/5Z0xQUtAseJovximRAY1eQd/T2B5YB204p2NirT8cz0tsMBmLu
         7i3BB5c1Tlo+PgOEfS4wgDDkKtoHlvsIOhyJaGuUAM2rO6T7PBtH7H2ppJovn5DCMCFE
         MqetLlfXy0gs7ojwey1BsUv99LNhvuX8k7LqKblGmI4U3WZNkAMceXzIPET+RTc1JPLp
         OB5w==
X-Gm-Message-State: AOAM532kr4zJUEceHJPC1ms7MvTQSygfXVtiK/6P1julFP5uo54G8XVs
        dxCTuwrJWxBbR+e0sEufVxqpNg==
X-Google-Smtp-Source: ABdhPJyXLIonD8xJ04Ht+ZUS+MlZjOb0BB8xnHg1SPUSIK9rnAYM+w0VRFN1jjXeVcx09AL7w4RlJA==
X-Received: by 2002:a5d:5953:0:b0:206:b5c:dfe8 with SMTP id e19-20020a5d5953000000b002060b5cdfe8mr4209687wri.35.1649011112553;
        Sun, 03 Apr 2022 11:38:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l28-20020a05600c1d1c00b0038e72a95ec4sm593851wms.13.2022.04.03.11.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 11:38:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 11/12] rpmsg: Constify local variable in field store macro
Date:   Sun,  3 Apr 2022 20:37:57 +0200
Message-Id: <20220403183758.192236-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
References: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Memory pointed by variable 'old' in field store macro is not modified,
so it can be made a pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 79368a957d89..95fc283f6af7 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -400,7 +400,8 @@ field##_store(struct device *dev, struct device_attribute *attr,	\
 	      const char *buf, size_t sz)				\
 {									\
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
-	char *new, *old;						\
+	const char *old;						\
+	char *new;							\
 									\
 	new = kstrndup(buf, sz, GFP_KERNEL);				\
 	if (!new)							\
-- 
2.32.0

