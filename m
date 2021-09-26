Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E078418601
	for <lists+linux-remoteproc@lfdr.de>; Sun, 26 Sep 2021 05:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhIZDco (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 25 Sep 2021 23:32:44 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58052 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhIZDcm (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 25 Sep 2021 23:32:42 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7CFFE2035EF;
        Sun, 26 Sep 2021 05:31:05 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 43E952035F2;
        Sun, 26 Sep 2021 05:31:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 92592183AD0B;
        Sun, 26 Sep 2021 11:31:03 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: [PATCH v5 0/4] Add remoteproc driver for DSP on i.MX
Date:   Sun, 26 Sep 2021 11:07:06 +0800
Message-Id: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Provide a basic driver to control DSP processor found on NXP i.MX8QM,
i.MX8QXP, i.MX8MP and i.MX8ULP.

Currently it is able to resolve addresses between DSP and main CPU,
start and stop the processor, suspend and resume.

The communication between DSP and main CPU is based on mailbox, there
are three mailbox channels (tx, rx, rxdb).

This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.

changes in v5:
- refine driver according to Mathieu's comments

changes in v4:
- merge binding doc to fsl,dsp.yaml for Rob's comments

changes in v3:
- Add this cover letter
- refine clock-names according to Rob's comments
- move common struct from imx_rproc.c to header file
- add IMX_RPROC_SCU_API enum item
- refine driver according to Mathieu's comments

changes in v2:
- change syscon to fsl,dsp-ctrl
- add items for clock-names

Shengjiu Wang (4):
  remoteproc: imx_rproc: Move common structure to header file
  remoteproc: imx_rproc: Add IMX_RPROC_SCU_API method
  remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX
  dt-bindings: dsp: fsl: update binding document for remote proc driver

 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   81 +-
 drivers/remoteproc/Kconfig                    |   11 +
 drivers/remoteproc/Makefile                   |    1 +
 drivers/remoteproc/imx_dsp_rproc.c            | 1206 +++++++++++++++++
 drivers/remoteproc/imx_rproc.c                |   28 +-
 drivers/remoteproc/imx_rproc.h                |   39 +
 6 files changed, 1333 insertions(+), 33 deletions(-)
 create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
 create mode 100644 drivers/remoteproc/imx_rproc.h

-- 
2.17.1

