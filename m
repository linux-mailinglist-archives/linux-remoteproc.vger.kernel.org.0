Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C53843EB
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Aug 2019 07:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfHGFj4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Aug 2019 01:39:56 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45451 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfHGFjz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:55 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so38953165plr.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Aug 2019 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hV2OpNDlf9B8X2Y4BzyxalclcI5O3SjBzPMCmfPooZQ=;
        b=cIXhIatsOcPuqn1+MgSm/QQB00cmGPVG8EbiRAPHUblko3fhn/9Pkpx/65QgW82eNH
         M0NEPAUTZxkplleu9px9+XRjuwTitLxz1ocIySnkyfqIvPgUWfLOZP4JvFXaeDAGHuZf
         gfb+cgF+zUNZJoCL70yvlLUa1ZzUuJXe6Wkujgon5BgiOZruSI4mqq+7l2Az18BLZMJa
         hIgU/T237Nrn1TzV5hATl8jhLt3m7srfJmdcAEm+yU+ToxZ8gJi1xu1FnqOX2Dhnktp+
         6+Crb6NnrQKI5jNDt6RGfuKMOiXcj/jhR316UzF1+SlE5hhasDGbjw0nzwq6pkPCkU0g
         oWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hV2OpNDlf9B8X2Y4BzyxalclcI5O3SjBzPMCmfPooZQ=;
        b=XUfQVA9RC4I2GGyWLCIQ5aw3GYURCOLqEsr0KPSMapMAoxlCe4cal27vGZa9xFxz99
         WlJhU66BOOfEIPe52VCsSj2cbsn5l0QD4XJqRwdWGDHCZW9VA3QdNxlfCDOjdjtSnYjT
         AyjEltwK/8uIkNuubN/ySs0ueu/yri0+tyTtb7qo6Ebyk/Prp0JY2ctyrOrXVXOehI/G
         E+YzZEHuYfcQltW8BjdsfXyFrOms/yYzDmAzZLA6z05nGk36lzmeAChpRUlXwk9s2Bjw
         BFOqNuwfPp3VsBT1v0NtErTZ0avKuHMEG5zaCXvt95HFfxjt+bW56T/K6PKJvabeTnEG
         2m1A==
X-Gm-Message-State: APjAAAU7MPhzj9gFWVWCswmUdCk0EMpWp+ESot4DEEs85SZOtN6mrIj1
        AGDozg7Xnnzv+tm7IkUGiH0lVg==
X-Google-Smtp-Source: APXvYqxVdFtsesLs97Pm6ige+MLx7B4T80576E9cEvBvip+y9DeCaBSXv/ssBsoin6c7szx10I2wuQ==
X-Received: by 2002:a62:2ccc:: with SMTP id s195mr7503689pfs.256.1565156394058;
        Tue, 06 Aug 2019 22:39:54 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 7/9] remoteproc: Introduce "panic" callback in ops
Date:   Tue,  6 Aug 2019 22:39:40 -0700
Message-Id: <20190807053942.9836-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce a "panic" function in the remoteproc ops table, to allow
remoteproc instances to perform operations needed in order to aid in
post mortem system debugging, such as flushing caches etc, when the
kernel panics.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++++
 include/linux/remoteproc.h           |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..cc47797c6496 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1833,6 +1833,16 @@ void rproc_shutdown(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
+static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
+			       void *ptr)
+{
+	struct rproc *rproc = container_of(nb, struct rproc, panic_nb);
+
+	rproc->ops->panic(rproc);
+
+	return NOTIFY_DONE;
+}
+
 /**
  * rproc_get_by_phandle() - find a remote processor by phandle
  * @phandle: phandle to the rproc
@@ -2058,6 +2068,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
 	}
 
+	/* Register panic notifier for remoteprocs with "panic" callback */
+	if (rproc->ops->panic) {
+		rproc->panic_nb.notifier_call = rproc_panic_handler;
+		atomic_notifier_chain_register(&panic_notifier_list, &rproc->panic_nb);
+	}
+
 	mutex_init(&rproc->lock);
 
 	idr_init(&rproc->notifyids);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..33553f6d8ff0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -383,6 +383,7 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	void (*panic)(struct rproc *rproc);
 };
 
 /**
@@ -481,6 +482,7 @@ struct rproc_dump_segment {
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
+ * @panic_nb: notifier_block for remoteproc's panic handler
  */
 struct rproc {
 	struct list_head node;
@@ -514,6 +516,7 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	struct notifier_block panic_nb;
 };
 
 /**
-- 
2.18.0

