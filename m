Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D2D17F092
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 07:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgCJGfR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 02:35:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34311 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgCJGfR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 02:35:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id 23so4226272pfj.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2020 23:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d8AjvD+mWU7Kqb2uax4NAbHla51Z2q1T68vOktWwmUU=;
        b=e0520db8rL5s48CNjE3/w6BUSfvVmG//sqsHJERB+PcVgHrF/F4qRQIGGfd/uc9LMV
         9b0cxRDjp+SMxwd8q1aDFRFwGeNgxqoIRMP2lE6JyiwK1CQAJS/JnpTEr+GO7TN7orJ8
         0Dh8v/P+phq3LMNQ+WCNVh9HVZg3Y0g18mp+RkiutASuBey33CwoCga0lZ4f+/8b6cEr
         Bnmwf3cBItdDjTtHkuONrBAzBYtJAM4GoMl25+mrva8MrY21PZTiBtQRwzZi3XIo3Bek
         VvBnzCCtoKwBqlDf9QDAwrGH5qAe6dqNi7HubPS/2zgRfkeqspdCSJG899vms16pzlar
         o8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d8AjvD+mWU7Kqb2uax4NAbHla51Z2q1T68vOktWwmUU=;
        b=bNphJGFW+uTu+OW+W+A6EPNvid4fd6hVl4un2u4LLm2RI7iJKkhN6T90ZxKTzeTLLb
         Dkgf7lt5N4RBSfH9FzyJHq6lYDdjbHjcnPaIYRxk81h6JtKCNGwhCAF1w7zzSe2l1FIa
         D1dAZTQxz3Jxcl07fV7vc1DT9uBTDzjYC0HtUnXI+qt9PnPy3sOj89CVUcUiDjK6L74m
         ipCuLX265LCSgmS/DT5dyQMln02D3JQVuCye107jurdS3rV/euSw6lGe6dRErP7Gezyn
         cE73/xo44OpdKNWu70nIv5BEdC7evaWtIRiIlJRJLfatcBYnoi8VrTrK59nCKOS33MJP
         8dEw==
X-Gm-Message-State: ANhLgQ1IvL52hJFB9Xlmd2EevPXOE9WtIf8OH9Tif45ML/C966yipV/H
        4JTA1yNfGphMwHjmuCFNRQTJQb2ePh4=
X-Google-Smtp-Source: ADFU+vudCcEsTmro255muOTHO0+MetHygAp5Rw7GUIUDvr3gglaDTNuVDtH7EHjcHbCVdeaXXlQXzQ==
X-Received: by 2002:a62:3854:: with SMTP id f81mr10941076pfa.81.1583822116459;
        Mon, 09 Mar 2020 23:35:16 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
Date:   Mon,  9 Mar 2020 23:33:37 -0700
Message-Id: <20200310063338.3344582-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on QCS404 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Added ranges
- Made size in reg hex

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 1eea06435779..3dadcf1c968b 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -997,6 +997,21 @@ blsp2_spi0: spi@7af5000 {
 			status = "disabled";
 		};
 
+		imem@8600000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x08600000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0x08600000 0x1000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.24.0

