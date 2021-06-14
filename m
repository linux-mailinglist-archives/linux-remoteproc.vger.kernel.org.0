Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C095D3A7093
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Jun 2021 22:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbhFNUnA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Jun 2021 16:43:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24019 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbhFNUnA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 16:43:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623703257; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wMvFvYlAu8/pSGZVYLtUuw7jWYqW1OvLE8HlOOTAm68=; b=g5BuH20LaiDP+sbGhhnpajlGZQQVs9YyVV6VGmz5MpPvJCo3CheCl6Y0wyLSo3CVK6qNRnQT
 eioDFPbYxRWoKiv0+ioYtbtXZpNiGQcqZQXrU7L4BxHRjVm9CLYYr+ADz6If1wr3ePvqEHQZ
 m9dSez20r1e85bkRILHNiR6zEaw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c7bed8e27c0cc77f4f0fd4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 20:40:56
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E68EC4323A; Mon, 14 Jun 2021 20:40:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40E39C433D3;
        Mon, 14 Jun 2021 20:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40E39C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: [PATCH v2 0/4] remoteproc: core: Fixes for rproc cdev and add
Date:   Mon, 14 Jun 2021 13:40:40 -0700
Message-Id: <1623703244-26814-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series contains stability fixes and error handling for remoteproc.

The changes included in this series do the following:
Patch 1: Fixes the creation of the rproc character device.
Patch 2: Validates rproc as the first step of rproc_add().
Patch 3: Fixes the rproc cdev remove and the order of dev_del() and cdev_del().
Patch 4: Adds error handling in rproc_add().

v1 -> v2:
- Added extra patch which addresses Bjorn's comments on patch 3
  from v1.
- Fixed commit text for patch 2 (s/calling making/making).

Siddharth Gupta (4):
  remoteproc: core: Move cdev add before device add
  remoteproc: core: Move validate before device add
  remoteproc: core: Fix cdev remove and rproc del
  remoteproc: core: Cleanup device in case of failure

 0000-cover-letter.patch.backup       | 26 ++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_cdev.c |  2 +-
 drivers/remoteproc/remoteproc_core.c | 27 ++++++++++++++++++---------
 3 files changed, 45 insertions(+), 10 deletions(-)
 create mode 100644 0000-cover-letter.patch.backup

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

