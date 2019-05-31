Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5283096F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 May 2019 09:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfEaHjC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 May 2019 03:39:02 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41485 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfEaHi6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 May 2019 03:38:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id z3so3554220pgp.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 May 2019 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g8DOkQs3tJJMTiP3KpsnfFyLKFLOLt0qtvZcNKVpUCg=;
        b=TjB+ZxUhUm9GBCDVwfx4e/cuXlJwh7kaM6nf9OLRcp6qOX/H8RxjWlYekkcJ93ftDp
         cFsdU/itNxI04wVELPsulpenyXzmZkmk4BE0w9JDz2/6hOoEr4yanKFBmiogY1Um3EWI
         iIRm6hyyW7zUhRf0FNanzmwdP6tw7YfeQRQrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g8DOkQs3tJJMTiP3KpsnfFyLKFLOLt0qtvZcNKVpUCg=;
        b=f35IDYQiEveNW2XPT/p3MPTxHYKkgC+JiBuHSH4DiAX8uyUbD+HUFOOt1gtma9gvGA
         VqlERFSmVuuqnwHJyLHZ8uJUHM53/yTNOCySN7BKD0c3hWD7OmG9WGNt1EJf5qTqqo6x
         1/yEvEhk5kvFTEdISW4rfS3EJ+OobbrVKHkJM1g8GuBmfy2Cf7vvWfgnSznOGjePDzJV
         OWme7yXdozR6c9l68F5TIpmX5rtmNDtZsJf2E7RlCGrQF5aZxpjmoQl+OEGgi4uHbwCT
         3KP/FjiTUgOIMico3tomSGcWkxYfE5HDDkRAVARey0XOMTTi9sqOkO8NNscU5kn7ywlq
         PlhQ==
X-Gm-Message-State: APjAAAVjPmVg9ebHyKVWg7BwoJuB5KI0yjmRnt5moRbeCdJjyeZe1T34
        ZDZfNCcfvfV2uOMpHKoq+5/BlQ==
X-Google-Smtp-Source: APXvYqyh9Gx4WMpB1o5c4zInzMILlvq5fF1RbNXMaUCPTCYPs4s+1ahQf9BJqP4MNuiuhHpkwzReBA==
X-Received: by 2002:a62:5306:: with SMTP id h6mr8141814pfb.29.1559288337403;
        Fri, 31 May 2019 00:38:57 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id r71sm17051741pjb.2.2019.05.31.00.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 00:38:56 -0700 (PDT)
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
Subject: [PATCH v9 1/7] dt-bindings: Add a binding for Mediatek SCP
Date:   Fri, 31 May 2019 15:38:42 +0800
Message-Id: <20190531073848.155444-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190531073848.155444-1-pihsun@chromium.org>
References: <20190531073848.155444-1-pihsun@chromium.org>
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
Changes from v8, v7, v6:
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
2.22.0.rc1.257.g3120a18244-goog

