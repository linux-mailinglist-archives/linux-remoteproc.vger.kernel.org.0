Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D9147225F
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Dec 2021 09:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhLMIYF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Dec 2021 03:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbhLMIYC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Dec 2021 03:24:02 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B28C06173F
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Dec 2021 00:24:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z5so50049674edd.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Dec 2021 00:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q70cqgRzfvObsCs+O+QFL42xSmUpXSY80Ymp8MHcdZQ=;
        b=EFzn7U/+mwtWjf5xkkkE06o/niQokFoi2Fx14MUC8OKWWMATpB9c2l83Qn07BXoaOt
         I3EMOddYLFb2Kv2z748a/GsJSgKeVaO/oiW6olIBJARQpQmTTkzcl39Y9r/7FBTwTZuL
         aCaXSBFN7XFgbspmenBailI7V1yXLoh2u7w3iA4wUcC5hZZJSEm//YwHY1mgIvwJ1GK2
         McDuGfVPryKNQ8116msD2qlk42pKu+7XO0B/3SWF8C5rxGg6EKxX3DchJG8VF90soSAr
         IH6RnBIfkU3zAlEt8l2c4eUnQewEE+2K9v8fRvx6zz5q63Pe5gFRDTSyBGEnQ7ptpQ5j
         wnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q70cqgRzfvObsCs+O+QFL42xSmUpXSY80Ymp8MHcdZQ=;
        b=a804cCSnNFTpifYhblrwO9e6znUW6MD2AqOeJl3tOjUhVCXtuo9Lt1PpzyotmXYklS
         IHYBXJBf85+g79qqar4FGmrKizsU+ea2l09NAmDe182tZZWsX08S3ZCInTLQ2hyGtNlq
         iZUcNqB3bGFjLyWSwSwYeOJ1d7jGZ8JXX0LEJcfMo+hnMM58ktgtwQaK6IIGAwOui6TB
         87CqqkHx0NgVj6nkAZEeDixQ+IUZ0b2uap+1pjrqtk/qbTWr7uBv5TqlkTs4b1W7Orq0
         uZfDj8BXa3k/ASCcM1ZKSLcCsCWlw5cZFYgmqvlSlLfQtOjBw5y04UM/WuSo5CbbtRrZ
         NS1w==
X-Gm-Message-State: AOAM533zS1FAUuDwDVEPjYIECfp4Jh/44BFXlMBCvRc/9I1/lV0nESoW
        Isc5UL+iwarLWI2rtF6TTndDbA==
X-Google-Smtp-Source: ABdhPJwtE5pGQIQmXqQUzOYbMwH3b8byTp68AFBCdLBBW3Yc746D0mV7/1A9RWzE3iPlj5QtafkuQg==
X-Received: by 2002:a05:6402:11d2:: with SMTP id j18mr64910013edw.318.1639383840837;
        Mon, 13 Dec 2021 00:24:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id nb17sm5535561ejc.7.2021.12.13.00.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:24:00 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] remoteproc: qcom: pas: Add SM6350 CDSP support
Date:   Mon, 13 Dec 2021 09:22:06 +0100
Message-Id: <20211213082208.21492-7-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082208.21492-1-luca.weiss@fairphone.com>
References: <20211213082208.21492-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a config for the CDSP present on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1d28036e0265..370a70e25722 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -629,6 +629,23 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sm6350_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct adsp_data sm8150_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -822,6 +839,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
+	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
-- 
2.34.1

