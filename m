Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1ED821FE1C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbgGNUFJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 16:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730051AbgGNUE6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 16:04:58 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88367C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:04:58 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q17so8036529pfu.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwNUu7qUpaCz4fG4QoO2T1DQUQdpi8xCnpxFDDXipPA=;
        b=RN0b/rynsi35wVqV9ynaZ4ndfEHryb0IgVrOeAN8Jt/bWww648cYNIpgbg0fUWycS9
         X+Rf8elKjhQ+5CrsIurWc71Lh2nkCsRgx42qYkI+CfA2cXblcmUxyVNEtVFCv+F9iaz2
         aOjAg/ZDrypEDedV7lIhzTTuwbKHAz8vi//jL93PZk69en8KbwqhDM0X+NF0LYYdqp0O
         se1SnqyANiQFXjoI/UEDhMFPdsShf98uyoFpYrjyKpkGRXgUPu21n304hpaQ2D5aKFtG
         uoIRaSHRoTx+fRiR/eKttCyNQKhwMPsP7djYP9VAw9oHfH1eHAyhYAWgFi4mUE4YWpmZ
         wppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwNUu7qUpaCz4fG4QoO2T1DQUQdpi8xCnpxFDDXipPA=;
        b=YmvEKVuW/Q84IG4ABmyS1IEJ4ZqRS6jeZPHXdZ1EnQsFKwGv23dupmHRsrpBAe3mdq
         wW5PS+LhAW8FflFG1/KT9aGMFa9F/3NIWWgn2HHvwXaNfxiJotsQGsrBDuZKF/I/Xsy3
         MOEClcO0PARsW/ggzTWQQeic++DHkx201CBdbdg5NBYNrz/QlG64Y69eg735RylGDkVQ
         F6YA8wJWwU/WNmG4GBOIDcJoIjaykfiRAqFmuzaF94GfXfywNPHxbsJGfgVSL5kKDj1P
         ZAj9WCtHSCHFiEM8ZxL8SF4Lf+vUSvqbb3LZip04TWjsiw6/G3gYmYWyb+d9vKKdm42A
         IFsw==
X-Gm-Message-State: AOAM531OZLwgyiTG+SZf73p47NAL07Vs+mIUHgkzjSgsSpZ6sMzaNCsq
        OXNtoAxRHAMBM25Yi9xkYSqx3g==
X-Google-Smtp-Source: ABdhPJwkQz414ccfJ9gtjI4z/9EmBf8RQptVbXjWgVkjnsmmfgwPWj2OE33kx20CL4DWkDCyGoDl5w==
X-Received: by 2002:aa7:970a:: with SMTP id a10mr5900173pfg.319.1594757098093;
        Tue, 14 Jul 2020 13:04:58 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:04:57 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 08/11] remoteproc: stm32: Parse memory regions when attaching to M4
Date:   Tue, 14 Jul 2020 14:04:42 -0600
Message-Id: <20200714200445.1427257-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split function stm32_rproc_parse_fw() in two parts, the first one
to parse the memory regions and the second one to load the
resource table.  That way parsing of the memory regions can be
done without having do deal with the resource table when attaching
to a remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index f393f2503106..2a1cccd8d311 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -213,7 +213,7 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+static int stm32_rproc_parse_memory_regions(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
@@ -266,6 +266,16 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 		index++;
 	}
 
+	return 0;
+}
+
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret = stm32_rproc_parse_memory_regions(rproc);
+
+	if (ret)
+		return ret;
+
 	return stm32_rproc_elf_load_rsc_table(rproc, fw);
 }
 
@@ -692,15 +702,20 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	if (state == M4_STATE_CRUN)
+	if (state == M4_STATE_CRUN) {
 		rproc->state = RPROC_DETACHED;
 
+		ret = stm32_rproc_parse_memory_regions(rproc);
+		if (ret)
+			goto free_resources;
+	}
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
 		ret = -ENOMEM;
-		goto free_rproc;
+		goto free_resources;
 	}
 
 	platform_set_drvdata(pdev, rproc);
@@ -719,6 +734,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	stm32_rproc_free_mbox(rproc);
 free_wkq:
 	destroy_workqueue(ddata->workqueue);
+free_resources:
+	rproc_resource_cleanup(rproc);
 free_rproc:
 	if (device_may_wakeup(dev)) {
 		dev_pm_clear_wake_irq(dev);
-- 
2.25.1

