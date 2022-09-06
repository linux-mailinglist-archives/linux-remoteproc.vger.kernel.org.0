Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6E85AE561
	for <lists+linux-remoteproc@lfdr.de>; Tue,  6 Sep 2022 12:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239129AbiIFKbM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 6 Sep 2022 06:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238894AbiIFKbL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Sep 2022 06:31:11 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227093CBEB
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Sep 2022 03:31:04 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e13so14758681wrm.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Sep 2022 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0C8ZbZGRsC6WjnSw7WLm99RBXqDzMdZGyqdyLdbrKqA=;
        b=pTovjWtRzdMpF92MW8b2c0eWxMHtxixVr0cmHy/pfwC6yTbJyjCmj+XX8x9A8Y2jDY
         2v9p3NqG3lyns7zHwFLabqm7vZ7aoaDlWxWYnhaSD5KJ0utWYNzq0jvfUHpx+Ahh8Em3
         KRtQd5iNP916z6IEJdhjUKBPZeaTXnmxpnFDqL9FQdBWIg1Mw8ksB8QAswmbGkQuDSjB
         L6hhcpLUtb72zDbBDqw+1quUn4YB65hlAwN8jfCNx8R3T8M/ovMgUfViIDaxYLyVz+lV
         LEIe2XaMpfTe84o0DEq0yNuEwEVKJY2rW9xG5OjnLhwsRhzRSmN43T7vI77T28/+WZMi
         JHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0C8ZbZGRsC6WjnSw7WLm99RBXqDzMdZGyqdyLdbrKqA=;
        b=unpCiUEZl5o88LwFmwUAH3nkA1hKeFhZtjwimEuQqTvEEtIzT8v3hFp7WSnoWNI/ib
         ICyDqUTTmjL4/QgLrphLPZzwjESul5+KKJvjQjN6Z5NTvYucjyLZWtMgBwJUvzbez24+
         zV6vhVkUw+RWpaIMwhYAn00PbdeTNgti6L91AHaD3ujAlkAoXtnxkx880Y02ItjhrHpG
         BTv+s2pqxtJ+cz3yOxjRnZDyXFgt9S/E/5QCXLYNkxN0K8J+/9TKROUrmRbuFp09ijHQ
         yhfsEUI/UJ4VPwW4GZeOFAGt1VhOBr3fHKbT1oLyaM8RNROPcKKga76gG/s7xHAa3FqV
         MP8g==
X-Gm-Message-State: ACgBeo2o0fA45edsnXJqA7VHah+2FV3h90VgjNL4nS1S6Upu5elQhmdE
        A+XcE7V6Wju4eHagJSfJO4FYiQ==
X-Google-Smtp-Source: AA6agR4Y8kHinJebL9VZAxfM33D0R3zE1NXbClajF1sigO+w/4Bc5A7bAMTHhVTUyqWogDNicEQ47A==
X-Received: by 2002:a05:6000:1f83:b0:223:60ee:6c08 with SMTP id bw3-20020a0560001f8300b0022360ee6c08mr26000850wrb.682.1662460262623;
        Tue, 06 Sep 2022 03:31:02 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c4fd000b003a5c999cd1asm18121478wmq.14.2022.09.06.03.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 03:31:01 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v9 2/2] MAINTAINERS: Update fastrpc documentation file from txt to yaml
Date:   Tue,  6 Sep 2022 13:30:55 +0300
Message-Id: <20220906103055.2089519-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906103055.2089519-1-abel.vesa@linaro.org>
References: <20220906103055.2089519-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The documentation for fastrpc bingings is now YAML. So update the
MAINTAINERS file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v8:
 * no changes

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96f47a7865d6..ad697195fc59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16863,7 +16863,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
+F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
 F:	drivers/misc/fastrpc.c
 F:	include/uapi/misc/fastrpc.h
 
-- 
2.34.1

