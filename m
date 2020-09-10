Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0788F26545E
	for <lists+linux-remoteproc@lfdr.de>; Thu, 10 Sep 2020 23:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgIJVmo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 10 Sep 2020 17:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730726AbgIJNBv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:01:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA5AC0617A9
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2020 06:01:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k15so6583781wrn.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2020 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HphHCPdJUs9HEUbW8jhDJPa14fS8feVjDMdm8pwKQX0=;
        b=KTLKPAFfGEgTr2BImp+QKZGVPI0BzcHxU/2gi4Hz4aq6K/0m9lhzMmNEiW8wgtH2iJ
         9mMpJYcT0vvo2wEb5v4jHjlftFwV7dVCl0Mszv4QdLfjxoQJ0psBeF6XCHqyLGq2iJGT
         JG/RiC70ZixTF7vkGxFnCKBHpN8EYdTYJF8mpnSaVEfGQpo/ZvNn6b9KSpmSz6VQkZk8
         hwwQIH7wRd612A+1kyQ9+Wo0SE/5kRVFTC+Feihkv7rQIanO+n8nGntYaPSdmWrgj1MD
         7XrBCFG9+53zppoSdG3GdYpd3G32cYgfKwIU+0XDPXodzaDBsm1YhRNWsnb6pL+LeuLE
         P0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HphHCPdJUs9HEUbW8jhDJPa14fS8feVjDMdm8pwKQX0=;
        b=d04dlj1u+yLJ8gvyAbGPTxEfpeqjYopy+zaULQdXVOhU1RXfXYDR+whH8ncd9wFBvQ
         JX7QKtHW0tSwxg0mteU+l99iIv7rop6HOYW6I9Tnqov64Sl55DFW+Q5N+eHUUh1P0oB+
         brtuTvPGofZk8XxTu5PJdNrDv3VNwL9aa30aYZVBRFMgNyNgU695mpxAtNtlw4ZxK0qY
         yj4WgYRQpv+5SU7hibJv+epUF0vQndWH9FxPUaxN27a9lnB9bs/8DGiEIt+hP7TbcrC+
         ZNnVaPEPeorxxVgrGsIjWyqRfcrTNAHlOT4DeMSdmNj+t00sVOREO4LeHBoUC9lA1JUx
         57TA==
X-Gm-Message-State: AOAM532rDFbG6bAJepT0/HnZq0LBhbvOe3CDvdaYeJfMLEW884Q/YCEX
        16iGP4il3ZLHnngzX5q0Le0r5w==
X-Google-Smtp-Source: ABdhPJxQ/7u8nEM7o5yIM0TqrL9dfyr46k2FRZOHqGju4TlGZTK0gY0DH16yhGiFzt+kO1B2bqgRGQ==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr9460647wrf.77.1599742902740;
        Thu, 10 Sep 2020 06:01:42 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y1sm9488269wru.87.2020.09.10.06.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:01:41 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, mathieu.poirier@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v2 4/4] ARM64: mt8183: Add support of APU to mt8183
Date:   Thu, 10 Sep 2020 15:01:48 +0200
Message-Id: <20200910130148.8734-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910130148.8734-1-abailon@baylibre.com>
References: <20200910130148.8734-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This adds the support of APU to mt8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index e215f1eb3eb2..28f75452961c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -967,12 +967,51 @@ ipu_adl: syscon@19010000 {
 			#clock-cells = <1>;
 		};
 
+		apu0: apu@0x19100000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19180000 0 0x14000>;
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE0_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+			status = "disabled";
+		};
+
 		ipu_core0: syscon@19180000 {
 			compatible = "mediatek,mt8183-ipu_core0", "syscon";
 			reg = <0 0x19180000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		apu1: apu@19200000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19280000 0 0x14000>;
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_CAM_IPUO>,
+				 <&iommu M4U_PORT_CAM_IPU2O>,
+				 <&iommu M4U_PORT_CAM_IPU3O>,
+				 <&iommu M4U_PORT_CAM_IPUI>,
+				 <&iommu M4U_PORT_CAM_IPU2I>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE1_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE1_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE1_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE1>;
+		};
+
 		ipu_core1: syscon@19280000 {
 			compatible = "mediatek,mt8183-ipu_core1", "syscon";
 			reg = <0 0x19280000 0 0x1000>;
-- 
2.26.2

