Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFA817F09B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 07:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgCJGfX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 02:35:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43717 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgCJGfT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 02:35:19 -0400
Received: by mail-pg1-f195.google.com with SMTP id u12so5857927pgb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2020 23:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v580Rmb03EtLJPoOXCw/wOCBD8/8JxS+MoT154A+lnQ=;
        b=mZjnCK5vkBIEyZzc52Dk5xKX2BfQ4L8Z8HcJx+EiQC03uv4g6+eRRk4jICz1TvlwxF
         pz3aLzoHZks6knnpqS++ZFf5tPuVGESoZ2yZbKadXuqgPzAgqi7/TXMdpEh1O2j3s1Gl
         v4bcGPiX5s/4jbedA5urg6swkCFxd5wBDCicTaB/F0u/DHq/nXl9joKuGBAinkAzS2vc
         Z+js7OfJk7DwI56K2vyUZ5zLBiGliWVM/ngL8cr5PX7aFRPkKp7pnBwqPfRj5NlEAmD2
         UApecdCUqnHxLO5ghE2IOabdpF9QEe0E3KoVuk5IKTDGCTUA9KKQrJhKqsGado8ogL2O
         Gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v580Rmb03EtLJPoOXCw/wOCBD8/8JxS+MoT154A+lnQ=;
        b=gC4YZDklkMYFiAc//prAm09PRKj2R8ZetDgqx5Q/btDtyrwoFn3Y8o7xQIB0rpVTqH
         Mb8VZoPNRH85RZwKrH0vQsLhGQ57gkQ2a64E3mD/gsBxZyjw9V0lbm0BKaTfLmbdxudd
         olfKofM7kZadpI0Wr2D6yhJ1oZvyGhfEE+WopkNbPcnAq93DbQpBgJL97q24Vry9Waa9
         pMcrTpIJxtULiDUhy7EmxNyLQ7TW2O9mZBZxXJ8Er40e2KKaa/qDTZenbGChsNP91uyK
         ke5sKqM7/iNZs3bwROgYQbKoUnsEFO9Np63haQ3pouAy7N7UaK/qYqiQnlnwBZT7yO4d
         nx7w==
X-Gm-Message-State: ANhLgQ368qe3eHKcA1YcxxDhoqKXVlG3K5czQbHgKBkmqWzUK5Ob9Tdo
        3ZLRVltb0C/ZLVAVY/H4MOTmzQ==
X-Google-Smtp-Source: ADFU+vtPlT2KsyZktOOc6LBt4AUsdDGVs4j2Zjv4y1WWMu5o9XGsVuStyT+MHbY93epK6kNtxoTLhQ==
X-Received: by 2002:aa7:875a:: with SMTP id g26mr20675002pfo.193.1583822118013;
        Mon, 09 Mar 2020 23:35:18 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Mon,  9 Mar 2020 23:33:38 -0700
Message-Id: <20200310063338.3344582-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Added ranges
- Made size in reg hex

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 061f49faab19..36ed6d8d0863 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3254,6 +3254,21 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
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
2.24.0

