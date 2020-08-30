Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA89256EAD
	for <lists+linux-remoteproc@lfdr.de>; Sun, 30 Aug 2020 16:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgH3OlN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 30 Aug 2020 10:41:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26312 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgH3OjZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 30 Aug 2020 10:39:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598798365; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mFIGYUIuVh/l0SGKENzwzwQMyfePN8+YBegyW6nrCD0=; b=pHgLw3QUtPMKkOYT9cfS6gXvJUW+X5G5buDAddKr6e8ir1XEwKrKbImd106P1WsTP/RjsMpd
 RtsBtwOHzG5JbwP+Xxi5WHQFHSNks+X/6hnt3N7ENF2mWM9Zmf1Ew3lt3/YYXX+3AUW/dQWe
 F65zygPkfAOhWIhSe0B/3M6IbSU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f4bb9eba816b7fb4893d618 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 30 Aug 2020 14:38:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0FA4C43387; Sun, 30 Aug 2020 14:38:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54078C433C6;
        Sun, 30 Aug 2020 14:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54078C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V1 0/4] General qrtr fixes
Date:   Sun, 30 Aug 2020 20:08:08 +0530
Message-Id: <1598798292-5971-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Arun Kumar Neelakantam (1):
  net: qrtr: Check function pointer before calling

Chris Lew (3):
  net: qrtr: Do not send packets before hello negotiation
  net: qrtr: Add socket mode optimization
  net: qrtr: Change port allocation to use cyclic idr

 net/qrtr/qrtr.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 77 insertions(+), 16 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

