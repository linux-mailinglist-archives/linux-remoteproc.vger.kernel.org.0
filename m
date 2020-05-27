Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47D51E388D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 May 2020 07:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgE0FuA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 May 2020 01:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgE0Ft6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 May 2020 01:49:58 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44CEC03E96E
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2020 22:49:58 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n15so1036316pjt.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2020 22:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ER99fZktJjShf0MQ65G5VWlR4BA86d/njxXiOdsbXAA=;
        b=l2n9x9fZQq6lFM2StO3TKlqHflMR0ZV10I2KqkUI2RHFKxfB/D6E7edevg0JKu2N0L
         4z93FI57rkyQz7GLT+AMTP2ayww+Dgx58V8kDNKxpQq2WG2lvDuBFS0gr8BzY+Cv0MwZ
         CorHPgt9bIYh5X5uk1VRKocozwyj8265qUC2DrLPlsbSH+raY4wTONsUT2tcHHYdcvoZ
         NBMeqEH+BA/7sr0D49XargHgn4W9OlnM8HLIkcx2lbq3vu4fdV+3bHx9ri+PcPs5jlun
         c82o1yRCZXe8TBAYCYPU8z12ciDCaWRxi/PTe8ezgbqUcuB0AkQWTGr9InGCmtIYZcfN
         vjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ER99fZktJjShf0MQ65G5VWlR4BA86d/njxXiOdsbXAA=;
        b=TZ85o4rBmRGngPt6rm4j+r0X+fuS53xLNYlrQbfnp5o6ccregS8/VHtZyLqViSgSPT
         B1Ni28/hZeVbFi1+wuHuRWIvh7ETSUw7feGRETJbSIYakB97IlgqJMa2nDlItS86DzOo
         N5hPm6hPdHGSn8Q8lB8IcWaMMJkbBxtW6FQHM3n0+5+c+VHTQNYgl8hrS20FGQt5R6Zd
         2uwjJ+JBzDHLoakduYZODuOHyTGE/rS6qHahaOe45Srkh8Ae3RIevI1O2zCy7jExljwU
         KxCod9PBUbBoqDVFMDKOlPxIYbLex1f8McmJvBMDPHsE53EMb1V4WzKSHHQyeqmqv3tj
         zGWQ==
X-Gm-Message-State: AOAM533/i6SE5WK52B8++7x9lJLQ3DHf8i8gS3UQyOyKeXmFN8avSVJX
        TlG7wIU06eeINVU8SvdujCIP8w==
X-Google-Smtp-Source: ABdhPJzNrDqnjvSB470UKYyek7GMQLoqmrKKNyfz6/R+lcRxAU/JyC+8Oni86bxpSgE3TUIN+aDuWQ==
X-Received: by 2002:a17:90a:b883:: with SMTP id o3mr2855177pjr.81.1590558598114;
        Tue, 26 May 2020 22:49:58 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 5/5] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Tue, 26 May 2020 22:48:49 -0700
Message-Id: <20200527054850.2067032-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
References: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Picked up reviewed-bys

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8eb5a31346d2..fee50d979dc3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3724,6 +3724,21 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x146bf000 0x1000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.26.2

