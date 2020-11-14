Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448D32B2C44
	for <lists+linux-remoteproc@lfdr.de>; Sat, 14 Nov 2020 09:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgKNIqs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 14 Nov 2020 03:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgKNIqr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 14 Nov 2020 03:46:47 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72148C0613D2
        for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2020 00:46:45 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id i17so12754853ljd.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2020 00:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OCYSuNi1JCYOWWFaprqNxn30Bt1Uq8l9kVTd9Q510R8=;
        b=ejcL9da7O8w5FN5tmzIGzQwAWtWpetZ/vbghzoH05lEbeuN/mcOxM8FGs9i2qAW4EE
         flv1xiKWnScN8Ms6/cZSXFMp5sMfgowpz+opFHNCGk4cqLGy9gdtFjVEBnQyQlZ/Ldsy
         /i/oY1l3khXDOtKKRzXfCSX/hrL8+KYNZVSH2JLZvDJDrZRQO7A8GhxLxa8I3GStmNn/
         vW0krurjjgGfyb6ue6YXqp71viqOeoFZylV3KliWcnB+4+bGyY9ay1BtKu84dhuZ4628
         yWlYNp+S1jGYZcyhFTZSUznE8CpevKxG0NfY+MEQhI0VYlqlJBPtG/brRZUWprZHVonz
         1AtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OCYSuNi1JCYOWWFaprqNxn30Bt1Uq8l9kVTd9Q510R8=;
        b=lWbYitSZajECPUAlYHWpEDN3axv+3Aw7nrvLipvZcaaOn2cVsGWh9tFuGxzAdbZx8/
         XDxRjLs3eJjOpR8R1HTuNwDx1LyFYAHxOb3gSGjnqJi+M403hmoRUNQ6iPQ+tcGMsUie
         nWZehYkx/pVfnILsFliXnVQ+erT9jXbemPCXRIYnqvV7G7odtduqfJa4KK3XMyKXmOWc
         OZCDMSGHNqSPCw2Tn9xGij9k6MqSL5PFzu82Xm1/AdDwY7Z6g8a3FsywbnCh+MG9L1i1
         kRRD0NnnKi7DsDUtS7FQ7PDr35igL14lKJGckHuPhOXIgiBOne7IUYuDIxCnrsCuENwm
         KKxw==
X-Gm-Message-State: AOAM532wch/8o+s/0IyduVf9WMga6rGr/8idytqDDDvIs9+CO1CGpihu
        w5hoUmcsu4uvZP6TvSdGYYvn2w==
X-Google-Smtp-Source: ABdhPJxOCtOaBNVaLtUp3RGqQhAgkWE3qbunetNHx3xw/RfWPbTg0Qw5bYgXFZmv7fFat7Ga2SKy3g==
X-Received: by 2002:a2e:2f0f:: with SMTP id v15mr2594592ljv.402.1605343603946;
        Sat, 14 Nov 2020 00:46:43 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id f62sm1870081lfd.144.2020.11.14.00.46.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 00:46:43 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH 6/6] remoteproc/pru: Add support for various PRU cores on K3 J721E SoCs
Date:   Sat, 14 Nov 2020 09:46:13 +0100
Message-Id: <20201114084613.13503-7-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
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
---
 drivers/remoteproc/pru_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 04c9f07799e2..98f9c598993f 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -855,6 +855,9 @@ static const struct of_device_id pru_rproc_match[] = {
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

