Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A78420313A
	for <lists+linux-remoteproc@lfdr.de>; Mon, 22 Jun 2020 10:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgFVIAG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 22 Jun 2020 04:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgFVH7s (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:59:48 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4029C061796
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:59:48 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id k4so14849061oik.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TTeC9Xi4qmQZeAOaphNZwsLRTSZ0LBevI66eeZFDnkA=;
        b=XAYvSU8HN8yBlbKuHfbJtuSsGToPrd+zDmCC2oKtJ0VVy2zd3Jn71KkbOytQU1ODmg
         ruspmVeLT8+Tyrahotyq7Atc4l436bDFnn2PqWXvxoU46ac9CTaYifRTXlxUB+z1D8C/
         FLqwY696rMer/Pcdm04wr6bqxhYux28lS2p78XtJvZel+FS/4NsO25VjbzQXF33E0BaK
         UvIMLYMXo1e6tNJMPqYB0PvzLQ/squz+fPeIueqQbhavDL7OFF+GgCiCjJvnVxWKF4Jz
         ZPXNANkc+arm9j47j9LSicyc5ZBlReoPVFN7A8kRKywcs8DBn5PSpuZch68+/o/+unNZ
         pN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TTeC9Xi4qmQZeAOaphNZwsLRTSZ0LBevI66eeZFDnkA=;
        b=jOg24SFYl4Wws9k3AA9Gccftedif6UVHuBw6XTkGwxiDYGORvLMHBN7G9iz4dw4ear
         4GhDU5awQbsIhpW8gfyl5m30+HGTgX0HpzC3UA6bEBVVHzrMfRY+8Bty/hed96hxW6ZF
         e6LMUUx11Y5xp4zc8WY51xHslHvAsByPJchgCQpD9gVorlC/DRjfgcW2G6pXXTKk0H7J
         cIZgE8ieDDC61MG34Hl1DHAZaCHHtHiAwZD44cN1RWyP2sgaCZ7tS1r7vJPxqV86i4K9
         Xgi8SnZmP3Dw76IK743QKdD50hKS+rmIR488OgCX1LSqmd4e09hiNyrk8kuV8j/R4zBo
         tfjA==
X-Gm-Message-State: AOAM533IjbiLTn0OIdQ3FMEL6RSZYNjynuMadso8mamNQLqda4zmOwmx
        58QaALeIFipEW3UyXy9YUhcMsA==
X-Google-Smtp-Source: ABdhPJw8A7djz0qzGWjwrGnP2koCSgUdpHbwC8JC4UWp1TlKHu6Nj9ro9JvJV9lwB2MWoeXWGqyMRA==
X-Received: by 2002:aca:5c43:: with SMTP id q64mr11118702oib.130.1592812788187;
        Mon, 22 Jun 2020 00:59:48 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm3135396otl.60.2020.06.22.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:59:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: hwlock: qcom: Allow device on mmio bus
Date:   Mon, 22 Jun 2020 00:59:54 -0700
Message-Id: <20200622075956.171058-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622075956.171058-1-bjorn.andersson@linaro.org>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In modern Qualcomm platforms the mutex region of the TCSR is forked off
into its own block, all with a offset of 0 and stride of 4096, and in
some of these platforms no other registers in this region is accessed
from Linux.

Update the binding to allow the hardware block to be described directly
on the mmio bus, in addition to allowing the existing syscon based
definition for backwards compatibility.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 .../bindings/hwlock/qcom-hwspinlock.yaml         | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 71e63b52edd5..88f975837588 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sfpb-mutex
       - qcom,tcsr-mutex
 
+  reg:
+    maxItems: 1
+
   '#hwlock-cells':
     const: 1
 
@@ -31,7 +34,12 @@ properties:
 required:
   - compatible
   - '#hwlock-cells'
-  - syscon
+
+oneOf:
+  - required:
+    - reg
+  - required:
+    - syscon
 
 additionalProperties: false
 
@@ -46,6 +54,12 @@ examples:
                 compatible = "qcom,tcsr-mutex";
                 syscon = <&tcsr_mutex_block 0 0x80>;
 
+                #hwlock-cells = <1>;
+        };
+  - |
+        tcsr_mutex: hwlock@1f40000 {
+                compatible = "qcom,tcsr-mutex";
+                reg = <0x01f40000 0x40000>;
                 #hwlock-cells = <1>;
         };
 ...
-- 
2.26.2

