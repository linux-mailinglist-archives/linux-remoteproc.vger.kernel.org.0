Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FB08E558
	for <lists+linux-remoteproc@lfdr.de>; Thu, 15 Aug 2019 09:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730683AbfHOHQr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 15 Aug 2019 03:16:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44146 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbfHOHQq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Aug 2019 03:16:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id c81so919007pfc.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Aug 2019 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HDILVyErmnTPxDiBJsIeowsoOA2xgMqocmOD7wZ83MI=;
        b=STKG4Bk0fm40Ckc4pkmy41EJdkzYuZPPzaEre6wEgzK/5PnSDs4jAmW+R+C5BELizl
         tVQoDBg8MPL11z/wPtAuYWfW/clM4UJFrBOymodTSqgL7KYyDD1GAIsttzY9bCpJUo2+
         VY0ZLXbtjzsyaDR2AGG+MyryQInV3T3W7lDqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HDILVyErmnTPxDiBJsIeowsoOA2xgMqocmOD7wZ83MI=;
        b=omSEdumftGXs+XgDWqsxDOumPt0/VQ3Uat9So6vnuTg4BsaKYsyRH4sRBGTEsRtL1d
         NVWN76LM//lhhTeXBA4YmA6SKrxborFlv84YQLNrkm4pIjF3gsZR0vzf29cv4WormLoI
         DbaNOBFuwtI/PmTR+B63Oicfg8GKpxjiCNWmz3Kl9XIFcllB5EBzMIH0++JVd+5MZIjy
         khRX0CDMwcQZIJbCryTQa7UVYssXF/+AQ+7XidAPdWFuPuxaamG23+frimzRPU5hPnKe
         XZaMqs5GFD8SX2tratJb5bmCVgGLcLi0+PeOtod66WqhPmp+hbPs3l8LYUUfYqBLZ9Pi
         IvEg==
X-Gm-Message-State: APjAAAWIf2JYea9ZwjrR6J8HQ0XGL7QlaRCviSqsY5Eg0DK+BsF8k//B
        C8R7OSnf7/wtFtrCoyiWeAkXaw==
X-Google-Smtp-Source: APXvYqyt5QKQ9lGgtDEGUyDoiYJKw6pCKeQ/gx+ujuL39urZz1mDuyhk/cTstGPwBzPVHGcSRRUz1g==
X-Received: by 2002:a63:eb06:: with SMTP id t6mr2438696pgh.107.1565853405704;
        Thu, 15 Aug 2019 00:16:45 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id v6sm1768727pff.78.2019.08.15.00.16.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 00:16:45 -0700 (PDT)
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
Subject: [PATCH v16 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Thu, 15 Aug 2019 15:16:25 +0800
Message-Id: <20190815071635.168671-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190815071635.168671-1-pihsun@chromium.org>
References: <20190815071635.168671-1-pihsun@chromium.org>
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
Changes from v15, v14, v13, v12, v11, v10, v9, v8, v7, v6:
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
2.23.0.rc1.153.gdeed80330f-goog

