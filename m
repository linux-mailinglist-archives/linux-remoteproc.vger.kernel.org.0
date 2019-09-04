Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB53AA7B6F
	for <lists+linux-remoteproc@lfdr.de>; Wed,  4 Sep 2019 08:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728796AbfIDGRC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 4 Sep 2019 02:17:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39386 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbfIDGRB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Sep 2019 02:17:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id s12so5556484pfe.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Sep 2019 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uzakui8viTETwW9jPht4pssIBM6YeQuIbX1083r5IEs=;
        b=lo30L7q4OAnqKuFHx/jfFe5LMFGNxW3a60tixFPIGjRHQJRbQOF23IYNpzJcMjRTVq
         2Apa9i5yXzA4Qs8/cbW70m3UX/jMB/vlNiJh6rFB5wqTmb8p7s/pr83xMkFqHyj+6BwT
         OMDumxpyjObtXBCv9eHgDI1Mf+fIj/s/UJ1Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uzakui8viTETwW9jPht4pssIBM6YeQuIbX1083r5IEs=;
        b=gaL6CiR0jIj29OsrfFObaWnYVWVvXKP8Z8vrveFXl9RkWQ0KewqQ2kPC/jlmJPEEOX
         zPGwLNmI2CpN2hA+5TRGCy5xew4XDR737C72ib77+hqFDmXuknsnNWLpjZdEP1rsDdqB
         08B1QfVVK+vI2+AMOdvErvhXXfv2spJ7vh8tyQ9zeo4mAACzLNEaWrpHj7o10s6O45aN
         WeHeAfZLg6BRVnSlaOJQWssDE7BFgard/vthR3RWHykASvmsccl3C1QG3wLXWslUkIPT
         6hPW9iUupAb/gcXQUxASUCu6mHOai4/XESsP/PGdW9fS3NjyBYcJnHYEzYbFx5WKoETU
         OMZQ==
X-Gm-Message-State: APjAAAV+CYUD5HRumX0BGAfHtHTXx5v8NRRI2SnR1b6W/4KAjjFKZr8M
        ig0Qkuoz1ft2oOXs6u7aTTCoKg==
X-Google-Smtp-Source: APXvYqznpx34k/PFtlLfTr2KZA144YWdk/hb9j75wdV4FzNEiNNRVy0S6ME9y3Lxmj4G5Tve2FO2Vw==
X-Received: by 2002:a65:640d:: with SMTP id a13mr33335797pgv.256.1567577821026;
        Tue, 03 Sep 2019 23:17:01 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id r2sm27248750pfq.60.2019.09.03.23.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 23:17:00 -0700 (PDT)
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
Subject: [PATCH v17 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Wed,  4 Sep 2019 14:16:39 +0800
Message-Id: <20190904061649.69099-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190904061649.69099-1-pihsun@chromium.org>
References: <20190904061649.69099-1-pihsun@chromium.org>
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
Changes from v16, v15, v14, v13, v12, v11, v10, v9, v8, v7, v6:
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

