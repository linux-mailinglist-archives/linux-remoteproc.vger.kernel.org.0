Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7177421FE17
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 22:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgGNUFG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 16:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729982AbgGNUFC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 16:05:02 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D738C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:05:02 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 72so7484310ple.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vHRO/0KjGNxIcLdu4Nprxq06C5XRM7DNFyiZUQDkaSQ=;
        b=HpKSrt/sw9Twx4HYSQuRe7qY2HexRKWuCG6/YkmnOA1TfIJTbMVco+HycC/GnXMpqP
         TZjyyRVe2FYTRm6E0s1cgTTjq+iiCo3g1yeKhd0cWSLw3rA+TxicbTqNBW0/wNK0siox
         +4ufU5GgjwoozEWZ7ZG+coKhws4dDc1NiLjSoEp6fJFDtEtjlbLGjaJK4nwdHstyPfK0
         Ir/2CdmVsKStSv9gbs4F3IEeC5GR7ZYr/BNed2kbgBJWjQO4HqrpjfdjU/HcWhDO1G0u
         eqQ72tDURayiZEW86/BZcasUcGJL3JXeC8E9ACR7ZQ+INM8BG+R5MIswuWu8usBVk0be
         FBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHRO/0KjGNxIcLdu4Nprxq06C5XRM7DNFyiZUQDkaSQ=;
        b=ZEVCOaiFtnlTtcnSdNzoWEAlrtef/Rkj/ERYKMk5mzUn5fehTCMQ3NVecUc+tlHaZ+
         PDALFbAQoofKDNgAL7Bw1ZxtPABzTjS/G1bB8OvotCTV2HMUBkUYtut8F+bnxZN1xfPA
         EuK74Q+36J5YUImdz/fi6rP2pGlYWRCQXYPltntugjq4lQA3eS7MB7ZCEUz5I9p8GAvl
         /o+t0VjtgKwLBY04Hm0VvezzkUd7fY/P6ogYjlFYz1PqJqCfmfMzR7WVB789p7VBfMDD
         61jkhofJpgf3DL8pwICTIaTA+xTSGh/gKn9s2dL9/3TPqpF5bbzXS2GCF1zQ4H++jqSi
         U3Tg==
X-Gm-Message-State: AOAM531FsuvTW2Zp/C2a9Y4d31Aw0k4bhQz3aGXkhh+Rto4bp9BqwPjR
        GwlCh6FxEi4wZjqp3vnb3xD3zw==
X-Google-Smtp-Source: ABdhPJzf7Ljcc070FSCCrVZHXRqFKMPunWgU55weQAyEjLHUA8bgjcOZIqobpXzGVURx+JoT/+hOTA==
X-Received: by 2002:a17:90a:304d:: with SMTP id q13mr6267566pjl.73.1594757101831;
        Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 11/11] remoteproc: stm32: Update M4 state in stm32_rproc_stop()
Date:   Tue, 14 Jul 2020 14:04:45 -0600
Message-Id: <20200714200445.1427257-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update the co-processor state in function stm32_rproc_stop() so that
it can be used in scenarios where the remoteproc core is attaching
to the M4.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7145cd49616e..f4da42fc0eeb 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -504,6 +504,18 @@ static int stm32_rproc_stop(struct rproc *rproc)
 		}
 	}
 
+	/* update coprocessor state to OFF if available */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.25.1

