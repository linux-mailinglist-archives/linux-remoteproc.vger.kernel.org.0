Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F87223F545
	for <lists+linux-remoteproc@lfdr.de>; Sat,  8 Aug 2020 01:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgHGXcZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 7 Aug 2020 19:32:25 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46483 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726262AbgHGXcW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:32:22 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Aug 2020 16:32:21 -0700
Received: from th-lint-015.qualcomm.com ([10.63.177.64])
  by ironmsg03-sd.qualcomm.com with ESMTP; 07 Aug 2020 16:32:20 -0700
Received: by th-lint-015.qualcomm.com (Postfix, from userid 2383757)
        id D5C8D174E; Fri,  7 Aug 2020 16:32:20 -0700 (PDT)
From:   Gurbir Arora <gurbaror@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, rishabhb@codeaurora.org,
        Gurbir Arora <gurbaror@codeaurora.org>
Subject: [PATCH 1/3] remoteproc: core: Add coredump to remoteproc ops
Date:   Fri,  7 Aug 2020 16:31:59 -0700
Message-Id: <1596843121-82576-2-git-send-email-gurbaror@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596843121-82576-1-git-send-email-gurbaror@codeaurora.org>
References: <1596843121-82576-1-git-send-email-gurbaror@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Each remoteproc might have different requirements for coredumps and might
want to choose the type of dumps it wants to collect. This change allows
remoteproc drivers to specify their own custom dump function to be executed
in place of rproc_coredump. If the coredump op is not specified by the
remoteproc driver it will be set to rproc_coredump by default.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 include/linux/remoteproc.h           | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7f90eee..283ecb6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1681,7 +1681,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 		goto unlock_mutex;
 
 	/* generate coredump */
-	rproc_coredump(rproc);
+	rproc->ops->coredump(rproc);
 
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
@@ -2113,6 +2113,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	rproc->ops->sanity_check = rproc_elf_sanity_check;
 	rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
 
+	/* Default to rproc_coredump if no coredump functions is specified */
+	if (!rproc->ops->coredump)
+		rproc->ops->coredump = rproc_coredump;
+
 	return 0;
 }
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2fa68bf..0ed1a2b 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -392,6 +392,7 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	void (*coredump)(struct rproc *rproc);
 	unsigned long (*panic)(struct rproc *rproc);
 };
 
-- 
1.9.1

