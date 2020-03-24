Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC038191C18
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgCXVqJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:09 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41687 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXVqJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:09 -0400
Received: by mail-pl1-f193.google.com with SMTP id t16so7960877plr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWSxNFnGJBIPMEQTNGHQotLd44zttutJo5MRF9su1t4=;
        b=zxcFYf9D5ivs7NL1fJWU9DKvTEYRvv2+pz8u+UAwSaJicr9C1vivsK3U8ZFWHYM0X/
         PeSQi/hnFbC98P2MT+0Y7gT7APcnVeKxo87s9JLBRNnZgS2qKKIe6ViVfWU68D3C6YCW
         GrMCgUEzJj21zOoAoA0OE3miQkoaTvqFlBBoJO+vmMxOdQWf1kuEjoJXZ/NE4Np7KFuI
         GcKc5b67hvrOhLi7L301Ym8F5Y68UQxdbH0wcJLlCQa2bU42sjDJ9XwVFvb+fbHsJH/4
         JK9KmZUOc1NmOlyUCTPdxiPU1sSliY+SDlOVKjGwQxYCb46P4VIJOzEsthXw+7WC1BM/
         jEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWSxNFnGJBIPMEQTNGHQotLd44zttutJo5MRF9su1t4=;
        b=a4lMV0anTJhPaIhaXTy8zMwJhRk/tdVpVnoYPCz/v9dZ9mGaRsUtSnVlrYKTgoJspM
         j7263URGwlMVZlgNhIfvQoXAQ8MBjhLinFkiKxr21CDoTA8/a/T9qV/bE/lV6A3r36yp
         O4kNww6Is8EmIZ2s9/jxLWkki/oX7ivuTQ6PBYZlO5u15gKStLbDonXAE3Sw/HvXmWk6
         B1gB6kWGeO3e+ZaIUrFBBXxAQvpKI98nVKrQrppAvleFNsETqmlX7vfsTGGHkJ1qvTQI
         goAUICEJmVSv3sTB5pNiXYucdeQ5rza/h5wHxSiBtWQApEXNAkHOLDwuu1FaDMkt2Yum
         A9wg==
X-Gm-Message-State: ANhLgQ34XANOxVOZ9fIN+4MTT7y4542bDq1XnnpyovlbbUM3BqocOoGB
        I1e7O63OddAgUz2ENr2YACI/SQ==
X-Google-Smtp-Source: ADFU+vtSWDnZVA7UB+emoell4dW5xDcMCsyocIyJKMJ8/p4H+iXApuccMvF3ZVDQKfvCXFyny2S+pw==
X-Received: by 2002:a17:902:694c:: with SMTP id k12mr57375plt.173.1585086366222;
        Tue, 24 Mar 2020 14:46:06 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:05 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 01/17] remoteproc: Add new operation and state machine for MCU synchronisation
Date:   Tue, 24 Mar 2020 15:45:47 -0600
Message-Id: <20200324214603.14979-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new rproc_ops sync_ops to support use cases where the remoteproc
core is synchronisting with the MCU.  When exactly to use the sync_ops is
directed by the states in struct rproc_sync_states.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c  | 31 ++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  5 ++++
 include/linux/remoteproc.h               | 23 +++++++++++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index dd93cf04e17f..187bcc67f997 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -311,6 +311,35 @@ static const struct file_operations rproc_carveouts_ops = {
 	.release	= single_release,
 };
 
+/* Expose synchronisation states via debugfs */
+static int rproc_sync_states_show(struct seq_file *seq, void *p)
+{
+	struct rproc *rproc = seq->private;
+
+	seq_printf(seq, "Sync with MCU: %s\n",
+		   rproc->sync_with_mcu ? "true" : "false");
+	seq_printf(seq, "On init: %s\n",
+		   rproc->sync_states->on_init ? "true" : "false");
+	seq_printf(seq, "After stop: %s\n",
+		   rproc->sync_states->after_stop ? "true" : "false");
+	seq_printf(seq, "After crash: %s\n",
+		   rproc->sync_states->after_crash ? "true" : "false");
+
+	return 0;
+}
+
+static int rproc_sync_states_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, rproc_sync_states_show, inode->i_private);
+}
+
+static const struct file_operations rproc_sync_states_ops = {
+	.open		= rproc_sync_states_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 void rproc_remove_trace_file(struct dentry *tfile)
 {
 	debugfs_remove(tfile);
@@ -357,6 +386,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
 			    rproc, &rproc_rsc_table_ops);
 	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
 			    rproc, &rproc_carveouts_ops);
+	debugfs_create_file("sync_states", 0400, rproc->dbg_dir,
+			    rproc, &rproc_sync_states_ops);
 }
 
 void __init rproc_init_debugfs(void)
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 493ef9262411..5c93de5e00bb 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -63,6 +63,11 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 
+static inline bool rproc_sync_with_mcu(struct rproc *rproc)
+{
+	return rproc->sync_with_mcu;
+}
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..d115e47d702d 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -353,6 +353,21 @@ enum rsc_handling_status {
 	RSC_IGNORED	= 1,
 };
 
+/**
+ * struct rproc_sync_states - platform specific states indicating which
+ *			      rproc_ops to use at specific times during
+ *			      the MCU lifecycle.
+ * @on_init: true if synchronising with MCU at system initialisation time
+ * @after_stop: true if synchronising with MCU after stopped from the
+ *		command line
+ * @after_crash: true if synchonising with MCU after the MCU has crashed
+ */
+struct rproc_sync_states {
+	bool on_init;
+	bool after_stop;
+	bool after_crash;
+};
+
 /**
  * struct rproc_ops - platform-specific device handlers
  * @start:	power on the device and boot it
@@ -456,6 +471,9 @@ struct rproc_dump_segment {
  * @firmware: name of firmware file to be loaded
  * @priv: private data which belongs to the platform-specific rproc module
  * @ops: platform-specific start/stop rproc handlers
+ * @sync_ops: paltform-specific start/stop rproc handlers when
+ *	      synchronising with a remote processor.
+ * @sync_states: Determine the rproc_ops to choose in specific states.
  * @dev: virtual device for refcounting and common remoteproc behavior
  * @power: refcount of users who need this rproc powered up
  * @state: state of the device
@@ -479,6 +497,7 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @sync_with_mcu: true if currently synchronising with MCU
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  */
@@ -488,7 +507,8 @@ struct rproc {
 	const char *name;
 	char *firmware;
 	void *priv;
-	struct rproc_ops *ops;
+	struct rproc_ops *ops, *sync_ops;
+	struct rproc_sync_states *sync_states;
 	struct device dev;
 	atomic_t power;
 	unsigned int state;
@@ -512,6 +532,7 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
+	bool sync_with_mcu;
 	struct list_head dump_segments;
 	int nb_vdev;
 };
-- 
2.20.1

