Return-Path: <linux-remoteproc+bounces-2475-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209D9A97B5
	for <lists+linux-remoteproc@lfdr.de>; Tue, 22 Oct 2024 06:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1AF282487
	for <lists+linux-remoteproc@lfdr.de>; Tue, 22 Oct 2024 04:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02729126BE2;
	Tue, 22 Oct 2024 04:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpvWk+O7"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05353481CD
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570646; cv=none; b=jWwMbI+KeCZXZGu3O31fNBbQ7Of/ll9gqyfpDcmhwWJoaedhREf7TomH1UfBUHcpv3nSuzMT3sY5bcSvwNUEttC7ZjCu6mBr+IzMzduBAcL201ZHKNnLHB4BGOff8uKMgPM3HeWtcW5SYFRanfLBVgMxFf03ebXNnc40iGUB0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570646; c=relaxed/simple;
	bh=nCR6eSYZoIUnv62h9XkzPEQUfmyePMrQlbxXjeqjc1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZxZ4kJMr1ja690+z9FTIlr6p383CdywP/wXf8FnyV+9WlASgtJmDK+sX1pCe9VsBO4EFxW3SUsjH6BriAoUgWskqm9KeS2ppNNlF9K8SjSVwl1WPKsfTeaz3lU7D4wayZt+Vl0+bPQ43VdqHSWvwz5zU7VyywWrTGxSX7ZmATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpvWk+O7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJrnpa017139
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tdkej9tfa36Vd2vuixq/tj81ncNxKtylXtt57HOCl3M=; b=YpvWk+O7c8Gmnzvb
	OuFu9gMIkke0iNVuQobeTjirpgo9VrUh8HSFnSdwARKB2phpyrwwMsOxL+MthfpD
	ixXh7b3FVm+LqdsOh0HCHh7ATpYphELYyIwQgeW2tSey89lEQluJUoTopYoV2AfN
	9Il9xBzO1cYhuaaPOW+80zvpJyrEpB8ukenf5DSntKYAjeGUEUltE3jFIw8ny5ij
	OFe4vcETLSfqIOgGrASloqhJXxb8qH5CcKPaALktzdKBpdMajweWnDZ9As3RjzFf
	JukZu2XZZcDWOSBunZXiMO3lpl+p0gjMCCySVOIkNw4nSoY2G06gIC3w8lZ73JU5
	yL2VPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqarc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:17:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7db4c1a55f5so4470087a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 21:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729570636; x=1730175436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tdkej9tfa36Vd2vuixq/tj81ncNxKtylXtt57HOCl3M=;
        b=pWwRMK/yldrb/4WVa02s8jnerLv2Js6KM2NrFE1aM5MXQHuaCc/yq2vfv0Ul0oOhiG
         VysDTbucCeVcAK1UN/wBl/+m5eyKszdj3XRBUgV3QH46Pw01ebBJK4DjyiwfY70mobQc
         gxhDqI64Ap1l4PE92/CppG0pYHUyTsefYTwEkaaAU32NG2ja2H12N+sASFJYawFIUKo/
         nHnI7W+Bos5CrY9Tpu58/QiHP8llhy4G4X0sdJgtnrQfUTsA+DLBCd8LOK6iDxB/AfwR
         KtA6qb3fJCuzyKoY/jRNEHi+YuNZjZIheBPHLwTTPM06d5bMKHAhn/FbaBKUoe03EqEe
         BONg==
X-Forwarded-Encrypted: i=1; AJvYcCXv87+LLqMA7azaTQ21jYOzNq/pWXR+1sSEfTWbRugIZgd5ocdBOmAPmPFWq6UVITOsP6Qk/AenT4RLU6inB2u+@vger.kernel.org
X-Gm-Message-State: AOJu0YyhPLKaldymPYPmkwIM0trxQxGauEfgyxefU++6IHxOqeWsWGsH
	2dTxOUfHLW75hdgJTyU4i7a3Q2UA9rUqHoZlGH1bLI3I4LBHiuzoYnakzvlX4Ho52ZlnQXV5aP3
	ny36JvLwzkmY4sQnempgZF75USyOMYS5bYeHCkeMwg+XKvi4nngLvROHs5EzgXQAE9dWo
X-Received: by 2002:a05:6a21:1349:b0:1d0:603b:bf76 with SMTP id adf61e73a8af0-1d92c5729abmr18339060637.34.1729570635901;
        Mon, 21 Oct 2024 21:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEUEFea4BiFa1YOh3N6h1+Jyb4uSBn6P00YWWH1fIJkQubb38xnsMRypqA3DS4/7pfBsxRWQ==
