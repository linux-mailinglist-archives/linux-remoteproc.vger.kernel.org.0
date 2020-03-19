Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E3818C2AE
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Mar 2020 23:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgCSWBR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 19 Mar 2020 18:01:17 -0400
Received: from gateway33.websitewelcome.com ([192.185.146.130]:33160 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727302AbgCSWBR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Mar 2020 18:01:17 -0400
X-Greylist: delayed 1353 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:01:16 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id E473C4B9B2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2020 16:38:42 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F2sEjCDjSEfyqF2sEjCGed; Thu, 19 Mar 2020 16:38:42 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8t+GKURvPsiO09P1cerppTv6KLHnl8mv7NQMq1iJcNM=; b=ySM5kIDMuSsDptGkthLtuvRg7z
        AHjQu993DIg+zVXmTFYBvwUSfH38F8YRbaUBx5nS3bw3OFdIj+ORziSAD/H1MXC9jGyEXALYJp9VM
        0KR9g9foGdFdFdkHxSXxA0kcDuQTvxRvw83/YgYiyQ6fYR4K/pBegimesX29m9jysPtdFbTJuKpLh
        Zd91PNJXiVV+VIYpicABw/dQ6FI4ZsrmyJsY8LjNzE2xeUnK2VJxyz5ubdid3gzOLzVgxZxVgoGyy
        SWZIcIUE43DL0NgOlcxQFjYoVMBKV+K32YzVsCLPvQ7B0u9yVPs2lB5fy1VAAMkw5iW+mFipm1AIq
        VVe5OPCw==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53364 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF2sC-001gsA-8G; Thu, 19 Mar 2020 16:38:40 -0500
Date:   Thu, 19 Mar 2020 16:38:39 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] hwspinlock: hwspinlock_internal.h: Replace zero-length
 array with flexible-array member
Message-ID: <20200319213839.GA10669@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF2sC-001gsA-8G
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53364
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 40
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwspinlock/hwspinlock_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 9eb6bd020dc7..29892767bb7a 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -56,7 +56,7 @@ struct hwspinlock_device {
 	const struct hwspinlock_ops *ops;
 	int base_id;
 	int num_locks;
-	struct hwspinlock lock[0];
+	struct hwspinlock lock[];
 };
 
 static inline int hwlock_to_id(struct hwspinlock *hwlock)
-- 
2.23.0

