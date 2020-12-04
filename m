Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D9E2CF580
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Dec 2020 21:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388174AbgLDUUY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Dec 2020 15:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388072AbgLDUUY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 15:20:24 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57100C094251
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Dec 2020 12:18:26 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id b4so1769613lfo.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Dec 2020 12:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u6TvCy/F7eRWtUNo/MxFFiMZO9h7izN6lekg9c6lpkc=;
        b=zTJIsspapB64C5r5loN0+0GDKLFNDnEMlGm5RHOQgShnFOeXFexxBihVypXTdPf1n1
         TcoPsxiTRkIZlexfVgyIdhu1JYBbMGlycaL3NBzLTldpom6UA6jl7BF02ALHZXNgg3/V
         2zfG9moKzOBr5l3ppCWUh6kTsw9UhqC1tM2m6bQTJRq0x7DO1YgfPLSswbgpNr4KpgpI
         miSL76z/9e4UCkjK/0H+g8awm2BPHn+Hf+zfm+k+ezxb8OQ5CMfwI9TGc+TizhmPD6wq
         Tmkvwz3zxxWbVeoKvQfuly+EJ4XK9Ak+kSMTpa/NU7eIlmpLay2xmx5Qadj7s37igAAZ
         2jfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6TvCy/F7eRWtUNo/MxFFiMZO9h7izN6lekg9c6lpkc=;
        b=USVPW3Xr4669MKGm3Cjzaqtse31lCAWnAoSXj8TqKYWl57vAL07lhvlI+uaoWDTnA9
         Bf4ZiKVrxQfzbXLVUCyqygvjHXbhCf7sS5fH6dndV74OHfBUbP8XwbtFsSiiUqtC/hFm
         rWQHd27bPgHIGFBztF+LpldjLZAG4wHPNPaguc7xNIHxh+pa5pMMaxY4lSRF6GlS3edc
         kkbIvF/4fWTwVmrDnikdU0QvUThrVvwtF6wGcCgfztJpXv4bI6jiqKPbjCFV1QzD+2uB
         UWYLqWm7YQ9mgL0WcNcspVGMOS6C/jtPhO0Wb8yydoWbdDGclpmpB2Zv6DXBekTug+un
         iN2g==
X-Gm-Message-State: AOAM533OHbz73PvT7PGpuXERCVZh0+T5TxeqM1JV0MLxGoKfBSsvP4zc
        ixOrsF2o5kaOfgZYoRql4gTQBQ==
X-Google-Smtp-Source: ABdhPJx86pDawmjihnBby2Ln8g2zAZeAcXoUgXGJVDzaLglJkBUW+wxsCPzW8TQpxT/Hm4XxtMCeDg==
X-Received: by 2002:ac2:5307:: with SMTP id c7mr3694123lfh.28.1607113104899;
        Fri, 04 Dec 2020 12:18:24 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w21sm2036918lff.280.2020.12.04.12.18.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Dec 2020 12:18:24 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v3 6/6] remoteproc: pru: Add support for various PRU cores on K3 J721E SoCs
Date:   Fri,  4 Dec 2020 21:18:07 +0100
Message-Id: <20201204201807.14716-7-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 J721E family of SoCs have a revised version of the AM65x ICSSG IP
and contains two instances of this newer ICSSG IP. Each ICSSG processor
subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called RTUs,
and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).

Enhance the existing PRU remoteproc driver to support these new PRU
and RTU cores by using specific compatibles. The cores have the same
memory copying limitations as on AM65x, so reuses the custom memcpy
function within the driver's ELF loader implementation. The initial
names for the firmware images for each PRU core are retrieved from
DT nodes, and can be adjusted through sysfs if required.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v2->v3:
- Add Reviewed-by: tag
---
 drivers/remoteproc/pru_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index f76423792acb..e32123c099de 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -849,6 +849,9 @@ static const struct of_device_id pru_rproc_match[] = {
 	{ .compatible = "ti,am654-pru",		.data = &k3_pru_data },
 	{ .compatible = "ti,am654-rtu",		.data = &k3_rtu_data },
 	{ .compatible = "ti,am654-tx-pru",	.data = &k3_tx_pru_data },
+	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
+	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
+	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.29.0

