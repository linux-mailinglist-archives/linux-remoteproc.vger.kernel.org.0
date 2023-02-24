Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6770B6A239D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Feb 2023 22:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjBXVST (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Feb 2023 16:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjBXVSP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Feb 2023 16:18:15 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA22525E;
        Fri, 24 Feb 2023 13:17:53 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OKp80j029561;
        Fri, 24 Feb 2023 21:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=CPewQcvdvM6tnCXkA/ryYOlaoSyypxN3yA10Btcyz3E=;
 b=k+Gj8IPUFgcBH5J1LlgnQ/1KIbeqwHdh6LjwnpYXitZ7FY/uucBYhJTp/IklW+N0SwGu
 ae7g9Y7U9Rh+yX4xP2khxktloAZb9eB8sHaWT+9EAoST7ocdYpsobb9waTky+l20Ru9d
 bSQuWWfc4aKoYNiOs4DNY3q+ezUmhw0d29S2TEK9Usvnn7cTKs819TeVePxhsI1mh0B2
 KgF57/TJVAAMR1tcS+6xgbtBHxnX/wqkMEuYDxOViaHco0CTAqnATzmSyoeDsSDXaUQ4
 d3euLNj2JU76/bRvlBXrbPVkJARiEDbQWycJ8zgdBk53ueUXMzDYQaeKZGTFqprtwlYI BQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxsy7t22n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 21:17:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OLHMhK025479
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 21:17:22 GMT
Received: from hu-gokukris-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Feb 2023 13:17:21 -0800
From:   Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Elliot Berman" <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Subject: [PATCH v5 1/2] remoteproc: core: Export the rproc coredump APIs
Date:   Fri, 24 Feb 2023 13:17:06 -0800
Message-ID: <20230224211707.30916-2-quic_gokukris@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224211707.30916-1-quic_gokukris@quicinc.com>
References: <20230224211707.30916-1-quic_gokukris@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: blBNM9NyXPCCoeOBTVj9JCNqBbbd9bVH
X-Proofpoint-ORIG-GUID: blBNM9NyXPCCoeOBTVj9JCNqBbbd9bVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240169
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Siddharth Gupta <sidgup@codeaurora.org>

The remoteproc coredump APIs are currently only part of the internal
remoteproc header. This prevents the remoteproc platform drivers from
using these APIs when needed. This change moves the rproc_coredump()
and rproc_coredump_cleanup() APIs to the linux header and marks them
as exported symbols.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Signed-off-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
---
 drivers/remoteproc/remoteproc_coredump.c | 2 ++
 drivers/remoteproc/remoteproc_internal.h | 4 ----
 include/linux/remoteproc.h               | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index 4b093420d98a..9c53c3df7fde 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -32,6 +32,7 @@ void rproc_coredump_cleanup(struct rproc *rproc)
 		kfree(entry);
 	}
 }
+EXPORT_SYMBOL_GPL(rproc_coredump_cleanup);
 
 /**
  * rproc_coredump_add_segment() - add segment of device memory to coredump
@@ -327,6 +328,7 @@ void rproc_coredump(struct rproc *rproc)
 	 */
 	wait_for_completion(&dump_state.dump_done);
 }
+EXPORT_SYMBOL_GPL(rproc_coredump);
 
 /**
  * rproc_coredump_using_sections() - perform coredump using section headers
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index d4dbb8d1d80c..f62a82d71dfa 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -76,10 +76,6 @@ extern struct class rproc_class;
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
-/* from remoteproc_coredump.c */
-void rproc_coredump_cleanup(struct rproc *rproc);
-void rproc_coredump(struct rproc *rproc);
-
 #ifdef CONFIG_REMOTEPROC_CDEV
 void rproc_init_cdev(void);
 void rproc_exit_cdev(void);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index fe8978eb69f1..b4795698d8c2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -690,6 +690,10 @@ int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+
+/* from remoteproc_coredump.c */
+void rproc_coredump_cleanup(struct rproc *rproc);
+void rproc_coredump(struct rproc *rproc);
 void rproc_coredump_using_sections(struct rproc *rproc);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
 int rproc_coredump_add_custom_segment(struct rproc *rproc,
-- 
2.39.2

