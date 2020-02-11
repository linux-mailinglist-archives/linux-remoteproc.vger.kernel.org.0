Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D361591DF
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Feb 2020 15:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgBKO04 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Feb 2020 09:26:56 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:44938 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729381AbgBKO0z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Feb 2020 09:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581431199; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=if2tUvRTbcQfiSVIQPJMw9fRHEfv/pngG5ZakinK/A8=;
        b=GFqi+T3U2e2vN7dP+dP/J6YamdF9Sg6FthDNzi6XOZKGfbJ9ZmlXAJsALGEZPBW7wS7GK6
        41H1v+MUsvRIWZI6J902BPgRwUGrrHHfP/BtKiLwB10Y1Xx8WSEFfmUkV4mZgIJ1UADChz
        Zy3BoJSZo/gBfuUEfbzGOSjkU1PyWH8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     od@zcrc.me, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 5/5] MAINTAINERS: Add myself as reviewer for Ingenic rproc driver
Date:   Tue, 11 Feb 2020 11:26:13 -0300
Message-Id: <20200211142614.13567-5-paul@crapouillou.net>
In-Reply-To: <20200211142614.13567-1-paul@crapouillou.net>
References: <20200211142614.13567-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add myself as the reviewer for the Ingenic VPU remoteproc driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v4: New patch
    v5: No change

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..f7eef2bf2b4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8294,6 +8294,7 @@ F:	drivers/mtd/nand/raw/ingenic/
 F:	drivers/pinctrl/pinctrl-ingenic.c
 F:	drivers/power/supply/ingenic-battery.c
 F:	drivers/pwm/pwm-jz4740.c
+F:	drivers/remoteproc/ingenic_rproc.c
 F:	drivers/rtc/rtc-jz4740.c
 F:	drivers/tty/serial/8250/8250_ingenic.c
 F:	drivers/usb/musb/jz4740.c
-- 
2.25.0

