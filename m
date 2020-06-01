Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530A61EA8A6
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jun 2020 19:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgFARwY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jun 2020 13:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgFARvn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:43 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884C7C08C5C9
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p30so3828371pgl.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MbOKQVccoNk2iiaBCxRQwqrB6pY9V3Ek5XyuyrPL344=;
        b=XMh2YQ00G3/iFxRJLp5X+Ffu1aDH9sHaBAby+8PDY928HiuKVov7KQ/xyV987CcyRn
         3R4aqvM9gLbpYp4UbAzd3d5iFf6wumH1UmIPXZ2p4vbGJZZ+QxntY4uYK0dKEUTUleJs
         dOrScvgMF+nbeES+cIfHO/ygGL4HzwCZyxNXui/59j7FOGinXLVFjU3BCmjA7bu7x3Pk
         VnaiHoI+QznyvPmUjFzS9gsGhjwGM9C7UhD/yfhMw5fKoAcUd+ykW/WFDi+PKgCafX2y
         QYa8ivZLmAXdOnHbmdWvicXI0ZyHbptrKor6POUKGswFRWrDNCaPDkKdQgLAHbZROHJu
         9fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbOKQVccoNk2iiaBCxRQwqrB6pY9V3Ek5XyuyrPL344=;
        b=ZWgvHI1MNYfTKfyuWu7CiNKAtHdpg15hBbEJXxip8kE4Q9840N54jifUMmUwc8Xblu
         vw3PUpoUQs4+obhbZUzByN35sc0dZX9dBsDiojsAJTRLXOscB1vx2329EPrC+pxnHArj
         37tf9lFppQcdndWtz7azjD4kP4tL93XCPUqPlQYxItIu35R6tK2uFNKB69bIQOFuh3jL
         ZSS0Ar4OzL5bD0VVbdJxzwu0G+dGYVyq6/YcuC5bsKqwv/O5i3bFaphlUikPkCMdkACn
         7XrW/ET7ntaYitfFUUSHfF8OeieUU9OyjW46HSOtkmZ6ejIDLHxLp63gSaqvtoktGOlO
         meFA==
X-Gm-Message-State: AOAM532CB6cUi1us05oJaFBzMZqo8v6cg9YwRKXxV5ijplezI4TbendZ
        A1Pr1m3rPPASg90iS7CkMRgj9A==
X-Google-Smtp-Source: ABdhPJyThCX4Ai+3IbVSLO17nsi28llbYdW3I8iACfWmVTPeTmDXfBXGql/ZgbvdMUU1Q/L9K+JNbw==
X-Received: by 2002:a62:3381:: with SMTP id z123mr22115539pfz.274.1591033903039;
        Mon, 01 Jun 2020 10:51:43 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:42 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 2/9] remoteproc: Add new attach() remoteproc operation
Date:   Mon,  1 Jun 2020 11:51:32 -0600
Message-Id: <20200601175139.22097-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
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
2.20.1

