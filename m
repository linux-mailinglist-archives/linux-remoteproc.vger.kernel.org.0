Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B68D2C88D1
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Nov 2020 16:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgK3P6d (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Nov 2020 10:58:33 -0500
Received: from mail-dm6nam11on2074.outbound.protection.outlook.com ([40.107.223.74]:50656
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728504AbgK3P6N (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 10:58:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Phr1osq4WFQQfnMcNqE6ccCqthafCkEmTJcBQKoT+Z9nW+qfUygWFFssf8V/0X7F1rDwAFQQTiyoovlCSuJabehzxi2aJHIvxQkTjb6nm4V+jhTLjSdfZdAOb4LmF7A1YJqxMTLlmRBxN7OkLbv4EdvNJNXiUmn2kIR4b1pRahV6NAtc+d42v6CLOUuO53wcc2GVK7yLT/HSjQE4YXhWgSn/AOYXIF/YVPIEutNKJoqsqzy5C5k0hA6G6SteA+ushtLZexfFxuOc31vihCw9CCnFpG3vprtQlgHLZbXDGgr4Si+rA+xNdZPoYl77aibkf9rhXshsawkcub1t28oglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ+f26VHd7qTVop0EtmJHM9Dm0melO76w6gQnDIAoCo=;
 b=cz/MW8mEBu0Hns4yuQwW0ay2bSsLYZcUbH2YfqJjuEsNreS6zoAeR/I3nTUw3hZBLs2oYFZa8UqfmaTguOUNGLNNjqoO0uD3rZ/adpRA3NnktIHuL7/K3cQ/koFYtnpIW+hBPJldUi5PqLg/nlTCcTi5ygYIW9CjTU9N6kg7Ii1EfftjklpHw7/eoRuB8g9nGPwChAn2dJMpdpagIuRcC4ggsnG6/iATgDxi53Apl8I+dVa9aYqoIgH1CaFGxw7bdwiyBM0ua9rVJ5rvC2TZQeMqVtWOuXAfOCw4qx7e1t4HjkUPVYai3x8oR4JhEiA7sWEUaz9HE65E5NnQcKD4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ+f26VHd7qTVop0EtmJHM9Dm0melO76w6gQnDIAoCo=;
 b=OgguQIpz4ZQD6XziHFJmKeJjwOeJjQy/yh1m6D+vzpVpRMyxQAnjJK80xvbdUbn9pqlAI38zDD5mGtCYFygXqmqxJ1/73MC8Fcs7wiZbd9S4CuzE38XzEcpzD2B5THcHwCivy+N3dskiL+mnxfz5Ri0Xbtf+Sr9b6YWRiMz5L/s=
Received: from MN2PR22CA0003.namprd22.prod.outlook.com (2603:10b6:208:238::8)
 by SN6PR02MB4541.namprd02.prod.outlook.com (2603:10b6:805:a3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:57:19 +0000
Received: from BL2NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:238:cafe::60) by MN2PR22CA0003.outlook.office365.com
 (2603:10b6:208:238::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 15:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT052.mail.protection.outlook.com (10.152.77.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 15:57:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 30 Nov 2020 07:57:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 30 Nov 2020 07:57:17 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=47338 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kjlYD-000342-8N; Mon, 30 Nov 2020 07:57:17 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v24 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Mon, 30 Nov 2020 07:57:14 -0800
Message-ID: <20201130155717.26008-3-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130155717.26008-1-ben.levinsky@xilinx.com>
References: <20201130155717.26008-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b17dbfc-006c-4789-c06e-08d895489d13
X-MS-TrafficTypeDiagnostic: SN6PR02MB4541:
X-Microsoft-Antispam-PRVS: <SN6PR02MB454112F4E85AAFB3CC2B8F83B5F50@SN6PR02MB4541.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZL0ixPu/N81H1KikygvlA6+jKfa8yghfUX5xAG2pb/vEsP6ImiK92R4jJ2zzWM0nTcCEFLUJfLFXLuqGmtkhVSpsVvn16WUFOd8cYWGLlak804/hGCKOcp0MlyU3YOKlQi4oEff9yEEt+FgwF9EBneIyrK6CCu9N1HsIEu4iubQ4cr+ZC2r2mKZD0cwsgEj75Kw73Apr/yjPy/41W9hXTNpvN3QS4qCBGtYsG1ny7OKo6V5jiOy9EgTDafC/ymiJsnlFYhufY9VECSuujC7DZev+HVLsgy7/lYooIJww5wcJFSkgqIesREY6TEeloRUlsgtn66ye+NLc9v6YH0NP2YtZQgfXnjoU/qlUzoKIctIVSqvS4QtbUCg2GrHWeHdBz/UgrnyUJTHvGdkodC/dlcWMhoXmJ8atStHeZpFyIY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966005)(2616005)(478600001)(336012)(70206006)(426003)(5660300002)(70586007)(83380400001)(6666004)(44832011)(1076003)(26005)(54906003)(316002)(2906002)(7696005)(356005)(82740400003)(8676002)(6916009)(47076004)(9786002)(8936002)(7636003)(186003)(4326008)(36756003)(36906005)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:57:17.7017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b17dbfc-006c-4789-c06e-08d895489d13
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4541
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
index 0dd2d188f8aa..0cc862b26263 100644
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

