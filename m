Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C40191C70
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgCXWDo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:44 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34611 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbgCXWDo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:44 -0400
Received: by mail-pj1-f68.google.com with SMTP id q16so1611326pje.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DF6ut+sIjxCo1vYVUNvb1kGsbVUugsDLID5ZsQOGmMA=;
        b=mK+pFgyIPI92Ul0mJlK/vgwhdWnxVTNscH8ueyJXKuq9SZHbFmbRt1BJUXHpn/bnwA
         rv/yFTHMJIGcNGf1kRWbHdoj3QlFgQaiE3OWVGBQplLL++jq1BQIkzshoohfqFO271LI
         xg4lKW/zAy34IwIF/y6KFYgdpa30uaBN0km9LKYIADTX7dqE2fV7Ascv4E4OxgMm/p5n
         KAxSAgkpEOjUAxqKkLsbf5hhlGPNX+P0CJq0bJBeQrySeTsfO8oi7M0nlqyjYpujN9A6
         LWi1yVT7U1OQ3pu0Qh8YXYjZJRkkCWkQHdwW03gEqhBV/IP6I06K16W+CLVy5U/sml08
         pRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DF6ut+sIjxCo1vYVUNvb1kGsbVUugsDLID5ZsQOGmMA=;
        b=UHkFbfE3rnK1jyck28XddeW2OMkX27ptjsuCGxNYxXAdz19LMzeC0LEMteOncSVSsW
         I3eMGB78wsXB4SDhn41xqggbBoZELYIcJ7FCcGwPP5k31nIZNYm5UwnTHxg/UzehQpJT
         sOM5M7pI05kBk9WxjVl9M67IHZ4TpM5VXsaCnKgNVCFpkoU0V9WFbmX//OSSYEm16ZJJ
         8Y0+LvxmSSLZVJzWzGNb623FnPE35vzlR6VsAWqcvge6FAEex75eNVZO3qdPOuMyQG4x
         g0nuAHLs2PRTzMDDvWt3aDjg8GsefGUuay1dXIBujR67P8KGzydKVSwQKH8/sMongo0Y
         skzg==
X-Gm-Message-State: ANhLgQ1CyHM22ZB17IqV8RlJNWtyjJX6eaLmTilRzNGf38QwzLn8FNd4
        4vwBNY6+iLjYeChX4+LWSbRWD1lkwhM=
X-Google-Smtp-Source: ADFU+vuCa1KOnFgQj8YIxLv2THmgFu83DUIbZOQf3a7UoMhQ6Dh40lETyXNVj4m7Vm5VNvTFf0K7pw==
X-Received: by 2002:a17:90b:1b04:: with SMTP id nu4mr22645pjb.81.1585087422177;
        Tue, 24 Mar 2020 15:03:42 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:41 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop ops for synchronisation
Date:   Tue, 24 Mar 2020 16:03:26 -0600
Message-Id: <20200324220329.15523-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce new start and stop rproc_ops functions to be used when
synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 5bac0baf8f4c..734605a9223e 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_sync_start(struct rproc *rproc)
+{
+	stm32_rproc_add_coredump_trace(rproc);
+
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -489,6 +496,30 @@ static int stm32_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
+static int stm32_rproc_sync_stop(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	int err;
+
+	err = stm32_rproc_stop(rproc);
+	if (err)
+		return err;
+
+	/* update copro state to OFF */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -522,6 +553,12 @@ static struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
+	.start		= stm32_rproc_sync_start,
+	.stop		= stm32_rproc_sync_stop,
+	.kick		= stm32_rproc_kick,
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
 	{},
-- 
2.20.1

