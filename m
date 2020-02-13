Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A7115B606
	for <lists+linux-remoteproc@lfdr.de>; Thu, 13 Feb 2020 01:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgBMAp2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Feb 2020 19:45:28 -0500
Received: from gateway23.websitewelcome.com ([192.185.49.177]:40915 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729103AbgBMAp2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Feb 2020 19:45:28 -0500
X-Greylist: delayed 1363 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 19:45:27 EST
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id AB75F57B4
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Feb 2020 18:22:43 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 22HDj6JzwRP4z22HDjXugl; Wed, 12 Feb 2020 18:22:43 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tA9Nxa5icE0djE3yLFy7vpyj4unEuRLX7Ll55JKtKiY=; b=ZRvCCq3gLOgyreUkrdt8kcd8fF
        icWGLgFrwAQHJZGUeD9H/5V4KEIv1ohbRviWpDuwQnqSrtPuau0txGptr/VRewfSmU6v8Lz5kvt/V
        1PDF1ki2YM0yfXtF+CVxe91oQ/rAB3k6ofwrE1NhpLgBDLC7YeK6G8nWZL9ZqAcOGqPOa2TPMuRP2
        eJJMTqypYAlPi2EHFfuc/lJMhkcuVkz8UekutODzTrAHB8FlKDiWRrlP44RnkkkAjcYeP4LTk8PUN
        doHIsL1fJsh8TxruCoXkwwhoRjQvaq3KxzDI6YbyaAQssgjjWoFJdGu+et7GQ0YDUFsNAqrNvt5Oy
        gXKfibXQ==;
Received: from [200.68.141.42] (port=25619 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j22HB-003Y39-Nk; Wed, 12 Feb 2020 18:22:42 -0600
Date:   Wed, 12 Feb 2020 18:22:39 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] rpmsg: virtio_rpmsg_bus: Replace zero-length array with
 flexible-array member
Message-ID: <20200213002239.GA30190@embeddedor.com>
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
X-Source-IP: 200.68.141.42
X-Source-L: No
X-Exim-ID: 1j22HB-003Y39-Nk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.141.42]:25619
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 28
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
 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 376ebbf880d6..07d4f3374098 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -89,7 +89,7 @@ struct rpmsg_hdr {
 	u32 reserved;
 	u16 len;
 	u16 flags;
-	u8 data[0];
+	u8 data[];
 } __packed;
 
 /**
-- 
2.23.0

