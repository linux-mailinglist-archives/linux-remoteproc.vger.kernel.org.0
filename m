Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A80517F0B0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 07:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgCJGjz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 02:39:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44508 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgCJGjy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 02:39:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id b72so2460855pfb.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2020 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0B7KMhj7KXyXrKRXHFaEpM25cw3DFGC+sUjtxaJiLnw=;
        b=sPfXTdaZeqRKyB+o83TSVViXYP1gJ/3A0HFSP9o8PlCvRUTrhdFa5HmiKS771Y1Xf+
         Dh8vUrZ2SyV6UrvE0OoGLlUizYQnaxZL27dirXjagRDQ3OgKOoHrbyo6SOVo0l/Ik9+Y
         q/bZdNV3PMcqvJvXmaN/wIOYJ3130Bw2UFK7/Q+2dRWU9610ZdwWDpeyG0NdT+LRPkDL
         o/U+3hiVRkJ7J9B+iJqEAHhLLsCj70wUX/sRXx7SA77An0tgS9IA1HiDOp+QZFb4HsPy
         mV2+zu3acdNxRT6yyI3PHfmTFq59hdEcH4caaf9HuKzg11lStNdEGFfclwEodlDG4AEY
         /rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0B7KMhj7KXyXrKRXHFaEpM25cw3DFGC+sUjtxaJiLnw=;
        b=Z4+0aygrGrnRtTs/8KRoT9Jqp9kzFEO8MpCwgQDeAhwxsfgDgHoGbRDxwLUXStkIXZ
         WXV6Q5+daa2wal/zkwPMzq7Wb4R+3NRNTcV7fbSnUihuXquEH98sfQJ0g20B0v3cL7Rd
         7+USgCYvYG8KgwCWta/fD0hfDnPTeD/4IKatHub6KPHkDN+O+1xX9iG/FTDuhWTq66Zn
         HAxEf5qbLlW0VZTaqzIMmGmuLr7bNu0kTnirUQokRXv7NHlT0IcoOBkSLQhplPAk9BgR
         d5aAxFgc45AkdiCo/hf4kM21/MdoJJVuZkPhckcuzJBY8KX2TGVIHmheyUVv8bbnVTcJ
         A2sA==
X-Gm-Message-State: ANhLgQ1eZfcAMF2bFjs+AwKrg/azXdaOP/dDJjFcKVeyFCc5axS0EX/0
        rxI12UxlsEUihm4CVmyXgqaodg==
X-Google-Smtp-Source: ADFU+vvjj8l2r+L94HRcD3IZZeS0yyjJfLlLOq54AbStqmDOT4Qt8dlSnlKBUnml/+9ZNN7xa5lgfA==
X-Received: by 2002:a65:5688:: with SMTP id v8mr18531819pgs.403.1583822392248;
        Mon, 09 Mar 2020 23:39:52 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j38sm42398468pgi.51.2020.03.09.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:39:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v4 2/4] remoteproc: Introduce "panic" callback in ops
Date:   Mon,  9 Mar 2020 23:38:15 -0700
Message-Id: <20200310063817.3344712-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce generic support for handling kernel panics in remoteproc
drivers, in order to allow operations needed for aiding in post mortem
system debugging, such as flushing caches etc.

The function can return a number of milliseconds needed by the remote to
"settle" and the core will wait the longest returned duration before
returning from the panic handler.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v3:
- Migrate from mutex_trylock() to using RCU
- Turned the timeout to unsigned long

 drivers/remoteproc/remoteproc_core.c | 44 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  3 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f0a77c30c6b1..2024a98930bf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -43,6 +44,7 @@
 
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
+static struct notifier_block rproc_panic_nb;
 
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
 				 void *, int offset, int avail);
@@ -2219,10 +2221,51 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 }
 EXPORT_SYMBOL(rproc_report_crash);
 
+static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
+			       void *ptr)
+{
+	unsigned int longest = 0;
+	struct rproc *rproc;
+	unsigned int d;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(rproc, &rproc_list, node) {
+		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+			continue;
+
+		d = rproc->ops->panic(rproc);
+		longest = max(longest, d);
+	}
+	rcu_read_unlock();
+
+	/*
+	 * Delay for the longest requested duration before returning.
+	 * This can be used by the remoteproc drivers to give the remote
+	 * processor time to perform any requested operations (such as flush
+	 * caches), where means for signalling the Linux side isn't available
+	 * while in panic.
+	 */
+	mdelay(longest);
+
+	return NOTIFY_DONE;
+}
+
+static void __init rproc_init_panic(void)
+{
+	rproc_panic_nb.notifier_call = rproc_panic_handler;
+	atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
+}
+
+static void __exit rproc_exit_panic(void)
+{
+	atomic_notifier_chain_unregister(&panic_notifier_list, &rproc_panic_nb);
+}
+
 static int __init remoteproc_init(void)
 {
 	rproc_init_sysfs();
 	rproc_init_debugfs();
+	rproc_init_panic();
 
 	return 0;
 }
@@ -2232,6 +2275,7 @@ static void __exit remoteproc_exit(void)
 {
 	ida_destroy(&rproc_dev_index);
 
+	rproc_exit_panic();
 	rproc_exit_debugfs();
 	rproc_exit_sysfs();
 }
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..5959d6247dc0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -369,6 +369,8 @@ enum rsc_handling_status {
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
+ * @panic:	optional callback to react to system panic, core will delay
+ *		panic at least the returned number of milliseconds
  */
 struct rproc_ops {
 	int (*start)(struct rproc *rproc);
@@ -383,6 +385,7 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	unsigned long (*panic)(struct rproc *rproc);
 };
 
 /**
-- 
2.24.0

