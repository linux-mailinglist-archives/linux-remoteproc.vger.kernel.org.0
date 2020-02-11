Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A8E1586F6
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Feb 2020 01:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbgBKAwR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 10 Feb 2020 19:52:17 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45525 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbgBKAwP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:15 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so3512387pls.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Feb 2020 16:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=usB5IoDyLwWY36+AuSkvkbrGcg49AWldfTwBCrrtmpU=;
        b=x8yLEeAJm5pg44gCh19Xinxc52LnzVmwZBRkJFm2t+blF3Kx8ux8OLeeQTKtqyZJh7
         v43NbY/nF8f4JoFBX+I+mlu8+VJnZem3CbyjRUNAJpJecBPJXslIhd5FHYtVk5Hmkt2J
         e01TAgFVetot9Jeq4x2df5WUV5Jv4S8cBsHbPCKxrio8pvWw1vFrD6DLB2Mwk57nmry1
         AaMId8w0OC3YuuzcHw5wo4C0BCABvmzadCE98WJ4GoVysMT+pRKhL1slWvJzduJpnrVL
         82tyDGYgnXlUv7I5Jsorp7bwjFlD58W8D8tcrpiQ+7/t3/G7V+fIH9IN2UNgUCRQxmdB
         5FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=usB5IoDyLwWY36+AuSkvkbrGcg49AWldfTwBCrrtmpU=;
        b=s8a1sJn4O12TNhGk9TmIAUQsaoUvNBow6LI7xcNMXNzVVZpZPTUGwdrwG0z0SgmEN0
         XurjraoOHZ07r7TAGxLj2hhUItvT9QWCB3FjAQnUNJsknF7/pwdaq/LjsWQN8B4WTQm7
         Cc+URf5WLoK5d6eLdlDg5mg6y+bOBt6JwAqEZbGylld7gLgUP24DVSLG+Ro4w5QSxgBd
         tpc4V2EZ69kREZgNK/hvuP3xp/rUp4qisFY/ef6vVqkA6RZ2dNVmlAWTxnN0OEaUu5pF
         IYp+4BwcclMcWZ0WrQkP9dSfRfGg11gHDRNq+6xWTA66BCjXvb3+rgiGQkBM+LlfLLXl
         z51Q==
X-Gm-Message-State: APjAAAXCpnQXwqjnYe3ZO0n7YESiasg9zh33Oif20p37FMBprrYC9Ybl
        8BzNot8klhygbbBB818ujRZbpA==
X-Google-Smtp-Source: APXvYqzBLJhl4yfx6CRhp1php6TZrHLUEmZeDDuor9FiyoO4g8yRWY7V1J8l3ohfRc3nP4NIgJzOWQ==
X-Received: by 2002:a17:90a:b010:: with SMTP id x16mr669765pjq.130.1581382334401;
        Mon, 10 Feb 2020 16:52:14 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:13 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 4/8] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
Date:   Mon, 10 Feb 2020 16:50:55 -0800
Message-Id: <20200211005059.1377279-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on QCS404 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replace offset with reg

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4ee1e3d5f123..f539293b875c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -997,6 +997,19 @@ blsp2_spi0: spi@7af5000 {
 			status = "disabled";
 		};
 
+		imem@8600000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x08600000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible ="qcom,pil-reloc-info";
+				reg = <0x94c 200>;
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.24.0

