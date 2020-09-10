Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F702263B3A
	for <lists+linux-remoteproc@lfdr.de>; Thu, 10 Sep 2020 05:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgIJDMx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 9 Sep 2020 23:12:53 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:54082
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728442AbgIJDMx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Sep 2020 23:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599696160;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=RXbn1DWMYAZ/35A4Quy1kciFUeBroO2XMUKTixP81u8=;
        b=SSdf49bXNSkyITUrNrsFYmvJdow5ybQbUcmAXzzOKBVA7wRlk2NKVKHN39OSn+YW
        Kpt4dB+fPzoDIWxBEyKCn2ZkJ6uw7NFWAJpuG6A3R3Pk5/3geNV7YZmIQrjbJb/WEiU
        wHByHE/nGw2a2v4iPcYgVINt5FZK57J+YJ+4DF9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599696160;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=RXbn1DWMYAZ/35A4Quy1kciFUeBroO2XMUKTixP81u8=;
        b=IXvcYt7lm3IylKhmQTwjJsufMpraLy+JMyJRn4MiqAdvfiVGTcnWkZBqKS8uNtlW
        tbAqIgtDzq80ed4TM7Cq19DZHiDZFkdGjKqKmkZ0VvNHiTrKOlMtnCAkYj5wvs46Yop
        Q7Ut62RYHBIi6ilUFkdPyTJoJ5ini5u2sqt3PTdA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D416C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: [PATCH v3 3/3] remoteproc: qcom: Add minidump id for sm8150 modem remoteproc
Date:   Thu, 10 Sep 2020 00:02:39 +0000
Message-ID: <01010174755244c8-4654df20-f3df-49ae-94ce-eea0af121a99-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599696147-30585-1-git-send-email-sidgup@codeaurora.org>
References: <1599696147-30585-1-git-send-email-sidgup@codeaurora.org>
X-SES-Outgoing: 2020.09.10-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add minidump id for modem in sm8150 chipset.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3879921..fa2d077 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -709,6 +709,7 @@ static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
+	.minidump_id = 3,
 	.has_aggre2_clk = false,
 	.auto_boot = false,
 	.active_pd_names = (char*[]){
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

