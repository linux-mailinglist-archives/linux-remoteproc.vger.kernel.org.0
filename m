Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9DA25DBCF
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Sep 2020 16:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgIDOdN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Sep 2020 10:33:13 -0400
Received: from mail-bn7nam10on2075.outbound.protection.outlook.com ([40.107.92.75]:56192
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730570AbgIDOcX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Sep 2020 10:32:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbitQLvNHh1J5wPk8p6elVp+gqZggjPwdX+/KP8sOSxnsnq3pDCvYgjGbabSArXu4UD+XXrVLIDraad6KwBh/RfHvASsMCjJs7kCNQIp5UTYQqHTMwqnKTTB73jbMgI7qSvrpqUzj6ogwwOalTyjnBrLiymNS4BrbnYHHI0WrAfKHYOm5T+5/9Di9CaD/pX9ymBc88KRhAlvMdFmC5b1dKEZeq9X+lgRnusNru7kx+pzCzFaz2plsvGvkoZixM2RlTvmOpFOTgPYezc3wVJJQyfOl7/RiIscxhZs/AE5Uh4mL4FBxVI1uEXb+IJZLfhWyOmAAciNke+sIGhSTEiPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBhzK6/+3qzl2TIEmlP/0lBGAMg4z3Yvf69FMHri2gI=;
 b=E2Ts1bRUSjYgtU6HWc/NYKu9kqq2I7NgCp17vTAqoMqiBRpn/OMQ10c+LExfes6IG1X54vTPgTsr3TaEUXD8oG+rBrqkHhgmBJDoQzzFJqmaNY571Lmmb9L3f7oxACbUQBXq36H6UxPLJcfxB1gXjdVBGROsMg5cefrHye5uCUsVvGVQ3ML0NpfSlVbbLI+sz/DvIRZhRhjbZaEYokHAMrWXp+EQRqCEv/S7ZpyTmDdkIm3NIphcjqUY3NjCvhVmtxHML/iBVDUpVpE0HEp1xUthxfmipfiqDPjFZSERnBNlwh3+tB9UBxWJ7gvWPq3MlDmIVI9Six8SjFzHtKxWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=toshiba.co.jp smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBhzK6/+3qzl2TIEmlP/0lBGAMg4z3Yvf69FMHri2gI=;
 b=OakGVHgHEUy1g7Bglas52oY/xQYkVYZK2aAnnGQ/vZX0BCJPRgfrALKi7knQiywDl6G0q4ZoNY2UzZaZqIjImdEhQzKknyznKUP0Ljbi+8AO7M6YZ8Py7Kt/eq0HPsQ6F70KFSxFKA9pg8EK+jF4WHSp1vx1DkGW05yAz+fxVqU=
Received: from MN2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:208:23e::35)
 by CH2PR02MB6581.namprd02.prod.outlook.com (2603:10b6:610:ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 14:32:17 +0000
Received: from BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23e:cafe::b1) by MN2PR14CA0030.outlook.office365.com
 (2603:10b6:208:23e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Fri, 4 Sep 2020 14:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; toshiba.co.jp; dkim=none (message not signed)
 header.d=none;toshiba.co.jp; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT043.mail.protection.outlook.com (10.152.77.95) with Microsoft SMTP
 Server id 15.20.3348.17 via Frontend Transport; Fri, 4 Sep 2020 14:32:15
 +0000
Received: from [149.199.38.66] (port=38220 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kECl5-0002aG-PP; Fri, 04 Sep 2020 07:32:07 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kEClD-0003ng-9H; Fri, 04 Sep 2020 07:32:15 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kECl7-0003lx-QP; Fri, 04 Sep 2020 07:32:09 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com
Cc:     michael.auchter@ni.com, devicetree@vger.kernel.org,
        mathieu.poirier@linaro.org, emooring@xilinx.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jliang@xilinx.com, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, Jason Wu <j.wu@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v13 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Fri,  4 Sep 2020 07:32:08 -0700
Message-Id: <20200904143209.31235-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904143209.31235-1-ben.levinsky@xilinx.com>
References: <20200904143209.31235-1-ben.levinsky@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 086af59c-52a0-459b-0f72-08d850df5201
X-MS-TrafficTypeDiagnostic: CH2PR02MB6581:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6581BE6A3DAA986578CB411EB52D0@CH2PR02MB6581.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: du/I6TwhvWlcWYtT4iirO0uP4UFtuYKvJvRLDDgGiFfLOCoIdl/H9a170euKl7RvSSGiwnPKHnQv3lQ1KSZGF4G/RZPfg9IPj4pr1flobVoEfE0uMLbRKRi081GWm0GuWzLNIWoAVMsbFJGAxTrt5MloHeSLeV32fyPHu2EiKqEkUTTTuVXW5n/StDYdfQnUn5oTF7xTmckKJm5VrioEMkJRv5P5w3wF+4TOl4pmRhlNZiTkgxUDfBiSIEhJUKMDOXT6FwdvppwuUbxVHoup3aB7ctm/EkGEVwfIo8Hn/33kLnmblLgihDtD/3U0MIXgWFdSNte4uQ9iJYo4h6wtGdMgEyeaOcubTEbMmnyxJmDLzr0G6vQwdYGtVsXbjyTsnAd24tGBV/a4gbBuFpLN54O98+tPZxRrPYWLgmeaFDuS1LRJ+IyRDvjsGM9RqqGvNRQ6KPjMIn4nA4+MM7HofQJZFvbvONLvWbu8DAasRv8=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(346002)(136003)(376002)(396003)(39860400002)(46966005)(36756003)(26005)(9786002)(8676002)(82310400003)(70206006)(4326008)(54906003)(426003)(70586007)(44832011)(2616005)(186003)(83380400001)(316002)(81166007)(82740400003)(47076004)(1076003)(5660300002)(107886003)(8936002)(478600001)(6636002)(7696005)(2906002)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 14:32:15.6545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 086af59c-52a0-459b-0f72-08d850df5201
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6581
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add binding for ZynqMP R5 OpenAMP.

Represent the RPU domain resources in one device node. Each RPU
processor is a subnode of the top RPU domain node.

Signed-off-by: Jason Wu <j.wu@xilinx.com>
Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
v3:
- update zynqmp_r5 yaml parsing to not raise warnings for extra
  information in children of R5 node. The warning "node has a unit
  name, but no reg or ranges property" will still be raised though 
  as this particular node is needed to describe the
  '#address-cells' and '#size-cells' information.
v4::
- remove warning '/example-0/rpu@ff9a0000/r5@0: 
  node has a unit name, but no reg or ranges property'
  by adding reg to r5 node.
v5:
- update device tree sample and yaml parsing to not raise any warnings
- description for memory-region in yaml parsing
- compatible string in yaml parsing for TCM
v6:
- remove coupling TCM nodes with remoteproc 
- remove mailbox as it is optional not needed
v7:
- change lockstep-mode to xlnx,cluster-mode
v9:
- show example IPC nodes and tcm bank nodes
v11:
- add property meta-memory-regions to illustrate link
  between r5 and TCM banks
- update so no warnings from 'make dt_binding_check'
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..148374c61908
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xilinx R5 remote processor controller bindings
+
+description:
+  This document defines the binding for the remoteproc component that loads and
+  boots firmwares on the Xilinx Zynqmp and Versal family chipset.
+
+  Note that the Linux has global addressing view of the R5-related memory (TCM)
+  so the absolute address ranges are provided in TCM reg's.
+maintainers:
+  - Ed Mooring <ed.mooring@xilinx.com>
+  - Ben Levinsky <ben.levinsky@xilinx.com>
+
+properties:
+  compatible:
+    const: "xlnx,zynqmp-r5-remoteproc-1.0"
+
+  lockstep-mode:
+    description:
+      R5 core configuration (split is 0 or lock-step and 1)
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping for remoteproc IPI. It is required if the
+      user uses the remoteproc driver with the RPMsg kernel driver.
+    maxItems: 6
+
+  memory-region:
+    description:
+      collection of memory carveouts used for elf-loading and inter-processor
+      communication.
+    maxItems: 4
+    minItems: 4
+  meta-memory-regions:
+    description:
+      collection of memories that are not present in the top level memory
+      nodes' mapping. For example, R5s' TCM banks. These banks are needed
+      for R5 firmware meta data such as the R5 firmware's heap and stack
+  pnode-id:
+    maxItems: 1
+  mboxes:
+    maxItems: 2
+  mbox-names:
+    maxItems: 2
+
+examples:
+  - |
+     reserved-memory {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          elf_load: rproc@3ed000000 {
+               no-map;
+               reg = <0x3ed00000 0x40000>;
+          };
+     };
+     rpu {
+          compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          lockstep-mode = <0>;
+          r5_0 {
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
+               memory-region = <&elf_load>;
+               meta-memory-regions = <0x40 0x41>;
+               pnode-id = <0x7>;
+          };
+     };
+
+     /*
+      * Below nodes are required if using TCM to load R5 firmware
+      * if not, then either do not provide nodes are label as disabled in
+      * status property
+      */
+     tcm_0a@ffe00000 {
+         reg = <0xffe00000 0x10000>;
+         pnode-id = <0xf>;
+         no-map;
+         status = "okay";
+         phandle = <0x40>;
+         compatible = "xlnx,tcm";
+     };
+     tcm_1a@ffe20000 {
+         reg = <0xffe20000 0x10000>;
+         pnode-id = <0x10>;
+         no-map;
+         status = "okay";
+         compatible = "xlnx,tcm";
+         phandle = <0x41>;
+     };
+
+     /*
+      * Below nodes are required for IPC, as Xilinx Kernel
+      * can potentially have other applications that use CMA
+      * and conflict from hardware design. With that in mind,
+      * explicitly state the address spaces for the IPC remoteproc
+      * mechanisms.
+      *
+      * If IPC not required and only elf-loading then these are not needed.
+      */
+     rpu0vdev0vring0: rpu0vdev0vring0@3ed40000 {
+         no-map;
+         reg = <0x3ed40000 0x4000>;
+     };
+     rpu0vdev0vring1: rpu0vdev0vring1@3ed44000 {
+         no-map;
+         reg = <0x3ed44000 0x4000>;
+     };
+     rpu0vdev0buffer: rpu0vdev0buffer@3ed48000 {
+         no-map;
+         reg = <0x3ed48000 0x100000>;
+     };
+
+...
-- 
2.17.1

