Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290D0197B0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 May 2019 06:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfEJEe4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 May 2019 00:34:56 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37521 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfEJEe3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 May 2019 00:34:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id e6so2352978pgc.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 May 2019 21:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I9XJT6/tH1dITtwqwwLksUn/i2UuLzClmRgZy8rDTNU=;
        b=bDwrUyGicRP9fSW6fbUR34sFHt4e3afbYdrtDoiQet4eIfjmlw0QLI1eIaUKuswFbM
         LbIGKBZjCQBX9EQrW8nigwlmLJedEWzM/PkucoGO2ywGW3gBRwQ7HBmzjKdKHqyhbVHh
         dG1F5LvMkdI93G0Nyy+/detIg+eJOVf+CuruHZvqA/xp2DfZvgaSt24ceJa1PjHGODEe
         Fe/M56z8UEHzKh35wPl7s6NNN4aQfOv9eCLCJMtHaSg6ZhozOBi1iVzyHS1DSh5QETJL
         9qAwPqE8+4jIuejFfheUw6nXcspOCSbO1W9/mtM3IJB3iZD+M2AofBxGuFNZs+Gz2Ccl
         XTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I9XJT6/tH1dITtwqwwLksUn/i2UuLzClmRgZy8rDTNU=;
        b=n1KgL/ELpU4B5rnVmPw9EGEeyfzh08YXjHuSNSS9+YMPYw926ULr81eAr1bx2iW/cS
         JDqJE47e/JOjQ/6I28vbzinWbwNSDIuEJw95WeqQ/xin2JUBOVTmRBQbp+4R66lXGkd/
         o641YSFcGs4OyHPuMJ4quWeuMNA8hNOgm+JHOyefRAwSluyBiyJVas7Ul7eW8XffHzUW
         Rw8SJMaElC07qYfSYF0x5bfWgNSy51lWZyU0COd1Ww/JmbWq1p3e0kv2jMDSCWd16N9T
         goJJ47+PIEo3ff9s0AW9geF1wh3mr7x2ANXS83h+uyh5OfPLKzv2RR1LK/e9LsjxsjfS
         dDlw==
X-Gm-Message-State: APjAAAVEEkljKPAVpGyEMx2dGBiVScRXlt3p3s8666qXIqVRy2MQG8A3
        0VR5Pg32mo2ltE4Px3g61vW32Q==
X-Google-Smtp-Source: APXvYqx2tWMZbLvXcC5dL4h3+Ji6jKr/3wiZYay/VBSDzYcTpM25FB4xAbgZ2RwJciBxjYcSochlSQ==
X-Received: by 2002:a63:5d44:: with SMTP id o4mr10993170pgm.15.1557462868338;
        Thu, 09 May 2019 21:34:28 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm4785317pfm.149.2019.05.09.21.34.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:34:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] arm64: dts: qcom: qcs404-evb: Mark CDSP clocks protected
Date:   Thu,  9 May 2019 21:34:16 -0700
Message-Id: <20190510043421.31393-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

With the Trustzone based CDSP remoteproc driver these clocks are
controlled elsewhere and as they are not enabled by anything in Linux
the clock framework will turn them off during lateinit.

This results in issues either to later start the CDSP, using the
Trustzone interface, or if the CDSP is already running it will crash.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..dc1d7d5d21a4 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -56,6 +56,13 @@
 	qcom,controlled-remotely;
 };
 
+&gcc {
+	protected-clocks = <GCC_BIMC_CDSP_CLK>,
+			   <GCC_CDSP_CFG_AHB_CLK>,
+			   <GCC_CDSP_BIMC_CLK_SRC>,
+			   <GCC_CDSP_TBU_CLK>;
+};
+
 &pms405_spmi_regulators {
 	vdd_s3-supply = <&pms405_s3>;
 
-- 
2.18.0

