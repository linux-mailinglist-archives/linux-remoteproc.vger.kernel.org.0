Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F20F7D9B15
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Oct 2023 16:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346166AbjJ0OUq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Oct 2023 10:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346118AbjJ0OUo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Oct 2023 10:20:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774B2D6D
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Oct 2023 07:20:38 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9cf83c044b7so233359066b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Oct 2023 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698416436; x=1699021236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5VK2HSIOWZmUzPwXwqeSeHrMobAdR7tlAySzxFYWrY=;
        b=kju7MqYAJmlHUDfIkQKsMnzzAr2o7ukRwdw9kG/ruxKWZheoyDFlQz/LdvFvAPmAd1
         qjgnQAvi9ak+W0Vqqod9OcoLnyHLGf3CiHMe4yZx0vtgQzC5YSaiOehB991vvrPz47pp
         YQHJmYPtqvSayMBll0gXLrvBcVFroZAQhxYu5rqRUc2Jc51bfkcW7BAs6UdXxiCd0S5H
         +h+9lquEucc6m8D/SNnjRlfHXkQBrEHXHjnGEvZ0AvwiO1jL8b9pv+8JLyycShsLS6Nh
         6xET2gNvrEJkDmWC4wz9yfwHKa0qteNtg1ko3TLBNw9fYJ3776afsG4+H8atAWppWZPq
         f+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416436; x=1699021236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5VK2HSIOWZmUzPwXwqeSeHrMobAdR7tlAySzxFYWrY=;
        b=CWMebFmuRYtSqZdAT2NWVUQjpYvmjX2vbYblqbqaRU/bdsKUVi4kTO/61cb4Sl30v5
         imzMbCCNFEmpjAHKin+o+3vZ2NlKUHNDpD4BvbL7geC1cqPHHULYl0LVYZG4DgkPNMA8
         BdmdFddG+1R6uPWKEPfLldmNccFMoy2QycnJdSSBKrHQTIq0GzJuY/s7yCQFBq0gYFJv
         uGCt+vnSaZkZaPRRJURliWO8m12WYOhVvN5o9+3vk3CrRjOMxXMRHed0ja/7FG0QLaXe
         CjID/OL6UehBL56waWArwtgA13qQvphwVXw7TNDh8zAmdlMBPSCZ0Z+5Ig/ZAaW0XqGj
         /KvQ==
X-Gm-Message-State: AOJu0Yw1cWXuxTDGHhv+ruFJHIu4qqzDZ4VLYyP+GubLzYy8wzW2A4r7
        Py0rxO5qnPQf7bImA5qlT0X6LQ==
X-Google-Smtp-Source: AGHT+IGCrCLnjiNlVbMaeUUlvJXqIO5b6SWq0niQMI5IHqrUMdEpFeM4ZgO5YzR9L+9udK6dzKRqgA==
X-Received: by 2002:a17:907:3da7:b0:9be:6ff7:128a with SMTP id he39-20020a1709073da700b009be6ff7128amr2350241ejc.67.1698416436593;
        Fri, 27 Oct 2023 07:20:36 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906075700b0099cc36c4681sm1254076ejb.157.2023.10.27.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:20:36 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 27 Oct 2023 16:20:31 +0200
Subject: [PATCH 9/9] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable WiFi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-sc7280-remoteprocs-v1-9-05ce95d9315a@fairphone.com>
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
In-Reply-To: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Now that the WPSS remoteproc is enabled, enable wifi so we can use it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index d65eef30091b..e7e20f73cbe6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -713,3 +713,7 @@ &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
 };
+
+&wifi {
+	status = "okay";
+};

-- 
2.42.0

