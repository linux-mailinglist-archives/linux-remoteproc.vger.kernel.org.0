Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A281D06CC
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 07:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgEMF5b (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 01:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728803AbgEMF5a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 01:57:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76034C05BD09
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 22:57:30 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x15so6941305pfa.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6DiGQprIc29jGTRSS3LZaN5JVFAfBWIOn/MrmstepU=;
        b=Fb2COTTw/N3aD5LFq740uqcf3QSh77Yy6iPOdAeFB4E4qUXDDK+SYDileYM1YFcqLl
         zMxq/AxeRh7l3p/pWa6CQ+3Vw2ae7TZQNvWoLomxvCdh8C/7xzFaACTHK74Qwg05dJXV
         UUTezkhlz5DdGS7TFBpBnhR12FUen2C6GHxT14TDeCTgm/9Pjhi4fjodWTcQZVzT38/m
         s/K8AgbVLfKlQT4z9BL0UQnp+MbGS7QIhXE8UYuj1illNa+kt+QBTQ6jZ9nNCpAa5BRW
         KHJUQWh/0n/aJT6bsh+Dzs071uS+POhBPxnNOiyWTl7vCwB4ED0XtV5hPrOp+7u8WouW
         ZIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6DiGQprIc29jGTRSS3LZaN5JVFAfBWIOn/MrmstepU=;
        b=b9lc3jrsijdVsDxX2gtwneC9qJo24CSymCJELHDmLwJBfNTh0maqaycqYaUBWBgBcd
         +7yz0a8RMOzyyHQxw/BOD0N2d+IfgFlyARb7I5cGbxDOf3KM1HhgXSa7e/3x4+NOFCR9
         bBdmsrfhTZaX8KV14A2Tlu47juFCux4NHLkJntealYkl6q+JnoLJlpdRZWgmyKtuiAS/
         4c5pE8vvBf8mS5amPBhKnlQfka8m07/oBuXLcxKor0BZPCVkZVyrOZ69M7kjUL9qogD+
         DQXJGzgAhDMHRpX+DF2JU+1Q9h9c3e8RCI8n96qQ7CLGlcrENTEMqNF4sfVXf4WO9d9v
         HN2g==
X-Gm-Message-State: AGi0PuYzMx6JiHzrIFRfyoRCfxd+rugoJi3+uUpSY9dgLrQKhUeZFmJo
        Aze8ItadWmCa3TYaL9nmhPTYWg==
X-Google-Smtp-Source: APiQypI84evXisIIfEqnC8EO9qzc3IB9Ueo00kGZo3+v1H5V2zsyU8JHw0t4FsBkkGqyEde+HF8bsg==
X-Received: by 2002:a05:6a00:c8:: with SMTP id e8mr24250228pfj.206.1589349449862;
        Tue, 12 May 2020 22:57:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w192sm14131161pff.126.2020.05.12.22.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 22:57:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v5 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Date:   Tue, 12 May 2020 22:56:37 -0700
Message-Id: <20200513055641.1413100-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a devicetree binding for the Qualcomm peripheral image loader
relocation information region found in the IMEM.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Fixed reg in example to make it compile

 .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
new file mode 100644
index 000000000000..87c52316ddbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm peripheral image loader relocation info binding
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  The Qualcomm peripheral image loader relocation memory region, in IMEM, is
+  used for communicating remoteproc relocation information to post mortem
+  debugging tools.
+
+properties:
+  compatible:
+    const: qcom,pil-reloc-info
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    imem@146bf000 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x146bf000 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      ranges = <0 0x146bf000 0x1000>;
+
+      pil-reloc@94c {
+        compatible = "qcom,pil-reloc-info";
+        reg = <0x94c 0xc8>;
+      };
+    };
+...
-- 
2.26.2

