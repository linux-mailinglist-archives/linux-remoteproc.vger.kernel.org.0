Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D62322DD6
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Feb 2021 16:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbhBWPp7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 23 Feb 2021 10:45:59 -0500
Received: from mail-mw2nam12on2079.outbound.protection.outlook.com ([40.107.244.79]:58785
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233136AbhBWPpt (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 10:45:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce2Bf/Ry7GSjVc2tuCUA3J2X864L3VIW5QMUs5DLhpWmVnerhoMYnTvR8SiDhYXT85jJS2wrx7hCI902I3/vpB4eeSe1279iOLo8R2pcX66p9CZHmqoLxr0n9Ws7b9paruAIN11bcfDd5aIMge/P1wjv8s+MuVvuNyc6j0+X68jsw4vBf87ryvhLuWRhdNPK7v0iSJVgnlKKicXW862yKdZBIlP2BOGLb7udwcj1Wb1ZVcOAxun5Z8EPaBmZkOXsPHjntDBLADihzbQ/WsODVaKO5wYiTKHATGYD297XTD6Tbp0fLJJ2fQN5QUxnggDchy+pQfs0CsNwRAhZikVyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDE8B5t/rBK24hQ97Axy07eFeYkYZHqMIlHzE5f1vXE=;
 b=d4R/vZPSbfqVjDiHsbGoFLWAaNITLu2Izxl/DWt986lwOfWkNH9TCfX1JulK9XKm1WAGGTMIkY8SL3aSB3der3t98WYMbABmiyWaryZhTPxrluKpVWu+XDRVxtOiWqsdLKBtrRo9uPJFHGJK4S/FEoUrvKhV6slIipjZBTTz/EBx+/qvzTeKOSZAKpKS4winHUkS1s6PEolGP/owJyvfrTbGTmQhF/CMsSd35QLaqO8ogCPI7cVBal27ZcFEufo8DnxpKCmRgjvjq3dn+I2JdOI2hAN9zUw/dBcsbp93WCxhjDuQ6uaWIvotiovOqu5jiivh4/4YXzcoFIVtTIWHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDE8B5t/rBK24hQ97Axy07eFeYkYZHqMIlHzE5f1vXE=;
 b=K3Ka7Tf68v8aS8jl0wZORqK+H9C1VgftjXTMkYjkOAFhCRE9wdIBUvcgXqvz2wKYtDAFAPc9C2xbvisTc4YzjHXliXTcGlHqtRG/J3KF3Yr87SorkltR/XEx+9SdzLoMy3RWMiqnazSPbffZf2qSK1j4A2LZ4K/WCf+uJ/6kKjo=
Received: from MN2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:208:1a0::19)
 by CY4PR02MB2742.namprd02.prod.outlook.com (2603:10b6:903:11a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 23 Feb
 2021 15:44:52 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1a0:cafe::8d) by MN2PR07CA0009.outlook.office365.com
 (2603:10b6:208:1a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Tue, 23 Feb 2021 15:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:44:51 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 23 Feb 2021 07:44:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 23 Feb 2021 07:44:47 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=40282 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1lEZrj-0006uk-90; Tue, 23 Feb 2021 07:44:47 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v26 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Tue, 23 Feb 2021 07:44:44 -0800
Message-ID: <20210223154447.13247-3-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223154447.13247-1-ben.levinsky@xilinx.com>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8987b7a8-33cf-4335-4669-08d8d811f5a1
X-MS-TrafficTypeDiagnostic: CY4PR02MB2742:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2742910673E956DD22CE1CA5B5809@CY4PR02MB2742.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6x6ODsVRSJe0lRJoKYTo1KeE6QPtCU+TL1Cv2JODz3EXGyptVhpb3PgFmZycPeDKoqWES119oWgbe8+WCuhcE0mRQvfW2IEDZTkxAMFxVRcWbIntMYPnptSNkYrS6xfSjWKkRDRJyR8J//PFpXPVKCsP35DTYXI8AGwp2cVTy+FDDoyEzsWSLNCcx7yK5ljiyC4ipLlQmJ36pFKfESKiB/8vzfe1FlYqNZ4cTkx1rZQZvJ++RwkUPyyo+pk7RukrsL3k1OlE4EC8JRTsfNfuukV25Kzn2l+IaX8VgHuKMfDgmrwD0OkepBqvVfw275GY7kfUFOcznecemuMcQvk/kiLmQXv23uR9NIWFjbbn+OYGy7hom8vdlSVXThXX+lKdiVFTfsUIbCshUB8Udb6lDcW+apELV8cJk4il69NeCXeojK1dljChjOneiDxoKSyuHTHbaGU+KhEI66DkGa60wruFAzqmyAZ2pttJrythTBa2qFZ7mORM68qSeQpF3gbju/l+VKWRvHKr58BRqYrLwt7ZzWT/y5At8CXD99OT2JrSPxX+DEYAzRMvQwIfHQagoelyWOAzLTIvWh+mYT6Fw5LXUrEosHAsbwagywah5a5buOlde9AqziZvfJKK1SA4ndOb8s4BkFeEd455CUSvE0uK+BB25i20/CAoYZkt3XKS3i6QDFurGLXQB51JLf2
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(7696005)(6666004)(426003)(336012)(36906005)(82310400003)(316002)(54906003)(36860700001)(26005)(186003)(107886003)(478600001)(2616005)(8936002)(6916009)(8676002)(36756003)(9786002)(356005)(44832011)(5660300002)(2906002)(4326008)(82740400003)(7636003)(83380400001)(1076003)(70206006)(47076005)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:44:51.8546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8987b7a8-33cf-4335-4669-08d8d811f5a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2742
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add shutdown/wakeup a resource eemi operations to shutdown
or bringup a resource.

Note alignment of args matches convention of other fn's in this file.
The reason being that the long fn name results in aligned args that
otherwise go over 80 chars so shift right to avoid this

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 35 ++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 23 ++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 8d1ff2454e2e..a966ee956573 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -846,6 +846,41 @@ int zynqmp_pm_release_node(const u32 node)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
 
+/**
+ * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
+ *             be powered down forcefully
+ * @node:  Node ID of the targeted PU or subsystem
+ * @ack:   Flag to specify whether acknowledge is requested
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_force_pwrdwn(const u32 node,
+			   const enum zynqmp_pm_request_ack ack)
+{
+	return zynqmp_pm_invoke_fn(PM_FORCE_POWERDOWN, node, ack, 0, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_force_pwrdwn);
+
+/**
+ * zynqmp_pm_request_wake - PM call to wake up selected master or subsystem
+ * @node:  Node ID of the master or subsystem
+ * @set_addr:  Specifies whether the address argument is relevant
+ * @address:   Address from which to resume when woken up
+ * @ack:   Flag to specify whether acknowledge requested
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_request_wake(const u32 node,
+			   const bool set_addr,
+			   const u64 address,
+			   const enum zynqmp_pm_request_ack ack)
+{
+	/* set_addr flag is encoded into 1st bit of address */
+	return zynqmp_pm_invoke_fn(PM_REQUEST_WAKEUP, node, address | set_addr,
+				   address >> 32, ack, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
+
 /**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:		Node ID of the slave
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index e4044cae0713..2d5c644cb570 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -12,6 +12,7 @@
 
 #ifndef __FIRMWARE_ZYNQMP_H__
 #define __FIRMWARE_ZYNQMP_H__
+#include <linux/types.h>
 
 #define ZYNQMP_PM_VERSION_MAJOR	1
 #define ZYNQMP_PM_VERSION_MINOR	0
@@ -64,6 +65,8 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_FORCE_POWERDOWN = 8,
+	PM_REQUEST_WAKEUP = 10,
 	PM_SYSTEM_SHUTDOWN = 12,
 	PM_REQUEST_NODE = 13,
 	PM_RELEASE_NODE,
@@ -380,6 +383,12 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
 int zynqmp_pm_read_pggs(u32 index, u32 *value);
 int zynqmp_pm_system_shutdown(const u32 type, const u32 subtype);
 int zynqmp_pm_set_boot_health_status(u32 value);
+int zynqmp_pm_force_pwrdwn(const u32 target,
+			   const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_request_wake(const u32 node,
+			   const bool set_addr,
+			   const u64 address,
+			   const enum zynqmp_pm_request_ack ack);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -530,6 +539,20 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
 {
 	return -ENODEV;
 }
+
+static inline int zynqmp_pm_force_pwrdwn(const u32 target,
+					 const enum zynqmp_pm_request_ack ack)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_request_wake(const u32 node,
+					 const bool set_addr,
+					 const u64 address,
+					 const enum zynqmp_pm_request_ack ack)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.17.1

