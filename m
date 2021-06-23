Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560743B1D36
	for <lists+linux-remoteproc@lfdr.de>; Wed, 23 Jun 2021 17:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhFWPKk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 23 Jun 2021 11:10:40 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39670 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230061AbhFWPKj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 11:10:39 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15NF1OOD009479;
        Wed, 23 Jun 2021 17:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=G6xlYIyNxjPZG5SWM3I1riaaYkND4hTSFn25NEiDio4=;
 b=VaQRfKZodfES8ofYVX58s8rBCMwmBK8I17G317lYbNl2tuPM3nAVs2GZDxL2NIUnymET
 +FglQ4Rbmv1NoGsJ0CXP/EDtILsELN0pa6cAkedF5fxo3DBDUYOhuKiWILySDAZolmtd
 FcWFAzrw7nM59PBw3zANsWVfMrSfaOH1+w3RmG9HeJ5AN4RjOTNaWl6q4E6NM1aknVQy
 +bYvx10tFK++NBptlUeDlLgUI7xYJZz8x+NJu+2KxQq9jzLEH8RqwJbVE9q7FHWuUBEx
 IkiaHFJy1pAJQ7ox8vxj/M6Mbz8BN2ytdDe/cghsJGtkX7NH4Kb3TmqJazLsi86e5Yxf pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39bvpmuqkf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Jun 2021 17:08:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8497C100034;
        Wed, 23 Jun 2021 17:08:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6ED8E22D187;
        Wed, 23 Jun 2021 17:08:11 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Jun 2021 17:08:10
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 1/4] rpmsg: Introduce rpmsg_create_default_ept function
Date:   Wed, 23 Jun 2021 17:05:01 +0200
Message-ID: <20210623150504.14450-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-23_09:2021-06-23,2021-06-23 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

By providing a callback in the rpmsg_driver structure, the rpmsg devices
can be probed with a default endpoint created.

In this case, it is not possible to associated to this endpoint private data
that could allow the driver to retrieve the context.

This helper function allows rpmsg drivers to create a default endpoint
on runtime with an associated private context.

For example, a driver might create a context structure on the probe and
want to provide that context as private data for the default rpmsg
callback.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---

update from V1:
- Minor: alignement of the function parameter to have homogenous function declaration.
---

 drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h      | 13 ++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e5daee4f9373..07b680bda61f 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -115,6 +115,57 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
 }
 EXPORT_SYMBOL(rpmsg_create_ept);
 
+/**
+ * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
+ * @rpdev: rpmsg channel device
+ * @cb: rx callback handler
+ * @priv: private data for the driver's use
+ * @chinfo: channel_info with the local rpmsg address to bind with @cb
+ *
+ * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
+ * no endpoint is created when the device is probed by the rpmsg bus.
+ *
+ * This function returns a pointer to the default endpoint if already created or creates
+ * a endpoint and assign it as the default endpoint of the rpmsg device.
+ *
+ * Drivers should provide their @rpdev channel (so the new endpoint would belong
+ * to the same remote processor their channel belongs to), an rx callback
+ * function, an optional private data (which is provided back when the
+ * rx callback is invoked), and an address they want to bind with the
+ * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
+ * dynamically assign them an available rpmsg address (drivers should have
+ * a very good reason why not to always use RPMSG_ADDR_ANY here).
+ *
+ * Returns a pointer to the endpoint on success, or NULL on error.
+ */
+struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+						rpmsg_rx_cb_t cb, void *priv,
+						struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_endpoint *ept;
+
+	if (WARN_ON(!rpdev))
+		return NULL;
+
+	/* It does not make sense to create a default  endpoint without a callback. */
+	if (!cb)
+		return NULL;
+
+	if (rpdev->ept)
+		return rpdev->ept;
+
+	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
+	if (!ept)
+		return NULL;
+
+	/* Assign the new endpoint as default endpoint */
+	rpdev->ept = ept;
+	rpdev->src = ept->addr;
+
+	return ept;
+}
+EXPORT_SYMBOL(rpmsg_create_default_ept);
+
 /**
  * rpmsg_destroy_ept() - destroy an existing rpmsg endpoint
  * @ept: endpoing to destroy
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index d97dcd049f18..11f473834e86 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
 struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
+struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+						rpmsg_rx_cb_t cb, void *priv,
+						struct rpmsg_channel_info chinfo);
 
 int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
@@ -234,6 +237,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return ERR_PTR(-ENXIO);
 }
 
+static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+							      rpmsg_rx_cb_t cb, void *priv,
+							      struct rpmsg_channel_info chinfo)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+
 static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 {
 	/* This shouldn't be possible */
-- 
2.17.1

