Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5E9183C18
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCLWMU (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45357 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id 2so3934787pfg.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7QdFESlb8Bs5GweNDaM0o+22PsENpp2NnEjZ0zQZ+k=;
        b=d3ad8GEggulvMDXbMkEzutP5wDdvj8p3S1fPELSWxgAxkPlH7hNApkvDpWJ+kgCJ9R
         Fk2YNvX6+e0K56qC4lsjQBy+DmFi5ZNuQlXLCOmqzgtV0J6yVK4ig9j3dXbGtZKDbL7R
         qyswQRz9ECj7oyv78kmouvaU2tnxxgvXeNacGtMYjfKosl1HBgnVofnguvIZBoPHfXRi
         ghmBqEYwZujUdk1qVMUdUBX3b3NlHHhI/E18zFZpt0qNUFjZhnJT550dQJ79+TsXBtXt
         WSsWSGZwijeKDNyHp4OL66x3ov+UXO+dChWwjnYOPV06tyS9H0Bp6PJVbYqxeknCDgWv
         mqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7QdFESlb8Bs5GweNDaM0o+22PsENpp2NnEjZ0zQZ+k=;
        b=bftzTM4BaPjB2biLMKMm/RcyCe4l8DX2uFSSiwoY7ltMs2Czg/80OlX7cd7ZToQ2Md
         KrbOMgUQPQ0U5L2ad+P173pdHZ4vMS0hk0t74S0iR2AfEVaCP/N6bnTwIOwEAzBf2w42
         9837jh4/XAOCHsXy5Bc9VR7RrodfmgwroY0quJcmKVW9wLhkkLnhmqfSr6IupTij7I5R
         WdQPDjQXo4/25rP7g/asnAj2IPWbiQ2Wixx9JENebrAUzjNNojKfKHZeKpmHT765SuaD
         aR8MmYY7DO359S0Pwt8DnNmj/gYZWS0JCBpZS5IR+Dd7e0FMsjArV5uwoW2C1kuuwvrS
         s6Jw==
X-Gm-Message-State: ANhLgQ3MbriJEOsTT4YvJ82r9ejEwJiWzLN7TbCauga+1Lnt2IsItArS
        4GQfMpteBceSxFcL8jfxWZQyYw==
X-Google-Smtp-Source: ADFU+vvVI44ejzKBxSRmiQsWrsm78yRq37zEXAnLc5iX2xG7v4xyZ2llXxlXdOYHw1KLWMDLyvNdRA==
X-Received: by 2002:a63:2b4e:: with SMTP id r75mr10113562pgr.32.1584051138923;
        Thu, 12 Mar 2020 15:12:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:18 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 17/18] remoteproc: Make MCU synchronisation state changes on stop and crashed
Date:   Thu, 12 Mar 2020 16:11:57 -0600
Message-Id: <20200312221158.3613-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
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
index 7ea4397a9004..f776a474da97 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1720,6 +1720,14 @@ static void rproc_crash_handler_work(struct work_struct *work)
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
@@ -1854,6 +1862,13 @@ void rproc_shutdown(struct rproc *rproc)
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

