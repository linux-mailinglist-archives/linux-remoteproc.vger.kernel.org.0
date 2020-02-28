Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C86D173FA9
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 Feb 2020 19:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgB1SeG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 28 Feb 2020 13:34:06 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:34364 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgB1SeF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Feb 2020 13:34:05 -0500
Received: by mail-yw1-f66.google.com with SMTP id b186so4273995ywc.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Feb 2020 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIcV50HzfFuzHnFyxJZaw5ayTXhu+ot1cYJZR5HNC2I=;
        b=rZHhsOAub+cbp14f0VQ94mMSWV+s83mEdNkA061F4J1uF3G54XpGHLT0hB3XBf0b9l
         vQBZrBGUl464onvfp7WNa0eFDneYBz/SZmtOk4UFQQqTISZRyLjF0Ijxw4lJS11xjvd8
         W9ED6lThimFZMP+nCTqUxWka0vWjrqd6PX630j8loEy1Pi/JnrrLck/3sFUxtOSl9ZhQ
         7b/KFiYweB5+DySbOgti5DiHQbbWM0fdByQaoKFbMFjkVoW5DFyoJYI9UyESyx95zEFU
         HgrwrZuwIq3v1cjE4xtG2woxXufkxtKoCd0QL9jUsvVcMjkv+yXlZgMw323aCfm6f0Dt
         xR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIcV50HzfFuzHnFyxJZaw5ayTXhu+ot1cYJZR5HNC2I=;
        b=EBxhHUsq+9rLGG5Gnh9thjO0hP+9/+7tkilDLqW4rQDNfhP8LlnZuz2zX50sLREb7y
         9Qqiv/KtxZbKVZrO4kPNo50/LMFHMBcAT+QExwW1mWc5fEEasv2Ka+MAYVcDPDzN+Xr4
         CUNeHhqvbLsQ76XQr5lcG6FsyDmOtcaTxtZQVlDynzXkNwqElzRlVszC60sDYJJnUh7e
         t136jSgIXmojBgz6F8CnfzA17QaAH/wL7xcYEm2iYycyQ9ASEnBzTLayxUx/EZcwjITv
         mN6SgZn9jVhLzprIQ8ppkZppF3iDaOjuzzfNEdX1y6OZBE6e51av6EhYnm2mwdyJn4mU
         S9Jg==
X-Gm-Message-State: APjAAAW4aP0Sv7mwFOXBlONA0KOIybGgwopuMTGKPhtxjfUkbZERE5qN
        34ddDjZ/Vz1qYkFKe1Py9Kh83g==
X-Google-Smtp-Source: APXvYqy0T88Ery5T/84/Na8fYDmQec02Ukk7u5LokLZ6FVxaUPs9/9ebRaw/9+yxnnxgyVs/hIEmqA==
X-Received: by 2002:a25:aa6a:: with SMTP id s97mr4799522ybi.232.1582914844407;
        Fri, 28 Feb 2020 10:34:04 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o127sm4409884ywf.43.2020.02.28.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:34:03 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] remoteproc: re-check state in rproc_trigger_recovery()
Date:   Fri, 28 Feb 2020 12:33:56 -0600
Message-Id: <20200228183359.16229-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Two places call rproc_trigger_recovery():
  - rproc_crash_handler_work() sets rproc->state to CRASHED under
    protection of the mutex, then calls it if recovery is not
    disabled.  This function is called in workqueue context when
    scheduled in rproc_report_crash().
  - rproc_recovery_write() calls it in two spots, both of which
    the only call it if the rproc->state is CRASHED.

The mutex is taken right away in rproc_trigger_recovery().  However,
by the time the mutex is acquired, something else might have changed
rproc->state to something other than CRASHED.

The work that follows that is only appropriate for a remoteproc in
CRASHED state.  So check the state after acquiring the mutex, and
only proceed with the recovery work if the remoteproc is still in
CRASHED state.

Delay reporting that recovering has begun until after we hold the
mutex and we know the remote processor is in CRASHED state.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..d327cb31d5c8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1653,12 +1653,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	ret = mutex_lock_interruptible(&rproc->lock);
+	if (ret)
+		return ret;
+
+	/* State could have changed before we got the mutex */
+	if (rproc->state != RPROC_CRASHED)
+		goto unlock_mutex;
+
 	dev_err(dev, "recovering %s\n", rproc->name);
 
-	ret = mutex_lock_interruptible(&rproc->lock);
-	if (ret)
-		return ret;
-
 	ret = rproc_stop(rproc, true);
 	if (ret)
 		goto unlock_mutex;
-- 
2.20.1

