Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D89326EE
	for <lists+linux-remoteproc@lfdr.de>; Mon,  3 Jun 2019 05:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfFCDqD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 2 Jun 2019 23:46:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40898 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfFCDqC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 2 Jun 2019 23:46:02 -0400
Received: by mail-pg1-f194.google.com with SMTP id d30so7448760pgm.7
        for <linux-remoteproc@vger.kernel.org>; Sun, 02 Jun 2019 20:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hEJonRLI9nF5eFhZjIysE4hQm1TY3MN4XBFUsywjVOo=;
        b=PBKKS9khHDKTfo4Vf1IK0e2eum8/Ah3ZBIpZzQcK8zUg2CerP2x9B5evBBi3dPmM8b
         mrMMtVjH2WQUEdWDYEQ7NotqtpAHB2Zs/AcNu42Ll5QUZ/+XjY5jgh+7TjRBFdPUcYEA
         dRJ5vLVem+8zgDc4jTjVqTr4qGCVzB9RC+8Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hEJonRLI9nF5eFhZjIysE4hQm1TY3MN4XBFUsywjVOo=;
        b=mAMijev6oV23qUenj+Tq8YqVDfBDzNyMEnV/sUXGScnibkHzlzD3H7wVRfd7VgHFuC
         Ezrhytso6m1rRidB/PxIF8/cRnC3jCqMFTH76KdSsCO8rGd2iE8UKS4ISi85/YW0HiBj
         jrRDeK8gWTDa8yo7WznnP/wC/OjTC6xNLeRskBRFLg5XnyduwT8Y6ztkzMm6KhLC0082
         N8pKlbgw3vQh+4Tb97aoQOl7qp0aeUx/9qX6g+OV37ZxgNh5lgrR+Lsq7NcXKVrGq+uf
         /M/4py9edw/wJXNBjaMeKKMMmef/2SkI9Rlty8uu6rmS7lipebW4RKbHyaufPeQQav9e
         mclw==
X-Gm-Message-State: APjAAAXrLM6/jTn+CkL2L0ijNbmPxMlBw++T4LbK6bhKzVZYtcqG8UH6
        8xHbxppOPArkNaY5nRukdqt3tg==
X-Google-Smtp-Source: APXvYqwWhD6dJQ7e7U6XXknP+lCqRI/wQ2l7stAOB/LOcEtN9grXtAVkkkFLAih8hwbZy4nolot6NA==
X-Received: by 2002:a17:90a:7343:: with SMTP id j3mr26398048pjs.84.1559533561988;
        Sun, 02 Jun 2019 20:46:01 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id i73sm11878960pje.9.2019.06.02.20.45.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 20:46:01 -0700 (PDT)
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
Subject: [PATCH v10 1/7] dt-bindings: Add a binding for Mediatek SCP
Date:   Mon,  3 Jun 2019 11:45:06 +0800
Message-Id: <20190603034529.154969-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603034529.154969-1-pihsun@chromium.org>
References: <20190603034529.154969-1-pihsun@chromium.org>
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
Changes from v9, v8, v7, v6:
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

