Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5FD133B72
	for <lists+linux-remoteproc@lfdr.de>; Wed,  8 Jan 2020 06:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgAHFxh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 8 Jan 2020 00:53:37 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41140 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgAHFxg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Jan 2020 00:53:36 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so1002636pgk.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jan 2020 21:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoB041Qi6gAAsKDfeXTiJLvWYKMaZ3RNSLAQlXIIIG0=;
        b=rmY/HpS/mbpy6xWHZc+XG8LDePEJw8nEDOE0yYUwMpcMbWnwWD4ibVlbu0EtJt9XGY
         WTpuQENnkbkloGePmvTrH2uDl2i4ocs//5xYYKO8sKEFe0NOUpPL4H9cv36+Fa8Wv+o8
         73u1xiZnqzTqz5nGn/h2l3h++gMTHvf/Qtf1wA3lblGcMZ9vIHGoEvJhTiocXpKJ45Ma
         qGZTgblO1msz7vOzp8YrREaSyZ+2UCokkTEp7+vGdJIBFAnzrJfwO1K1VOYPbogtinNp
         8LCL2gseqtHo1MnNLTdgnZ1qS+wMFzm8MCoHr2YBTHVLTj0+yQg+Qs3d5+d/U5ZDryb0
         ptVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoB041Qi6gAAsKDfeXTiJLvWYKMaZ3RNSLAQlXIIIG0=;
        b=d2cImAl6RcsnHPA3l/qbroTNknMVfIM81jFD72wFRgKVg/oEy/yPUc6ShPDQt0VNDE
         +oVB/nJQ8NJt7Agis1QNHkg6/W7/UiAqCZ72Hv1JN//5nS7zKvf5+17UYwWu5QxhNl22
         R8jl2dov2gCjlo3VWY0u7SljwVfZc+EEnjQdJH3IpF6QQ5B8/U6g7dZbtKkBkkUrv1L4
         jiPQGhq9hKIuu6ctcxs+wnhbMVifWfkWeqsJv4/0LAH6k1w/Zo0HDawtQkGhQdG0UYrc
         WJXxJQ3jkEObzPrbfI0Dcy2+2T1s6AiQqxTNcps2b60d7kU2oaWsEswM++4TMnIe54L1
         KARA==
X-Gm-Message-State: APjAAAWYxjY00hm3WLvNLWIa3+D3fdWQIJk2mVPhS2aANVcjVf7fbiv0
        M6sQi0/D++/4dG8rPNNS46qCnQ==
X-Google-Smtp-Source: APXvYqzw6INjJz8mKK7BZ2+aIxdsMGb+ExuIJpa29ybtjU6VtPqSIZdlwTCJ4IiEtL1Rb8g/wUwGUA==
X-Received: by 2002:a65:5786:: with SMTP id b6mr3555590pgr.316.1578462816142;
        Tue, 07 Jan 2020 21:53:36 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b8sm1643971pff.114.2020.01.07.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 21:53:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: wcnss: Allow specifying firmware-name
Date:   Tue,  7 Jan 2020 21:52:52 -0800
Message-Id: <20200108055252.639791-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce a firmware-name property, in order to be able to support
device/platform specific firmware for the wireless connectivity
subsystem; in line with other Qualcomm remoteproc drivers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
 drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index d420f84ddfb0..00844a5d2ccf 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    WCNSS core.
+
 - vddmx-supply:
 - vddcx-supply:
 - vddpx-supply:
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index dc135754bb9c..a0468b3cc76f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -457,6 +457,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 static int wcnss_probe(struct platform_device *pdev)
 {
+	const char *fw_name = WCNSS_FIRMWARE_NAME;
 	const struct wcnss_data *data;
 	struct qcom_wcnss *wcnss;
 	struct resource *res;
@@ -474,8 +475,13 @@ static int wcnss_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
-			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
+			    fw_name, sizeof(*wcnss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
-- 
2.24.0

