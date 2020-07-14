Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CF921FDDB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 21:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGNTvP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 15:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729619AbgGNTul (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 15:50:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E955C08C5DB
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so8039100pgm.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dkdk1HU4RvzeNvsp6TinYFs07yUk0YfjlyMcPX/N2O0=;
        b=w1onkpR0METlahp/EUYmJcn6mWjsIh2w1U7rLwYVuoEy65Ux3Cvt8dqR0ywX28J9do
         1QqnVlHR24CaclQatHlIDa/QIToenuxeRPBco4ZpaT5U//3wkqnLYnOtJS8LheG3A5Wb
         uBiRjzoZ25c/bipZUnK9eg1EqXr1iSBQ4uwdFi871GEADiHCUTZ2hjrQNVXmcSaDjlGq
         U7Mkssbp8c5qhFG2x+puXK3BAv6xAWqiExRbz+2uhyFiMbbDqyrnjfy92Hu5js8p7arA
         HfOSJP5BRf85TLSmz/18fng4/Xr58rPI6Kyfl8urJ+mDTmZs1+4PHgGhkoVLcDdv+Gsp
         Jj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dkdk1HU4RvzeNvsp6TinYFs07yUk0YfjlyMcPX/N2O0=;
        b=tZN5pbZlnWlTgLK6PPuq3baL2yqp2EGvcoOGczCmdlyFLVIGhiH9nZ1Z28+/GjId5b
         5pRctxCx7kcNOjNdbIHrDZapn7TZsDhCtLUWm+KeZHv7pLx6METy3VKm3WDIM/bi0sX+
         5+n1LNIP7IE3OA9sxPQ973P94ZeZ/P7npOKOne3q10LFsUg0cLRUHP2OfV5q82sSXcS+
         p7hBIVvA1N+A0MsyDlkZc6lsgg1PXXDq3JA9+j4sNiAp5ox8KOmYO4ZSpLq/MyfJdxp+
         Z5Kx4+2nNQgZWYQAQZYBVE2591sxpmX6CHQCxmTv13YNjqySZWlRE9il409kXpxHBzeu
         J4VA==
X-Gm-Message-State: AOAM5315bB4SMNJ/DqLAfm0Ba1b9P8YbWsKkN03FnU9ti/rIKKY1DGeI
        LZn+UkThYmTqr0M59d8FaBfBWQ==
X-Google-Smtp-Source: ABdhPJxGDve+4ouHSFclk3B4WQKVvxx6xzUCSPGKIHmneSYbayoSOqfgHE5SYmLNVv6A79SUzG33ZA==
X-Received: by 2002:aa7:8550:: with SMTP id y16mr5379487pfn.151.1594756240988;
        Tue, 14 Jul 2020 12:50:40 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g8sm16736689pgr.70.2020.07.14.12.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 12:50:40 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/9] remoteproc: Introducing function rproc_attach()
Date:   Tue, 14 Jul 2020 13:50:29 -0600
Message-Id: <20200714195035.1426873-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introducing function rproc_attach() to enact the same actions as
rproc_start(), but without the steps related to the handling of
a firmware image.  That way we can properly deal with scenarios
where the remoteproc core needs to attach with a remote processsor
that has been booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0f95e025ba03..1e8e66a25bd6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1369,6 +1369,48 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int __maybe_unused rproc_attach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	ret = rproc_prepare_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto out;
+	}
+
+	/* Attach to the remote processor */
+	ret = rproc_attach_device(rproc);
+	if (ret) {
+		dev_err(dev, "can't attach to rproc %s: %d\n",
+			rproc->name, ret);
+		goto unprepare_subdevices;
+	}
+
+	/* Start any subdevices for the remote processor */
+	ret = rproc_start_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to probe subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto stop_rproc;
+	}
+
+	rproc->state = RPROC_RUNNING;
+
+	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
+
+	return 0;
+
+stop_rproc:
+	rproc->ops->stop(rproc);
+unprepare_subdevices:
+	rproc_unprepare_subdevices(rproc);
+out:
+	return ret;
+}
+
 /*
  * take a firmware and boot a remote processor with it.
  */
-- 
2.25.1

