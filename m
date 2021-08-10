Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500FB3D861F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 28 Jul 2021 05:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbhG1Djw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 27 Jul 2021 23:39:52 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58020 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233481AbhG1Djw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Jul 2021 23:39:52 -0400
X-UUID: 06901bbc26b9437287306031bd83b926-20210728
X-UUID: 06901bbc26b9437287306031bd83b926-20210728
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 44931842; Wed, 28 Jul 2021 11:39:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 11:39:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 11:39:45 +0800
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
Subject: [PATCH 0/4] Mediatek MT8195 SCP support
Date:   Wed, 28 Jul 2021 11:39:26 +0800
Message-ID: <20210728033930.5269-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Changes since v2:
- Add compatible for mt8192
- Convert mtk,scp.txt to mtk,scp.yaml 
- Refine clock checking method

Changes since v1:
- Fix missing 'compatible' line in binding document

Tinghan Shen (4):
  dt-bindings: remoteproc: mediatek: Add binding for mt8195 scp
  dt-bindings: remoteproc: mediatek: Add binding for mt8192 scp
  dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema
  remoteproc: mediatek: Support mt8195 scp

 .../bindings/remoteproc/mtk,scp.txt           | 36 --------
 .../bindings/remoteproc/mtk,scp.yaml          | 85 +++++++++++++++++++
 drivers/remoteproc/mtk_scp.c                  |  3 +-
 3 files changed, 87 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

-- 
2.18.0

