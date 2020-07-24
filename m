Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F6F22C006
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Jul 2020 09:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgGXHnq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Jul 2020 03:43:46 -0400
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:36068
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728040AbgGXHnp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmpJxX7COcZNG+pTWyHWicFmSFQ7G1IOgjFqNvlCz5reFWkMev77J1flEvk8KADVXQArLNTuZQvk8HFgzLZKGm342fr8j4bHbQnf4f7YrZsj+OdtHb2R0lAoAhWyInS9NZ4pPgg6utpHDGRqEDkyDX6rkm1aAbcvBENNsOfuTrhDqhy/8qPYtTZjvu04c3XU15MdqtXO4aIWugutESX6Bb0SKwQZg4nO9dBzaOsrZIqx2J7qPSGUYCmFIcEdvMbQ3VHKq2iTnxkOR9PTJxCNhrma30Zmsp+dghL5PNF9VHCY9NndTN/coV8YKywc889Hne+arsiPby7Z0tAIjNMs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdNMZtH7GA3m7WuCVTf+3ch988T+aebmrLLYbcmLdns=;
 b=m6cFjMkIuRV2S6uNFLFPwywloiO9xbpcp+tG8JOg7W4guJFbwCqU+JXmEgPee6XkiUx/kE3VlIMrSKDxL2Nh7yvHUZtzXJoOSic8Atm8T/CtyqNLYAGHo/2o+1fXPb7UkbSlwUaqEELdIEfhiwdKuY03pN0+CzXXJW6RGD7E0CQaIhqNbusQ3CTuoU2HiQQSACr+Il2rRM3Z4W/FPP9AZettZAdmhNEogj0jmmlykzsG7rOj/jblCLWhK3cNVNLEMG03f/w2WiqYkXUzsoUlDRbMcDx1oQGstLMGaOf2HjXGxqQ+ICGuGcPNjv35MP4fRZ7sMcEWG1/adYNr/BHYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdNMZtH7GA3m7WuCVTf+3ch988T+aebmrLLYbcmLdns=;
 b=ZCQPE6YVO+2LAHqNOBvys0Jct47cKY7mATMak/BJOdGFe292BC18mbJrIUdD6+sI5FuSIIC1o4u7HjivxCAvND7J5p5VI+DW9yEH9DYGw/FwDnn/SgLzx+N9PCqG9emPvOY40X/OXCMqfz/K+ygdgwa5RB5qAPzWsstJiUSOW0Y=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 07:43:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3216.024; Fri, 24 Jul 2020
 07:43:41 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 03/10] remoteproc: imx: use devm_ioremap
Date:   Fri, 24 Jul 2020 16:08:06 +0800
Message-Id: <20200724080813.24884-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200724080813.24884-1-peng.fan@nxp.com>
References: <20200724080813.24884-1-peng.fan@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Fri, 24 Jul 2020 07:43:37 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7b7e7497-b0da-49f1-d59d-08d82fa548d6
X-MS-TrafficTypeDiagnostic: DB8PR04MB6857:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6857A6EE4A7C1AC02E07D26488770@DB8PR04MB6857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfXCY6Dv9fvxQkS/INfX1qU93V0S2K7jh+4+Lie4j14bgeQjxA/fZVtwJp5MjttTRAjUOVwMl4WNRaKkGc1CqCbBt4G0Zu1Q1j9N96CyHl5Qho1c7S+MjG4A655fxSoE56LGjPmbMzLeGOSViBrrzf9bLj5CV0Ov2EU83fUft7X2IAAjndd+vhhd9Q/n7yI0jZcgS+VFAczEaKOb2cGKO6qwXbsaSGdDrugyszbiNvHEnRxuq7Z8gzdCNtQxzmBzW8ZEe3EMfXGtv4MF9GSQqya+YDkNpoZWRv89EvYxiw/T7BvN+qC2glorQBp83SRqf5rqUeED5qywJ5upW5KB4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(6512007)(478600001)(8676002)(2616005)(7416002)(316002)(44832011)(956004)(66946007)(66476007)(66556008)(1076003)(5660300002)(6506007)(186003)(26005)(8936002)(6666004)(2906002)(6486002)(16526019)(86362001)(4326008)(36756003)(83380400001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: t4Gcwf73+sJ2Z8iOUDOAzLcur+BN0kPRaX8Dnj1rfiubHBEmXVQLaaP+U5Lhyr5rHL5U9R3JAqSVilf6pSXaoiQHUbZKK4ZlQLDlR9fGEvwN0NRTS4VOomCN7OjGdTqXGcyrAgtwFV6gd+xuns1Lzb8V+I8k+WlRvUChHGtPRNDhF4AE+seBwIJnwVxHbDA4ZcXXO+TAUj5Jpf39an5wDd9dNlWl1NbB23SweJsIwOMh88gdW7Z6LCqeXP47wRfoLJh5uPJ/slrgR99ebsD1PoKXVwhwQ5cbW3tIJ0I1sES7GXfYyuWLEb3iIgiY1JqsbuEHmkMRSO+Kal7w3YMxwkDb+nAUCT5vKaWBYBDQhx5nJDHKr1LsIiDfRLEmklWyFWofAD3BcnCvhniA8lk8p/Pm10Ohpao28B72z86tio2ngUWuWnssGlZCfdKbxlA28YbD4W9zPwIcpxMdgq2juEg7srDH8kRxuUYTGVFFlLQuJTf4rqA/fXSwy/7oYdzp
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7e7497-b0da-49f1-d59d-08d82fa548d6
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 07:43:41.4721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 885mKcTdaad3U9cuJr694p/8ncnTz+BN9YqDOtmErqgNYeFIy7UjFSdBE/CGCI+JrvxcVpQomV16ZxDbVRbx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

We might need to map an region multiple times, becaue the region might
be shared between remote processors, such i.MX8QM with dual M4 cores.
So use devm_ioremap, not devm_ioremap_resource.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3b3904ebac75..82594a800a1b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,9 +296,10 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region*/
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "devm_ioremap %pR failed\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.16.4

