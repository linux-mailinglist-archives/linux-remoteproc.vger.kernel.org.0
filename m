Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B64253BB1
	for <lists+linux-remoteproc@lfdr.de>; Thu, 27 Aug 2020 03:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgH0B61 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 26 Aug 2020 21:58:27 -0400
Received: from mail-co1nam11on2059.outbound.protection.outlook.com ([40.107.220.59]:46657
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726790AbgH0B6U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 21:58:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvSdVUAzuwdgv9fhd9O27jiAMNe3KWaXQDoe7UaS2ah4yQUOnJWCndXXzKRHkaXtINzW6CM0xmzL8oZxXOt9R+pTwyH44x+s82im5Gz2GEfLbiK6AzfpL+4/JZ2GH+MqxYr0QfFTubrI+tqafakF8AU3+fbbxGWu1+PgeS2w+NQ79pH06+hcQY4A3P865mAw1RGN29PWsNPjt5PQjSHI7ajZWoHsw8cDzOGrbPelRJtojZzaxWDDKB3ZIBZSvzSQgK9iid3ttY0JF9rk5zjqe3Fd2m+Vi9q6nWTcLRfPfZ+q0D6180oPIPaRpCyGDfaG2I0bHuKLeSHCb2rikOjpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ3+zwK7XaBuOc2uS8qUIvIm4z8BTwd9iOrQ5deSvg4=;
 b=M1zka2DkVOyCEpT+x0gyDVqwkrDQWp3DabIskXEMvAqLlM4TYJpwZ11G3fLtNUORXgGSAoIAw8fjhTauSz629YfrqK8qda62US1CNrxmiDFmknB/m+6CUt6u9Btz6vE7Pia0BDdV2nxR52VpH2H5NKHPYq7xnjypFsZ7P8/NtOn+khOmkt9Oc+Z5EzO9G2E/K4g8FxEDhQAwO9kpGnLHMuZ3DWTRy9fzPC9Ae6xBHzGzzBHZPhmmOtncRsqcvT7P9wZ5SiQkvRlgfKIf8J8kiS8YY1EG9chYUSPYejDobNb1kk+sbfWsI19I04jCBqlcuk1RjfsqL0xDZGgi82xjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ3+zwK7XaBuOc2uS8qUIvIm4z8BTwd9iOrQ5deSvg4=;
 b=rAmQctHDg6eik0r0yosW9FdOIN/wExIm2YMz2ULlDDjXh9mlP/tD71D8e6pasAPDh4XACYfYXyQlozaueMQGc4k0YaYTQ+/Jma20H2HF7vqcUgJpPfJLQNEe6HedyTpoOjeBqbLBuRQAXWG3NEmvt8aFxlKgLuVReGkMaKuTbBs=
Received: from DM5PR19CA0071.namprd19.prod.outlook.com (2603:10b6:3:116::33)
 by BYAPR02MB5208.namprd02.prod.outlook.com (2603:10b6:a03:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 01:58:17 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::e4) by DM5PR19CA0071.outlook.office365.com
 (2603:10b6:3:116::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 01:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with Microsoft SMTP
 Server id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 01:58:15
 +0000
Received: from [149.199.38.66] (port=58693 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kB7Ad-0002AL-Cc; Wed, 26 Aug 2020 18:57:43 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kB7B9-000183-0m; Wed, 26 Aug 2020 18:58:15 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07R1wApn015254;
        Wed, 26 Aug 2020 18:58:11 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kB7B4-000155-PJ; Wed, 26 Aug 2020 18:58:10 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     stefano.stabellini@xilinx.com, michals@xilinx.com,
        michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Wed, 26 Aug 2020 18:58:05 -0700
Message-Id: <20200827015810.11157-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5b9ef98-cb68-493e-88b4-08d84a2ca951
X-MS-TrafficTypeDiagnostic: BYAPR02MB5208:
X-Microsoft-Antispam-PRVS: <BYAPR02MB520858531F1320825445F219B5550@BYAPR02MB5208.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Az1GCZHeRM0Cj/Q3DV3b+2kUFPFjP5fNTE5LPvosoDRyDyk2gnwhm5WE2xtJ2RYi3B+1N5WC/aIGD9SZ6vWhtVyd6gm3Lre5Sbpq6dO8liieMhIlp7C53AVKjROEB5I0vkqQCKnrtoUA7B+YNkNdBiuTxhQ+E0orxotZdpIsAS0QlJm/iFYYCF52VUfFpvfUemAz/ZbxMKvMqziNkrC0eJItqu/K2fRX16CwmTy9HUOjIzmC5fEvVJUnp7iVuRCDBZeRCoJf4lzwIUd4Oh31YsM46fXthRsyMigMEMhPUW2LS+atwjRisqeDQ1xWMmcpt03UsqACQLhS62gTCx3Bx+OvMRRtsZ8DW/oXyYp0E4kvhSphVxgZOXe3K/06/AwjpM7aGT7/gXQ5ijsRM3rhg==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39860400002)(346002)(376002)(396003)(136003)(46966005)(2616005)(81166007)(8936002)(8676002)(9786002)(6666004)(47076004)(26005)(82740400003)(426003)(82310400002)(336012)(44832011)(356005)(186003)(4326008)(2906002)(7696005)(1076003)(5660300002)(83380400001)(316002)(36756003)(70206006)(478600001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 01:58:15.2544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b9ef98-cb68-493e-88b4-08d84a2ca951
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5208
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver was tested on Xilinx ZynqMP

For sake of ease of review, only support ZynqMP. Once accepted, then
add support for Versal platform and R5 loading onto OCM.

v2:
- remove domain struct as per review from Mathieu
v3:
- add xilinx-related platform mgmt fn's instead of wrapping around
  function pointer in xilinx eemi ops struct
- update zynqmp_r5 yaml parsing to not raise warnings for extra
  information in children of R5 node. The warning "node has a unit
  name, but no reg or ranges property" will still be raised though 
  as this particular node is needed to describe the
  '#address-cells' and '#size-cells' information.
v4:
- add default values for enums
- fix formatting as per checkpatch.pl --strict. Note that 1 warning and
  1 check are still raised as each is due to fixing the warning
  results in that particular line going over 80 characters.
- remove warning '/example-0/rpu@ff9a0000/r5@0: 
  node has a unit name, but no reg or ranges property'
  by adding reg to r5 node.
v5:
- update device tree sample and yaml parsing to not raise any warnings
- description for memory-region in yaml parsing
- compatible string in yaml parsing for TCM
- parse_fw change from use of rproc_of_resm_mem_entry_init to
  rproc_mem_entry_init and use of alloc/release
- var's of type zynqmp_r5_pdata all have same local variable name
- use dev_dbg instead of dev_info
v6:
- adding memory carveouts is handled much more similarly.
  All mem carveouts are now described in reserved memory as needed.
  That is, TCM nodes are not coupled to remoteproc anymore.
  This is reflected in the remoteproc R5 driver and the device tree
  binding.
- remove mailbox from device tree binding as it is not necessary for elf
  loading 
v7:
- remove unused headers
- zynqmp_r5_remoteproc_probe:lockstep_mode from u32* to u32
- device-tree binding "lockstep-mode"  to "xlnx,cluster-mode"
- remove zynqmp_r5_mem_probe and loop to Probe R5 memory devices at
  probe()
- remove is_r5_mode_set from  zynqmp rpu remote processor private data
- do not error out if no mailbox is provided since mailboxes are optional
- remove zynqmp_r5_remoteproc_probe call of platform_set_drvdata as pdata
  is handled in zynqmp_r5_remoteproc_remove
v8:
- remove old acks, reviewed-by's in commit message
v9:
- if zynqmp_r5_remoteproc.c pdata->tx_mc_skbs not initialized, then do not
  call skb_queue_empty
- update arguments and documentation for zynqmp_pm_set_rpu_mode
- in fn zynqmp_pm_force_powerdown, change arg 'target' to 'node'
- zynqmp_pm_request_wakeup update code style
- edit 3/5 patch commit message
- document zynqmp_pm_set_tcm_config and zynqmp_pm_get_rpu_mode
  documentation to include expected return val
- remove unused fn zynqmp_pm_get_node_status
- update 5/5 patch commit message to document supported configurations
  and how they are booted by the driver.
- remove copyrights other than SPDX from zynqmp_r5_remoteproc.c
- compilation warnings no longer raised
- remove unused includes from zynqmp_r5_remoteproc.c
- remove unused  var autoboot from zynqmp_r5_remoteproc.c
- reorder zynqmp_r5_pdata fpr small mem savings due to alignment
- zynqmp_pm_set_tcm_config and zynqmp_pm_set_rpu_mode uses second arg
- zynqmp_r5_remoteproc.c use of zynqmp_pm_set_tcm_config now does not
  have output arg
- in tcm handling, unconditionally use &= 0x000fffff mask since all nodes
  in this fn are for tcm
- update comments for translating dma field in tcm handling to device
  address
- update calls to rproc_mem_entry_init in parse_mem_regions so that there
  are only 2 cases for types of carveouts instead of 3
- in parse_mem_regions, check if device tree node is null before using it
- add example device tree nodes used in parse_mem_regions and tcm parsing
- add comment for vring id node length
- add check for string length so that vring id is at least min length
- move tcm nodes from reserved mem to instead own device tree nodes
   and only use them if enabled in device tree
- add comment for explaining handling of rproc_elf_load_rsc_table
- remove obsolete check for "if (vqid < 0)" in zynqmp_r5_rproc_kick
- remove unused field mems in struct zynqmp_r5_pdata
- remove call to zynqmp_r5_mem_probe and the fn itself as tcm handling
  is done by zyqmp_r5_pm_request_tcm
- remove obsolete setting of dma_ops and parent device dma_mask
- remove obsolete use of of_dma_configure
- add comment for call to r5_set_mode fn
- make mbox usage optional and gracefully inform user via dev_dbg if not
  present
- change lockstep_mode from u32* to u32
- update zynqmp_pm_set_rpu_mode and zynqmp_pm_set_rpu_mode documentation
  and remove unused args
v10:
- add include types.h to xlnx-zynqmp.h for compilation

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 113 +++
 drivers/firmware/xilinx/zynqmp.c              |  86 ++
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 898 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  63 ++
 6 files changed, 1171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

