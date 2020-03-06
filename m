Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4DA617C635
	for <lists+linux-remoteproc@lfdr.de>; Fri,  6 Mar 2020 20:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgCFTV0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 6 Mar 2020 14:21:26 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:63441 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726194AbgCFTVZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Mar 2020 14:21:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583522485; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=piXTaqCWbh+pl4OG3SQEESYx+jI27po7fx9Q0GyAWjw=; b=d2uL3pkP727DAjlcSt9tMYqbq/EuPJEnsAKuts2eFH9jo0Zhq36sOIXdMdM1pHSzo4AblK6A
 Zpfq09pGLpf1CIwIQLn5wI9bf7SQLpBcP83Szp/0GizKlOx7in48z0yGXNFjU2NLbrQo5nNL
 1k3Yywtv5AGIjNVn70eLRqvqo+k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e62a2b0.7fb60665d570-smtp-out-n01;
 Fri, 06 Mar 2020 19:21:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39CE9C433BA; Fri,  6 Mar 2020 19:21:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86130C433D2;
        Fri,  6 Mar 2020 19:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86130C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 0/2] Introduce PAS based Secure Subsystem rproc driver
Date:   Fri,  6 Mar 2020 11:21:05 -0800
Message-Id: <1583522467-3499-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Qualcomm SOCs have a secure remote processor that provides secure
execution environment for processing sensitive data and also performs
cryptographic operations using protected keys stored in its secure
storage. This patch series introduces a Peripheral Authentication
based remoteproc driver that handles booting, shutdown and crash
scenarios for SPSS. Also this driver can handle late attach usecase
where remote  processor is already booted even before linux. This
patchset builds up on the skip firmware load patch
"remoteproc: add support to skip firmware load when recovery" which is
in review.

Rishabh Bhatnagar (2):
  remoteproc: qcom: Add PAS based SPSS PIL driver
  dt-bindings: remoteproc: Add documentation for SPSS remoteproc

 .../devicetree/bindings/remoteproc/qcom,spss.txt   | 114 +++++
 drivers/remoteproc/Kconfig                         |  17 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_spss.c                     | 500 +++++++++++++++++++++
 4 files changed, 632 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,spss.txt
 create mode 100644 drivers/remoteproc/qcom_spss.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
