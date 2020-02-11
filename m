Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD101586EE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Feb 2020 01:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgBKAwL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 10 Feb 2020 19:52:11 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38326 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgBKAwK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:10 -0500
Received: by mail-pl1-f196.google.com with SMTP id t6so3526809plj.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Feb 2020 16:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhizcQrNZHXbgWrj4mKBKUeank5/j0aTe0/Ly1U0jwc=;
        b=mhpZK9ReyC64uuztvB4v7YaBTqMJAe6TRYWjAodSBc/5XTN1Ilado6v2YZPycAQxl3
         0GbVg6arqhwfH/YL/u4kwISo5kJyu3cp4ent7GxbNQxq1HTOX/VV2W3ItRp9h+MGPRgH
         aLobregRui7wcZ3+jwYzs6uw+Ow5mmtvX8ndSodWujw7dgCq4IPnz+iTF+sX+gM/Z+ty
         NuIdZCXW114xgLNbZQMAUSap6aB4yxHDrURLAFiERE2ITS49TauTO13dzFtasIJlKvpi
         DcN5N0larLZ5O4NASnuCamLOShDDwEGKGhTh7TPB1YkF1G1dYWjhw3uVJ5IEaIQ96xsH
         04pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhizcQrNZHXbgWrj4mKBKUeank5/j0aTe0/Ly1U0jwc=;
        b=b1nZkaGVXRRyCznqOF5AvVygwk2n0tZa29+VH2jhJtaENQqp4JYy+lADfvy1gQiphY
         WL7O8Qng5530IAdvIAnM4VYNyrc87gPahrZrW6HZjIIwQT988jGS/qts8BhSxxpYqOnc
         yEZcQyIx9DofjCC3Rn91XLKNHZ69VlVmE3pLO1OBvWH3vQh9ebl0qDpjWcBAKKE6Id4M
         l+JzgEt+tlOM7AuYnxbTOKuLGvm3ousCRwtw6swqLFwKfgm+sToYycAJBJ6B+91e+Jsb
         Fk1shfouqFmEMIHofkAAayTiG/M/UmAn7zgo1hmteEMt+WHeJSb/jfxBKGjIWDu5VPAa
         zZ1w==
X-Gm-Message-State: APjAAAWUJ3LwPh4KUVYdD4e2VTY/uOSUNYEseXxG2MhFHOodb5dUhPip
        xCfX2ybhU0JCMCT4yOm3QZ+LGg==
X-Google-Smtp-Source: APXvYqxcoMxw31IIUUXxZP96/pN8wPjnmV1c/wvB8rNFxyk6baM5maVAEa1ii5AJl89QxhN29phprQ==
X-Received: by 2002:a17:902:9a8c:: with SMTP id w12mr615147plp.149.1581382330138;
        Mon, 10 Feb 2020 16:52:10 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:09 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Date:   Mon, 10 Feb 2020 16:50:52 -0800
Message-Id: <20200211005059.1377279-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a devicetree binding for the Qualcomm periperal image loader
relocation info region found in the IMEM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replaced offset with reg to describe the region of IMEM used for the entries

 .../bindings/remoteproc/qcom,pil-info.yaml    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
new file mode 100644
index 000000000000..8386a4da6030
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -0,0 +1,42 @@
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
+  This document defines the binding for describing the Qualcomm peripheral
+  image loader relocation memory region, in IMEM, which is used for post mortem
+  debugging of remoteprocs.
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
+      reg = <0 0x146bf000 0 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      pil-reloc {
+        compatible ="qcom,pil-reloc-info";
+        reg = <0x94c 200>;
+      };
+    };
+...
-- 
2.24.0

