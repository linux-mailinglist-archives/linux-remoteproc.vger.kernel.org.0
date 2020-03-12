Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2535183C0F
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgCLWMK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:10 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39845 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgCLWMJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:09 -0400
Received: by mail-pj1-f67.google.com with SMTP id d8so3222765pje.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pt7wDr4fqIMluK1YQKun6+ciCQDmnXKa037aAN4VvN0=;
        b=Pqqw3b1cGrDYt8qTciWQLdTFdP9cN5eyul6oQY2VWxuQIR+3gu/brPlYPz8bH80eDP
         wweBnZZyulcgHhHNxbtYblElIXJyH0FkH7Kwl4p5ofdDUhTPP+iPxqG4pvs94IhUDZVS
         01wmp2txSX/qsEO7SIXNcJxH10WhCgTmhpNRXnCXsjeJic3RhNcy11q1qpbUdcxeiFvj
         JDUzrXCXb0v9sFObvGpCW1BdrpmQRYvFuhXgjbiyNfshGBcRfTnIrLx53H4hAGAfuksV
         zz6xGyauAGoZBFZNXuyE3qzG3ByFQKy1fm/BFZjtxJohPncs82cVI/SsnaX6zZmsiJS8
         WBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pt7wDr4fqIMluK1YQKun6+ciCQDmnXKa037aAN4VvN0=;
        b=HCrf2SV1qq5gKLd8mS2nRsUU4Gw5nf9XYRCrjmUsFNehsu9P+0O/UDeF0xwts/NMTn
         1cd0rpRzauchGyhGPPfJIbJ1WdMdP2bHdS+uMgCOYdzL911SVEb4f7xdKj5EVnhyewqK
         EDGbkdTy007TqIc1pBlTptW/GKE80AHwYGsQzSvrP84BZ5L9++ijXAsU2ucwfg8dbulU
         WbYMyqFHLbykGQJFZxOBLuNiGILHvR4lXauzgpxaUcchq4k3mqBMYin0QJy+oGnMpNzt
         kQReCymBDU2twNSe+/xSbif1RQ1e6x9r/anIuaMGi4+nwn+eKgSd0KWt5PZ4KX6N6ezz
         iTCQ==
X-Gm-Message-State: ANhLgQ2Ag0RwA5wuGGqmPPiGtQmXDekv5N2rSZX4jaXSlHfEshGhb0t9
        6JzhFGA5JRbDV/y7ftsfNc4giFhzNnQ=
X-Google-Smtp-Source: ADFU+vsD3SKeFtreDq1UF7IqCuaUpNyMM3z4oCMait0xcf8w4h8rlU0B1M0m/opDROsRD0oS0NC2Nw==
X-Received: by 2002:a17:90a:7f93:: with SMTP id m19mr6020436pjl.92.1584051128822;
        Thu, 12 Mar 2020 15:12:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:08 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 08/18] remoteproc: Allocate synchronisation state machine
Date:   Thu, 12 Mar 2020 16:11:48 -0600
Message-Id: <20200312221158.3613-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch allocates a synchronisation state machine, either provided or
not by users, in order to enact the proper behavior requested by the
platform or specific scenarios.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 02dbb826aa29..1578a9c70422 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
 	kfree(rproc->sync_ops);
+	kfree(rproc->sync_states);
 	kfree(rproc);
 }
 
@@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_sync_states(struct rproc *rproc,
+				   const struct rproc_ops *boot_ops,
+				   const struct rproc_ops *sync_ops,
+				   struct rproc_sync_states *sync_states)
+{
+	struct rproc_sync_states *st;
+
+	/* At least one set of operation is needed */
+	if (!boot_ops && !sync_ops)
+		return -EINVAL;
+
+	/* We have a synchronisation state machine, no need to build one */
+	if (sync_states) {
+		st = kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
+		if (!st)
+			return -ENOMEM;
+
+		/* Nothing else to do */
+		goto out;
+	}
+
+	/* Allocate synchronisation state machine */
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	/*
+	 * We have a boot_ops and no sync_ops - build a state machine that
+	 * does _not_ synchronise with an MCU.
+	 */
+	if (boot_ops && !sync_ops) {
+		st->on_init = st->after_stop = st->after_crash = false;
+		goto out;
+	}
+
+	/*
+	 * We have a sync_ops and an no boot_ops - build a state machine that
+	 * _only_ synchronises with an MCU.
+	 */
+	if (sync_ops && !boot_ops) {
+		st->on_init = st->after_stop = st->after_crash = true;
+		goto out;
+	}
+
+out:
+	rproc->sync_with_mcu = st->on_init;
+	/* And the synchronisation state machine to use */
+	rproc->sync_states = st;
+	/* Tell the core what to do when initialising */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
+	return 0;
+}
+
 static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 				 const struct rproc_ops *boot_ops,
 				 const struct rproc_ops *sync_ops,
@@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 			return ret;
 	}
 
-	return 0;
+	/* Finally allocate the synchronisation state machine */
+	ret = rproc_alloc_sync_states(rproc, boot_ops, sync_ops, sync_states);
+
+	return ret;
 }
 
 /**
-- 
2.20.1

