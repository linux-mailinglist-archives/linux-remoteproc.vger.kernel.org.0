Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9151E312CFF
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 Feb 2021 10:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhBHJNk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 8 Feb 2021 04:13:40 -0500
Received: from mail-am6eur05on2086.outbound.protection.outlook.com ([40.107.22.86]:49473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231436AbhBHJLy (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:11:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxuOolDYRa46VE1Xb372TEKDUe6vFHP8Kp98Wy2XQh3VctYEPa7qiOQkevS7Wp39kPDIonxwT9OZcR24QVPbtLbmdLIq4H3QsUrerUigcL8JWBNsZhKTwiJOmehDu6C1yFmG0c2cDw9e6LQCMtbuR01cU+/68Njd3Lha01dmnB+F/uIr1bbYed+nQCwivS3ex0ktellUNChnBBODl5uYIdNJfozewLTbWkSUM42K1GCxEJl31XJ3wI7i03mPQYgEOXmHraCKyCkBJOQ/xXd5gtUamXGi/tcSFUQJAMjFiXK9YumcsGBhAElUT/jmHiU8JoBqbAKHAnPVOt63WLwkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=IU/mVIr+padiD32Z4lmU9ahqsflhaeTQoB+yAu70gqbbXcTmcItFq8Gr0qYrqvIJl+YEwm0FunIwky5rpIyvkOeov+kq7vPvFOHV2lWJidHt5Uuidpf2c5eqZ4LTQT//DCKBEFleb02HWhry4ApfcrwB42FA61MzCGpJwhPVidUD9whGs9eFGfYM22C7X2bBavTyAXrTtVkHUge78Pi8492uTuo4qZbWBX96SzwG3+CLHcJLrQlcatepOIVpT38nBzuntgo+KSjh2uryMzW1yCFeLpgDyucBm9qEr3pGLBi3bozHKqPTsfExgtO3gY2eBk3sJtrma9dSVrv47WLiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=R6aYpo8QITNYelMzBoModnSZAsiRZihwxIZqutNhNM5gorPCKe1yotBno6lxDECdwl6BEV3XkNMN1kVxwjxYJudsVFcTa5V4XIso0FWxp+laWO9pParmzvvqlkMtlNI+nJccf13PK9Db1OU/jzbgMtX4oseyClyg/Phf7FAeMK4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:08:35 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:08:35 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Mon,  8 Feb 2021 16:56:11 +0800
Message-Id: <1612774571-6134-11-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:08:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a717bbe-b64f-41fe-f65e-08d8cc111d9b
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2933FC08376792786DF1BBFFC98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0dLjvMAUYXkpR7YlfHqeQudylHZWAdj+7VBBY4f4TLM9eB+JGV5ag9bl9ugutoQBl31oLap1XqFTtGek+hLWqO7axw15pJP2crTPq0cZXIGk7GwZv/O+hV468ExttUtqJkqEhGOCd43KGUbINhLj57SzwScRzVGGdMaEg8iKFtT8mdVa2HLUaYI7Q5FaIOEMCshSXpV3Z76CR7OrlidKrJIT1JhhROh83ff6plhScBKa0k6D0A+5d+cqGKOf8Fl3p7Vwvvqeu1eQ+8KjCTMDf6LjYcYiayrxwiRYqBfShXdZOLkkE0+4bjhKr6CaY6tB29N2aTIZsUl5A5Bg4/dvIJa2btXbeFwGimJ9q7W87qiIu0fMeAEY/XGiCQt6S0kKMihnjUbzNMlV/IHjGg1vZaCOBRFfpXycvogSI1lHAbp3VoY2dg0FhJW3O/UK7oESqRs+B53a4Bye/TdCMz4tVSE1bjUSOlv+div6NMMB2VmYXVGCgWB1DCarnSTjHGJ/9kJ6oRB3mKrv3QR/BkAR8bWz+DrIE/ckHmlSWRTVt3ZDrbuMePFG2tgoFuR96omNA+59WJ6URZfJBPhFsHsvPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(83380400001)(4326008)(8936002)(15650500001)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VEO9yqGZ+nrKDySeTSA3RWulTkMfT/ewy7T12OzBdCCKnZxYERJvt1VyTFkq?=
 =?us-ascii?Q?HMo93tz0f6X7WEJUhNk8HIfJ2wAPESWIshgilBpSueJrVsImllPQOfzC6GZY?=
 =?us-ascii?Q?Zz60j/OOMtJoxfS1Wm87hCduZd7duB+iRtbJ7Dwon1uwcTRsAnBjTFNKFOhU?=
 =?us-ascii?Q?ENP/u6nb81W31XyoTNQ0fD1CDmVrtAgV2LYH4N6WJE5eDQPSQaTAPb53QQGY?=
 =?us-ascii?Q?YiK7wsOlOEx6vEKsg6McJ5UTKlmvyeLZPqbIyA7E9PTmujOwPlGRWIGKN61x?=
 =?us-ascii?Q?Z2R/F7kalNSjcH5o19AdHFOqhoDZKGRLqzhZVdXZaagCL0uYIWicEz4NWTQ+?=
 =?us-ascii?Q?2rGdcXkReiL2uA14Qwk12thnfLs3NKkzrKaBsvgd2exhh7/DESFpJi7l0N0A?=
 =?us-ascii?Q?6i1snGqF4eSGZJB0Cwy+A0BnqxOn2/KEa7qT3U4IQntHufYolNXu/kukP8e4?=
 =?us-ascii?Q?coigYfjIITK8EqT4rS4RRkzhRw/IQtVH5Qu7/ZK6w1LZPFSm8EC0PRHlOmZ+?=
 =?us-ascii?Q?aGSg1d/TOijxsG9751GI3EJEvX2DWhl+4lDTqaWaCKjfUXlKazXoZc9k+FqO?=
 =?us-ascii?Q?x2YoYtIA1FAIYKUOSEccSc6uF0rBvqGe4EwNiGqn8bLiMByWu46MRWLQEmIk?=
 =?us-ascii?Q?1Z7Y4mm/sEx+ElX2c5LUEMS9d797EUEninDTEAwThFd0tyCUK2bmDKq04n7H?=
 =?us-ascii?Q?APnl2Mf48rSMbT7eOf2Ypebdt9U77YoaskngaM/B3ftlEEVs8xRF3OOm175q?=
 =?us-ascii?Q?afCfhE6GrpxZpMMXGSUk+o5nAnUXaWuHcnd4EXdIZbDwdWejcUwgHOVmsH07?=
 =?us-ascii?Q?S9Adb3A6cjX7CFPupa3ZseasM9FEdgxKno6ZIvPC7f+Nt+oiBgcLpBpSTFpL?=
 =?us-ascii?Q?fmtCFzTQ37UXhG1EMHaSUzn2R6D8zSDhpG/8TCRsaEKh2RuiyDvfiV+dUIbE?=
 =?us-ascii?Q?vCyhqGXOQrdkGv8ftKUiaR0N3ocWfU4jUhVjE0oI80hTZpFBipEFyBD1A1kq?=
 =?us-ascii?Q?Knz1zaQYpwzdWPQas0CqFM8bmLkMmhp3Udnk2jKWkrbC+OUqpCGTxp3vo6Sz?=
 =?us-ascii?Q?/lfGkh7fpNAFUCkkzOIRnMNN7a3OQV+UoOBHzFtgRrNfR4jxpkAS75xoDjmk?=
 =?us-ascii?Q?3pA7R413svWZgsO4MqHDCt5aOx89IOeBJWfMjxFAlkTocweqKMfzVuwKs7VD?=
 =?us-ascii?Q?PL9jC26snWBMm24FMmrTpH21pmUBqxIbjGKvGcXmpmgCLc2tPDGsnO9QQiMp?=
 =?us-ascii?Q?FIpWHLdd0xWpgLeOFVWXGNS/Y4Y9wAxUv2jlilcj7ZQN7Tq0d7doHfcjaMRv?=
 =?us-ascii?Q?nqdJxuhZlpIeF8c7Pq2gr34L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a717bbe-b64f-41fe-f65e-08d8cc111d9b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:08:35.8484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcpi28mQpMAzNmtwAvfdGD1sFuesxa0mg3X0AtoMa35vM/Hig1nl/5dsSCIStfuTv3eW4vPqMQXdkw78J3jeyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add work queue to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirer@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 116 ++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3685bbd135b0..90471790bb24 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -7,6 +7,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -15,6 +16,9 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/workqueue.h>
+
+#include "remoteproc_internal.h"
 
 #define IMX7D_SRC_SCR			0x0C
 #define IMX7D_ENABLE_M4			BIT(3)
@@ -86,6 +90,11 @@ struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
+	struct mbox_client		cl;
+	struct mbox_chan		*tx_ch;
+	struct mbox_chan		*rx_ch;
+	struct work_struct		rproc_work;
+	struct workqueue_struct		*workqueue;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -366,9 +375,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static void imx_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct imx_rproc *priv = rproc->priv;
+	int err;
+	__u32 mmsg;
+
+	if (!priv->tx_ch) {
+		dev_err(priv->dev, "No initialized mbox tx channel\n");
+		return;
+	}
+
+	/*
+	 * Send the index of the triggered virtqueue as the mu payload.
+	 * Let remote processor know which virtqueue is used.
+	 */
+	mmsg = vqid << 16;
+
+	err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
+	if (err < 0)
+		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
+			__func__, vqid, err);
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
+	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
@@ -444,6 +477,66 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	return 0;
 }
 
