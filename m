Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23166183C07
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgCLWMD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:03 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43852 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id f8so3218423plt.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWSxNFnGJBIPMEQTNGHQotLd44zttutJo5MRF9su1t4=;
        b=aUAMXlR0NzFBvljPDbORYTUF0uM/a/2wXqtl7krLYXm42EsRkZBsY+l2PDlSraloMw
         w5lspqPMFRGVWda3sW+ff6csuIyd/YS3d8B3LwgOwVWgBL4GxbpP3YCZ8QR075H1JvMb
         5gMXa+d+EkXg9LxgzXsTFy0dDbZRQRhjLAGRWbOO/zEcSqXU5x+VONFkLVPrzGh5Kt1J
         G5L3/LE4qXvo9YS41ogJo2gkM/p1ZPzeg6JO7LoVsgao/ndxqlzIPGjl87eQTlJb9xIa
         mvPK65cnDHQL5d6w0WKWNNCtnhm+rnPzk//tHuYHzVbF97hLckJ6ORwv2MjDxOLg14Gi
         QmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWSxNFnGJBIPMEQTNGHQotLd44zttutJo5MRF9su1t4=;
        b=C3QLBL8n/wzo3+C4qit4jRI+YLwu507Zts340EUYgEclUvnOW3zZK9aRVJHlSvHrWT
         hKN/IrpdIKyW0RuZosJrRVmoeLsRlxupSFScef+l1HwWvhc/uYZwyWNdL0L9+Ac2RneD
         mZVY2Ur72cq59rgxROZa2wA5+SQjNhCsMFb3VZN5oQAHu89Gv438urmbZWbrgt8j/oHj
         STkDUCEHLo29IqrHRrpv6bi8hB8JDPu3YFe3rgVWzIoD7m1PDZnz5sVhnJFsBJsF8mww
         3f1DMZkh+NgBsv7kB87y7SK+2P+HqEfBtl/t+eii7VBSimXJTsCCrrCCeytxlSWaSYgT
         OHKQ==
X-Gm-Message-State: ANhLgQ0olSG75xVXI6mf9e3XTbWq7qWybUN/mVEZqrlC94LsGAnySK0N
        AFjCF/IakALskhV3Pdax+wenug==
X-Google-Smtp-Source: ADFU+vuspi1loUZ6ndebAEE6L6FraC2faoWWvWlxEVi0NqTjpOt/iO1dbjr6P1RM0O14rSTyRvIhhQ==
X-Received: by 2002:a17:902:fe83:: with SMTP id x3mr10255700plm.310.1584051121181;
        Thu, 12 Mar 2020 15:12:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:00 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 01/18] remoteproc: Add new operation and state machine for MCU synchronisation
Date:   Thu, 12 Mar 2020 16:11:41 -0600
Message-Id: <20200312221158.3613-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
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