X-Received: by 2002:a05:6a21:1349:b0:1d0:603b:bf76 with SMTP id adf61e73a8af0-1d92c5729abmr18339049637.34.1729570635588;
        Mon, 21 Oct 2024 21:17:15 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25cb6dsm4836169a91.1.2024.10.21.21.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:17:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 22 Oct 2024 04:17:11 +0000
Subject: [PATCH 1/2] rpmsg: glink: Handle rejected intent request better
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-pmic-glink-ecancelled-v1-1-9e26fc74e0a3@oss.qualcomm.com>
References: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
In-Reply-To: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729570634; l=3793;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=nCR6eSYZoIUnv62h9XkzPEQUfmyePMrQlbxXjeqjc1U=;
 b=EPYZ4TiHJdE/TrDEG2vMI1DOhNjQ5BNVJOpuX69S5TUCN4Dvb4fmplayc7hJYKKfMTdA+cvj/
 oMGKfmJs4EvCV7ZVI41y7/PuLFBFyxGAVPSqUlGJDwcihW/Unldci5/
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-ORIG-GUID: Pe4rwLkDIAkgMZjQsOnO90bjb5WcUab7
X-Proofpoint-GUID: Pe4rwLkDIAkgMZjQsOnO90bjb5WcUab7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220027

The initial implementation of request intent response handling dealt
with two outcomes; granted allocations, and all other cases being
considered -ECANCELLED (likely from "cancelling the operation as the
remote is going down").

But on some channels intent allocation is not supported, instead the
remote will pre-allocate and announce a fixed number of intents for the
sender to use. If for such channels an rpmsg_send() is being invoked
before any channels have been announced, an intent request will be
issued and as this comes back rejected the call is failed with
-ECANCELLED.

Given that this is reported in the same way as the remote being shut
down, there's no way for the client to differentiate the two cases.

In line with the original GLINK design, change the return value to
-EAGAIN for the case where the remote rejects an intent allocation
request.

It's tempting to handle this case in the GLINK core, as we expect
intents to show up in this case. But there's no way to distinguish
between this case and a rejection for a too big allocation, nor is it
possible to predict if a currently used (and seeminly suitable) intent
will be returned for reuse or not. As such, returning the error to the
client and allow it to react seems to be the only sensible solution.

In addition to this, commit 'c05dfce0b89e ("rpmsg: glink: Wait for
intent, not just request ack")' changed the logic such that the code
always wait for an intent request response and an intent. This works out
in most cases, but in the event that a intent request is rejected and no
further intent arrives (e.g. client asks for a too big intent), the code
will stall for 10 seconds and then return -ETIMEDOUT; instead of a more
suitable error.

This change also resulted in intent requests racing with the shutdown of
the remote would be exposed to this same problem, unless some intent
happens to arrive. A patch for this was developed and posted by Sarannya
S [1], and has been incorporated here.

To summarize, the intent request can end in 4 ways:
- Timeout, no response arrived => return -ETIMEDOUT
- Abort TX, the edge is going away => return -ECANCELLED
- Intent request was rejected => return -EAGAIN
- Intent request was accepted, and an intent arrived => return 0

This patch was developed with input from Sarannya S, Deepak Kumar Singh,
and Chris Lew.

[1] https://lore.kernel.org/all/20240925072328.1163183-1-quic_deesin@quicinc.com/

Fixes: c05dfce0b89e ("rpmsg: glink: Wait for intent, not just request ack")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0b2f290069080638581a13b3a580054d31e176c2..d3af1dfa3c7d71b95dda911dfc7ad844679359d6 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1440,14 +1440,18 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 		goto unlock;
 
 	ret = wait_event_timeout(channel->intent_req_wq,
-				 READ_ONCE(channel->intent_req_result) >= 0 &&
-				 READ_ONCE(channel->intent_received),
+				 READ_ONCE(channel->intent_req_result) == 0 ||
+				 (READ_ONCE(channel->intent_req_result) > 0 &&
+				  READ_ONCE(channel->intent_received)) ||
+				 glink->abort_tx,
 				 10 * HZ);
 	if (!ret) {
 		dev_err(glink->dev, "intent request timed out\n");
 		ret = -ETIMEDOUT;
+	} else if (glink->abort_tx) {
+		ret = -ECANCELED;
 	} else {
-		ret = READ_ONCE(channel->intent_req_result) ? 0 : -ECANCELED;
+		ret = READ_ONCE(channel->intent_req_result) ? 0 : -EAGAIN;
 	}
 
 unlock:

-- 
2.43.0


