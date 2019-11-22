Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2138510699D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 Nov 2019 11:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKVKGv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 22 Nov 2019 05:06:51 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:59618
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726568AbfKVKGv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Nov 2019 05:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574417210;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=lX0v2XY0noOshpJ5mHv1R7wlE0zYdmLyaeKbrAftS3k=;
        b=M4P4SSrixb44AudnsYYRDwuYOEe+bBe7No7L93CHWm2Fv3AMPDRX/HEUmLZgovRH
        ClDj6vhxOAo7zzGfr7yMQVTVBbIvbns0P1jyv0x5+nWGF2F5D3jFXYAAB+R7AK+Vqov
        /kDJZKgUrm3LQa9v2B+fHPnT4xeHwjPtT5/QrwkA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574417210;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=lX0v2XY0noOshpJ5mHv1R7wlE0zYdmLyaeKbrAftS3k=;
        b=H4tln2QjpriGiMsBYqMbN8NjdGmRfTkQtb8t5K1wa9eB9y81fkgqxM5kg0SXtWEJ
        4CO+h/58PIqnzSjlIStfs1Xt6ZvZLTLyQhRiAKyQyUYcUWpX6tJKxBzDXyI7SHK3/Xt
        0fSeYGxAEqnkNkznDoXKYcZKn20sJOKLO6QTp8po=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C8CCC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [RESEND PATCH V4 0/4] Add TIOCM Signals support for RPMSG char devices
Date:   Fri, 22 Nov 2019 10:06:50 +0000
Message-ID: <0101016e92941bcc-36d9920e-39c3-49b0-87fc-74ff3d4203e4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.11.22-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Glink transport support signals to exchange state notification between
local and remote side clients. Adding support to send/receive the signal
command and notify the clients through callback and POLL notification.

Changes since v3:
- Correct the TICOMGET case handling as per new rpmsg_get_signals prototype
- Update the rpmsg_get_signals function header

Changes since v2:
- Modify the rpmsg_get_signals function prototype

Changes since v1:
- Split the patches as per functional areas like core, char, glink
- Add set, clear mask for TIOCMSET
- Merge the char signal callback and POLLPRI patches

Arun Kumar Neelakantam (4):
  rpmsg: core: Add signal API support
  rpmsg: glink: Add support to handle signals command
  rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
  rpmsg: char: Add signal callback and POLLPRI support

 drivers/rpmsg/qcom_glink_native.c | 126 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  74 +++++++++++++++++++++-
 drivers/rpmsg/rpmsg_core.c        |  41 +++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   5 ++
 include/linux/rpmsg.h             |  26 ++++++++
 5 files changed, 269 insertions(+), 3 deletions(-)

-- 
1.9.1

