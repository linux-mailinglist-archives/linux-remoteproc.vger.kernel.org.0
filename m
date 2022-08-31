Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D30E5A82E0
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Aug 2022 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbiHaQRw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 31 Aug 2022 12:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbiHaQRp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Aug 2022 12:17:45 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC207D2EB5
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Aug 2022 09:17:42 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z23so12297678ljk.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Aug 2022 09:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=cKBGsEaj4oQkEiZ75eQ0nd+cq+8A2N09JqV8gHiJ4+Q=;
        b=tMgFRqslaUaliYOxYH0dYUK2/uIP7BKLWbF+I6IKNsjCJinHeYlZHRVMu1TRfw18Wp
         bUUkrsR36U9exIiOTQm6OmML0i/o8y2PcqqRp5BB8Nr2aaU0hNDmnhYE+52sHOujL6Vt
         1edd5Gm891k0Nu5Fsw1IyJvFBxknVve9eMr9QIBaqtPqLZjmLfNcGdJqcnrwyXclrZrA
         K9X6jK+IPOdS3ljtzFzBXEnpyCtnp6lopK0QmsQNQFcBrE2nqL3pllJCwOEwf0SimD2e
         LzLBsew2A2CtBjjxVQ9pqWnVFcUCtYQn0uJKMIvISBauaVlJIsJxLbwth/pDtYdLqjiJ
         h8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=cKBGsEaj4oQkEiZ75eQ0nd+cq+8A2N09JqV8gHiJ4+Q=;
        b=cE+gGBlp2ZHh4QM1vCtLOZLDo5iPKyosQL7f/NfOLpqqGrf0httSTUJLq5cJ9mMlyz
         6PafY2Hu+UoTYrn5nKd/GaonMSnMWKnE2i8eJ+gd8ACFq6UjarIwjmvXGR4WSnrGDXD7
         AUFQ56GT3+18Pwl4fiEqBEOGQTw+spzeNSBDXTSfayqYbMyc/1u0e92n0WsGEzG21Qi6
         MJUFim7WRWL3RHcncVZu5/s0zHhawmpGRw/5CfEiEyxbjc6UNFDgvQOmQm07IG3H5LWQ
         QVD6gq/quKIets4pUKKvZbVzrmSP/yaEOz1947J+t+tqUdhSytuWm/eKva2R2jQLvhtE
         NCog==
X-Gm-Message-State: ACgBeo3lamt2imdPUlByg0kiK8EeHrAO+eGh7Qj7Q8yby4yzO/sjq/nP
        xHHBFa5bCYxQMXSdK40ZDWxGLg==
X-Google-Smtp-Source: AA6agR4XliYALSJxmaQxjIWvOpSmc8kb/s83quW2sIBceAg8gUtAGNVFHuJ2Z38TzPn8KPwBT6uGuA==
X-Received: by 2002:a05:651c:905:b0:261:d00c:e71 with SMTP id e5-20020a05651c090500b00261d00c0e71mr8699218ljq.407.1661962661016;
        Wed, 31 Aug 2022 09:17:41 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512214200b004917a30c82bsm306338lfr.153.2022.08.31.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 09:17:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] remoteproc: report firmware name on load failures
Date:   Wed, 31 Aug 2022 19:17:36 +0300
Message-Id: <20220831161736.749932-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

remoteproc error messages like:
  remoteproc remoteproc0: request_firmware failed: -2
  remoteproc remoteproc1: request_firmware failed: -2
are difficult to debug as one actually have no clue which device
reported it and which firmware is missing.  Be verbose and print the
name of the failed firmware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e5279ed9a8d7..71cd7ed7a970 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1923,7 +1923,8 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
+		dev_err(dev, "request_firmware %s failed: %d\n",
+			rproc->firmware, ret);
 		goto unlock_mutex;
 	}
 
@@ -2023,7 +2024,8 @@ int rproc_boot(struct rproc *rproc)
 		/* load firmware */
 		ret = request_firmware(&firmware_p, rproc->firmware, dev);
 		if (ret < 0) {
-			dev_err(dev, "request_firmware failed: %d\n", ret);
+			dev_err(dev, "request_firmware %s failed: %d\n",
+				rproc->firmware, ret);
 			goto downref_rproc;
 		}
 
-- 
2.34.1

