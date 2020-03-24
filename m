Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB3E191C27
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 22:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXVqZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 17:46:25 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55106 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:25 -0400
Received: by mail-pj1-f67.google.com with SMTP id np9so112426pjb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDKckchEP5jKnQNDmUYqNLCsBKtRywXgHyTH3809raQ=;
        b=q/VMrtbpFTwSTk1+rTP8692zKObFz0XPJXce/nDOQAH1Mecykiog/cx/rooBbG/1yi
         7P3W38xqP/2GCSkGqMhq3/tkaBI+5cXg+ywE6Nw4bU3p3ZXyAQOiobUzsvrGuBy5waj+
         tMLsdvoUANAJ+MAqPcObHUY5cksRm24AflxvNeXeKcGme5JtsuVCpTCYqZFIxTk754Qa
         YmYVyEjBgsBZiTW460VwuPQu1TyjNchnbFSzaqv8+2WxxlYSKPLJFxlpZwjz0AFTjfrX
         Vzoc53YygC/TxKQM557rtChB+qnZrTnW8N9xFp7lBMEK8f/9eB661HYMtlwx3PVHuzrN
         2MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDKckchEP5jKnQNDmUYqNLCsBKtRywXgHyTH3809raQ=;
        b=PUU4iKxF2pctiXMo/629MWfW4irGlzW0ijUNiSDiMB+HjPKnp9Zyj36AHgztxxzmdc
         mH2otYWHFZVukKyjwi/O8p+EfokRMcUYaSPIBHBesCuMDrE6pTLmJ0kGphBunndlb7Qp
         RFFgVIFgrsZjxr/x3qHdj3BwOf9CFirCqof9/0hJOJjv3iCYziNM+72wuh5h83y83hVg
         X9wKIBDLZu5tWLdoKTFoOslQkUhtts5dbFCKnH4IxCcUgHZVYzTLbAKkkpHDIdhSUXYu
         oEwi/2t8eJmwjFTrbyP5PevMq5dhigC+HxCsgdKzZHMv+vbzEv1btWl+4cOIScUPM8YX
         MJZw==
X-Gm-Message-State: ANhLgQ1CWnallUsYh4CBvOnkixxI+OLc/YZethBgQ+94tGi1pWEFHmqh
        BGvQ/ZxNuNUTAYE5O2mDg1DluQ==
X-Google-Smtp-Source: ADFU+vuPTNhWETaApnyd02KQpWAt8nSgcJdfkUiYCcBhYaJb0AGssspJB5xQVPFGHmWuYqLZdmqCQA==
X-Received: by 2002:a17:90a:8586:: with SMTP id m6mr7633994pjn.121.1585086383778;
        Tue, 24 Mar 2020 14:46:23 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm17070240pfb.78.2020.03.24.14.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:46:23 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 17/17] remoteproc: Make MCU synchronisation state changes on stop and crashed
Date:   Tue, 24 Mar 2020 15:46:03 -0600
Message-Id: <20200324214603.14979-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Call on the MCU synchronisation state machine to determine the
synchronisation status to enact when the MCU is either stop from sysfs
or has crashed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dbb0a8467205..0608593cccc6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1722,6 +1722,14 @@ static void rproc_crash_handler_work(struct work_struct *work)
 	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
 		rproc->name);
 
+	/*
+	 * The MCU has crashed - tell the core what operation to
+	 * use from hereon, i.e whether an external entity will
+	 * reboot the MCU or it is now the remoteproc core's
+	 * responsability.
+	 */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_CRASHED);
+
 	mutex_unlock(&rproc->lock);
 
 	if (!rproc->recovery_disabled)
@@ -1856,6 +1864,13 @@ void rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+
+	/*
+	 * The MCU has been switched off - tell the core what operation to
+	 * use from hereon, i.e whether an external entity will reboot the
+	 * MCU or it is now the remoteproc core's responsability.
+	 */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_SHUTDOWN);
 out:
 	mutex_unlock(&rproc->lock);
 }
-- 
2.20.1

