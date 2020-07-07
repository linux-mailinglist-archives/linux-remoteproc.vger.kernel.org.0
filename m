Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246322179E8
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Jul 2020 23:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgGGVAq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Jul 2020 17:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728995AbgGGVAS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:00:18 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE730C061755
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:00:17 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u5so18952516pfn.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T4hkCqVCeOMZgcGJmCmeYT1tYbutzJigRMD38BY9+lY=;
        b=skhoYdkaprvrrYvb7cLlxtvHSZIP1JXvNY5H59zSulwBZznsxe5PwG8/tb0EdKgMXu
         R94Beq1AyHUthM/hUUGgdj0vn7WRz4eaX4yJI9s1/5YbSlJiwUE+a2QFdR9vpsUp9ux8
         3Lbtf80MKp8IgIpbKsCnhLgJiX3gcjczj0XLmhxVFZPZJgMFVakumZg79o/Fr9i8bbxP
         j43R8pBYDaGi8I7Mt4IxOcJX2X5XdUAsHZNL1BocEAB5z8K92AuwJC9GKQg5iKCPELJA
         O3mET5jlADa1Ny58wEWUehDhyskXRwJfPf0fwq6kO5C4XjTzSSMfPrCecT6suDJ3hTcv
         aomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T4hkCqVCeOMZgcGJmCmeYT1tYbutzJigRMD38BY9+lY=;
        b=lx6FU9tVC+lXOcqpfi5IxLIKRJYPg8BturfOsE7g2ILOUOVPjRDW1mGXbBO6y7VnZg
         hgr8twBqJzc/wVnJtTIIyEEyuLIPNpVMGkFSi3aiWMN5fq6tG1s73cYh0mZC8wYogGgV
         h6Qhof4wWkSQFHB+114KZ+8QUrKa8HEnD2txFJL8xSyj2LFgbj1Hl0969sBG1A2v6LBb
         nMmEb/t0iw8d0NmpJEjngrbGZHnyQMgdQZTYLE319NRKvmAkEWaDEiagC5d2dd/CfrR0
         UCVhBa438FjFe4j/PTXvqx7BcA3ieU8GSV9z4yFq/yQdzjaoC+9Biyw7bQZ1JCf7k1+5
         BsSA==
X-Gm-Message-State: AOAM532CfkmU4JDGiT6kMSPCYwzYzyx5B5f9hlcNGaneLZ5LrHKZUtJ7
        +yoCPzYuTEslP/gRNXG5kCZ/IA==
X-Google-Smtp-Source: ABdhPJxZWe4+LqvbhLX+FR1pDBbdohuGLXTvW36qakI87t3n/y2FTLbHFO0wsREYVkEZkji1GFPqHA==
X-Received: by 2002:a63:5004:: with SMTP id e4mr24268596pgb.208.1594155617393;
        Tue, 07 Jul 2020 14:00:17 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b21sm13738061pfb.45.2020.07.07.14.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:00:17 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] remoteproc: Add new RPROC_DETACHED state
Date:   Tue,  7 Jul 2020 15:00:06 -0600
Message-Id: <20200707210014.927691-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210014.927691-1-mathieu.poirier@linaro.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new RPROC_DETACHED state to take into account scenarios
where the remoteproc core needs to attach to a remote processor
that is booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 include/linux/remoteproc.h            | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 52b871327b55..264759713934 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -72,6 +72,7 @@ static const char * const rproc_state_string[] = {
 	[RPROC_RUNNING]		= "running",
 	[RPROC_CRASHED]		= "crashed",
 	[RPROC_DELETED]		= "deleted",
+	[RPROC_DETACHED]	= "detached",
 	[RPROC_LAST]		= "invalid",
 };
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e7b7bab8b235..21182ad2d059 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -400,6 +400,8 @@ struct rproc_ops {
  * @RPROC_RUNNING:	device is up and running
  * @RPROC_CRASHED:	device has crashed; need to start recovery
  * @RPROC_DELETED:	device is deleted
+ * @RPROC_DETACHED:	device has been booted by another entity and waiting
+ *			for the core to attach to it
  * @RPROC_LAST:		just keep this one at the end
  *
  * Please note that the values of these states are used as indices
@@ -414,7 +416,8 @@ enum rproc_state {
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
 	RPROC_DELETED	= 4,
-	RPROC_LAST	= 5,
+	RPROC_DETACHED	= 5,
+	RPROC_LAST	= 6,
 };
 
 /**
-- 
2.25.1

