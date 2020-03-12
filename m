Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB50183C13
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgCLWMP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44914 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id 37so3746365pgm.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oTShSnKJqR8hoHXMOzKwWtyGKqtTdUnapLBABWvOQ/c=;
        b=L1UVGnRzsnRw8TqXBR9Wh9CsgNrENQ/iaVNF37wJlBZb1i9H80DDC1vzlGD3+XSBdv
         DMxeLPDxDvrUB854qd4XPasnaN+YT34SeDycxjCmElfkSDXpw0VtH/I5D30Vh1Xn8fs2
         FwOHWr8eBpwfVASpjhioIXDz3MMrXSaCr5r7n6+m1D5/eGOF1eoS3DMaqnvYv10ZPdy0
         FfAnLSUhoKRZeyxBytkmQsTnKfiHc88EjwjPslii8IOSZCiwPp/MZ2mXmpyAMp1VXuu7
         XttlDLwF71UMEp7Xdlk99uJGkXK9Iso5Jgo9XeZHIIE0CMNH6iUjRODRFdPGH7CYKlut
         NfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oTShSnKJqR8hoHXMOzKwWtyGKqtTdUnapLBABWvOQ/c=;
        b=rkYldF85HeY5Msu415Awuq5Sjtz6xOe/U4HKcXTw8Zl2bKY1307ZkhF0E2jMMjmx8X
         XD35+fiMm/rZGHLVlXgJhGwyJ6fTFjnFCFQ+es1ctcBOUMqsVSGZsdh4quM9PtzoVv1L
         lDWZu5FfRpiqVHcJiiZJI6kyrG3C52FgbAcOwFF1mDTON+0G+JLShHGs+IHgJ7r9vJqn
         3NdNF7wTrj6kVPxqjOq+oXjNeFpjnX6GEuvjYRSRX8iVtoVoCA9pqDJwD/dgxsthS26N
         D6O40YDjB19FMaisy3ICk5ajRegee5naP+XolmtWl6Uyfhb40jJYZJTZMIZf60fP3M5f
         YIJQ==
X-Gm-Message-State: ANhLgQ0Q3OfmJ5vjFGLeBbs5B8ufY3IIcZqZurGTT1JijM36fXhW9uvL
        6+avRzMs2chQTCftaO+c7R4gRg==
X-Google-Smtp-Source: ADFU+vujmYOTFrP6hnXD0ve4i9OUEKyJGAg47lxi/QvazgroRQMVEbEecRh1L9bhQaZxFkOJ+gdF8A==
X-Received: by 2002:a63:8342:: with SMTP id h63mr10079678pge.141.1584051133228;
        Thu, 12 Mar 2020 15:12:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:12 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 12/18] remoteproc: Rename function rproc_fw_boot()
Date:   Thu, 12 Mar 2020 16:11:52 -0600
Message-Id: <20200312221158.3613-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Renaming function rproc_fw_boot() in order to better reflect the work
that is done when supporting scenarios where the remoteproc core is
synchronising with an MCU.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d57b47b0d6be..36c4d0f13ae9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1363,7 +1363,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 /*
  * take a firmware and boot a remote processor with it.
  */
-static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
+static int rproc_actuate_platform(struct rproc *rproc,
+				  const struct firmware *fw)
 {
 	struct device *dev = &rproc->dev;
 	const char *name = rproc->firmware;
@@ -1756,7 +1757,7 @@ static int rproc_actuate(struct rproc *rproc,
 		 firmware_p ? "powering up" : "syncing with",
 		 rproc->name);
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+	ret = rproc_actuate_platform(rproc, firmware_p);
 	if (ret)
 		atomic_dec(&rproc->power);
 
-- 
2.20.1

