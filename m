Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A70F1C9AAB
	for <lists+linux-remoteproc@lfdr.de>; Thu,  7 May 2020 21:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbgEGTPS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 7 May 2020 15:15:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgEGTPR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 May 2020 15:15:17 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D16B2208E4;
        Thu,  7 May 2020 19:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588878917;
        bh=dmkjYUSRjBOU9cIkMaN7hPDyFaInZqjL3fVGYpepZAY=;
        h=Date:From:To:Cc:Subject:From;
        b=vDWIkb78pKi3Do4eX6sHoac2nBFhl0TvC8Bg1W7pkXVVWkLMNGuStpJvbPHZ5EE45
         EsbLT7KX8Wxap4YE26VR7C8nh3j/jK+erlujs0+UyHn5XXnkbEyYtlLuhQTRQrxLm4
         GKZE/vRe6vtniDmY6qeISUWHGeuIrP3Qehew8lOk=
Date:   Thu, 7 May 2020 14:19:43 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: Replace zero-length array with flexible-array
Message-ID: <20200507191943.GA16033@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/linux/remoteproc.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 9c07d7958c53..e6267fba00e6 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -73,7 +73,7 @@ struct resource_table {
 	u32 ver;
 	u32 num;
 	u32 reserved[2];
-	u32 offset[0];
+	u32 offset[];
 } __packed;
 
 /**
@@ -87,7 +87,7 @@ struct resource_table {
  */
 struct fw_rsc_hdr {
 	u32 type;
-	u8 data[0];
+	u8 data[];
 } __packed;
 
 /**
@@ -306,7 +306,7 @@ struct fw_rsc_vdev {
 	u8 status;
 	u8 num_of_vrings;
 	u8 reserved[2];
-	struct fw_rsc_vdev_vring vring[0];
+	struct fw_rsc_vdev_vring vring[];
 } __packed;
 
 struct rproc;

