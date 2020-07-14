Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7501B21FDDC
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 21:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbgGNTvQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 15:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729577AbgGNTuk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 15:50:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A38CC061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a24so2411495pfc.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PxMPjmCidB1VqxktAlXIXRqqTAOgcw26S01KAMxl9kw=;
        b=hlyWX+HOr/q+if9cMIgEmThC1u6vQtcFud5LQqCelC4HuFCu0EpDkdF9xErUX07pSQ
         D4eJkOOxFaXUHcz+ItpZp2f7hpPEJUV/CGnl3lAWsTJc02JO2ZHJhDGllw5jKtLsbGi1
         xXsVZx3woaivaAzQXFUVidaqrx58bvxNSIuaaNrX3JySm+WZIUf21PV70kYJrQGcsTQp
         eQbOMUIj7sUvcB+jRECcStioJVoEX60Fc4MwZUIC+lYW4M/LdX18iIu7tSrTHge6GERS
         YMGOggkkhmnVei1AFpO+crOJWuKZLcIcdu8yoHjXPv2xSreiqw+lD2DFLkPfVvrlqdda
         tgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PxMPjmCidB1VqxktAlXIXRqqTAOgcw26S01KAMxl9kw=;
        b=tkuX5slTaYM6ChZqIr4LK3lG+9C0KPTAlNhEoUllfLwTOQOkSVoetM0y92HVCvMou5
         IOllMPlKCEqjqaVK1eYol2DcNXSEaVARUpSe71yhzMTudSVQIiWgdXbng/jlNROzXB7i
         0fTkflKH6zfevepZK8dMl78lGoDtjwOsxI0IxseBxm3sqwLok7MmHIMrcgc9IHaWzw/V
         dpPB9RoFqpAOkuDDPaxHvMGrts6MMsbgM+8zn61okRSHyM1+pHtGMIvMEbzDFJL0Qal3
         DwgZtTmfcxulOzTLjmSjjKxasJCc9FCS9kDcoUUw5SSqY3b0XKU1WWsyrzpfabus3W3M
         AYVg==
X-Gm-Message-State: AOAM530YcajiQ/iPTp90VS3B73Xc/HYs9v+MmiR2IzT0krBJ+lRWq1w+
        px1eelnfgu+4TMUUv2HNvsgMZQ==
X-Google-Smtp-Source: ABdhPJx3LAse7Jrv+E7Mxy835Oc9uLwqd1k3vr63RaMuHcjnc2iLNbKOmUK5SsuTLlOBkih3Detk1w==
X-Received: by 2002:a63:475c:: with SMTP id w28mr4796471pgk.222.1594756239831;
        Tue, 14 Jul 2020 12:50:39 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g8sm16736689pgr.70.2020.07.14.12.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 12:50:39 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/9] remoteproc: Add new attach() remoteproc operation
Date:   Tue, 14 Jul 2020 13:50:28 -0600
Message-Id: <20200714195035.1426873-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add an new attach() operation in order to properly deal with
scenarios where the remoteproc core needs to attach to a
remote processor that has been booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_internal.h | 8 ++++++++
 include/linux/remoteproc.h               | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 4ba7cb59d3e8..fc710866f8ce 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -79,6 +79,14 @@ static inline int rproc_unprepare_device(struct rproc *rproc)
 	return 0;
 }
 
+static inline int rproc_attach_device(struct rproc *rproc)
+{
+	if (rproc->ops->attach)
+		return rproc->ops->attach(rproc);
+
+	return 0;
+}
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 21182ad2d059..bf6a310ba870 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -359,6 +359,7 @@ enum rsc_handling_status {
  * @unprepare:	unprepare device after stop
  * @start:	power on the device and boot it
  * @stop:	power off the device
+ * @attach:	attach to a device that his already powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
@@ -379,6 +380,7 @@ struct rproc_ops {
 	int (*unprepare)(struct rproc *rproc);
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
+	int (*attach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

