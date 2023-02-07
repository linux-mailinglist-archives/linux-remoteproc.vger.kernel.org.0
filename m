Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623B568D22E
	for <lists+linux-remoteproc@lfdr.de>; Tue,  7 Feb 2023 10:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjBGJJH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 7 Feb 2023 04:09:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjBGJJE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 04:09:04 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C602238012
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 01:08:59 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id g6so4840077wrv.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUaBz8Wj2D5vq+Kh2IsKpU4Gz19YcWnTY9ua/0BPDPY=;
        b=YtG5XkZacx+Pi+rKPbhOpPtdVe0GYqqKaJUerSbckkBOl36WJUMu+WYk6IwyxdaAXB
         u5P2fu3D0RvYGSL/l14dTA1/uXdAOuRzOBzDoPJ0JgOKs+Qx+K9IxKOQo3WGcOXRzWak
         AVmZ6LgI+OfsKyzpiluJjnToseQsjSU27FKtMXLLO98X2BoJkw3f8tcBAbU7oCuTtRh6
         ShlEBn+0nfJE55YkQaM5Y8E1zqHPvNrbeby59zcBwX45exVo5qlkeA0vEkWqq5plrO6e
         B3OvxzxzRunT1V9LHmaOZU4PwUQ//uX51dzViFIE42vl179sIzrx/t7npAWIjfFLDrx2
         BKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUaBz8Wj2D5vq+Kh2IsKpU4Gz19YcWnTY9ua/0BPDPY=;
        b=hdZQ/c3zhoBMWv3MBUGmck9ObODl2Lq0D0ai31tjI8vUttxdTOKaBOnIz82vw1qSEk
         e5275QCk+136cO8S9hptQMoNVtPi6SJ2rucbfmgK+NBItI2Ks4pyns/DjlytuXm2uSVP
         4vpAcRO3GEX8H599goL1NZG854ilMfbugPnu8oAKh6O05GU7PgbcfN+Am+UI10zdz4YE
         09N+5Xa6dYEIrEKL2zTLwGnZB/P1aH6jB+LRBaz66mRI9W+8EwbN7OblmtgmD4xn2n7/
         6dIJuTZYIWT52NCu1M82qnOFHXacHcYjVqNUC8XhgTe3NYqjnSlpBJjWsp4+Hf6/R5ev
         cqZg==
X-Gm-Message-State: AO0yUKXpXVrmoJJNgjMGU3Zmz7T8dNJzoHCFrWzgH64IlcmTJSgq+T0L
        4pp9qTe2EqDTiJnCy2L7reRc1w==
X-Google-Smtp-Source: AK7set9TwHFF5oaEVbd1cKlgNkoD65nG9Tbft8M278dwOwakgmcz5S7So+GIVoG1dQxr9q0sySExlw==
X-Received: by 2002:adf:e443:0:b0:2bf:94c3:19ac with SMTP id t3-20020adfe443000000b002bf94c319acmr1857014wrm.31.1675760938387;
        Tue, 07 Feb 2023 01:08:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h3-20020a056000000300b002c3e5652744sm5081955wrx.46.2023.02.07.01.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:08:58 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: qcom: msm8996: align RPM G-Link clock-controller node with bindings
Date:   Tue,  7 Feb 2023 10:08:50 +0100
Message-Id: <20230207090852.28421-3-krzysztof.kozlowski@linaro.org>
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

qcom,rpmcc bindings expect RPM clock controller to be named generic
"clock-controller":

  rpm-glink: rpm-requests: 'qcom,rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 55180586f7b6..e0d46dbd498f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -483,7 +483,7 @@ rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
-			rpmcc: qcom,rpmcc {
+			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-msm8996", "qcom,rpmcc";
 				#clock-cells = <1>;
 				clocks = <&xo_board>;
-- 
2.34.1

