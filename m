Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D92D283C11
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Oct 2020 18:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbgJEQGb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 5 Oct 2020 12:06:31 -0400
Received: from mail-dm6nam11on2044.outbound.protection.outlook.com ([40.107.223.44]:19360
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726659AbgJEQGV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Oct 2020 12:06:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLVXqZCC+Ai0Ln1HNrD9iN0q2vgqxliYDoVTQXKlvwzQSK9/HUBYf4p++XBn5XlucSaznct8NQoRPfIFe9VlABns5hJYYv//dlIUVuW2jpLsGBjVNqdlzwbIhJSXieKb7+9lAEZOTzNZmck0WYCFb/VLneIs75dSZVBryXg4mbedhfhgW6BuFREyW8lIJrgL1Wqp62beQp3l4IkR5l5ifNPUXAwO3eQlh0H4EJjvOqNZu53vdP7eed9WDOxOYxnp8lWsbgP2fZbzhlqX9LQygXYNx75ntsYtdrdxPSkLtfH3GFg5Jrq7DRAKgz+gJNgUw1etq4rsM68he6aaHgu5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4IcB3c/avAP+1zXYkpdvf0Ticak+IRpsB8zrCDolEo=;
 b=EcUoG+vElfw2palN3yYkdO/D06Yh41oYrnSKtyBO3zM5N36SwlGt+qzJ8/9VOTQsfR32vJ1yFeXQYCOgNLmyQR5Pt9aSaKnd5XZZbRPXlbwayn/qYKx6q0uDU2Oam9vtpWn8WKXQ0LBvZ01U7yORTtqDB4mGruv48XJDAJn/SizCfNAh8QHAgNU4wTEo+5lTFzM9XfTnYq4pEyJIeEOaY6uF/Acd2Kb5t2aOBPOSAn7ZXHydZmE2VF1vdYmqJKynMo/tsQzWlZA59xUQtz8q8+B8/Qeh8pn24h449X4oGSWlzFIwvb/qiK2MAwYCRY+h/oEy7p6GMncEvT1QDUuf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4IcB3c/avAP+1zXYkpdvf0Ticak+IRpsB8zrCDolEo=;
 b=e6OkDxIcth81X0/kixL9JfgXjUeBG/F+ngjEXAjMngItixwgIggQWo6zzZRtSEOq+dQZTFZam/gWrD8hoq85lUf/zZc9qMlME2pg/1nFJdfTnau5ajAskfGL6BMyUgYzch/+UHFFu0GTldAeRdqT5mJJKs9jYXWs8RGXSLUTRXE=
Received: from SN2PR01CA0061.prod.exchangelabs.com (2603:10b6:800::29) by
 MWHPR02MB2493.namprd02.prod.outlook.com (2603:10b6:300:43::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.37; Mon, 5 Oct 2020 16:06:16 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::5e) by SN2PR01CA0061.outlook.office365.com
 (2603:10b6:800::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Mon, 5 Oct 2020 16:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server id 15.20.3433.39 via Frontend Transport; Mon, 5 Oct 2020 16:06:16
 +0000
Received: from [149.199.38.66] (port=36669 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPSze-0001tf-RB; Mon, 05 Oct 2020 09:05:42 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPT0C-00026i-4e; Mon, 05 Oct 2020 09:06:16 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 095G6EKK027457;
        Mon, 5 Oct 2020 09:06:14 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPT0A-000260-9Z; Mon, 05 Oct 2020 09:06:14 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     ed.mooring@xilinx.com, sunnyliangjy@gmail.com,
        punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v18 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Mon,  5 Oct 2020 09:06:09 -0700
Message-Id: <20201005160614.3749-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a533f22-f7bc-4fda-e8dc-08d8694896f8
X-MS-TrafficTypeDiagnostic: MWHPR02MB2493:
X-Microsoft-Antispam-PRVS: <MWHPR02MB249321BDE6D7B0B8FFB09B4AB50C0@MWHPR02MB2493.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIhQpku3Nl7IyqjxMlZq3QDxnabUZS2/W3nXreAQIoEK1UiHR6XtHCkusoj1XjH7aWARKTVXSeZkKPpp7DNQqA1S2u5SW7Bq6S4BQqjchjhL0clySlxGDQF0I9CJZRdgkmDlShviBfsWm+UAhhbCzEL8nIWpxsqL1cK7euR8Up6uySzYKYZ39SV4NCwmRYzM+0DNMc+fTXrikqxuL6claGEjOVuITb9ocHtuv+eyTTMFwbNz2Qzmn8MIdiBfE1Im0a27bnSNm3OJhIdA8o7aZJucoT+23g59lvKbuXZP80nzv0NAMxZniI0Iu5qOSpk8CXXc1DBml3zabcDT9F97b6Lv7ui1gmqKlqkNNej4fOO1r7FCGzCHIrDTDMHmCjrJ4ngFdivV5bgKHNOZHC2SXaNRgXo7BFzKxcFr9mqP8Ig=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39860400002)(136003)(376002)(396003)(346002)(46966005)(1076003)(36756003)(44832011)(81166007)(6666004)(356005)(336012)(478600001)(2906002)(70586007)(7696005)(2616005)(316002)(426003)(9786002)(70206006)(4326008)(8936002)(26005)(186003)(5660300002)(8676002)(47076004)(82740400003)(82310400003)(83380400001)(42866002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 16:06:16.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a533f22-f7bc-4fda-e8dc-08d8694896f8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2493
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver was tested on Xilinx ZynqMP QEMU

For sake of ease of review, only support ZynqMP. Once accepted, then
add support for Versal platform and R5 loading onto OCM.

v2:
- remove domain struct
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
v11:
- update usage of zynqmp_pm_get_rpu_mode to return rpu mode in enum
- update zynqmp_pm_set_tcm_config and zynqmp_pm_set_rpu_mode arguments to
  remove unused args
- use enums instead of u32 where possible in zynqmp_r5_remoteproc
- zynqmp_r5_remoteproc: update prints to not use carriage return, just
  newline
- zynqmp_r5_remoteproc: look up tcm banks via property instead of string
  name
- print device tree nodes with %pOF instead of %s with node name field
- update tcm release to unmap VA
- handle r5-1 use case
- device tree binding r5 node to have link to TCMs via
  meta-memory-regions property
- fix device tree binding so no warnings from 'make dt_binding_check'
v12:
- update signed off by so that latest developer name is last
- in drivers/firmware/zynqmp.c, update zynqmp_pm_set_rpu_mode so rpu_mode
  is only set if no error
- update args for zynqmp_pm_set_rpu_mode, zynqmp_pm_set_tcm_config fn
  arg's to reflect what is expected in the function and the usage in
  zynqmp_r5_remoteproc accordingly
v13:
- zynqmp_pm_get_rpu_mode argument zynqmp_pm_get_rpu_mode is
  only set if no error
v14:
- rebase off v5.9-rc3 kernel
- concerns were raised about the new property meta-memory-regions.
  There is no clear direction so for the moment I kept it in the series
- in device tree binding, place IPC nodes in RAM in the reserved memory section
- zynqmp_r5_remoteproc::r5_set_mode set rpu mode from
  property specified in device tree
- use u32 instead of u32* to store in remoteproc memory entry private data
  for pnode_id information
- always call r5_set_mode on probe
- remove alloc of zynqmp_r5_pdata in
  zynqmp_r5_remoteproc::zynqmp_r5_remoteproc_probe as there is static
  allocation already
- error at probe time if lockstep-mode property not present in device tree
- update commit message as per review
- remove dependency on MAILBOX in makefile as ZYNQMP_IPI_MBOX is present
- remove unused macros
- update comment ordering of zynqmp_r5_pdata to match struct definition
- zynqmp_r5_remoteproc::tcm_mem_release error if pnode id is invalid
- remove obsolete TODOs
- only call zynqmp_r5_remoteproc::zynqmp_r5_probe if the index is valid
- remove uneven dev_dbg/dev_err fn calls
v15:
- change lockstep mode device tree property from acting as
  boolean, to instead being used as, if it is present, then r5 is in lockstep mode. otherwise in split.
- add safeguard for if 2 rpu remoteproc instances are provided then err out
v16:
- replace of_get_property(dev->of_node, "lockstep-mode" with
  of_property_read_bool
- propagate rpu mode specified in device tree through functions instead
  of holding a global, static var
- check child remoteproc nodes via of_get_available_child_count before
  looping through children
- replace check of "pdata->pnode_id == 0" instead by checking rpu's
  zynqmp_r5_pdata* if NULL
- remove old, obsolete checks for dma_pools in zynqmp_r5_remoteproc_remove
- change rpus from zynqmp_r5_pdata[] to zynqmp_r5_pdata*[] so that
  check for pdata->pnode_id == 0 is not needed
v17:
- remove compatible string from tcm bank nodes
- fix style for bindings
- add boolean type to lockstep mode in binding
- add/update descriptions memory-region, meta-memory-regions,
  pnode-id, mbox* properties
- update driver as per kernel-test-robot
v18:
- *really* change zynqmp_r5_remoteproc::rpus and rpu_mode to static
- to more closely mimic other remoteproc drivers, change zynqmp r5 rproc
  data from zynqmp_r5_pdata to zynqmp_r5_rproc and pdata local var to
  zproc
- remove global vars rpus and rpu_mode
- instantiate device for zynqmp r5 rproc from device set by rproc_alloc
- fix typos
- update to call zynqmp_r5_release from the rproc_alloc-related device and
  remove the instantiated device from zynqmp_r5_probe
- remove unneeded call to platform_set_drvdata
- remove driver remove function, as the clean up is handled in release
- remove while (!skb_queue_empty loop and mbox_free_channel calls in 
  zynqmp_r5_release, and mbox_free_channel
- remove device_unregister call in zynqmp_r5_release
- remove kzalloc for pdata (what is now called z_rproc)
- update conditional in loop to calls of zynqmp_r5_probe
- update example remoteproc zynqmp r5 compat string, remove version
  number




Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 142 ++++
 drivers/firmware/xilinx/zynqmp.c              |  96 +++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 708 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 6 files changed, 1015 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

