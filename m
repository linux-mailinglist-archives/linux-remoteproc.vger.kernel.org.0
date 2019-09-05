Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE6CCA99B0
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Sep 2019 06:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbfIEEoz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Sep 2019 00:44:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44156 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730042AbfIEEoy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Sep 2019 00:44:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so869000pfn.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Sep 2019 21:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1EsJptc9BwkCPLiKXU5O2k6sWV2iJmNZHdqi26Mb3kw=;
        b=NUQHUdujzAeNrEkgTL2aVeIvJNWhO1oeNBr3IZ8+gDEQWHeUbIPC4o4TDH9lgMoLnS
         jhCIO3oeOkaPDEisT4IBZSKC7DbauGcBzikiGV5n0oFwilrs3kvXiYQdNdZ18GvIJ/9W
         XrexL/We59SMNEC1gCJxYlfx06r6IBahj7g4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1EsJptc9BwkCPLiKXU5O2k6sWV2iJmNZHdqi26Mb3kw=;
        b=McxW5ZogF+lYmW6AFsEY2KCy6q0fyT8JN7grddmG7m+wkDnTI39Wro//kvNnF/axRO
         c9AfRMCIBN43TqqowrgPaKNWCRDoH7OcNFAnHzHsa+ZOhzu1EHwSJEbQVPNFsSTkt6+G
         KpbhYdsUYVHGddECT8ajwzyZ5wv8Wi/8nYuTpYBX5PRLabU42QgunXoTB/0CXHyHl3N2
         eSnoz2f1ZuQhIVUUdmpI6O78TKpsFg9Y9NxPrc33JP4rQf9vWlhQ4Kr15Bx6PMlvhuFa
         ok+30qTEXzHGzvj5Jr8PwDEDdyLGrRom4f8czStLCtc3ZDp9Z5br3Nx9WVfZDfV1DgB9
         vGCQ==
X-Gm-Message-State: APjAAAXYDbySQhk+ffDlBzTeWf2Zo2P9YZuynSL7pP8xljwnwi6km3kM
        iEG01qNcGGvq5KDNuXMz4Tzu1A==
X-Google-Smtp-Source: APXvYqwzt9FrByNIuoHbAXjwW0uTei7NlddzpoKO0YO0ElwSOeMSOyEQadUu8dzB6wCqWScVicHTqg==
X-Received: by 2002:a62:2ac4:: with SMTP id q187mr1434107pfq.242.1567658693850;
        Wed, 04 Sep 2019 21:44:53 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id v22sm602272pgk.69.2019.09.04.21.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 21:44:53 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>, Erin Lo <erin.lo@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR
        (REMOTEPROC) SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v18 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Thu,  5 Sep 2019 12:44:22 +0800
Message-Id: <20190905044432.150131-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190905044432.150131-1-pihsun@chromium.org>
References: <20190905044432.150131-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Erin Lo <erin.lo@mediatek.com>

Add a DT binding documentation of SCP for the
MT8183 SoC from Mediatek.

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes from v17, v16, v15, v14, v13, v12, v11, v10, v9, v8, v7, v6:
 - No change.

Changes from v5:
 - Remove dependency on CONFIG_RPMSG_MTK_SCP.

Changes from v4:
 - Add detail of more properties.
 - Document the usage of mtk,rpmsg-name in subnode from the new design.

Changes from v3:
 - No change.

Changes from v2:
 - No change. I realized that for this patch series, there's no need to
   add anything under the mt8183-scp node (neither the mt8183-rpmsg or
   the cros-ec-rpmsg) for them to work, since mt8183-rpmsg is added
   directly as a rproc_subdev by code, and cros-ec-rpmsg is dynamically
   created by SCP name service.

Changes from v1:
 - No change.
---
 .../bindings/remoteproc/mtk,scp.txt           | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
new file mode 100644
index 000000000000..3ba668bab14b
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -0,0 +1,36 @@
+Mediatek SCP Bindings
+----------------------------------------
+
+This binding provides support for ARM Cortex M4 Co-processor found on some
+Mediatek SoCs.
+
+Required properties:
+- compatible		Should be "mediatek,mt8183-scp"
+- reg			Should contain the address ranges for the two memory
+			regions, SRAM and CFG.
+- reg-names		Contains the corresponding names for the two memory
+			regions. These should be named "sram" & "cfg".
+- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
+- clock-names		Contains the corresponding name for the clock. This
+			should be named "main".
+
+Subnodes
+--------
+
+Subnodes of the SCP represent rpmsg devices. The names of the devices are not
+important. The properties of these nodes are defined by the individual bindings
+for the rpmsg devices - but must contain the following property:
+
+- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
+			the subnode to rpmsg device announced by SCP.
+
+Example:
+
+	scp: scp@10500000 {
+		compatible = "mediatek,mt8183-scp";
+		reg = <0 0x10500000 0 0x80000>,
+		      <0 0x105c0000 0 0x5000>;
+		reg-names = "sram", "cfg";
+		clocks = <&infracfg CLK_INFRA_SCPSYS>;
+		clock-names = "main";
+	};
-- 
2.23.0.187.g17f5b7556c-goog

