Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3241E54AE
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 May 2020 05:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgE1Dez (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 May 2020 23:34:55 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:46721 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726856AbgE1Dez (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 May 2020 23:34:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590636894; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Tt14DLw/lhIXFc656zdZe9CQpIPrUXpBgC236pfTA7g=; b=a+28BDNUGehxTzeG3fHAGvTa+4grW9qX7xWLWxgtO8NJLcTojwhMr7J5E+JTwLVkRPd6/VYU
 j3Yy467MWsJauv/Xm4IsjABSB+QBolr853Wm1EN8sTMy2ZHuCZeTYuYYGKdJUthcn44O0YZR
 HrhHKEhD3tJZkfIuxhqpeGELrjo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ecf315db65440fdbaf58863 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 03:34:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05243C433C9; Thu, 28 May 2020 03:34:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C809C433C6;
        Thu, 28 May 2020 03:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C809C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v4 0/2] Extend SSR notifications framework
Date:   Wed, 27 May 2020 20:34:41 -0700
Message-Id: <1590636883-30866-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This set of patches gives kernel client drivers the ability to register
for a particular remoteproc's SSR notifications. Also the notifications
are extended to before/after-powerup/shutdown stages.
It also fixes the bug where clients need to register for notifications
again if the platform driver is removed. This is done by creating a
global list of per-remoteproc notification info data structures which
remain static. An API is exported to register for a remoteproc's SSR
notifications and uses remoteproc's ssr_name and notifier block as
arguments. 

Changelog:
v4 -> v3:
- Fix naming convention 

v3 -> v2:
- Create a global list of per remoteproc notification data structure
- Pass ssr_name and crashed information as part of notification data
- Move notification type enum to qcom_rproc.h from remoteproc.h

 v2 -> v1:
- Fix commit text

Rishabh Bhatnagar (1):
  remoteproc: qcom: Add per subsystem SSR notification

Siddharth Gupta (1):
  remoteproc: qcom: Add notification types to SSR

 drivers/remoteproc/qcom_common.c      | 126 ++++++++++++++++++++++++++++++----
 drivers/remoteproc/qcom_common.h      |   5 +-
 include/linux/remoteproc/qcom_rproc.h |  34 +++++++--
 3 files changed, 146 insertions(+), 19 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

