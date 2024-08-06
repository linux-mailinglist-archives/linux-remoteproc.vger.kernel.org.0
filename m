Return-Path: <linux-remoteproc+bounces-1927-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695094882A
	for <lists+linux-remoteproc@lfdr.de>; Tue,  6 Aug 2024 05:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17DFB1F239F1
	for <lists+linux-remoteproc@lfdr.de>; Tue,  6 Aug 2024 03:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7551BB6A9;
	Tue,  6 Aug 2024 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gRYbdLfE"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CF1BA880;
	Tue,  6 Aug 2024 03:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722916606; cv=none; b=Ym2ERT5we99SFG8BqCeZMLBJCLHzdd1wHUtGsKBMuO9I7jqHawNTyE9n0s0KqThKmvrdlOhxNTO+6+XMRTWozZffy2H6TQHCzd41QxpxW2anL/e+cdExsohrLYbmXpsULCxA6r6ZOQ4zSLGuYdOpU+XYx4IlIBJOJidWusN/IdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722916606; c=relaxed/simple;
	bh=5Za1blmZKu/PDGhChaJYCHZs2RuAeibIE41GF1b/PHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uE4a2OTwvrIEJgTt5fDx4MNEl8azDI8KVBAdyAi0pBVNJR85rnXOEr3+Zz68LE2mvdLQO+Tzz4AEcdaE4Xa5lfmjDOmT/OnNR/g6/IpARWNb8HHBJvy6KTA6qGdyKdKr8yFLH1kw51Yn3DsKO+tkDTHKEl5B0V38WTdlSO4rgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gRYbdLfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4762CHkP029102;
	Tue, 6 Aug 2024 03:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaktMGPvP/wO+k4/DQeyGaoFeUeyigt/WGkVIocO1vs=; b=gRYbdLfEQ6KLeJhS
	/UJCeWfdELcfWzHA7MBRQay9x+15S9xBwFYMgxhfyiu2oSv79o1Pg2N4q/kTy21l
	Zap6KuEw/7KTGtLNg/XX2WQCavKdJ52AZ8aOhH91bLLxV9jURqJrS1hcMJDQi8Mk
	zDnt3fTvbCid0Mcf7oCkzCLXBgeOI5EyiCljQMjNsIirnViiabParMJNuHXxz69C
	IqcWbgmPoaD+b1wN09OeAKUej5RmkaXTLYOt1YxElsPxszh8sZ3m+HlHzJwgdZHa
	euHX8NT/eQoAVcgavHV1hHxA4vuRCZOPitqVdpgxxGms5d2hz3XLgE6bDdpzFZ0A
	cwgLfw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdae5u42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 03:56:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4763uRKA012461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 03:56:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 20:56:26 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Mon, 5 Aug 2024 20:56:27 -0700
Subject: [PATCH 3/3] rpmsg: glink: Introduce packet tracepoints
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240805-glink-tracepoints-v1-3-a5f3293fb09e@quicinc.com>
References: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
In-Reply-To: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722916586; l=26195;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=5Za1blmZKu/PDGhChaJYCHZs2RuAeibIE41GF1b/PHM=;
 b=gXM1oVestSNGLBizyJWpkMtWyOkhtkIyP2a5SaiMUM8SgSt5Fm10wZvMHY10SIjKQ8UBwybso
 L6biCliz+klCe9sRLKZaCqtlHSMHdBXqW9pWRc8dAqe9EgqEhPwq6d8
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ie1a9SXBDJSqDD3V-ODfD5n6AjTkC3zN
X-Proofpoint-GUID: Ie1a9SXBDJSqDD3V-ODfD5n6AjTkC3zN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060026

Introduce tracepoints to allow tracing the GLINK packets being exchanged
with other subsystems. This is useful for debugging both interaction
with remote processors and client driver issues, as well as tracking
latency through the communication stack.

Channel events are traced with both local and remote channel ids, as
well as the textual representation when possible. The channel ids are
useful when matching traces with traces from the firmware side logs,
while the textual representation is necessary to identify channels when
we're starting to trace an already running system.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |  96 ++++++++-
 drivers/rpmsg/qcom_glink_trace.h  | 406 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 501 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 58e3b382e316..1e02b58ff61f 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
 obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
 obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
