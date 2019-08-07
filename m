Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3A2843E6
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2019 07:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfHGFjx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Aug 2019 01:39:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35947 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfHGFjw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:52 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so38955755plt.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Aug 2019 22:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LuR1ky4R+W8DnJlClr7ItKCcIJSpq5BHTgJG+rP0wz4=;
        b=BN1iYmX3VS7iNjW36GRLTazm6lrD0RRsFwt3TRZMMqbhiC7X6+9Uzi4RYwPKB60hQn
         4nS2QQ4CVKBocbEcvJEM7OOGQcV7THez5IHf0FQiGx7UInJSEoH3dELsSjvHwx0Jg2JJ
         eJgm6W9JJfX0M5zOEKyX3dQj5qdXRl6ruoNTm2zdwPcLNEq4xOoe7o3FKadQa8TJZRHv
         dFFgTWSlwiRuxq20DKWLdBaPUkkHgfoyJrhSienE5+enZLqZzBFOdQGx/z7+54x9dfFP
         llaWNYh0YsFjxuK9DISr6aso0211Ps+SesAbVPKLemIq78WkV4K1X++La0IY9sSuR84O
         QkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LuR1ky4R+W8DnJlClr7ItKCcIJSpq5BHTgJG+rP0wz4=;
        b=RZle1KQQCbroNJXA2Oy22sOQYeg/1IzPuJ4867zWUR9BAG440bzYXQ6/PfHzeuKO9M
         hGW2LCpr58z2WDfvxlktccNxZg6gQmJ9nrBFYdBi3KUtmesqTwgdD7HZdJxIJYB+a65A
         AiyuD8KgHpYqY8VW9VdNqte7LRwdNeqko9Ld+inL3xrBNKT5gW6LZhi7XRPbFbwGVS2r
         QPdXmcpieldPjN+EApOjnjydaIoPjX6ku1ezs2lbxBxGqohCrSttPGtdIHYR0J5w5kLr
         zoV72NRTqWTFfqih5cEWQ1NkkYvRgkcBy8hDnuEI3NAz/Sql/U+4w6QvuiGtrjC9l3Gy
         pCyA==
X-Gm-Message-State: APjAAAVmPlsHqm4uJTPyBp1x0tBoxM/8GM4QFZYm2lcUMYbZNHp/WUY1
        lBH2yFiy5tU913jGtsrPNwcY8Q==
X-Google-Smtp-Source: APXvYqwteeE9q8f83hjRPGYATCdDy8cEXcbkYjbkT24pE6lGFv27jx/C08Js6EVAX5W6MsCH9hmiMA==
X-Received: by 2002:a17:902:7612:: with SMTP id k18mr6498473pll.48.1565156391829;
        Tue, 06 Aug 2019 22:39:51 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
Date:   Tue,  6 Aug 2019 22:39:38 -0700
Message-Id: <20190807053942.9836-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on QCS404 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009..1604a9697832 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -845,6 +845,16 @@
 			status = "disabled";
 		};
 
+		imem@8600000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x08600000 0x1000>;
+
+			pil-reloc {
+				compatible ="qcom,pil-reloc-info";
+				offset = <0x94c>;
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.18.0

