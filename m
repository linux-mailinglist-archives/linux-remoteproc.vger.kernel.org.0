Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CA11DAEF2
	for <lists+linux-remoteproc@lfdr.de>; Wed, 20 May 2020 11:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgETJj7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 20 May 2020 05:39:59 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53180 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726435AbgETJj7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 May 2020 05:39:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589967598; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nV13h5PX71gonzpbX+Edt0PcuYoJs3RX9Ta6lg4GJkw=; b=U9/XVzh8HzviUhPpdeebY/THPNxRrZNy0u9SF/tSMyrP+HLWdIUDKnsfbAJ6k8o305DesTNp
 +YV5OCZ2w3MOgTda4Rh4hUsjLeyiVoB05XZVYFqD/fjj+KppaOs3mHIqtdk/E2HcEGEn0w92
 FAnPIOt0GCVbBbVLh+DBidr273U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec4fae9.7f76fd1fd8f0-smtp-out-n01;
 Wed, 20 May 2020 09:39:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 57526C433C8; Wed, 20 May 2020 09:39:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A571AC433C6;
        Wed, 20 May 2020 09:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A571AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V5 0/5] Add chrdev and name query support for GLINK
Date:   Wed, 20 May 2020 15:09:34 +0530
Message-Id: <1589967579-15559-1-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for the GLINK rpmsg transport to register a rpmsg chrdev.
This will create the rpmsg_ctrl nodes for userspace clients to open 
rpmsg epts. The rpmsg chrdev allocation is done by allocating a local
channel which also allocates an ept. We need to add some guards against
edge cases for this chrdev because it will never fully open.

Changes since v5:
- Re-orange the completion_done code

Changes since v4:
- Resending by removing approved patches

Changes since v3:
- Change to device_add_group for rpmsg name attr
- Add patch to unregister the rpmsg device
- Add patch to support compat ioctl for rpmsg char driver

Changes since v2:
- Revert change to make glink attribute table const

Changes since v1:
- Add explanation to dt-bindings commit message
- Add patch complete_all the open_req/ack variables
- Add patch to prevent null pointer dereference in chrdev channel release
- Change chrdev allocation to use glink channel allocation
- Change glink attr struct to const

Arun Kumar Neelakantam (1):
  rpmsg: glink: unregister rpmsg device during endpoint destroy

Chris Lew (4):
  rpmsg: glink: Use complete_all for open states
  rpmsg: Guard against null endpoint ops in destroy
  rpmsg: glink: Add support for rpmsg glink chrdev
  rpmsg: glink: Expose rpmsg name attr for glink

 drivers/rpmsg/qcom_glink_native.c | 79 +++++++++++++++++++++++++++++++++++++--
 drivers/rpmsg/rpmsg_core.c        |  2 +-
 2 files changed, 77 insertions(+), 4 deletions(-)

-- 
2.7.4
