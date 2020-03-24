Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA36191C72
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 23:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgCXWDq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 18:03:46 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46712 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbgCXWDq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:46 -0400
Received: by mail-pl1-f194.google.com with SMTP id s23so920097plq.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PKFUCHXycedKqG9pECFjQS1acORaTZjCEUQUtaelduI=;
        b=gzMsHTsVyIUTei6peXf0dv2b63rz5xBe7VrXDVor696ijcCZpxKMx5kGqYBm7D6MfJ
         FsgrO9nyGmJPE8Cn3H4JR7z62QKzyxd9MDaNNTVtHcBIm46xHUrRnVsf01/Hr0X+ct1z
         Lir8Hy2cxlx8jBc5ts4Ugze0tjShpSpH2+iSqMoJ6+AY/fV4LeDlWM+PNOLkGd13K9Li
         j0N3FpaD+y/8gEo/ier8nlnLAIf8LzcZjjI513H+eXt/KYjuj/WUXAvfYBrT4M/tjFlm
         qB6N9/DotKH7TPTwA1Jo5tjPAMlirL40ncrJAwkTq1WrqdifW4zwTGvadu1kt83pA4/m
         UBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKFUCHXycedKqG9pECFjQS1acORaTZjCEUQUtaelduI=;
        b=R9g2dwdKOgh/9bCY0gYTP7BESo0ucg/DdA+EEF9DnAB5C+DR2w86N+KPEXJyT8/o2/
         P5GVTxgJNLv8G3U44qcZXK48s8Zq8gLxn50W/U+fz/9LmZ0HTiU7Cjxhx9AxVz1/ezHY
         7CbSIQ3U1qC6zhYpPRo+ZfFCSiLOz/NIKeQm9NhdVeGVXTXvbPHKvf6lmlo3sYCCwHm9
         Zdew7Hc1Vmcb/BZK7u6hR5rUkJodYAmHLrv9Tldg5a5efF+5sT5phslOvcLcVj2vr7X0
         /RlItI5wkvae3oJp9ORja2hXJwoPfyBmGKp2s7seNUBUWqfcrsqpjbHaLtcvUV+/WsOt
         u6oQ==
X-Gm-Message-State: ANhLgQ3taxN/Uui9GOAS+98CCDsOrH4etDzpG3fb9JCgiM4IySYVdM/J
        KZKvHmA4bOrF+zBv6piALTuefw==
X-Google-Smtp-Source: ADFU+vuufWxTBzrJ5IbvPv66AqqjzhSCg3mJ/5FnkckEJ3Q7p35Xxmnlc08HtevYBAvN6lFyZCzEHw==
X-Received: by 2002:a17:902:b90c:: with SMTP id bf12mr157451plb.152.1585087424956;
        Tue, 24 Mar 2020 15:03:44 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm15571199pgd.37.2020.03.24.15.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:03:44 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 10/11] remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
Date:   Tue, 24 Mar 2020 16:03:28 -0600
Message-Id: <20200324220329.15523-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce new elf find loaded resource table rproc_ops functions to be
used when synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 4268d71f191d..07be306c0fb1 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -317,6 +317,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
 	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
 }
 
+static struct resource_table *
+stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
+					   const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+
+	return (struct resource_table *)ddata->rsc_va;
+}
+
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -604,6 +613,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.stop		= stm32_rproc_sync_stop,
 	.kick		= stm32_rproc_kick,
 	.parse_fw	= stm32_rproc_sync_parse_fw,
+	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.20.1

