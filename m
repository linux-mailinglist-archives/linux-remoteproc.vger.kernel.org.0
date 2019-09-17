Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB87B4601
	for <lists+linux-remoteproc@lfdr.de>; Tue, 17 Sep 2019 05:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392211AbfIQDbo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 16 Sep 2019 23:31:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43574 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730000AbfIQDbo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Sep 2019 23:31:44 -0400
Received: by mail-io1-f65.google.com with SMTP id v2so4080968iob.10;
        Mon, 16 Sep 2019 20:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AZbBTIbQbqXwZoo2mD7WVQh8P9va3DGLxdwCMpbqykM=;
        b=rGHRRJc6cmlQU6fzDipZt7KO5qJAWDWcnNDKSmndXpk0ewSLW23M8z7MSAS//IRj1l
         tALlRIDw+7SUzX5oZBm7estXiqj5CDURnMfZuF79BxBQ+zBn15C215GlFtTeHRuG5oJR
         v35CbGdsHyQUlJbZwndh7jhpbviDigFIUwvtN87/RcR1LLkquGA24oKzOknAIZzGKLxO
         7oJx7GgYMDJcZTaQBiy1SXTwC0dRQjDNmtdSjt40yzfROfi7nvGYsEyGo683REJTh3cr
         Csz+zl2qSybIJaFl1b9JqdfU0fZdWLhwBvZAW6VFTo1GDKCalj3bu56OLWpXe5/2EyHe
         k8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AZbBTIbQbqXwZoo2mD7WVQh8P9va3DGLxdwCMpbqykM=;
        b=H0T7GzjEzd76Q4M+fZ0zeWuyI2xvoQ6DwrCEEZr3Gb78xewtcJrJ2Uoy02HqXTY7Wh
         wPXhKdlNpvGEAr5jCqHSqAO97xEf0q8Uo+5PTpbIePdn6AUBy+oZq95pT7ugT55Lw+X4
         0q/Ef6854dvkM3Z9cjers0ia9MTaDYv1Ipn5SZ0gb87EvuZ9iQxfcNxpiqrAR3DfEGIH
         LTwDRowj4YD0b9QqzpEyDlqbsMWY2241Yfj+awLnJ0gOSCTnAhE/BlgB2BrraWvCYfFH
         t7thN0U6VI7faKxaP/Q1pUMeJ3tIcq+5lXfEzZecdIBxHFvS5W4u4eULnDUKhaa/jk4u
         SLbQ==
X-Gm-Message-State: APjAAAVgR6KWN4oOwYJYA/Y6CJAcZxUfM16AUVfuG/Yx618weACP4BC4
        YV7/xT1rb1pLuAt/gojQxXgdV4jgRos=
X-Google-Smtp-Source: APXvYqx4BGYBTXWug5NY3wJbo99uGA8r8HQaH6QnaLuCl7KSJytf2lAhCbNRWnl2/4bx5Sw7OH9Ksg==
X-Received: by 2002:a6b:c7c2:: with SMTP id x185mr1469065iof.224.1568691103125;
        Mon, 16 Sep 2019 20:31:43 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id i26sm1134258ion.40.2019.09.16.20.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 20:31:42 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: char: release allocated memory
Date:   Mon, 16 Sep 2019 22:31:23 -0500
Message-Id: <20190917033124.1077-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In rpmsg_eptdev_write_iter, if copy_from_iter_full fails the allocated
buffer needs to be released.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/rpmsg/rpmsg_char.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index eea5ebbb5119..c655074c07c2 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -227,8 +227,10 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 	if (!kbuf)
 		return -ENOMEM;
 
-	if (!copy_from_iter_full(kbuf, len, from))
-		return -EFAULT;
+	if (!copy_from_iter_full(kbuf, len, from)) {
+		ret = -EFAULT;
+		goto free_kbuf;
+	}
 
 	if (mutex_lock_interruptible(&eptdev->ept_lock)) {
 		ret = -ERESTARTSYS;
-- 
2.17.1

