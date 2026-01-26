Return-Path: <linux-remoteproc+bounces-6274-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFunBV1Zd2maeQEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6274-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Jan 2026 13:09:01 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A668D8805F
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Jan 2026 13:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B9A23006682
	for <lists+linux-remoteproc@lfdr.de>; Mon, 26 Jan 2026 12:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0783A334C1C;
	Mon, 26 Jan 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="reoptmXj"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DE334C1A;
	Mon, 26 Jan 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429338; cv=none; b=N41tria9podY1BoyUEoLAnSYW5f05pnArfC1FxEwU8QNuRmOkHA3v4PpkVpQWyX1dqjGHGabTVmK1cGdDlyARhjUMX8ehvoOmn8WX6JPQaMO54xQ7ZfnYmtted2GTngS0S0hklmfUgaJa5GeWHL9EBY8TeWOMKnXkn1M+2NgxYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429338; c=relaxed/simple;
	bh=nPA/2MLgxN0wimvPDpwZ4bxUv8zXvhteAkpRiwmGRww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asqSdQruEXpEJ2c2+Gr3IdF2VEJ6N6HYclyhasNT8leqpjvIV9Cr5RTzhII53Jhx93GXJtsNwR0LbR0CPjhUiNQ5ondNDxtAPug2AYcSIevK00Fq+UotfXHfCe/FLB4tylf7TantamyxK9uKDNNJTjFRlUngygpBhzp02JxLUYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=reoptmXj; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769429337; x=1800965337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nPA/2MLgxN0wimvPDpwZ4bxUv8zXvhteAkpRiwmGRww=;
  b=reoptmXjrYm0s/8EKca8r2MUDsp5lZ0xyETzoVPpsmpKRSV1d4cIn10m
   Yzk46E7+IMLpuU5kBtV+hvocMYbxBNEAK34FZNId8yhXKfdRWLgIRvSKP
   YB34p0F3ArhTBHtrAF/HZHVDiBFlsCJt1YLl45wj60CrCxp8/kYpTkBAf
   c5DxVh7nEyn2bVsoNB7oN4JXxz/DgKHPo/1nDiJ8gQv9h1cDKehYAUtD/
   OPXxKzXc6SgYSFWxIvTdJmEn9/FBnIn4h+j7LJBnRFdKGtDFVPUmitAxf
   fIm18Hi5Peg7pHStPsTcKvujzG6SlZyq0Y9zfSSevz4JvoCxUBOJ5TInR
   A==;
X-CSE-ConnectionGUID: YdKOwlMaRum+YCEcOjTQUQ==
X-CSE-MsgGUID: ZTbl7MSlQl6E+Tccx0PcfQ==
X-IronPort-AV: E=Sophos;i="6.21,255,1763449200"; 
   d="scan'208";a="59537388"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2026 05:08:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 26 Jan 2026 05:08:20 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 26 Jan 2026 05:08:18 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: add Microchip IPC remoteproc
Date: Mon, 26 Jan 2026 12:06:57 +0000
Message-ID: <20260126120658.1674253-2-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126120658.1674253-1-valentina.fernandezalanis@microchip.com>
References: <20260126120658.1674253-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6274-lists,linux-remoteproc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[valentina.fernandezalanis@microchip.com,linux-remoteproc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,microchip.com:dkim,microchip.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: A668D8805F
X-Rspamd-Action: no action

Microchip RISC-V SoCs typically contain one or more clusters. Clusters
can operate in Asymmetric Multi-Processing (AMP) mode, where individual
cores or groups of cores run as independent software contexts.

The compatible is intentionally generic, representing a “generic” SBI
ecall interface to a set of remote processors, with the platform
abstracted  via SBI ecalls. The IPC/IHC (named differently depending on
whether it is RTL for the FPGA fabric or a hardened version) is
intended for Asymmetric Multiprocessing, where a set of cores or
clusters can run other firmware, such as Zephyr.

Unlike platforms with a fixed DSP, the configuration here is variable
even for a single SoC. For example, which memory regions are used for
the remote cluster or which mailbox channel is selected. This binding
documents that firmware interface.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 .../microchip,ipc-sbi-remoteproc.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
new file mode 100644
index 000000000000..6fc0ab7f3ffb
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remoteproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip IPC Remote Processor
+
+description:
+  Microchip RISC-V SoCs typically contain one or more clusters. Clusters can
+  operate in Asymmetric Multi-Processing (AMP) mode, where individual cores
+  or groups of cores run as independent software contexts.
+
+  The configuration is flexible, as the set of cores or clusters that can be
+  controlled as remote processors may vary, and memory regions used for
+  firmware as well as mailbox assignments depend on the system design.
+
+  Communication with remote cores or clusters is abstracted using ecalls
+  to the platform's Supervisor Binary Interface (SBI) firmware, through
+  which the state of remote cores or clusters are controlled. This binding
+  documents that firmware interface.
+
+maintainers:
+  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,ipc-sbi-remoteproc
+
+  cpu:
+    description:
+      phandles to the CPUs comprising the remote cluster
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mboxes:
+    description:
+      Microchip IPC mailbox specifier. Used for communication with
+      a remote cluster. For HSS versions prior to v2026.04, it is also
+      used for controlling the life cycle of a remote cluster. The
+      specifier format is as per the bindings in
+      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    maxItems: 5
+    description:
+      List of phandles to the reserved memory regions associated wih the
+      remoteproc device. This is variable and describes the memories shared
+      with the remote cluster (e.g. firmware, resource table, rpmsg vrings)
+    items:
+      anyOf:
+        - description: resource table when firmware is started by the bootloader
+        - description: remote cluster firmware image section
+        - description: virtio device (vdev) buffer
+        - description: vring0
+        - description: vring1
+
+  memory-region-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      anyOf:
+        - const: rsc-table
+        - const: firmware
+        - const: buffer
+        - const: vring0
+        - const: vring1
+
+required:
+  - compatible
+
+# Remote Cluster ID is derived either from the CPU phandle or
+# from the mailbox specifier prior to HSS v2026.04
+anyOf:
+  - required:
+      - cpu
+  - required:
+      - mboxes
+
+allOf:
+  - if:
+      properties:
+        memory-region-names:
+          contains:
+            enum:
+              - vring0
+              - vring1
+    then:
+      properties:
+        memory-region-names:
+          contains:
+            const: buffer
+
+additionalProperties: false
+
+examples:
+  - |
+    // Early boot mode example - firmware started by bootloader
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc {
+            compatible = "microchip,ipc-sbi-remoteproc";
+            cpu = <&cpu4>;
+            mboxes= <&ihc 8>;
+            memory-region = <&rsctable>, <&vdev0buffer>,
+                            <&vdev0vring0>, <&vdev0vring1>;
+            memory-region-names = "rsc-table", "buffer",
+                                  "vring0", "vring1";
+        };
+    };
+
+  - |
+    // Late boot mode example - firmware started by Linux (remoteproc)
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc {
+            compatible = "microchip,ipc-sbi-remoteproc";
+            cpu = <&cpu4>;
+            mboxes= <&ihc 8>;
+            memory-region = <&cluster_firmware>, <&vdev0buffer>,
+                            <&vdev0vring0>, <&vdev0vring1>;
+            memory-region-names = "firmware", "buffer",
+                                  "vring0", "vring1";
+        };
+    };
+...
-- 
2.34.1


