Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C70525B8E4
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Sep 2020 04:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgICCwB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Sep 2020 22:52:01 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34057 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726528AbgICCwA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 22:52:00 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Sep 2020 19:51:58 -0700
Received: from th-lint-039.qualcomm.com ([10.63.179.124])
  by ironmsg01-sd.qualcomm.com with ESMTP; 02 Sep 2020 19:51:58 -0700
Received: by th-lint-039.qualcomm.com (Postfix, from userid 2383757)
        id 4F6E71B66; Wed,  2 Sep 2020 19:51:58 -0700 (PDT)
From:   Gurbir Arora <gurbaror@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, rishabhb@codeaurora.org,
        Gurbir Arora <gurbaror@codeaurora.org>
Subject: [PATCH v2 0/3] Introduce mini-dump support for remoteproc.
Date:   Wed,  2 Sep 2020 19:51:53 -0700
Message-Id: <1599101516-243760-1-git-send-email-gurbaror@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

Changelog: 

v1 -> v2:
- 3 kernel test robot warnings have been resolved.
- Introduced priv_cleanup op in order to making the cleaning of
private elements used by the remoteproc more readable.
- Removed rproc_cleanup_priv as it is no longer needed.
- Switched to if/else format for rproc_alloc in order to keep 
the static const decalaration of adsp_minidump_ops.

Gurbir Arora (3):
  remoteproc: core: Add multiple components to remoteproc ops
  remoteproc: qcom: Add capability to collect minidumps
  remoteproc: qcom: Add minidump id for sm8150 modem remoteproc

 drivers/remoteproc/qcom_minidump.h          |  64 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c          |  36 ++++-
 drivers/remoteproc/remoteproc_core.c        |   6 +-
 drivers/remoteproc/remoteproc_coredump.c    | 203 +++++++++++++++++++++++++++-
 drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++
 drivers/remoteproc/remoteproc_internal.h    |   1 +
 include/linux/remoteproc.h                  |   4 +
 7 files changed, 337 insertions(+), 4 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_minidump.h

-- 
2.7.4

