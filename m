Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A2733C12
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Jun 2019 01:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfFCXqi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 3 Jun 2019 19:46:38 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36999 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfFCXqh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Jun 2019 19:46:37 -0400
Received: by mail-qk1-f196.google.com with SMTP id d15so1664318qkl.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Jun 2019 16:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8+a0+ZIBaGGIy8cYuZBELQbPIuG/ilmX3XlGqWPFCfI=;
        b=pkKYm93oI8NXb2MMXC2nbc9xD60JDdqeWA0AGW60zgIQWpqL+zRH8SsfgqkLlnYlXX
         RnXOl0kPym5uSg42+6exh0Z5W9ihlffCn1Gj9OphRHcCRFnYtvuRPrkGZ+tNiLTPeGg3
         fw9LUYXb6JXzfzwFvh2dpfKvklCuPCVkDCw4iHeacFUvsGbeB7WZ7lBpUc+YeKw4JTQg
         5wyH0Jaba6uTTkgypCeyjexQB2rBjr72KiuMU4QLnyy0pCJToVrUiimehBxg6k0/XZmB
         0zcMZLHbkmxjSHEPJHjJKpUxZXgH3lqt1QIbSZxyjdhiXWER3h2y5Rwd4Apt44vpjuTY
         5d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8+a0+ZIBaGGIy8cYuZBELQbPIuG/ilmX3XlGqWPFCfI=;
        b=DlsQU0L4M6GMCWYLhDfWqq8aUWvWXPxz99WpQoisGwCzzLUvtoS/6Uo2zce5Cyjnww
         KrwTX93JyUP7u4BMpRlq7RyjeRQWKkmS2qCb6RtzObYQ+tnNiJQ8T+KelV62VbRJ4Otg
         Fiirr2sS94F4bY1DrWwOBCVTYW2ZFRYuevk2Rev5VDvTtfo9mb/8ib/dUAQ9ak8Bs/WS
         ilWOl22WxbNVsBHk2q3pCHsmJmDfC1DYpeaSqmm66EgJ0dPR2PclgBzoyfXDGzJHnDZg
         0aFeJcmwuZRquL7FqDFWqx6JudEHuAgkHnRLkvNSOfcscTvm408bApjao32DCYpBW+Tv
         npqA==
X-Gm-Message-State: APjAAAUHyQrlJkyFTsnWqVw3dM4V098rSYNtIyVGUOCbvCc6BwsuPcmy
        RTIO35wwEHAwLGZdoHtzPnhMJFLJ
X-Google-Smtp-Source: APXvYqxJxRSXf9O2g4WgIg/SJbgKRCnysEOE9YemgHvqLFfOvf/O3P4Dx/uBzIazfeJPd6qVyI/8Bg==
X-Received: by 2002:ae9:ea17:: with SMTP id f23mr8572919qkg.110.1559605596728;
        Mon, 03 Jun 2019 16:46:36 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8::2])
        by smtp.gmail.com with ESMTPSA id l40sm2487175qtc.51.2019.06.03.16.46.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 16:46:35 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, o.rempel@pengutronix.de,
        linux-remoteproc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] remoteproc: imx: Broaden the Kconfig selection logic
Date:   Mon,  3 Jun 2019 20:46:27 -0300
Message-Id: <20190603234628.10924-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Besides i.MX6SX and i.MX7D, there are other i.MX devices that contain
Cortex M4 and could make use of the imx remoteproc driver, such as
i.MX7ULP, i.MX8M, etc.

Instead of adding new SoC entries in the Kconfig logic, make it
broader by using the more generic ARCH_MXC, which encompasses
all the 32-bit and 64-bit i.MX devices.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 18be41b8aa7e..0df301be6d9a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -16,7 +16,7 @@ if REMOTEPROC
 
 config IMX_REMOTEPROC
 	tristate "IMX6/7 remoteproc support"
-	depends on SOC_IMX6SX || SOC_IMX7D
+	depends on ARCH_MXC
 	help
 	  Say y here to support iMX's remote processors (Cortex M4
 	  on iMX7D) via the remote processor framework.
-- 
2.17.1

