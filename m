Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1893C23AD
	for <lists+linux-remoteproc@lfdr.de>; Fri,  9 Jul 2021 14:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhGIMuF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 9 Jul 2021 08:50:05 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:44302 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229671AbhGIMuF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Jul 2021 08:50:05 -0400
X-UUID: 9b997646e56344c693cebd0a7413313b-20210709
X-UUID: 9b997646e56344c693cebd0a7413313b-20210709
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 358079144; Fri, 09 Jul 2021 20:47:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 20:47:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Jul 2021 20:47:18 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <tzungbi@google.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Add binding for mt8195 scp
Date:   Fri, 9 Jul 2021 20:46:30 +0800
Message-ID: <20210709124631.28312-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add mt8195 compatible to binding document. The description of required
properties are also modified to reflect the hardware change between
mt8183 and mt8195. The mt8195 doesn't have to control the scp clock on
kernel side.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3f5f78764b60..d64466eefbe3 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
 Mediatek SoCs.
 
 Required properties:
-- compatible		Should be "mediatek,mt8183-scp"
+				"mediatek,mt8183-scp"
+				"mediatek,mt8195-scp"
 - reg			Should contain the address ranges for memory regions:
 			SRAM, CFG, and L1TCM.
 - reg-names		Contains the corresponding names for the memory regions:
 			"sram", "cfg", and "l1tcm".
-- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- clock-names		Contains the corresponding name for the clock. This
+- clocks		Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
+- clock-names		Required by mt8183. Contains the corresponding name for the clock. This
 			should be named "main".
 
 Subnodes
-- 
2.18.0

