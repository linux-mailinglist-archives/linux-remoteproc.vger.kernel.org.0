Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A861D06BE
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 07:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgEMF5g (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 01:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729213AbgEMF5f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 01:57:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20DAC05BD0A
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 22:57:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s20so6401290plp.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z7kZFy6HCyxrhgKGNSyjSTuXnfPxfj+czQqHRi3u1gM=;
        b=zJr212c2S4dtMzz93cPqS9vPSi5G7YQyOSztYFxV+YM7YSjz7mTD7iy9LEtY/3XHjB
         CJQA/o7CJlh3wJ9QmxVCuIUK03DsCHVTURqv0fyFzxSozfeaYXyeDil6GiiH+78ov1JU
         tOJ+Xxwm0dmYI35dwakztMpzXpDIVHts4iaOBjkYKJNMRv9nmkxqWj3eloPcbKQ+m3rA
         yYXqdfkFO5SEX/thFBE04tpjnZCmNFdvRUFckCGqklrhnOq+f6v8WCBvXHH4tKwPIHx/
         bIOq2O2C94ASio9RDUE4fuMlp474f7pQngoq86yC2h1r4uunP5bSc0YyfuGfHwrL25kh
         eEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z7kZFy6HCyxrhgKGNSyjSTuXnfPxfj+czQqHRi3u1gM=;
        b=NtxOB5Ci/xVK7lUB80kGYaanlO19RT3aXMXxDgqMluCIdOzZy+PZwY8PJ/y+AdR0tE
         8G0HwdK8MT8RXzmSNe2eTfh+W9HK+6b7ySebkdZp3njwJisfGlaV7Yak6FvAVTMTBRBh
         hWx48FUvq2Fm2iAFTcxmHCrftYlBFGVuaIBM1ZyKrmCJ2btX18ERzQqlnMS+6CvnawFJ
         lPvp5rGwM5L8pJ+Y72Bhgmkk8B+KWdLwhBf0tHmS8InCUS+yQkXqpCPXcoMOq8Brh4fQ
         mfmy0OyUO4y4SL5zx8MPnWSO7tx4d94z0qZffiD89O8jdDKGeDfjiQTJfMTK5xKVOsaw
         WEaQ==
X-Gm-Message-State: AGi0PuaUWzZlasgSUrwN0iQ8ynwfYv5osdnYRR3jI7xh4BfIbAl0OVIQ
        bruda78rvu2nrEn+q7SN58L/UQ==
X-Google-Smtp-Source: APiQypLDvyMdeHWS/UIk3epwcBtrBMYdULAF2/nXkMJSwPEnQM79P5r56h8uTsWRBFp718+BnjFXnA==
X-Received: by 2002:a17:902:8b82:: with SMTP id ay2mr22486312plb.94.1589349454118;
        Tue, 12 May 2020 22:57:34 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w192sm14131161pff.126.2020.05.12.22.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 22:57:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v5 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
Date:   Tue, 12 May 2020 22:56:40 -0700
Message-Id: <20200513055641.1413100-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on QCS404 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- imem is no longer compatible with "syscon"

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index c685a1664810..b654b802e95c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1097,6 +1097,21 @@ blsp2_spi0: spi@7af5000 {
 			status = "disabled";
 		};
 
+		imem@8600000 {
+			compatible = "simple-mfd";
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
2.26.2

