Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6051D5B13
	for <lists+linux-remoteproc@lfdr.de>; Fri, 15 May 2020 22:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgEOU4u (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 15 May 2020 16:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgEOU4t (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 May 2020 16:56:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D99C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 13:56:49 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t16so1396925plo.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s8VDhGuf90flrni22PAMq0PKDvRvzu01cgQHrQkAFj4=;
        b=y/0wl3uo18c7tS7j57d3Zz+JlewUQBMvtMwNWF0DZ7HLH1KZYmL0up0STGVDbMDtyK
         7HseB+rrPRH1K+IJ4zFxWycOTsh6YlrcOZc4K7vbjrBwwRr1aEeELQxu/JB0ShYEm65Y
         Tc4gNrusae8YlRRDo8NchO+oZrGWxqr+GTdQEEgVoynZ0hHV+PyzI2mpXLHZHLPNvp3Z
         TvltwGzEPHW8vNrozpq/YZBeffCUdr8pQETq0y7jlPy9m3zM3kZicnLcyCZmCCjgyCPK
         JQA/0p9UKXrucdcZECmSi5EoXCMfOEZFfqgZLoSNRYFBtbfOVef+xs8lVNQ7jXg9a3Sj
         pxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s8VDhGuf90flrni22PAMq0PKDvRvzu01cgQHrQkAFj4=;
        b=Ti/08cy3i9cMBGn7tPtUPFUVg4ZiThI4PRDorCcX/Z9soyeA3uz4aDnzEiVmn5vWor
         gHZKXOTK3UHoJq8PjpNxPcarNO777/hf8ZoKpZLn76LPbA6FT0kxWn9nVMUyDh/gorry
         IvwGqzKAda3pGq9lgRb5aPRBVkCRDZOMc+wFryxYRYcEQ/co8oWpSS5FKjw9QHSk1rmf
         Z/L4frB7MUOSdVuJw3A/wYcNrSHrJI3zaGNnFQ6zYJqXgjnKIgsrTGfya97/TdzUQGsB
         oTbXbLLo8y8NZrMoNz6J1Atc9Wp1ssPjmP+eBb0MX1RY9RvlNiQLR99hYNA0/ikkhLeN
         h0eA==
X-Gm-Message-State: AOAM5335rbl6B3eLzKVFEdZ87Tr/rruzIrQZCIbqjnTRMK4G5zVAqmdX
        MDjQRvTp4kVEYSb+Dk3aZEGhsA==
X-Google-Smtp-Source: ABdhPJx24OkkbS2jhgwfSIrmOtBRqe/ry5dIWhu5gs9ECDMAJuQMhtatx9NQP1yAHm23aPdjWmBFUw==
X-Received: by 2002:a17:90a:4d4a:: with SMTP id l10mr5560683pjh.0.1589576208902;
        Fri, 15 May 2020 13:56:48 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z13sm2208903pjz.42.2020.05.15.13.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 13:56:47 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] sample: rpmsg: Print out RPMSG device name extension
Date:   Fri, 15 May 2020 14:56:42 -0600
Message-Id: <20200515205642.13529-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515205642.13529-1-mathieu.poirier@linaro.org>
References: <20200515205642.13529-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the new rpmsg_device_get_name_extension() API to print the
RPMSG name extension if used by a RPMSG device name.

Suggested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 samples/rpmsg/rpmsg_client_sample.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index ae5081662283..2c5dc65ed844 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -51,8 +51,13 @@ static int rpmsg_sample_cb(struct rpmsg_device *rpdev, void *data, int len,
 static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 {
 	int ret;
+	const char *extension;
 	struct instance_data *idata;
 
+	extension = rpmsg_device_get_name_extension(rpdev, 1);
+	if (!IS_ERR_OR_NULL(extension))
+		dev_info(&rpdev->dev, "extension: %s\n", extension);
+
 	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
 					rpdev->src, rpdev->dst);
 
-- 
2.20.1

