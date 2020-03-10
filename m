Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4056417F0A7
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 07:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJGjy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 02:39:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44012 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCJGjx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 02:39:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id c144so6014668pfb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2020 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HwB5QpHMwVsS+atKeiBWAI3spUZ2vMmG5d4HMGVSirs=;
        b=yC9TOv7aX103lryUmtPi+1Z8m3H0/sgxo6d+6ZY3KzO80A3wY16U8qF6dEEo4lk4SY
         NswHZOIXMKKQ4sR3GS/uk5tQmTpYWrnuF+60/nLhdb5rvvCaaeAKyi+DiYorGd16v09e
         UxKvfNCrgB0svfxdF2C6lyDkcRwTt9DQBjBN8jEe6wX6QwMex8FZEsKULnFGpXkfFQOJ
         qLiaOCliBnJfeGVfGpRnSh/SUV+uQmw15ghufdgHXmZ4R9jhJeYPKCjw7jCsN2Lg2p72
         xYI5KVOc2kt9zmwtcQyug808PRACCczRiB7H/1u7EpNH2KqwHwcLldgn6EW0ryn9+iu8
         tYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HwB5QpHMwVsS+atKeiBWAI3spUZ2vMmG5d4HMGVSirs=;
        b=GnPDk/W/S4EwmPO5Na8GHZ0VpxU8dvcAzGF2o0GGPK1WsgGtCtE2HnM1+58oddSOvQ
         JiJUIxVzrnTNnXbAUIpq63T4WOtmsVrpAR/RyhCvir9z0LEhMm3ReiUPDFADzC0gtqd0
         qOS8FPXzFihrqiXoqHNIRld6soPaL1hBHGqYfVf+Iei0JmEZi5FfJU/glM6WKy2kMuRH
         cdOD+mNz+v1vbFJhOYOQlDHl/yEsFxPAVXFOJyHcTgjFd7ZfjDa5OOmk7NSvRyfYJBCZ
         laPOQmmrsgcpysiyWLs3aLDYGQVEHQ3FuD3BsHaF0UlGS0yOodUwrebSKviDh7sHz5bZ
         VcgA==
X-Gm-Message-State: ANhLgQ1Y7Tbx2bX7ZYGHsv/37mexhS+iojPtLeHfQT5/FK6dRNdw+aXu
        ZXOdlTp1apwn7R4gPz7GH3O68w==
X-Google-Smtp-Source: ADFU+vtq7LA2u8eUtgWvkDTKb9pk5ius5sw4geFbwCEPIUeovy1ncDocBczxtnJeCB5+5Tsmul/Fbg==
X-Received: by 2002:a62:ae17:: with SMTP id q23mr20335477pff.239.1583822390853;
        Mon, 09 Mar 2020 23:39:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j38sm42398468pgi.51.2020.03.09.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:39:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v4 1/4] remoteproc: Traverse rproc_list under RCU read lock
Date:   Mon,  9 Mar 2020 23:38:14 -0700
Message-Id: <20200310063817.3344712-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In order to be able to traverse the mostly read-only rproc_list without
locking during panic migrate traversal to be done under rcu_read_lock().

Mutual exclusion for modifications of the list continues to be handled
by the rproc_list_mutex and a synchronization point is added before
releasing objects that are popped from the list.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change v3:
- New patch

 drivers/remoteproc/remoteproc_core.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..f0a77c30c6b1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1854,8 +1854,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 	if (!np)
 		return NULL;
 
-	mutex_lock(&rproc_list_mutex);
-	list_for_each_entry(r, &rproc_list, node) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(r, &rproc_list, node) {
 		if (r->dev.parent && r->dev.parent->of_node == np) {
 			/* prevent underlying implementation from being removed */
 			if (!try_module_get(r->dev.parent->driver->owner)) {
@@ -1868,7 +1868,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 			break;
 		}
 	}
-	mutex_unlock(&rproc_list_mutex);
+	rcu_read_unlock();
 
 	of_node_put(np);
 
@@ -1925,7 +1925,7 @@ int rproc_add(struct rproc *rproc)
 
 	/* expose to rproc_get_by_phandle users */
 	mutex_lock(&rproc_list_mutex);
-	list_add(&rproc->node, &rproc_list);
+	list_add_rcu(&rproc->node, &rproc_list);
 	mutex_unlock(&rproc_list_mutex);
 
 	return 0;
@@ -2140,9 +2140,12 @@ int rproc_del(struct rproc *rproc)
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
-	list_del(&rproc->node);
+	list_del_rcu(&rproc->node);
 	mutex_unlock(&rproc_list_mutex);
 
+	/* Ensure that no readers of rproc_list are still active */
+	synchronize_rcu();
+
 	device_del(&rproc->dev);
 
 	return 0;
-- 
2.24.0

