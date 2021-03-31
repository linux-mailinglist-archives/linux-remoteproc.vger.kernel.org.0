Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130CE34B7AE
	for <lists+linux-remoteproc@lfdr.de>; Sat, 27 Mar 2021 15:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhC0OcN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 27 Mar 2021 10:32:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32932 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhC0Obq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 27 Mar 2021 10:31:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12REVZP4022499;
        Sat, 27 Mar 2021 09:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616855495;
        bh=MYNfuso9vI4/c6IFLTupBSNCVd+TkyTmMexrXQvnD2Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GM3Fzb0+B7ahAKU5A8NGB15ZV2MS6qhKpxTvjwjLPVckz+eftFXmVUs9Id/zxvFV1
         b+WfQemF4XYWyu1RKcrWBapkVY15pEcSTYtOI22UuxDqbCyEPFX+Dla1ndItetqxN0
         ygA9Roh7IsSUFWIA1QfKfQa2/2+8goa2xQ32LSXM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12REVZ6J060683
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 27 Mar 2021 09:31:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 27
 Mar 2021 09:31:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 27 Mar 2021 09:31:35 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12REVZSI034944;
        Sat, 27 Mar 2021 09:31:35 -0500
Received: from localhost ([10.250.33.213])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12REVZbe019374;
        Sat, 27 Mar 2021 09:31:35 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
Date:   Sat, 27 Mar 2021 09:31:16 -0500
Message-ID: <20210327143117.1840-2-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210327143117.1840-1-s-anna@ti.com>
References: <20210327143117.1840-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The K3 AM64x SoCs have two dual-core Arm R5F clusters/subsystems, with
2 R5F cores each, both in the MAIN voltage domain.

These clusters are a revised IP version compared to those present on
J721E and J7200 SoCs, and supports a new "Single-CPU" mode instead of
LockStep mode. Update the K3 R5F remoteproc bindings with the compatible
info relevant to these R5F clusters/subsystems on K3 AM64x SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index d905d614502b..130fbaacc4b1 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -14,8 +14,12 @@ description: |
   processor subsystems/clusters (R5FSS). The dual core cluster can be used
   either in a LockStep mode providing safety/fault tolerance features or in a
   Split mode providing two individual compute cores for doubling the compute
-  capacity. These are used together with other processors present on the SoC
-  to achieve various system level goals.
+  capacity on most SoCs. These are used together with other processors present
+  on the SoC to achieve various system level goals.
+
+  AM64x SoCs do not support LockStep mode, but rather a new non-safety mode
+  called "Single-CPU" mode, where only Core0 is used, but with ability to use
+  Core1's TCMs as well.
 
   Each Dual-Core R5F sub-system is represented as a single DTS node
   representing the cluster, with a pair of child DT nodes representing
@@ -33,6 +37,7 @@ properties:
       - ti,am654-r5fss
       - ti,j721e-r5fss
       - ti,j7200-r5fss
+      - ti,am64-r5fss
 
   power-domains:
     description: |
@@ -56,11 +61,12 @@ properties:
 
   ti,cluster-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1]
     description: |
       Configuration Mode for the Dual R5F cores within the R5F cluster.
-      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
-      default is LockStep mode if omitted.
+      Should be either a value of 1 (LockStep mode) or 0 (Split mode) on
+      most SoCs (AM65x, J721E, J7200), default is LockStep mode if omitted;
+      and should be either a value of 0 (Split mode) or 2 (Single-CPU mode)
+      on AM64x SoCs, default is Split mode if omitted.
 
 # R5F Processor Child Nodes:
 # ==========================
@@ -97,6 +103,7 @@ patternProperties:
           - ti,am654-r5f
           - ti,j721e-r5f
           - ti,j7200-r5f
+          - ti,am64-r5f
 
       reg:
         items:
@@ -198,6 +205,20 @@ patternProperties:
 
     unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      enum:
+        - ti,am64-r5fss
+then:
+  properties:
+    ti,cluster-mode:
+      enum: [0, 2]
+else:
+  properties:
+    ti,cluster-mode:
+      enum: [0, 1]
+
 required:
   - compatible
   - power-domains
-- 
2.30.1

