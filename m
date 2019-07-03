Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6A5C902
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Jul 2019 08:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfGBGGE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 2 Jul 2019 02:06:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32960 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfGBGGE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Jul 2019 02:06:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id m4so7150722pgk.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jul 2019 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2DXKtNTv+enH5mK3GUPDYxbfPSoTPJ0a1FQBq84Hi+Y=;
        b=n2YRkfEcd42/YjEnVh6ZuwGh2F8LbZbM2Yv0TnulNyM8phjRiBCCHGSp1AZkKWrPg5
         ZhfO+t6cnCLJWW6mNBJ8bQF+mEsMNZV+XsYOMPu/0Nfxec+KbElFGiNW8w4nswNZoDBC
         unN6O9Z6ZD0ro3kaNg2izFE9+xbtTccy4SOm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2DXKtNTv+enH5mK3GUPDYxbfPSoTPJ0a1FQBq84Hi+Y=;
        b=GabDf0wJrnCasLixBBDi2agGwTKJcGQT3rXBn0u9wXlA8oGuo80q138WuKahi383Q8
         UuA3CKekOwQNGP7fAvHxL5u5zs7rB0s59SpV3kg4cgaBTJr0A2PUzxXsLnTZRpPvJg8h
         bro7lNyyOjP4Y3eA/XWII+2RHMxWY6SsN7j+5yAzaUkUys2VSB56YbATl9rfpcHM4hRi
         TNMdT6Cq7RTEiMsZLBmj9kMDZU4cnnteupkwk5I1j/BU5fwVFBZmdlGzbkNBjbXCJn6Q
         e0UZmmpOSmmwhOetrHdUbtPVfh5QunMN8EfOM2lWBbVh+n7jzqS7b3rmFKBAJauqPn+z
         WjaQ==
X-Gm-Message-State: APjAAAUirLObCvwZvicFjgc21pO2AuMuJUYTBHoQMS9T7VTwRdoeSYDO
        z8LNQI1blsRKy8s2n/sRp1ZUYA==
X-Google-Smtp-Source: APXvYqyfx3lBk+zavVeFFQ3Exhb53WC8en4hyQZPVwxXtoVaI/XCoVnt+JtXEvekAV66miBKRip/Xw==
X-Received: by 2002:a17:90a:24e4:: with SMTP id i91mr3758658pje.9.1562047563192;
        Mon, 01 Jul 2019 23:06:03 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id d1sm10284013pgd.50.2019.07.01.23.06.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 23:06:02 -0700 (PDT)
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
Subject: [PATCH v12 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Tue,  2 Jul 2019 14:05:24 +0800
Message-Id: <20190702060546.222934-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190702060546.222934-1-pihsun@chromium.org>
References: <20190702060546.222934-1-pihsun@chromium.org>
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
Changes from v11, v10, v9, v8, v7, v6:
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
2.22.0.410.gd8fdbe21b5-goog

