Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FAD26E609
	for <lists+linux-remoteproc@lfdr.de>; Thu, 17 Sep 2020 22:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgIQUDA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 17 Sep 2020 16:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgIQUDA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 16:03:00 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3788CC061A10;
        Thu, 17 Sep 2020 12:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqlfjFYVgEA5lHejDn65+/HeWKZZeGOqOUm0U0RTX5Dufttkzd2I6fwBb4yXJSgL/1HNPiyAXQeCaD3t4+a44gWL9zTI2ELXlhPKLKl9KD+68+b+AcJZjff2BS1WlJ4k2c5EeOQT3F6btQ7+/Pic1fRQmNuuql/1dwUbhZpTx0jYgT7uvIixEvq3SuvarTu/jpxoWchbuU6IHYLwIKF6UAc2ClLO8iIWX3XQ93rxQDiqga6P5N2i9xxONOKpnYmPVAqGHXrdmgqi0TT8tutVKnNT7eHXpIWA7CrObTxRalbAebFnTIqLW1vLBC3X5sJ8C1V0jK//L4OsZRJ80qqkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XUH5w/XHClRg6X4ZRGlepy7+ogGhWgwKe6nsgSHSrs=;
 b=DI/hwXzT3YZCS9FDg9HF0J+hYF7JpSvYBCrHcxg1myRx5srALykyzLFiAM/tX9ZXF5XgQaoX4pECIuzM571vYkI/OMvVlrOf0Sne3PKnDtKPDlF6cRXQHz87+euRioGPmyPIkCKBWgzZcw1orXcC/W/gR3lz+sx1+rng4o+jByJRBI/f0qUhvTLB6r8t1hTRUphoLCx3qhj+6GGo6ICAsEM5aroAZBd1flB0aPxbLU6J9RaddWrtyPS+nEhR5m05nf+nd/2KxlbPGGRkZ2KuxOqHyS1rcUQ4PK6n5PxnIHb5p9juCh86G66LsQUyz7oZwdf/hhB+o7UZp7G0WfTdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XUH5w/XHClRg6X4ZRGlepy7+ogGhWgwKe6nsgSHSrs=;
 b=q90fBRMSHjJLxJOBjPPtdLnAlXGJwSJ5D1dxtuSX+PWeBlQyTAoD286WrOKZXiZfCuHITjyyF4DHmxdCuUod8HTjcEMgwEXqSq4joU5qQg/Sfc/TT3tJGpjsc0PIRY5rfWDv2/ci8e0VIbiXDKYVvbNwgcmI0XdimfX41rZ3xc4=
Received: from SN4PR0501CA0120.namprd05.prod.outlook.com
 (2603:10b6:803:42::37) by CY4PR02MB2631.namprd02.prod.outlook.com
 (2603:10b6:903:70::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Thu, 17 Sep
 2020 19:43:45 +0000
Received: from SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::4b) by SN4PR0501CA0120.outlook.office365.com
 (2603:10b6:803:42::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend
 Transport; Thu, 17 Sep 2020 19:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT010.mail.protection.outlook.com (10.152.72.86) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 19:43:45
 +0000
Received: from [149.199.38.66] (port=43986 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzoe-0005ZC-IV; Thu, 17 Sep 2020 12:43:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzom-0005P5-Vn; Thu, 17 Sep 2020 12:43:45 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08HJhgl6028245;
        Thu, 17 Sep 2020 12:43:42 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzok-0005OV-5c; Thu, 17 Sep 2020 12:43:42 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Jason Wu <j.wu@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v14 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Thu, 17 Sep 2020 12:43:40 -0700
Message-Id: <20200917194341.16272-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917194341.16272-1-ben.levinsky@xilinx.com>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3fc49d3-78a4-489e-5d21-08d85b41fd40
X-MS-TrafficTypeDiagnostic: CY4PR02MB2631:
X-Microsoft-Antispam-PRVS: <CY4PR02MB263168FC001C1D60567FD040B53E0@CY4PR02MB2631.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEqHhadT1ABFBb1zb3vO/zmGWI12uut0YrVsGP68TTbluMPC64zw1mwXrMtV2AsBIHgzCjwSoRdqpKYRnHVKB4Ew9rWdh3ahD6Ij/50DtmxzGpQo4fT5bKWqyq0JCSjKu86VG9z+DoVfWxN/MifEvaoLjRw4amSc9IiZSbgEtfPsShqhmy9yxEm10Oy3v6uXWfcSX8XI3c/7vxa9lnCvt9wmbhIy70RLkltgr1MWMrorpQGMUi1zP1/75SVW72vzTudbBKLXkzqasYjOie0VMzqPIBcijBlQVNYRNOnMbyaZlqoF2QJMNJApPvaRDK5sKWLzZYssYMSgQ8QTSl1A/v9lygPJuhjH30V4/Ac/e8URjusTqVRtQY7qdZtxOEVLZxHFQQJh7KXK6NIzDkR+KyTDpcdP/DfA6PWj1nPP1BZKdsIsUu9lSl/27/t6CcexX0dgA94cLKAYwQUozOd3iBdCljDp8PBwmbFoKrUQqdU=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(39860400002)(346002)(136003)(396003)(46966005)(47076004)(7696005)(26005)(83380400001)(1076003)(70586007)(82310400003)(356005)(81166007)(70206006)(82740400003)(186003)(107886003)(4326008)(316002)(478600001)(44832011)(2906002)(36756003)(9786002)(8676002)(8936002)(426003)(54906003)(336012)(2616005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 19:43:45.2660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fc49d3-78a4-489e-5d21-08d85b41fd40
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2631
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
v14:
- concerns were raised about the new property meta-memory-regions.
  There is no clear direction so for the moment I kept it in the series
- place IPC nodes in RAM in the reserved memory section
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..cd2406b4dc24
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,119 @@
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
+
+          rpu0vdev0vring0: rpu0vdev0vring0@3ed40000 {
+               no-map;
+               reg = <0x3ed40000 0x4000>;
+          };
+          rpu0vdev0vring1: rpu0vdev0vring1@3ed44000 {
+               no-map;
+               reg = <0x3ed44000 0x4000>;
+          };
+          rpu0vdev0buffer: rpu0vdev0buffer@3ed48000 {
+               no-map;
+               reg = <0x3ed48000 0x100000>;
+          };
+
+     };
+
+     /*
+      * Below nodes are required if using TCM to load R5 firmware
+      * if not, then either do not provide nodes are label as disabled in
+      * status property
+      */
+     tcm0a: tcm_0a@ffe00000 {
+         reg = <0xffe00000 0x10000>;
+         pnode-id = <0xf>;
+         no-map;
+         status = "okay";
+         phandle = <0x40>;
+         compatible = "xlnx,tcm";
+     };
+     tcm0b: tcm_1a@ffe20000 {
+         reg = <0xffe20000 0x10000>;
+         pnode-id = <0x10>;
+         no-map;
+         status = "okay";
+         compatible = "xlnx,tcm";
+         phandle = <0x41>;
+     };
+
+     rpu {
+          compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          lockstep-mode = <1>;
+          r5_0 {
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
+               memory-region = <&elf_load>,
+                               <&rpu0vdev0vring0>,
+                               <&rpu0vdev0vring1>,
+                               <&rpu0vdev0buffer>;
+               meta-memory-regions = <&tcm_0a>, <&tcm_0b>;
+               pnode-id = <0x7>;
+          };
+     };
+
+...
-- 
2.17.1

