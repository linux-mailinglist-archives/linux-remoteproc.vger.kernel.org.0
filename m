Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5DA34B7B5
	for <lists+linux-remoteproc@lfdr.de>; Sat, 27 Mar 2021 15:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhC0OdR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 27 Mar 2021 10:33:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33532 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhC0Oc5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 27 Mar 2021 10:32:57 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12REWp1Z023425;
        Sat, 27 Mar 2021 09:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616855571;
        bh=kfa+qJtpUE8uUuJRX4nhjzBA6ZEZ4RD2emwsS8UwswI=;
        h=From:To:CC:Subject:Date;
        b=JFBPR62x3X6m/r3zHlAzXHNBQMC1tu+eMpRWgAfWo32wsLLVhPpmt1ggni1R18KT0
         wTur71Aq+nogDrvEyg/JiyxQvwJ6sg3EHKa9DHR04tlqf/mR5Dfmk7uq3zIUHmObxY
         GcyBZQzGC7ZlH1bKsFMAtsIZVfNMMsj9w5MudY+c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12REWpUA038074
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 27 Mar 2021 09:32:51 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 27
 Mar 2021 09:31:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 27 Mar 2021 09:31:29 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12REVTW7034885;
        Sat, 27 Mar 2021 09:31:29 -0500
Received: from localhost ([10.250.33.213])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 12REVTAQ038804;
        Sat, 27 Mar 2021 09:31:29 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/2] TI K3 R5F remoteproc support on AM64x SoCs
Date:   Sat, 27 Mar 2021 09:31:15 -0500
Message-ID: <20210327143117.1840-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following series is a minor revision of the K3 R5F remoteproc AM64x
support series [1] addressing one review comment from Mathieu. Please
see the v1 cover-letter for details about the revised R5F IP in TI AM64x
SoCs. 

Only change is in Patch 2, binding patch is unchanged from v1. Also,
corrected the AM46x typo in the cover-letter title :)

regards
Suman

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20210318215842.8196-1-s-anna@ti.com/

Suman Anna (2):
  dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
  remoteproc: k3-r5: Extend support to R5F clusters on AM64x SoCs

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  31 +++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 149 ++++++++++++++----
 2 files changed, 146 insertions(+), 34 deletions(-)

-- 
2.30.1

