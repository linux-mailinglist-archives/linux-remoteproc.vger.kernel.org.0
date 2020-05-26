Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F411DC365
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 May 2020 02:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgEUAKX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 20 May 2020 20:10:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54944 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgEUAKX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 May 2020 20:10:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04L0ABHw119697;
        Wed, 20 May 2020 19:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590019811;
        bh=bxxyF39bG20vkcm18FoVVnaFF3ZtcaFk7MRVd2l1kI0=;
        h=From:To:CC:Subject:Date;
        b=VSZRfu/3WcDFrXomQ64o4chhGx9XGnBogVSR5I1sND692cEzFxyHbIQyKZYzZQ7y6
         8It4fxYlyjUiJ6QPsJKU3D5zSBhmtjCRIWToU583rDfVrErApmzQq1D/ZoBo84H+xp
         7Z2Z4CI+CWx1613nQlcCAVVbPS8lBOq4n6+DgHPo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04L0ABjx023423
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 19:10:11 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 19:10:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 19:10:11 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04L0ABum003652;
        Wed, 20 May 2020 19:10:11 -0500
Received: from localhost ([10.250.48.148])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 04L0ABdd084874;
        Wed, 20 May 2020 19:10:11 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/4] TI K3 DSP remoteproc driver for C66x DSPs
Date:   Wed, 20 May 2020 19:10:02 -0500
Message-ID: <20200521001006.2725-1-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following is v2 of the K3 DSP remoteproc driver supporting the C66x DSPs
on the TI K3 J721E SoCs. The patches are based on the latest commit on the
rproc-next branch, 7dcef3988eed ("remoteproc: Fix an error code in
devm_rproc_alloc()").

v2 includes a new remoteproc core patch (patch 1) that adds an OF helper
for parsing the firmware-name property. This is refactored out to avoid
replicating the code in various remoteproc drivers. Please see the
individual patches for detailed changes. 

The main dependent patches from the previous series are now staged in
rproc-next branch. The only dependency for this series is the common
ti-sci-proc helper between R5 and DSP drivers [1]. Please see the initial
cover-letter [2] for v1 details.

regards
Suman

[1] https://patchwork.kernel.org/patch/11456379/
[2] https://patchwork.kernel.org/cover/11458573/

Suman Anna (4):
  remoteproc: Introduce rproc_of_parse_firmware() helper
  dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs
  remoteproc/k3-dsp: Add a remoteproc driver of K3 C66x DSPs
  remoteproc/k3-dsp: Add support for L2RAM loading on C66x DSPs

 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 190 +++++
 drivers/remoteproc/Kconfig                    |  13 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  23 +
 drivers/remoteproc/remoteproc_internal.h      |   2 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     | 773 ++++++++++++++++++
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_dsp_remoteproc.c

-- 
2.26.0