+CFLAGS_qcom_glink_native.o	:= -I$(src)
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index ba0ea28df821..c7c3c21a7156 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -23,6 +23,9 @@
 #include "rpmsg_internal.h"
 #include "qcom_glink_native.h"
 
+#define CREATE_TRACE_POINTS
+#include "qcom_glink_trace.h"
+
 #define GLINK_NAME_SIZE		32
 #define GLINK_VERSION_1		1
 
@@ -78,6 +81,7 @@ struct glink_core_rx_intent {
 /**
  * struct qcom_glink - driver context, relates to one remote subsystem
  * @dev:	reference to the associated struct device
+ * @label:	identifier of the glink edge
  * @rx_pipe:	pipe object for receive FIFO
  * @tx_pipe:	pipe object for transmit FIFO
  * @rx_work:	worker for handling received control messages
@@ -96,6 +100,8 @@ struct glink_core_rx_intent {
 struct qcom_glink {
 	struct device *dev;
 
+	const char *label;
+
 	struct qcom_glink_pipe *rx_pipe;
 	struct qcom_glink_pipe *tx_pipe;
 
@@ -392,6 +398,8 @@ static int qcom_glink_send_version(struct qcom_glink *glink)
 	msg.param1 = cpu_to_le16(GLINK_VERSION_1);
 	msg.param2 = cpu_to_le32(glink->features);
 
+	trace_qcom_glink_cmd_version_tx(glink->label, GLINK_VERSION_1, glink->features);
+
 	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
 }
 
@@ -403,6 +411,8 @@ static void qcom_glink_send_version_ack(struct qcom_glink *glink)
 	msg.param1 = cpu_to_le16(GLINK_VERSION_1);
 	msg.param2 = cpu_to_le32(glink->features);
 
+	trace_qcom_glink_cmd_version_ack_tx(glink->label, msg.param1, msg.param2);
+
 	qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
 }
 
@@ -415,6 +425,9 @@ static void qcom_glink_send_open_ack(struct qcom_glink *glink,
 	msg.param1 = cpu_to_le16(channel->rcid);
 	msg.param2 = cpu_to_le32(0);
 
+	trace_qcom_glink_cmd_open_ack_tx(glink->label, channel->name,
+					 channel->lcid, channel->rcid);
+
 	qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
 }
 
@@ -429,6 +442,11 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, cid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
+
+	trace_qcom_glink_cmd_rx_intent_req_ack_rx(glink->label,
+						  channel ? channel->name : NULL,
+						  channel ? channel->lcid : 0,
+						  cid, granted);
 	if (!channel) {
 		dev_err(glink->dev, "unable to find channel\n");
 		return;
@@ -483,6 +501,9 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 	req.msg.param2 = cpu_to_le32(name_len);
 	strcpy(req.name, channel->name);
 
+	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
+				     channel->lcid, channel->rcid);
+
 	ret = qcom_glink_tx(glink, &req, req_len, NULL, 0, true);
 	if (ret)
 		goto remove_idr;
@@ -507,6 +528,9 @@ static void qcom_glink_send_close_req(struct qcom_glink *glink,
 	req.param1 = cpu_to_le16(channel->lcid);
 	req.param2 = 0;
 
+	trace_qcom_glink_cmd_close_tx(glink->label, channel->name,
+				      channel->lcid, channel->rcid);
+
 	qcom_glink_tx(glink, &req, sizeof(req), NULL, 0, true);
 }
 
@@ -519,6 +543,9 @@ static void qcom_glink_send_close_ack(struct qcom_glink *glink,
 	req.param1 = cpu_to_le16(channel->rcid);
 	req.param2 = 0;
 
+	trace_qcom_glink_cmd_close_ack_tx(glink->label, channel->name,
+					  channel->lcid, channel->rcid);
+
 	qcom_glink_tx(glink, &req, sizeof(req), NULL, 0, true);
 }
 
@@ -550,6 +577,9 @@ static void qcom_glink_rx_done_work(struct work_struct *work)
 		cmd.lcid = cid;
 		cmd.liid = iid;
 
+		trace_qcom_glink_cmd_rx_done_tx(glink->label, channel->name,
+						channel->lcid, channel->rcid, cmd.liid, reuse);
+
 		qcom_glink_tx(glink, &cmd, sizeof(cmd), NULL, 0, true);
 		if (!reuse) {
 			kfree(intent->data);
@@ -600,6 +630,8 @@ static void qcom_glink_receive_version(struct qcom_glink *glink,
 				       u32 version,
 				       u32 features)
 {
+	trace_qcom_glink_cmd_version_rx(glink->label, version, features);
+
 	switch (version) {
 	case 0:
 		break;
@@ -627,6 +659,8 @@ static void qcom_glink_receive_version_ack(struct qcom_glink *glink,
 					   u32 version,
 					   u32 features)
 {
+	trace_qcom_glink_cmd_version_ack_rx(glink->label, version, features);
+
 	switch (version) {
 	case 0:
 		/* Version negotiation failed */
@@ -658,6 +692,10 @@ static int qcom_glink_send_intent_req_ack(struct qcom_glink *glink,
 {
 	struct glink_msg msg;
 
+	trace_qcom_glink_cmd_rx_intent_req_ack_tx(glink->label, channel->name,
+						  channel->lcid, channel->rcid,
+						  granted);
+
 	msg.cmd = cpu_to_le16(GLINK_CMD_RX_INTENT_REQ_ACK);
 	msg.param1 = cpu_to_le16(channel->lcid);
 	msg.param2 = cpu_to_le32(granted);
@@ -695,6 +733,10 @@ static int qcom_glink_advertise_intent(struct qcom_glink *glink,
 	cmd.size = cpu_to_le32(intent->size);
 	cmd.liid = cpu_to_le32(intent->id);
 
+	trace_qcom_glink_cmd_intent_tx(glink->label, channel->name,
+				       channel->lcid, channel->rcid,
+				       cmd.count, cmd.size, cmd.liid);
+
 	qcom_glink_tx(glink, &cmd, sizeof(cmd), NULL, 0, true);
 
 	return 0;
@@ -752,6 +794,9 @@ static void qcom_glink_handle_rx_done(struct qcom_glink *glink,
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, cid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
+
+	trace_qcom_glink_cmd_rx_done_rx(glink->label, channel ? channel->name : NULL,
+					channel ? channel->lcid : 0, cid, iid, reuse);
 	if (!channel) {
 		dev_err(glink->dev, "invalid channel id received\n");
 		return;
@@ -801,6 +846,10 @@ static void qcom_glink_handle_intent_req(struct qcom_glink *glink,
 	channel = idr_find(&glink->rcids, cid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 
+	trace_qcom_glink_cmd_rx_intent_req_rx(glink->label,
+					      channel ? channel->name : NULL,
+					      channel ? channel->lcid : 0,
+					      cid, size);
 	if (!channel) {
 		pr_err("%s channel not found for cid %d\n", __func__, cid);
 		return;
@@ -873,9 +922,15 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 	}
 
 	rcid = le16_to_cpu(hdr.msg.param1);
+	liid = le32_to_cpu(hdr.msg.param2);
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, rcid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
+
+	trace_qcom_glink_cmd_tx_data_rx(glink->label, channel ? channel->name : NULL,
+					channel ? channel->lcid : 0, rcid,
+					liid, chunk_size, left_size,
+					hdr.msg.cmd == GLINK_CMD_TX_DATA_CONT);
 	if (!channel) {
 		dev_dbg(glink->dev, "Data on non-existing channel\n");
 
@@ -906,8 +961,6 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 			intent = channel->buf;
 		}
 	} else {
-		liid = le32_to_cpu(hdr.msg.param2);
-
 		spin_lock_irqsave(&channel->intent_lock, flags);
 		intent = idr_find(&channel->liids, liid);
 		spin_unlock_irqrestore(&channel->intent_lock, flags);
@@ -958,6 +1011,8 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 
 static void qcom_glink_rx_read_notif(struct qcom_glink *glink)
 {
+	trace_qcom_glink_cmd_read_notif_rx(glink->label);
+
 	qcom_glink_rx_advance(glink, ALIGN(sizeof(struct glink_msg), 8));
 	qcom_glink_tx_kick(glink);
 }
@@ -993,6 +1048,7 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
 	channel = idr_find(&glink->rcids, cid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 	if (!channel) {
+		trace_qcom_glink_cmd_intent_rx(glink->label, NULL, 0, cid, count, 0, 0);
 		dev_err(glink->dev, "intents for non-existing channel\n");
 		qcom_glink_rx_advance(glink, ALIGN(msglen, 8));
 		return;
@@ -1004,6 +1060,11 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
 
 	qcom_glink_rx_peek(glink, msg, 0, msglen);
 
+	trace_qcom_glink_cmd_intent_rx(glink->label, channel->name,
+				       channel->lcid, cid, count,
+				       count > 0 ? msg->intents[0].size : 0,
+				       count > 0 ? msg->intents[0].iid : 0);
+
 	for (i = 0; i < count; ++i) {
 		intent = kzalloc(sizeof(*intent), GFP_ATOMIC);
 		if (!intent)
@@ -1037,6 +1098,9 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 	spin_lock(&glink->idr_lock);
 	channel = idr_find(&glink->lcids, lcid);
 	spin_unlock(&glink->idr_lock);
+
+	trace_qcom_glink_cmd_open_ack_rx(glink->label, channel ? channel->name : NULL,
+					 lcid, channel ? channel->rcid : 0);
 	if (!channel) {
 		dev_err(glink->dev, "Invalid open ack packet\n");
 		return -EINVAL;
@@ -1069,6 +1133,9 @@ static int qcom_glink_set_flow_control(struct rpmsg_endpoint *ept, bool pause, u
 	msg.param1 = cpu_to_le16(channel->lcid);
 	msg.param2 = cpu_to_le32(sigs);
 
+	trace_qcom_glink_cmd_signal_tx(glink->label, channel->name,
+				       channel->lcid, channel->rcid, sigs);
+
 	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
 }
 
@@ -1084,6 +1151,9 @@ static void qcom_glink_handle_signals(struct qcom_glink *glink,
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, rcid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
+
+	trace_qcom_glink_cmd_signal_rx(glink->label, channel ? channel->name : NULL,
+				       channel ? channel->lcid : 0, rcid, sigs);
 	if (!channel) {
 		dev_err(glink->dev, "signal for non-existing channel\n");
 		return;
@@ -1357,6 +1427,10 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 	cmd.cid = channel->lcid;
 	cmd.size = size;
 
+	trace_qcom_glink_cmd_rx_intent_req_tx(glink->label, channel->name,
+					      channel->lcid, channel->rcid,
+					      cmd.size);
+
 	ret = qcom_glink_tx(glink, &cmd, sizeof(cmd), NULL, 0, true);
 	if (ret)
 		goto unlock;
@@ -1437,6 +1511,12 @@ static int __qcom_glink_send(struct glink_channel *channel,
 		req.chunk_size = cpu_to_le32(chunk_size);
 		req.left_size = cpu_to_le32(len - offset - chunk_size);
 
+		trace_qcom_glink_cmd_tx_data_tx(glink->label, channel->name,
+						channel->lcid, channel->rcid,
+						iid, chunk_size,
+						len - offset - chunk_size,
+						offset > 0);
+
 		ret = qcom_glink_tx(glink, &req, sizeof(req), data + offset, chunk_size, wait);
 		if (ret) {
 			/* Mark intent available if we failed */
@@ -1552,6 +1632,8 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 		create_device = true;
 	}
 
+	trace_qcom_glink_cmd_open_rx(glink->label, name, channel->lcid, rcid);
+
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	ret = idr_alloc(&glink->rcids, channel, rcid, rcid + 1, GFP_ATOMIC);
 	if (ret < 0) {
@@ -1613,6 +1695,9 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, rcid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
+
+	trace_qcom_glink_cmd_close_rx(glink->label, channel ? channel->name : NULL,
+				      channel ? channel->lcid : 0, rcid);
 	if (WARN(!channel, "close request on unknown channel\n"))
 		return;
 
@@ -1649,6 +1734,9 @@ static void qcom_glink_rx_close_ack(struct qcom_glink *glink, unsigned int lcid)
 
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->lcids, lcid);
+
+	trace_qcom_glink_cmd_close_ack_rx(glink->label, channel ? channel->name : NULL,
+					  lcid, channel ? channel->rcid : 0);
 	if (WARN(!channel, "close ack on unknown channel\n")) {
 		spin_unlock_irqrestore(&glink->idr_lock, flags);
 		return;
@@ -1823,6 +1911,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	idr_init(&glink->lcids);
 	idr_init(&glink->rcids);
 
+	ret = of_property_read_string(dev->of_node, "label", &glink->label);
+	if (ret < 0)
+		glink->label = dev->of_node->name;
+
 	glink->dev->groups = qcom_glink_groups;
 
 	ret = device_add_groups(dev, qcom_glink_groups);
diff --git a/drivers/rpmsg/qcom_glink_trace.h b/drivers/rpmsg/qcom_glink_trace.h
new file mode 100644
index 000000000000..668bdea1d78f
--- /dev/null
+++ b/drivers/rpmsg/qcom_glink_trace.h
@@ -0,0 +1,406 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_glink
+
+#if !defined(__QCOM_GLINK_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __QCOM_GLINK_TRACE_H__
+
+#include <linux/tracepoint.h>
+#include "qcom_glink_native.h"
+
+
+TRACE_EVENT(qcom_glink_cmd_version,
+	TP_PROTO(const char *remote, unsigned int version, unsigned int features, bool tx),
+	TP_ARGS(remote, version, features, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__field(u32, version)
+		__field(u32, features)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__entry->version = version;
+		__entry->features = features;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s version: %u features: %#x",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __entry->version,
+		  __entry->features
+	)
+);
+#define trace_qcom_glink_cmd_version_tx(...) trace_qcom_glink_cmd_version(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_version_rx(...) trace_qcom_glink_cmd_version(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_version_ack,
+	TP_PROTO(const char *remote, unsigned int version, unsigned int features, bool tx),
+	TP_ARGS(remote, version, features, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__field(u32, version)
+		__field(u32, features)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__entry->version = version;
+		__entry->features = features;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s version: %u features: %#x",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __entry->version,
+		  __entry->features
+	)
+);
+#define trace_qcom_glink_cmd_version_ack_tx(...) trace_qcom_glink_cmd_version_ack(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_version_ack_rx(...) trace_qcom_glink_cmd_version_ack(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_open,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u]",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid
+	)
+);
+#define trace_qcom_glink_cmd_open_tx(...) trace_qcom_glink_cmd_open(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_open_rx(...) trace_qcom_glink_cmd_open(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_close,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u]",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid
+	)
+);
+#define trace_qcom_glink_cmd_close_tx(...) trace_qcom_glink_cmd_close(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_close_rx(...) trace_qcom_glink_cmd_close(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_open_ack,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u]",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid
+	)
+);
+#define trace_qcom_glink_cmd_open_ack_tx(...) trace_qcom_glink_cmd_open_ack(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_open_ack_rx(...) trace_qcom_glink_cmd_open_ack(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_intent,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, size_t count, size_t size, u32 liid, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, count, size, liid, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(u32, count)
+		__field(u32, size)
+		__field(u32, liid)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->count = count;
+		__entry->size = size;
+		__entry->liid = liid;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u] count: %d [size: %d liid: %d]",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid,
+		  __entry->count,
+		  __entry->size,
+		  __entry->liid
+	)
+);
+#define trace_qcom_glink_cmd_intent_tx(...) trace_qcom_glink_cmd_intent(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_intent_rx(...) trace_qcom_glink_cmd_intent(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_rx_done,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, u32 iid, bool reuse, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, iid, reuse, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(u32, iid)
+		__field(bool, reuse)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->iid = iid;
+		__entry->reuse = reuse;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u] iid: %d reuse: %d",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid,
+		  __entry->iid,
+		  __entry->reuse
+	)
+);
+#define trace_qcom_glink_cmd_rx_done_tx(...) trace_qcom_glink_cmd_rx_done(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_rx_done_rx(...) trace_qcom_glink_cmd_rx_done(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_rx_intent_req,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, size_t size, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, size, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(u32, size)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->size = size;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u] size: %d",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid,
+		  __entry->size
+	)
+);
+#define trace_qcom_glink_cmd_rx_intent_req_tx(...) trace_qcom_glink_cmd_rx_intent_req(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_rx_intent_req_rx(...) trace_qcom_glink_cmd_rx_intent_req(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_rx_intent_req_ack,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, bool granted, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, granted, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(bool, granted)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->granted = granted;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u] granted: %d",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid,
+		  __entry->granted
+	)
+);
+#define trace_qcom_glink_cmd_rx_intent_req_ack_tx(...) trace_qcom_glink_cmd_rx_intent_req_ack(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_rx_intent_req_ack_rx(...) trace_qcom_glink_cmd_rx_intent_req_ack(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_tx_data,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, u32 iid, u32 chunk_size, u32 left_size, bool cont, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, iid, chunk_size, left_size, cont, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(u32, iid)
+		__field(u32, chunk_size)
+		__field(u32, left_size)
+		__field(bool, cont)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->iid = iid;
+		__entry->chunk_size = chunk_size;
+		__entry->left_size = left_size;
+		__entry->cont = cont;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u] iid: %d chunk_size: %d left_size: %d cont: %d",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid,
+		  __entry->iid,
+		  __entry->chunk_size,
+		  __entry->left_size,
+		  __entry->cont
+	)
+);
+#define trace_qcom_glink_cmd_tx_data_tx(...) trace_qcom_glink_cmd_tx_data(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_tx_data_rx(...) trace_qcom_glink_cmd_tx_data(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_close_ack,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u]",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid
+	)
+);
+#define trace_qcom_glink_cmd_close_ack_tx(...) trace_qcom_glink_cmd_close_ack(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_close_ack_rx(...) trace_qcom_glink_cmd_close_ack(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_read_notif,
+	TP_PROTO(const char *remote, bool tx),
+	TP_ARGS(remote, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote)
+	)
+);
+#define trace_qcom_glink_cmd_read_notif_tx(...) trace_qcom_glink_cmd_read_notif(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_read_notif_rx(...) trace_qcom_glink_cmd_read_notif(__VA_ARGS__, false)
+
+TRACE_EVENT(qcom_glink_cmd_signal,
+	TP_PROTO(const char *remote, const char *channel, u16 lcid, u16 rcid, unsigned int signals, bool tx),
+	TP_ARGS(remote, channel, lcid, rcid, signals, tx),
+	TP_STRUCT__entry(
+		__string(remote, remote)
+		__string(channel, channel)
+		__field(u16, lcid)
+		__field(u16, rcid)
+		__field(u32, signals)
+		__field(bool, tx)
+	),
+	TP_fast_assign(
+		__assign_str(remote);
+		__assign_str(channel);
+		__entry->lcid = lcid;
+		__entry->rcid = rcid;
+		__entry->signals = signals;
+		__entry->tx = tx;
+	),
+	TP_printk("%s remote: %s channel: %s[%u/%u] signals: %#x",
+		  __entry->tx ? "tx" : "rx",
+		  __get_str(remote),
+		  __get_str(channel),
+		  __entry->lcid,
+		  __entry->rcid,
+		  __entry->signals
+	)
+);
+#define trace_qcom_glink_cmd_signal_tx(...) trace_qcom_glink_cmd_signal(__VA_ARGS__, true)
+#define trace_qcom_glink_cmd_signal_rx(...) trace_qcom_glink_cmd_signal(__VA_ARGS__, false)
+
+#endif
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE qcom_glink_trace
+
+#include <trace/define_trace.h>

-- 
2.34.1