+static void imx_rproc_vq_work(struct work_struct *work)
+{
+	struct imx_rproc *priv = container_of(work, struct imx_rproc,
+					      rproc_work);
+
+	rproc_vq_interrupt(priv->rproc, 0);
+	rproc_vq_interrupt(priv->rproc, 1);
+}
+
+static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
+{
+	struct rproc *rproc = dev_get_drvdata(cl->dev);
+	struct imx_rproc *priv = rproc->priv;
+
+	queue_work(priv->workqueue, &priv->rproc_work);
+}
+
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
+	struct mbox_client *cl;
+	int ret;
+
+	if (!of_get_property(dev->of_node, "mbox-names", NULL))
+		return 0;
+
+	cl = &priv->cl;
+	cl->dev = dev;
+	cl->tx_block = true;
+	cl->tx_tout = 100;
+	cl->knows_txdone = false;
+	cl->rx_callback = imx_rproc_rx_callback;
+
+	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
+	if (IS_ERR(priv->tx_ch)) {
+		ret = PTR_ERR(priv->tx_ch);
+		return dev_err_probe(cl->dev, ret,
+				     "failed to request tx mailbox channel: %d\n", ret);
+	}
+
+	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
+	if (IS_ERR(priv->rx_ch)) {
+		mbox_free_channel(priv->tx_ch);
+		ret = PTR_ERR(priv->rx_ch);
+		return dev_err_probe(cl->dev, ret,
+				     "failed to request rx mailbox channel: %d\n", ret);
+	}
+
+	return 0;
+}
+
+static void imx_rproc_free_mbox(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	mbox_free_channel(priv->tx_ch);
+	mbox_free_channel(priv->rx_ch);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -481,18 +574,28 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dev = dev;
 
 	dev_set_drvdata(dev, rproc);
+	priv->workqueue = create_workqueue(dev_name(dev));
+	if (!priv->workqueue) {
+		dev_err(dev, "cannot create workqueue\n");
+		ret = -ENOMEM;
+		goto err_put_rproc;
+	}
+
+	ret = imx_rproc_xtr_mbox_init(rproc);
+	if (ret)
+		goto err_put_wkq;
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
 		dev_err(dev, "failed on imx_rproc_addr_init\n");
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(priv->clk);
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
 	/*
@@ -502,9 +605,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed to enable clock\n");
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
+	INIT_WORK(&(priv->rproc_work), imx_rproc_vq_work);
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -515,6 +620,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
+err_put_mbox:
+	imx_rproc_free_mbox(rproc);
+err_put_wkq:
+	destroy_workqueue(priv->workqueue);
 err_put_rproc:
 	rproc_free(rproc);
 
@@ -528,6 +637,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
+	imx_rproc_free_mbox(rproc);
 	rproc_free(rproc);
 
 	return 0;
-- 
2.30.0

