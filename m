Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA52F39E105
	for <lists+linux-remoteproc@lfdr.de>; Mon,  7 Jun 2021 17:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhFGPnX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 7 Jun 2021 11:43:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41269 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbhFGPnM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Jun 2021 11:43:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623080481; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aiuxn+DnrO5jrk2hOetPkzHkSL7V7qhTdnTfb2x8Zto=; b=OzikfxZElBbRXrwTJ7793ItNzrYgPSjD9zN6Ls+Tz6XpVGCxqyqZfoW8Ij+FD8YD/mbh4n9O
 /LsFn36/dRCjCEw+6et/7p8K2VTfYPS8rwBhj28ng3/K6DxaKIwCWNJApa6xGf/un/0LVpwt
 bcLAHG8luzue5qumh7TffJRjI3c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60be3e11e27c0cc77f1d9e9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 15:41:05
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03289C43151; Mon,  7 Jun 2021 15:41:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A833C4323A;
        Mon,  7 Jun 2021 15:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A833C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, swboyd@chromium.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 13/13] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
Date:   Mon,  7 Jun 2021 21:09:32 +0530
Message-Id: <1623080372-13521-14-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
References: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Delete unused power-domain definitions exposed by AOSS QMP.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/power/qcom-aoss-qmp.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

diff --git a/include/dt-bindings/power/qcom-aoss-qmp.h b/include/dt-bindings/power/qcom-aoss-qmp.h
deleted file mode 100644
index ec336d31dee4..000000000000
--- a/include/dt-bindings/power/qcom-aoss-qmp.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, Linaro Ltd. */
-
-#ifndef __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
-#define __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
-
-#define AOSS_QMP_LS_CDSP		0
-#define AOSS_QMP_LS_LPASS	1
-#define AOSS_QMP_LS_MODEM	2
-#define AOSS_QMP_LS_SLPI		3
-#define AOSS_QMP_LS_SPSS		4
-#define AOSS_QMP_LS_VENUS	5
-
-#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

