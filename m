Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F896E8A4B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 20 Apr 2023 08:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbjDTGWj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 20 Apr 2023 02:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbjDTGWh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Apr 2023 02:22:37 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB41F173C;
        Wed, 19 Apr 2023 23:22:13 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33K50tK6011240;
        Thu, 20 Apr 2023 06:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=FWT+UZ2wRIPfTA7YLn6I8VVtHEVjDWrhLRJlCY4ebFA=;
 b=UhHNyGf3N4EqjMRXz+ZfICIk7FshD+KEkJtBsbiOPizjHJDbD8dLBdI2fV/OikVPaPvO
 qxG48iuZwLlK4E7Pu3VNrliBwuS3s3VgI50C3imEvEP7JIvXC+Xf7KB4FuQAtHIalLTB
 xK6Yp28Yh0V0hN/nFxD5p9SLoQy0H8AIg0gTqV9rrhZcbsVWkNFzI4Fzld9nXVV8KV/r
 Znq8UsxP7OnoJ03l/eutyb7GfS5tXHB8BaAP2VJPmWS/lPuwxCkMBOMr06LDhnkxwqq9
 Q4xPEvn+BCT3IMOzW1l74KkAE9jDPOAxS3YmJ+tlrnUljrjnm/T+zorBN5b2U8xmka2H qg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2xuhr4eb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Apr 2023 06:22:05 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33K6M4iB013394
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Apr 2023 06:22:04 GMT
Received: from sarannya-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 19 Apr 2023 23:22:00 -0700
From:   Sarannya S <quic_sarannya@quicinc.com>
To:     <quic_bjorande@quicinc.com>, <arnaud.pouliquen@foss.st.com>,
        <swboyd@chromium.org>, <quic_clew@quicinc.com>,
        <mathieu.poirier@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Sarannya S <quic_sarannya@quicinc.com>,
        "Bjorn Andersson" <andersson@kernel.org>
Subject: [PATCH V6 1/3] rpmsg: core: Add signal API support
Date:   Thu, 20 Apr 2023 11:51:27 +0530
Message-ID: <1681971690-28858-2-git-send-email-quic_sarannya@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681971690-28858-1-git-send-email-quic_sarannya@quicinc.com>
References: <1681971690-28858-1-git-send-email-quic_sarannya@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lUSmurKMAe5FF_5LcPpRB25yrsrxd9Jr
X-Proofpoint-GUID: lUSmurKMAe5FF_5LcPpRB25yrsrxd9Jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200049
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Deepak Kumar Singh <quic_deesin@quicinc.com>

Some transports like Glink support the state notifications between
clients using flow control signals similar to serial protocol signals.
Local glink client drivers can send and receive flow control status
to glink clients running on remote processors.

Add APIs to support sending and receiving of flow control status by
rpmsg clients.

Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
---
 drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  2 ++
 include/linux/rpmsg.h          | 15 +++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index a2207c0..cd71a6a 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -331,6 +331,25 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
 
 /**
+ * rpmsg_set_flow_control() - sets/clears serial flow control signals
+ * @ept:	the rpmsg endpoint
+ * @enable:	pause/resume incoming data flow	
+ * @dst:	destination address of the endpoint
+ *
+ * Return: 0 on success and an appropriate error value on failure.
+ */
+int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable, u32 dst)
+{
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->set_flow_control)
+		return -ENXIO;
+
+	return ept->ops->set_flow_control(ept, enable, dst);
+}
+EXPORT_SYMBOL(rpmsg_set_flow_control);
+
+/**
  * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
  * @ept: the rpmsg endpoint
  *
@@ -539,6 +558,8 @@ static int rpmsg_dev_probe(struct device *dev)
 
 		rpdev->ept = ept;
 		rpdev->src = ept->addr;
+
+		ept->flow_cb = rpdrv->flowcontrol;
 	}
 
 	err = rpdrv->probe(rpdev);
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 39b646d..b6efd3e 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -55,6 +55,7 @@ struct rpmsg_device_ops {
  * @trysendto:		see @rpmsg_trysendto(), optional
  * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
  * @poll:		see @rpmsg_poll(), optional
+ * @set_flow_control:	see @rpmsg_set_flow_control(), optional
  * @get_mtu:		see @rpmsg_get_mtu(), optional
  *
  * Indirection table for the operations that a rpmsg backend should implement.
@@ -75,6 +76,7 @@ struct rpmsg_endpoint_ops {
 			     void *data, int len);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
+	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool enable, u32 dst);
 	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
 };
 
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 523c98b..a0e9d38 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -64,12 +64,14 @@ struct rpmsg_device {
 };
 
 typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
+typedef int (*rpmsg_flowcontrol_cb_t)(struct rpmsg_device *, void *, bool);
 
 /**
  * struct rpmsg_endpoint - binds a local rpmsg address to its user
  * @rpdev: rpmsg channel device
  * @refcount: when this drops to zero, the ept is deallocated
  * @cb: rx callback handler
+ * @flow_cb: remote flow control callback handler
  * @cb_lock: must be taken before accessing/changing @cb
  * @addr: local rpmsg address
  * @priv: private data for the driver's use
@@ -92,6 +94,7 @@ struct rpmsg_endpoint {
 	struct rpmsg_device *rpdev;
 	struct kref refcount;
 	rpmsg_rx_cb_t cb;
+	rpmsg_flowcontrol_cb_t flow_cb;
 	struct mutex cb_lock;
 	u32 addr;
 	void *priv;
@@ -106,6 +109,7 @@ struct rpmsg_endpoint {
  * @probe: invoked when a matching rpmsg channel (i.e. device) is found
  * @remove: invoked when the rpmsg channel is removed
  * @callback: invoked when an inbound message is received on the channel
+ * @flowcontrol: invoked when remote side flow control status is received
  */
 struct rpmsg_driver {
 	struct device_driver drv;
@@ -113,6 +117,7 @@ struct rpmsg_driver {
 	int (*probe)(struct rpmsg_device *dev);
 	void (*remove)(struct rpmsg_device *dev);
 	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
+	int (*flowcontrol)(struct rpmsg_device *, void *, bool);
 };
 
 static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
@@ -192,6 +197,8 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
 ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 
+int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable, u32 dst);
+
 #else
 
 static inline int rpmsg_register_device_override(struct rpmsg_device *rpdev,
@@ -316,6 +323,14 @@ static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	return -ENXIO;
 }
 
+static inline int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable, u32 dst)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG) */
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

