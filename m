Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66CE1A9A84
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Sep 2019 08:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731433AbfIEGT5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Sep 2019 02:19:57 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43996 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731393AbfIEGT4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Sep 2019 02:19:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id d15so1015530pfo.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Sep 2019 23:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eOou/Ud0sJZIJ3w0AOB8xY062SjRhhJ5K1s/AP/xaTc=;
        b=S9vJ63v0iIy8Jh4yKByDDuNyqPHdPhOEfaPBkj+7/MMDM44zSp5bRqCVFV82gslUPy
         CjKg1Z8NZHVn81a2lj3jrJQ5i7+oPiJUXPBEWeVSFzIZEF48Sr9F1baOrsPwAtfCMlpf
         NOtIg7xZiSjOUyyjkCy6U98UeGeYoyDI8EEE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOou/Ud0sJZIJ3w0AOB8xY062SjRhhJ5K1s/AP/xaTc=;
        b=AhZPURWsyZ2WEOnegiefOsyfeHHSqJLZfHMDS0xC9kBN9gWfJOLMlGMwXRSZdnJqBT
         21baK3Sr50/3A3BO6wLPtFNcRKq24L2vDayhP4RBiDeY9+aFtrSuYLfYlatkRI90bMLy
         GjNqeR4Ni1hdrHMlQ8XarfKxZOxIUoPGSfkF1omog0FXf2h+XwPFYtMlxRmTJWusZR/p
         w4xny9yex6otaE6O1Zk654cdUN7qRsXzV+t6p+vP4oJBcMeH5FsfLctDF+yd3bXv3U/c
         LucryYR5jTVgmbyw5a9S+W8drEzWDJxxeP0/Mh44A7ScCuC2VIteRgm4jFhZ5lj+r+T5
         XT+Q==
X-Gm-Message-State: APjAAAXbsKnyRPeXc3yCkqNtNrqHMzAmLw+VSDR/JAaJTT+I8gUHxgEg
        3nmC5kTuMff3HILqAt6lbbDADQ==
X-Google-Smtp-Source: APXvYqzS3/CTlFwcE72Yz2aQEiu4FXUp+BwnMqGXCJpYKZNTJeQb7nblnWkoSLISnNjodE2+jVwYwg==
X-Received: by 2002:a62:ce8a:: with SMTP id y132mr1821500pfg.240.1567664396084;
        Wed, 04 Sep 2019 23:19:56 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id p14sm443445pfn.138.2019.09.04.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 23:19:55 -0700 (PDT)
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
Subject: [PATCH v19 1/4] dt-bindings: Add a binding for Mediatek SCP
Date:   Thu,  5 Sep 2019 14:19:34 +0800
Message-Id: <20190905061943.242729-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190905061943.242729-1-pihsun@chromium.org>
References: <20190905061943.242729-1-pihsun@chromium.org>
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
Changes from v18, v17, v16, v15, v14, v13, v12, v11, v10, v9, v8, v7, v6:
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

