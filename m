Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9263B16AE21
	for <lists+linux-remoteproc@lfdr.de>; Mon, 24 Feb 2020 18:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgBXRw7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 24 Feb 2020 12:52:59 -0500
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com ([40.107.243.50]:6184
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727709AbgBXRwp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Feb 2020 12:52:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj8YvBmyjVRQEfRWtcPt5E6nDaQxty9Q73g1yrf99o1bqXCkxnaQOX29bFE8Lf33TaZioO0duB/xBxhp7zo1zBocheEQsNHiPcGOWTe5dz7XlRI+Bkdvav98lp4dxHgMfq+hVIeLYoDJzg9Q6xK1ju+9YB5ctTfbhFjMel1qM75cHpyiD2uJEq718Lho67dmJlY8eD8rAF1UG41Ss5EHxhTh8U5MI0PyzbcoVeRan2Qz5hUOfDLvQgW4wcGTmzDCdkKbbDea1fmJDHNOImV4W0ljljLi+Oh2TU+V/YlK8aF0ylJj/EddfHpJHetQOxyhBZnxIIGhtKe2o/UUbbKMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NvhhCqkZMueMvzUORkfGQsTMfv5Yf5qEEr262/B4hY=;
 b=O79Edf5zJJBMacrjzBUYSej2KDUOGt2l+0yh45ofB3VgUzeK7ZuICfYm4Z4AiMfIrgbgitwghhIUIROhgeBECzUp89iXW4Y0+FCsVI7yVFsxnPy6Ciru3tCwycaXJBNAR8oLdFuLUTTWCFuE9GHjS+/PWMNrJL/AbYZpULPgJOQyUegdqC5s1yTTIN6jHwkHbM81BP5jNb+EA+Ne9MfTLSGIhyyHWN65DgoOtS1qP5FN8d1WMUTV48GcDPV1lHzekVgZDQWvkfNeofVvI9ZZ4MOYORHCByArjBKs0RTnnUenruhm3E9omH7Y0uVR7k6S5oqftZc1wXpo+5M0jTZ99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NvhhCqkZMueMvzUORkfGQsTMfv5Yf5qEEr262/B4hY=;
 b=rkwvwaJYsPz4ldDIfljqUNT51GIXhQ97rEDAscRnWWGTGFcuBwZvQCiCc5K/xJ2nwPdtfdYRGm6twSrOExniwqs/xuKMLNCrXnf95fgy73+3bybsP4gmql3hXF1/0QgT9vaK0jT7TV+QUjMVpKuhZ5vbExEr0qz7bscqKPeFRqU=
Received: from SN4PR0201CA0017.namprd02.prod.outlook.com
 (2603:10b6:803:2b::27) by MN2PR02MB6766.namprd02.prod.outlook.com
 (2603:10b6:208:1dc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 17:52:42 +0000
Received: from BL2NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by SN4PR0201CA0017.outlook.office365.com
 (2603:10b6:803:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Mon, 24 Feb 2020 17:52:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT022.mail.protection.outlook.com (10.152.77.153) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Mon, 24 Feb 2020 17:52:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1j6HuK-0006VG-Tg; Mon, 24 Feb 2020 09:52:40 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1j6HuF-0007aa-QU; Mon, 24 Feb 2020 09:52:35 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01OHqVJu015186;
        Mon, 24 Feb 2020 09:52:31 -0800
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1j6HuB-0007aE-Ir; Mon, 24 Feb 2020 09:52:31 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon, 24 Feb 2020 09:52:27 -0800
Message-Id: <1582566751-13118-2-git-send-email-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(189003)(199004)(8676002)(6666004)(356004)(186003)(426003)(26005)(44832011)(4326008)(336012)(5660300002)(9786002)(81166006)(81156014)(2616005)(2906002)(70586007)(36756003)(7696005)(8936002)(498600001)(70206006);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR02MB6766;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f07c59b-6064-4d03-bf74-08d7b9525855
X-MS-TrafficTypeDiagnostic: MN2PR02MB6766:
X-Microsoft-Antispam-PRVS: <MN2PR02MB676696AB140D96A5C1227D16B5EC0@MN2PR02MB6766.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-Forefront-PRVS: 032334F434
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vtg8bUi8u7Grr+C6+RuGXyRZb3c8PFNJE5ZCyWObU8LlJFLOoO+bmC7Or5d7wWvIjg1U5V2VmcQpvAAKtsxs3kXc6gDHPX7Vp1IgxJdjmoGKnFz8hK7VKPLI0FANp4FJ6stWnJE4wm4gmIhr05rkDnbXkCeZmNvXMFs9ijObAILxmTMUSsJlALv3adOTUh+E7hag/+qMlP5ZNC9soI7mB5tm5vycuSH0SOZrNzQLnnBMEfOtNnVOcdkaCfBFI4fXSD5SgeAxKvM5eBALXfuyKodFxSIC2UNcTammZ46K5VzcLAtcybXcwkZdYjOwJP+YOMvNVHEMNgacWxoeMkfLKhi9kqIrVgTFD5pDhChMDQVtOBm12KW4v+ooarB0IhFJFMDTymTuk1jkVA+9/OGGn1JofjABI7Cz2DOq0QUrSu61KTCx/uk9erGhHTcGdm+5
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 17:52:41.4934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f07c59b-6064-4d03-bf74-08d7b9525855
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6766
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     |  4 ++++
 include/linux/firmware/xlnx-zynqmp.h | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index ecc339d..20e4574 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -512,6 +512,10 @@ static int zynqmp_pm_clock_getparent(u32 clock_id, u32 *parent_id)
 static inline int zynqmp_is_valid_ioctl(u32 ioctl_id)
 {
 	switch (ioctl_id) {
+	case IOCTL_GET_RPU_OPER_MODE:
+	case IOCTL_SET_RPU_OPER_MODE:
+	case IOCTL_RPU_BOOT_ADDR_CONFIG:
+	case IOCTL_TCM_COMB_CONFIG:
 	case IOCTL_SET_PLL_FRAC_MODE:
 	case IOCTL_GET_PLL_FRAC_MODE:
 	case IOCTL_SET_PLL_FRAC_DATA:
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 2cd12eb..b8ca118 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -100,6 +100,10 @@ enum pm_ret_status {
 };
 
 enum pm_ioctl_id {
+	IOCTL_GET_RPU_OPER_MODE = 0,
+	IOCTL_SET_RPU_OPER_MODE,
+	IOCTL_RPU_BOOT_ADDR_CONFIG,
+	IOCTL_TCM_COMB_CONFIG,
 	IOCTL_SET_SD_TAPDELAY = 7,
 	IOCTL_SET_PLL_FRAC_MODE,
 	IOCTL_GET_PLL_FRAC_MODE,
@@ -118,6 +122,21 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_MAX_DIVISOR,
 };
 
+enum rpu_oper_mode {
+	PM_RPU_MODE_LOCKSTEP,
+	PM_RPU_MODE_SPLIT,
+};
+
+enum rpu_boot_mem {
+	PM_RPU_BOOTMEM_LOVEC,
+	PM_RPU_BOOTMEM_HIVEC,
+};
+
+enum rpu_tcm_comb {
+	PM_RPU_TCM_SPLIT,
+	PM_RPU_TCM_COMB,
+};
+
 enum zynqmp_pm_reset_action {
 	PM_RESET_ACTION_RELEASE,
 	PM_RESET_ACTION_ASSERT,
-- 
2.7.4

