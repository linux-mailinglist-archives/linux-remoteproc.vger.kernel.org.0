Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C856191C6A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgCXWDh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34620 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgCXWDh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:37 -0400
Received: by mail-pf1-f193.google.com with SMTP id 23so4943pfj.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gD4LodALzmGwEFgS5fwtNqrnYj7UVPtTkyE0f/EdKkA=;
        b=Am+NoDRatHT6h/yfSS12DGXSW0QghcPI5B8zhX8Wylqb+EUxitBPqmkzeKpju37WxJ
         vYuEmxpE/VRc7x3Vqb37HeIo9+wQBpShCpynYhz/LJ+Rywi/prAz3zptuku9zMLvYWsT
         ZpIFbewVYYvqvLEgDkKoRkbId5YVQBz+nNqTo6IAbGJDfqxA5gUTBwT+zt4lqQBwiVsO
         RHHmcQ3aib2kEs0wFWMRdDXy5zLXtuJGz8z2adYWKmLfq1zYmjlue8U/M9edWsoiNICT
         WjYHPqeRiiCjCc8fd3pfNC7HE6oPcGIIJIGjIFj/Z8SSuxlwBzBuBZyEoGgtnwQ+WKmG
         LeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gD4LodALzmGwEFgS5fwtNqrnYj7UVPtTkyE0f/EdKkA=;
        b=QOmkgdUBBvcR1oLFzogzTBMvTAPDbTRt0am79pegN2tDzGvvHXw50Q8PKrG+U8WUdd
         8RvWTVs/XeuHBaxiFuan+Ssvg9eqTyuCcJGaWP5BiKHTXa67NdzYmCgfW9QM1MVkB+mu
         T3RROmdbFIRwkHnHyQhqvosxfQUDatdY0FDpz+ilCpo9P5d0GOAjhH8vfw1G/jE5sndK
         imP2sXHJlOIE6CTbfhxD+siBnx3Aj0Lir2+HUu4UrhH7Sh2+mpXX2MRRi28VYDg9R+08
         6U2WbS0Tj3BFMWbzmMMf2XyWox6TXa/K6Os7bLpycuVwMv+Udspe4FgC9rLjUlqzT62G
         3qtw==
X-Gm-Message-State: ANhLgQ0MRk99l/t3t1Yr/q+yYeEDY3saSo6v0T+LS4TlChz0sUMQ19n5
        OZVA0usuz9ADwbo11Y8+W3obSw==
X-Google-Smtp-Source: ADFU+vuaiZJ975CPSdjsA3X95fWb680idPGcTlM8FEIHyaMDFO341NnOzCm0rjU8iAD0pS7HxltIrA==
X-Received: by 2002:a63:a55d:: with SMTP id r29mr12041699pgu.248.1585087415817;
        Tue, 24 Mar 2020 15:03:35 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:35 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 02/11] remoteproc: stm32: Request IRQ with platform device
Date:   Tue, 24 Mar 2020 16:03:20 -0600
Message-Id: <20200324220329.15523-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Request IRQ with platform device rather than remote proc in order to
call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
know whether we need to synchronise with the MCU or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index cde4b1a56381..0c1f0b84e057 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
-	struct rproc *rproc = data;
+	struct platform_device *pdev = data;
+	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_report_crash(rproc, RPROC_WATCHDOG);
 
@@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
-				       dev_name(dev), rproc);
+				       dev_name(dev), pdev);
 		if (err) {
 			dev_err(dev, "failed to request wdg irq\n");
 			return err;
-- 
2.20.1

