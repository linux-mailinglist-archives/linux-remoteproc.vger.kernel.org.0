Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD8744648
	for <lists+linux-remoteproc@lfdr.de>; Thu, 13 Jun 2019 18:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404199AbfFMQub (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 13 Jun 2019 12:50:31 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46073 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfFMEHY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jun 2019 00:07:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id bi6so7118577plb.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jun 2019 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIgOPVVM6q+dVXIoVUUorxT+bwXe1fbLrkXzBBznV7s=;
        b=OheohaTmEdOffghZ8R5csfw6DkMLfVRuvon1dmsUQIY4NTvQq2/uiecrDqJNhwm1qI
         Xhmw+xYMm74rgeEI32RbJ4+iEMXcjclOQOgrpgxgTnsiepYSZDNvODQtZPjYe2IX10U3
         DZpHAcO6PymeHwAjrYp5HzHnpQjc70gUmpQ2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIgOPVVM6q+dVXIoVUUorxT+bwXe1fbLrkXzBBznV7s=;
        b=DfDndvw6UlxBYOEGVmxKJpTsCpXp0NhNbACnFpvrUxluyUEbP7iHy79HNftsvd+DgD
         3jlJjALIRj/VOCd/Csxa1L7pJv1l7GSMR76MLKf48TPWcyLNI5FmbO6PvKsDX01sBNVC
         gcyP3q7VySF34epvd34FmT7u/HSjOsdSgeu6Zw+Q5MjkBGfVLG8fcVZZxxt9av7SbI/W
         qXZHO4JgXMqLO8S8wVO8ywYNJWj3hI1TVBFAbXd8pJU8x9CyMCylEVdjzgjuiavmuop1
         w7BMYigbqpKwlIuUEgRmHo8qntP0j6+k54uzwO9Tu24yJyyv53AWyHXAfIzlJ836q9Lm
         mtSA==
X-Gm-Message-State: APjAAAW5aYAt6++OETqAIJW9iLSvoPIesxVJgft11210KMJzH3e0keUO
        i2fQFa5LyraJ6vxk4jfB3J5cpA==
X-Google-Smtp-Source: APXvYqzp7czAoQMic2M9v20g7fXHIfCQSQUhJ+Li+QPsBLMAzqYqPfD0A2oCeqTNcWIP4IYaajcVNQ==
X-Received: by 2002:a17:902:2ba7:: with SMTP id l36mr84276914plb.334.1560398843562;
        Wed, 12 Jun 2019 21:07:23 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id a13sm956849pgh.6.2019.06.12.21.07.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 21:07:22 -0700 (PDT)
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
Subject: [PATCH v11 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Thu, 13 Jun 2019 12:06:48 +0800
Message-Id: <20190613040708.97488-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613040708.97488-1-pihsun@chromium.org>
References: <20190613040708.97488-1-pihsun@chromium.org>
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
Changes from v10, v9, v8, v7, v6:
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
2.22.0.rc2.383.gf4fbbf30c2-goog

