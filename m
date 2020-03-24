Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEAD190528
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 06:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgCXF3O (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 01:29:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42883 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgCXF3N (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 01:29:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id 22so5125166pfa.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2020 22:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=prgc5yenFbqVYl3a5KSc8kSrf0HkGH2FfV3zRCvqmKU=;
        b=hEM/rlGONfHazJadGQTiOmWEjAXm+vqSTfam1wcplNH/Q+O2ztDaFBFhwMOXpkHSfD
         uuYUDr2Kd4VIN3SYFxZa2n/0SfPhX4KVBJ+zsS9ydwuzklU5ahb6KHiH9whRc/hDkOlu
         UAk/4bXjXKiKat4+ig6OgvxgoOgjI+S1WSwW5do5L8dDH2+XMbOvo+DodnHyUGgMHgOD
         KNPwc0fUdvDZG3yEUWniIG/YNqBiKOT5fIefa0zVBZLgLpDLvTe3/w2B0h/qCPCCcDdx
         1pU0J5yqCCONt/pov1CbLsk2VtWgOAbg4M1sBE8G3pYh17w9zom/Cn0d9ZMV3MtyTggK
         uU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prgc5yenFbqVYl3a5KSc8kSrf0HkGH2FfV3zRCvqmKU=;
        b=TFYVBbh538bS4psB6CdQnYi/436X/yOTYE0EuHLxkdAQVHVK+MsSJ9DQLf8PUDpxIL
         5GhQLl2LIiYlbwWrcqCdx8dZ1W8m7DUFb+5DZwn7p4sNTh10mFMpl1Sru18BONWkioi6
         Zp+YW51XNsOVVDICxNpQVQqC0GiGrrNr7l/A9hJRNeSFLhOJJ/tb+iwBNxq0cPVqA2TF
         Bsa9CYJVkMip3tMkqNCwLKlzB300S6CYE4c8rpLGi0tag2YymsM0TVLVfmkWkeUyUXU9
         xCkZoaa+VOYFs6oDhytbxe2lQNCjHuoafchSTRYhGlcnIk9GOh/0u+4+A7waFc1ah15p
         wb5w==
X-Gm-Message-State: ANhLgQ1AEjX9Hfe4ao6lPMLFeL4fp7W0t1g96BiIv0bngzhc4krxjox1
        j+t10mUhAgzL3jmmOeQVqiNf2w==
X-Google-Smtp-Source: ADFU+vtgBsqLCxc1WIyurKzcIGq00eupxNzzBQUA9Hm7fC7RVe5GrYL7SrWGnfmVf04T87Ro1s1FLg==
X-Received: by 2002:a63:fd0d:: with SMTP id d13mr22612146pgh.302.1585027752740;
        Mon, 23 Mar 2020 22:29:12 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j14sm2795413pgk.74.2020.03.23.22.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 22:29:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v5 3/4] remoteproc: qcom: q6v5: Add common panic handler
Date:   Mon, 23 Mar 2020 22:29:03 -0700
Message-Id: <20200324052904.738594-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200324052904.738594-1-bjorn.andersson@linaro.org>
References: <20200324052904.738594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a common panic handler that invokes a stop request and sleep enough
to let the remoteproc flush it's caches etc in order to aid post mortem
debugging. For now a hard coded 200ms is returned to the remoteproc
core, this value is taken from the downstream kernel.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Picked up Mathieu's r-b

 drivers/remoteproc/qcom_q6v5.c | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index cb0f4a0be032..111a442c993c 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -15,6 +15,8 @@
 #include <linux/remoteproc.h>
 #include "qcom_q6v5.h"
 
+#define Q6V5_PANIC_DELAY_MS	200
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -162,6 +164,24 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
+/**
+ * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Set the stop bit and sleep in order to allow the remote processor to flush
+ * its caches etc for post mortem debugging.
+ *
+ * Return: 200ms
+ */
+unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
+{
+	qcom_smem_state_update_bits(q6v5->state,
+				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
+
+	return Q6V5_PANIC_DELAY_MS;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 7ac92c1e0f49..c4ed887c1499 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
+unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
 #endif
-- 
2.24.0

