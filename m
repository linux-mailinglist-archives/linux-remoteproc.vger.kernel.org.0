Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B311F631F1
	for <lists+linux-remoteproc@lfdr.de>; Tue,  9 Jul 2019 09:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfGIH0H (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 Jul 2019 03:26:07 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46462 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfGIH0G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Jul 2019 03:26:06 -0400
Received: by mail-pl1-f194.google.com with SMTP id c2so8041179plz.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jul 2019 00:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PRbnhViNGl1LcxNP4nPbukDhthpgqPoYyJbQJnbMZA0=;
        b=jMl+kSfMM7zb/ANXNAuipsRghs3IaXllJGFB4syW1aDxKoiWx3ZkJIDy/bKh5yEbqG
         DF0mufDPqGDrUuehRIzezkykyjo9XFDLGaJsDFkMuSY0fLAS1PP10Uu+r2QHoOqKoQdg
         ZEodHpkSs5GQUiExm91SIJkVQGJ0GqZuEuBI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PRbnhViNGl1LcxNP4nPbukDhthpgqPoYyJbQJnbMZA0=;
        b=HxtEM4wjypWqxsb+Y7rp0A01PQ+8rst6Qzm6L8uaPg6+qF6BNKrCXdSU8KwnR5zizm
         x7ccXtzjuB5aKsmukDX9Rnt3R/MxibL9syo0wrSvUqGPSDcnsLbGlc4OQozJdtkRVi61
         JOmDJG23tm3Pxec4cZn1eTpbtfqEvAfs96RqCkPc4jblzc1QJ2UeP2FHR/F/jCTg7Tzg
         zVhJ1qPzBkP7m4XjqxySP+JqF80ffjdLjjcgikRtCWZ7qmJT7S9//1i93ceHOGFlQkLb
         CKI7wM4aA1w3utJAYw6IRKGDe1IFgieQHPTLSBmSWLqksYP7r/6mB7wnk0y2GOZdg4JY
         NrCw==
X-Gm-Message-State: APjAAAVPIb8gbBxi77xqmH7tuhmJoXqwUhzKC+aw8VmbLtO3hcM1gNPc
        sOtDqaMoBgGz+30vFxHDnPdDbg==
X-Google-Smtp-Source: APXvYqy1C7SaNvtMmzD+Mu+EeJXNAq3Ggxkt0i3uxRvfVX9ZRhM3irsxj+Ps47MKtzs8jkdRaDv7pw==
X-Received: by 2002:a17:902:2808:: with SMTP id e8mr29102226plb.317.1562657166216;
        Tue, 09 Jul 2019 00:26:06 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id 81sm12738135pfx.111.2019.07.09.00.26.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 00:26:05 -0700 (PDT)
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
Subject: [PATCH v13 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Tue,  9 Jul 2019 15:25:25 +0800
Message-Id: <20190709072547.217957-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190709072547.217957-1-pihsun@chromium.org>
References: <20190709072547.217957-1-pihsun@chromium.org>
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
Changes from v12, v11, v10, v9, v8, v7, v6:
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

