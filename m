Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32647184D26
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Mar 2020 18:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCMRBE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 13 Mar 2020 13:01:04 -0400
Received: from m17617.mail.qiye.163.com ([59.111.176.17]:13074 "EHLO
        m17617.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgCMRBE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Mar 2020 13:01:04 -0400
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Mar 2020 13:01:00 EDT
Received: from ubuntu.localdomain (unknown [58.251.74.227])
        by m17617.mail.qiye.163.com (Hmail) with ESMTPA id 3789F26148A;
        Sat, 14 Mar 2020 00:51:08 +0800 (CST)
From:   Wang Wenhu <wenhu.wang@vivo.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     trivial@kernel.org, kernel@vivo.com,
        Wang Wenhu <wenhu.wang@vivo.com>
Subject: [PATCH] rpmsg: fix a comment typo for rpmsg_device_match()
Date:   Fri, 13 Mar 2020 09:50:49 -0700
Message-Id: <20200313165049.62907-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VIQ0xLS0tLQ0hCSUhIT1lXWShZQU
        hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OD46Iyo5AjgyTzAuLEkSIjAK
        C0IKCS1VSlVKTkNPSkpDSUxKTkpCVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
        Q1VJTkpVTE9VSUlMWVdZCAFZQUpNS003Bg++
X-HM-Tid: 0a70d4ce84469375kuws3789f26148a
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Should be 'a' rather than 'an'.

Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
---
 drivers/rpmsg/rpmsg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e330ec4dfc33..a6361cad608b 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -284,7 +284,7 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
 
 /*
- * match an rpmsg channel with a channel info struct.
+ * match a rpmsg channel with a channel info struct.
  * this is used to make sure we're not creating rpmsg devices for channels
  * that already exist.
  */
-- 
2.17.1

