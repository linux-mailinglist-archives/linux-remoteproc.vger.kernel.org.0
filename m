Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D621E23F53F
	for <lists+linux-remoteproc@lfdr.de>; Sat,  8 Aug 2020 01:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgHGXcT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 7 Aug 2020 19:32:19 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:24146 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726066AbgHGXcS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:32:18 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Aug 2020 16:32:18 -0700
Received: from th-lint-015.qualcomm.com ([10.63.177.64])
  by ironmsg05-sd.qualcomm.com with ESMTP; 07 Aug 2020 16:32:17 -0700
Received: by th-lint-015.qualcomm.com (Postfix, from userid 2383757)
        id 0C4B4174E; Fri,  7 Aug 2020 16:32:16 -0700 (PDT)
From:   Gurbir Arora <gurbaror@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, rishabhb@codeaurora.org,
        Gurbir Arora <gurbaror@codeaurora.org>
Subject: [PATCH 0/3] Introduce mini-dump support for remoteproc.
Date:   Fri,  7 Aug 2020 16:31:58 -0700
Message-Id: <1596843121-82576-1-git-send-email-gurbaror@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Sometimes firmware sizes can be in ten's of MB's and reading
all the memory during coredump can consume lot of time and
memory.
Introducing support for mini-dumps. Mini-dump contains smallest
amount of useful information, that could help to debug subsystem
crashes.
During bootup memory is allocated in SMEM (Shared memory)
in the form of a table that contains the physical
addresses and sizes of the regions that are supposed to be
collected during coredump. This memory is shared amongst all
processors in a Qualcomm platform, so all remoteprocs
fill in their entry in the global table once they are out
of reset.
This patch series adds support for parsing the global minidump
table and uses the current coredump frameork to expose this memory
to userspace during remoteproc's recovery.

This patch series also integrates the patch:
https://patchwork.kernel.org/patch/11695541/ sent by Siddharth.

Gurbir Arora (2):
  remoteproc: core: Add coredump to remoteproc ops
  remoteproc: qcom: Add capability to collect minidumps

Rishabh Bhatnagar (1):
  remoteproc: qcom: Add minidump id for sm8150 modem remoteproc

 drivers/remoteproc/qcom_minidump.h          |  64 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c          |  21 ++-
 drivers/remoteproc/remoteproc_core.c        |   7 +-
 drivers/remoteproc/remoteproc_coredump.c    | 211 +++++++++++++++++++++++++++-
 drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++
 drivers/remoteproc/remoteproc_internal.h    |   2 +
 include/linux/remoteproc.h                  |   3 +
 7 files changed, 331 insertions(+), 4 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_minidump.h

-- 
1.9.1

