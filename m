Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309DD76CF6F
	for <lists+linux-remoteproc@lfdr.de>; Wed,  2 Aug 2023 16:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbjHBOGj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Aug 2023 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbjHBOGi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Aug 2023 10:06:38 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7423F26B6;
        Wed,  2 Aug 2023 07:06:37 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372DpOmW023852;
        Wed, 2 Aug 2023 14:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=XjtP5Uc3bWL916Sk+aDlvEnHl3I/1/nJsNSWvCxuiS4=;
 b=LrgCmISETxEJEXeEl0yl/KmNxdMCKuIiILytpM1EvJGg8HondNqMJtJNCXlAdcCrGaLs
 IrheDoSaPyV9d7Dq3AGVVmnMNDuXQO0xYfmtYj3aONJwuGDlGWKHQBFF7BZNLlDkueBJ
 SIpRAC2G8bebJ9KZPw50wZ/Wor/BzDESEOsQaSfx+nmqDMtVCLo3WiSCSrVIHHDpsOpM
 FdiaHBOyIU0OHLzjpiRRpmSbu8zWl1en8Bh3TvBcYZnEF2rwILrzeuUtanKFroMaiknQ
 MidOoGLKj8uA0KveR4yFhL0xtvrSBydBZVYxkKIC5Vs9gHSxs9uEf5c/srLfJJXWKpX6 zQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s6yq4bdcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 14:06:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372E6T4N022497
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 2 Aug 2023 14:06:30 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 07:06:22 -0700
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_eberman@quicinc.com>,
        <quic_gurus@quicinc.com>, <kvalo@kernel.org>,
        <quic_mmanikan@quicinc.com>, <loic.poulain@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_varada@quicinc.com>
Subject: [PATCH v5 00/11] Add multipd remoteproc support
Date:   Wed, 2 Aug 2023 19:35:55 +0530
Message-ID: <20230802140606.2041889-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P9iDJj92c2vAvJRT02NwsmpbPck1wti2
X-Proofpoint-GUID: P9iDJj92c2vAvJRT02NwsmpbPck1wti2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_09,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=873
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020125
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

APSS brings Q6 out of reset and then Q6 brings
WCSS block (wifi radio's) out of reset.

				   ---------------
			      -->  |WiFi 2G radio|
			      |	   --------------
			      |
--------	-------	      |
| APSS | --->   |QDSP6|  -----|
---------	-------       |
                              |
      			      |
			      |   --------------
			      --> |WiFi 5G radio|
				  --------------

Problem here is if any radio crashes, subsequently other
radio also should crash because Q6 crashed. Let's say
2G radio crashed, Q6 should pass this info to APSS. Only
Q6 processor interrupts registered with APSS. Obviously
Q6 should crash and raise fatal interrupt to APSS. Due
to this 5G radio also crashed. But no issue in 5G radio,
because of 2G radio crash 5G radio also impacted.

In multi pd model, this problem is resolved. Here WCSS
functionality (WiFi radio's) moved out from Q6 root pd
to a separate user pd. Due to this, radio's independently
pass their status info to APPS with out crashing Q6. So
other radio's won't be impacted.

Pd means protection domain. It's similar to process in Linux.
Here QDSP6 processor runs each wifi radio functionality on a
separate process. One process can't access other process
resources, so this is termed as PD i.e protection domain.

 APPS				QDSP6
-------                      -------------
|     |	 Crash notification  |		|	----------
|     |<---------------------|----------|-------|WiFi    |
|     |			     |		|    |->|2G radio|
|     |			     |	-------	|    | 	----------
|     |	     		     |	|     |	|    |
|Root |	 Start/stop  Q6	     |	|  R  | |    |
|PD   |<---------------------|->|     | |    |
|rproc|  Crash notification  |	|  O  | |    |
|     |			     |	|     |	|    |
|User |Start/stop UserPD1(2G)|  |  O  | |    |
|PD1  |----------------------|->|     |-|----|
|rproc|			     |	|  T  |	|    |
|     |			     |	|     | |    |
|User |Start/stop UserPD2(5G)|	|  P  | |    |
|PD2  |----------------------|->|     |-|----|
|rproc|			     |	|  D  |	|    |
|     |			     |	-------	|    |	-----------
|     |	Crash notification   |		|    |->|WiFi	  |
|     |<---------------------|----------|-------|5G radio |
-------			     |		|	-----------
                             ------------
According to linux terminology, here consider Q6 as root
i.e it provide all services, WCSS (wifi radio's) as user
i.e it uses services provided by root.

Since Q6 root & WCSS user pd's able to communicate with
APSS individually, multipd remoteproc driver registers
each PD with rproc framework. Here clients (Wifi host drivers)
intrested on WCSS PD rproc, so multipd driver start's root
pd in the context of WCSS user pd rproc start. Similarly
on down path, root pd will be stopped after wcss user pd
stopped.

Here WCSS(user) PD is dependent on Q6(root) PD, so first
q6 pd should be up before wcss pd. After wcss pd goes down,
q6 pd should be turned off.

IPQ5332, IPQ9574 supports multipd remoteproc driver.

[V5]:
	- Fixed all comments and rebased on linux-next.
	- Exported symbols to resolve errors reported here
https://lore.kernel.org/oe-kbuild-all/202307301307.LGjSxmY8-lkp@intel.com/

[V4]:
	- Fixed all comments and rebased on linux-next.
	- All userpd's rproc handles stored in linked list.
	- Removed data members from compatible specific data structure.
	- In probe itself, traverse for each userpd and call
	  'q6_register_userpd()'.

[V3]:
	- Fixed all comments and rebased on linux-next.
	- IPQ5018 support is dropped because it's base port
	  patches not yet merged.
	- IPQ5332 support is added with below patches.
	  [03/11], [05/11], [06/11], [07/11], [10/11].

[V2]:
	- Fixed all comments and rebased on linux-next.
	- since clocks handled by QDSP6 firmware
 	  Added [04/13], [05/13], [06/13], [07/13] patches.

Manikanta Mylavarapu (11):
  dt-bindings: remoteproc: qcom: Add support for multipd model
  clk: qcom: ipq5332: remove q6 bring up clocks
  clk: qcom: ipq9574: remove q6 bring up clocks
  dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
  dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring up clock macros
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  firmware: qcom_scm: ipq5332: add msa lock/unlock support
  remoteproc: qcom: q6v5: Add multipd interrupts support
  remoteproc: qcom: Add Hexagon based multipd rproc driver
  arm64: dts: qcom: ipq5332: Add nodes to bringup multipd
  arm64: dts: qcom: ipq9574: Add nodes to bring up multipd

 .../bindings/remoteproc/qcom,multipd-pil.yaml | 189 +++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts   |  21 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  60 ++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  59 ++
 drivers/clk/qcom/gcc-ipq5332.c                | 380 ---------
 drivers/clk/qcom/gcc-ipq9574.c                | 326 -------
 drivers/firmware/qcom_scm.c                   |  86 ++
 drivers/firmware/qcom_scm.h                   |   3 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5.c                |  41 +-
 drivers/remoteproc/qcom_q6v5.h                |  11 +
 drivers/remoteproc/qcom_q6v5_mpd.c            | 802 ++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5332-gcc.h  |  20 -
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |  18 -
 include/linux/firmware/qcom/qcom_scm.h        |   2 +
 16 files changed, 1291 insertions(+), 747 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_mpd.c

-- 
2.34.1

