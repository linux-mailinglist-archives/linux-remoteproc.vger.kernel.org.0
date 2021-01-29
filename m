Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171C3308B29
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 Jan 2021 18:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhA2RNl (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 29 Jan 2021 12:13:41 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:21204 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhA2RMw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Jan 2021 12:12:52 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 09:12:10 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 09:12:07 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jan 2021 22:42:00 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 7440E219F7; Fri, 29 Jan 2021 22:42:00 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 0/3] remoteproc: qcom: q6v5-wcss: Add driver data for IPQ6018
Date:   Fri, 29 Jan 2021 22:41:57 +0530
Message-Id: <1611940320-24830-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Q6 based WiFi fw loading is supported across
different targets, ex: IPQ8074/QCS404. In order to
support different fw name for IPQ6018, populate
hardcoded param using compatible and driver data.

This series depends on
[PATCH v8] remoteproc: qcom: q6v5-wcss: Add support for secure pil

Gokul Sriram Palanisamy (3):
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for IPQ6018
  remoteproc: qcom: wcss: populate driver data for IPQ6018
  arm64: dts: ipq6018: Update WCSS PIL driver compatible

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt      |  4 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi                 |  2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c                   | 19 +++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.7.4

