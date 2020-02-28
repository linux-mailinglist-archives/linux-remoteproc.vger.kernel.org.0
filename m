Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFFAD173FB3
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 Feb 2020 19:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgB1SeH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 28 Feb 2020 13:34:07 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:43952 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgB1SeG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Feb 2020 13:34:06 -0500
Received: by mail-yw1-f66.google.com with SMTP id f204so4202592ywc.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Feb 2020 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EH+UfAG3Moaz/zeIaZSYJJWmoPikxMZ1T1SkhnjF0wU=;
        b=UiBE4LUUyWqKf3RBr/SRdVBrgfZDD9K/4Pf1Yrwxg9Q/2icOm+kek4+X23P2F0Vk3p
         8I+ub/S6DKjZasKOjoFmG6Iac/pvt5dtjIPL7eXrQttzLM/toOC/39xGM3zmC5VYVoCg
         8KnVuJuenFzirRMWG6fSagXGMRcOZTHEp53x4pHwM8oO/xr1SaWjy2p7ZNd0AmIfBpCR
         A6O1/pLE2Enu1VHhJ9W9knf8ka8o6bCQsmbwTNwHfGcvJEo9PfrGyuTw7WqLzY00gV2v
         wKZRniTNdnUJDUVzSK7H4JdxMHp4FUaVTvV2hZFjSdSOD7/REivyauQBy2ymKR2Tn+Ju
         pWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EH+UfAG3Moaz/zeIaZSYJJWmoPikxMZ1T1SkhnjF0wU=;
        b=ukRoC2fAK0pSWL8DNMTDdGZcWtvZq9LMg20fFG8NBpgqdMLkE/pJ700H2qG4kVwMKK
         90qxVF3BUHRekt6Ra58Vu89FRpoV8pG7OaU2azCk5BqZKvA7BZyvIbSu3SaKVEt/mzVY
         e7WGiu2FlQSo9oPWop5Z6nI39zebT1HFgRraTQXNWt17BVkpGZwsBpa8qN/km0MzkT7Y
         TlSYj3Jw904qM/XQws5aR/s5PTiRwizKa5dtg+7EbXFlOG/om7NhrLCc/4B7mwo5wjt7
         Dorcvz7LqF6gdcywYQkQLLrlIBc7TIhvb3jgcXHLsxFp9GoWWOeV9qMhaQo0Es1q/mrx
         X8KA==
X-Gm-Message-State: APjAAAWSKj3oCqKDDM0SB+FTN/ABpnrP00r/QoyWLQyNNJweWSXBSbeq
        TD1+e8TOPz0qAJiaVKSKXZwQZg==
X-Google-Smtp-Source: APXvYqz+sl6V3tkKPiNzqxIm0lykhAAZHbbZJj9QhcnMa0+XvYu4P4D/XJJiv2YnN2vJ01AOUeO9ww==
X-Received: by 2002:a25:6d54:: with SMTP id i81mr4658616ybc.323.1582914845509;
        Fri, 28 Feb 2020 10:34:05 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o127sm4409884ywf.43.2020.02.28.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:34:05 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] remoteproc: remoteproc debugfs file fixes
Date:   Fri, 28 Feb 2020 12:33:57 -0600
Message-Id: <20200228183359.16229-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Don't bother checking the remoteproc state before calling
rproc_trigger_recovery() because that function will verify the
state, and the state can only be safely checked while holding the
mutex anyway.

Make the mode for "recovery" be writable.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index dd93cf04e17f..e995dc49c231 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -138,16 +138,14 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 		buf[count - 1] = '\0';
 
 	if (!strncmp(buf, "enabled", count)) {
+		/* change the flag and begin the recovery process if needed */
 		rproc->recovery_disabled = false;
-		/* if rproc has crashed, trigger recovery */
-		if (rproc->state == RPROC_CRASHED)
-			rproc_trigger_recovery(rproc);
+		rproc_trigger_recovery(rproc);
 	} else if (!strncmp(buf, "disabled", count)) {
 		rproc->recovery_disabled = true;
 	} else if (!strncmp(buf, "recover", count)) {
-		/* if rproc has crashed, trigger recovery */
-		if (rproc->state == RPROC_CRASHED)
-			rproc_trigger_recovery(rproc);
+		/* begin the recovery process without changing the flag */
+		rproc_trigger_recovery(rproc);
 	}
 
 	return count;
@@ -349,7 +347,7 @@ void rproc_create_debug_dir(struct rproc *rproc)
 
 	debugfs_create_file("name", 0400, rproc->dbg_dir,
 			    rproc, &rproc_name_ops);
-	debugfs_create_file("recovery", 0400, rproc->dbg_dir,
+	debugfs_create_file("recovery", 0600, rproc->dbg_dir,
 			    rproc, &rproc_recovery_ops);
 	debugfs_create_file("crash", 0200, rproc->dbg_dir,
 			    rproc, &rproc_crash_ops);
-- 
2.20.1

