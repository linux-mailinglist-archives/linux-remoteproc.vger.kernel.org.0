Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2307E81769
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Aug 2019 12:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbfHEKtz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 5 Aug 2019 06:49:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40401 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbfHEKty (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Aug 2019 06:49:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so39443469pfp.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Aug 2019 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8xlg27QH8tpTrWV0rnnvV2twgjoESVc5+PEUV3AQecw=;
        b=Kb5jSabX+xUJcNwwkqppYC0n41TvuyI3iPV4ltgOmefqTw6EQIOF0YQ5Bpq29EY86b
         6j1RB29YLu9xD7agao8Bk8/mLnF7hqTZDvcspTHsqDAXprxqTxvjrJF3LBOK+YbvFREr
         guE3yjgSqlZCiXh3YLtUe2CnqXNDn8GbjC0Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8xlg27QH8tpTrWV0rnnvV2twgjoESVc5+PEUV3AQecw=;
        b=MjOnJfREXqEUPHJqaaERC0dcdsshC5R17RTBPlv7/nLM1QP+i8nCF5xvn43sQIvTcB
         Be7DJC6ruhjjUG5nPphLibPMNV+T6s8gQnTLRw33fQZOqvy8JY3o0T674X3ugTJK5HL0
         vhvn64a6ukbji1DomYHIAxKZ4kjXGXKlXCt6gFqbbqstdYYFfG64YatgYlcebrRsz9Zq
         Fhl/7E6KL/U/6jteYNgE0cS+GJLucKhScCK6CPr9CFbNrTMf9kICJJUSKCVZTLhzoKdg
         hF+6ZfwLWG8SBUmhG9lN+0ke45KmjRjs/WmW4FuRAgyvdeHGsYzUeqHobeS4getigmHy
         udhA==
X-Gm-Message-State: APjAAAWSaxxpKzfCUYm16JQyEdMG63GfSKiTMT7Skkn4Zr8YuHSugDiw
        pTZlodc9jQOva5Wjqx6fHraca1mBtfA=
X-Google-Smtp-Source: APXvYqxEg0IAb3P5uVP43ppvraTT4m0uNVjxPr034jXNW3/4QCQRT4NAH3Pfxp0A/VaRcbKzV09gWA==
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr17893187pje.9.1565002194071;
        Mon, 05 Aug 2019 03:49:54 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id 65sm88693864pgf.30.2019.08.05.03.49.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 03:49:53 -0700 (PDT)
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
Subject: [PATCH v14 1/5] dt-bindings: Add a binding for Mediatek SCP
Date:   Mon,  5 Aug 2019 18:49:22 +0800
Message-Id: <20190805104932.96745-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805104932.96745-1-pihsun@chromium.org>
References: <20190805104932.96745-1-pihsun@chromium.org>
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
Changes from v13, v12, v11, v10, v9, v8, v7, v6:
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
2.22.0.770.g0f2c4a37fd-goog

