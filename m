Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878EFD5CDF
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Oct 2019 09:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbfJNH63 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Oct 2019 03:58:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35068 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729880AbfJNH63 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Oct 2019 03:58:29 -0400
Received: by mail-pl1-f193.google.com with SMTP id c3so7670122plo.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2019 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RoLTcDXevgrBk0cPxImrXSQB650BgpVWWTWZfcg9k7g=;
        b=ZDFa3M3vzS9eSdA3uEcRGaERyso/RAE0I9rzowdu2DiynsrrBk/5P/SW+3FcaW4p+I
         l80/46yx3MeUTyzGTPHQ6+uVjVorGRfCIPq+u1GHN+5ej1DAkVp63/NlREYxcetta9oP
         UqGKHWlfrBYx6UvRl1IDHSFQPMRRi08rbTJmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RoLTcDXevgrBk0cPxImrXSQB650BgpVWWTWZfcg9k7g=;
        b=ix5jH8Xtli4KANO2tq4dcu5s3oIuKjFr2DFzvSx1ll7XGZW7aWxKgtiab67NKZU7pS
         fY1o8WX8NkxDQWpFBd1WmSfK6eLT9eFrGgla82uMBGWR7fSHeK4Kq4etUwcuVSAnH9hd
         Hb8LaegehqO4OsOR6Fra+PXshnPXnLz9IW7mBOC/bhpOYCU3sLzyVaBcA0oUVzGEZmY+
         9x32gA7HM9JbZjEYUuvztOCq1DlxgMbxvMWPhLiRs6fYnNJO9AutVbUgF377L3NihBPU
         qDkWNH5EcbKR9g+ZkQZXGHLvM6pZaJ1BTeTTbhTfZ9xumjpITaYNmXWHK+4wvsEzS/ux
         a8/A==
X-Gm-Message-State: APjAAAXf42QHAWMyHz6r7C9Fu8SbUj+XHeiYCcod9tPsY62tmw4vfeua
        5y0npCG7MlVaoM/CPyqklhtsbQ==
X-Google-Smtp-Source: APXvYqzxOi3qsmmD13lzmgWeKmLblbUGcBQHAJG0proj9EHyiNN1q/oNb/wc6i7hbeVFXK+LlMi+Cw==
X-Received: by 2002:a17:902:8608:: with SMTP id f8mr27938903plo.185.1571039908818;
        Mon, 14 Oct 2019 00:58:28 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id q76sm36695998pfc.86.2019.10.14.00.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 00:58:28 -0700 (PDT)
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
Subject: [PATCH v20 1/4] dt-bindings: Add a binding for Mediatek SCP
Date:   Mon, 14 Oct 2019 15:58:06 +0800
Message-Id: <20191014075812.181942-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
In-Reply-To: <20191014075812.181942-1-pihsun@chromium.org>
References: <20191014075812.181942-1-pihsun@chromium.org>
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
Changes from v19 ... v6:
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
2.23.0.700.g56cf767bdb-goog

