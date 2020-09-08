Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87742617FA
	for <lists+linux-remoteproc@lfdr.de>; Tue,  8 Sep 2020 19:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbgIHRqR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 8 Sep 2020 13:46:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37114 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731272AbgIHRqO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Sep 2020 13:46:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088Hk88t100266;
        Tue, 8 Sep 2020 12:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599587168;
        bh=KE3LbvtjmHv/vDgNGPxvvQuZCln41PZaxww0wu2kX50=;
        h=From:To:CC:Subject:Date;
        b=cCKtvMawLshc8BLA6VAdfMZ0h2ASpYArAHqDGzX4fDE48Y8LJ5ECo+RiyNnuwDrOb
         wqtm8VDL9coKFsocgV/reyIjVYv+DSIusFLvtKLUAZnLnEMTT5v7ZJHc0LazUFS0a5
         l2ibPAklthcYfces9jFEdf/3IAW/Gaq6q5DPolvk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088Hk8m6099103
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Sep 2020 12:46:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 12:46:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 12:46:08 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088Hk8Ta065276;
        Tue, 8 Sep 2020 12:46:08 -0500
Received: from localhost ([10.250.34.59])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 088Hk89l097392;
        Tue, 8 Sep 2020 12:46:08 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v4 0/4] TI K3 R5F remoteproc support
Date:   Tue, 8 Sep 2020 12:45:52 -0500
Message-ID: <20200908174556.21277-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following is v4 of the TI K3 R5F remoteproc driver series supporting all
the R5F processor clusters/subsystems on TI AM65x and J721E SoCs. Please
see the v1 cover-letter [1] for the features supported on these R5F processors.

This series is a rebased version on top of the latest v5.9-rc baseline and
includes very minor fixes w.r.t v3. The previous K3 DSP dependencies are now
available in mainline kernel. Please see the individual patches for the delta
differences (Only patches 1 and 2 updated).

Bjorn,
This series is only waiting on bindings ack and the conclusion on the bindings
discussion from v2 [4] on which I haven't seen any forward progress on this 
despite all the clarifications. I do not expect any changes even w.r.t System DT,
and we can't really have a common binding between TI and Xilinx R5Fs. How can we
take this series forward? It is blocking us to get the various usecases that
leverage the remoteprocs upstream.

regards
Suman

[1] R5F v1: https://patchwork.kernel.org/cover/11456367/
[2] R5F v2: https://patchwork.kernel.org/cover/11632993/
[3] R5F v3: https://patchwork.kernel.org/cover/11679327/
[4] https://patchwork.kernel.org/patch/11632997/

Suman Anna (4):
  dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs
  remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem
  remoteproc: k3-r5: Initialize TCM memories for ECC
  remoteproc: k3-r5: Add loading support for on-chip SRAM regions

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  281 ++++
 drivers/remoteproc/Kconfig                    |   13 +
 drivers/remoteproc/Makefile                   |    1 +
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 1395 +++++++++++++++++
 4 files changed, 1690 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_r5_remoteproc.c

-- 
2.28.0

