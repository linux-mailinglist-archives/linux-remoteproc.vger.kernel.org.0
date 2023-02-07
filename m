Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61CC668D22C
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Feb 2023 10:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjBGJJF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Feb 2023 04:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbjBGJJD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 04:09:03 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D783801D
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 01:08:58 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id g6so4840022wrv.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uS4nCbTqenRP6fhWwOZexR7WIgCiihn20gN4I6ZYpzs=;
        b=cfGY19mFm+RYVWbvNspRZEmV5towgaFv+Bo5mOMqjwya3iOzM5v/tAG9XUs9Ye5gKg
         o1CyHM9NA2vbqyIJbqRSXmD4IshGP7Wlbs3cFk6O5qTktTczmaB19/dtacpnKGlnYs6q
         TkT73hrNmcqr3iSfXieGKQ7K6PV0AoSxonY5gCdkgCZvOPXmw+BhMwIeBFzu+zoMbBUN
         leQtE7z/8o35yHydNfK55sbpfTmuCn6JbwbCAatTIRjThwHIQJVqiKA0ySFuoR9hjhrR
         gdzgNCe3zuiRjNEUeB5x2sDJYXNX1M6BRPWPP6iWcq+64fAlR4kEXvAB2WoEGMm7T4Hh
         NWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uS4nCbTqenRP6fhWwOZexR7WIgCiihn20gN4I6ZYpzs=;
        b=fVdPWQ0OLPybf7AtRpzDVA/25haPfr3Bv7E8AGXdCbh/ZxLbmqphHpZpEEDiZlByyZ
         Zfp4NsxlJ4SAi/nk25OzLHYf2zMOyTQo5XvgAJOGj0IHX8BeTYRAy9Xil7T9BcFzbIiB
         mpZi41m7mBn545NyvIEuSBziTi6DcvdcFYl/t+vmaFUAWV9ucdGruM8Rtc/7SBb7aBOt
         YmD3Vkz5rpT+bB0TQ4Dxk8hGafIDbmu0QJ16VCzTLea253z3Ov7BWTprf9iKnQLRYk5n
         kDstIa43a6MWm/POvaSKjZ7/70MeWlZryA5IOiwUKoHAKNHPpHV/5w7X50YdE/crIymc
         U+Rg==
X-Gm-Message-State: AO0yUKUILXL3buZsEA1aQGX3QT9ag/PX8P9fohbNET5ENr3HGdWCtSlt
        DXb6vlIwvoAJV2bHy+iwUR5MMA==
X-Google-Smtp-Source: AK7set+P8vGXvIg+k1B6RbgBQ+ZJvrn0VN0+IdsKA+pap4Uq407UloM5XNWG2wKeXDTjEkVw+wS47A==
X-Received: by 2002:adf:c644:0:b0:2c3:d707:7339 with SMTP id u4-20020adfc644000000b002c3d7077339mr9161041wrg.6.1675760937208;
        Tue, 07 Feb 2023 01:08:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h3-20020a056000000300b002c3e5652744sm5081955wrx.46.2023.02.07.01.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:08:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] arm64: dts: qcom: qcs404: align RPM G-Link node with bindings
Date:   Tue,  7 Feb 2023 10:08:49 +0100
Message-Id: <20230207090852.28421-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Bindings expect (and most of DTS use) the RPM G-Link node name to be
"rpm-requests".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9c9890cf1b10..bc2ed73afb74 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -223,7 +223,7 @@ rpm-glink {
 		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		mboxes = <&apcs_glb 0>;
 
-		rpm_requests: glink-channel {
+		rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-qcs404";
 			qcom,glink-channels = "rpm_requests";
 
-- 
2.34.1

