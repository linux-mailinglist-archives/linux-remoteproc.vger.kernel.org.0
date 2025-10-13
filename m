Return-Path: <linux-remoteproc+bounces-5020-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B27BD26E9
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Oct 2025 12:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 879464EDC75
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Oct 2025 10:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE13C2FE570;
	Mon, 13 Oct 2025 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpT0O9Cr"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD732FE074
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349830; cv=none; b=ZQaFMhzxY0FHcl1iIfbpSdLyhMJP0UAC67dE0vM4Vm2hHmNWLjuz3yWudccMoDbJdI1wOuJl6XtS13YRZuI0pODWev7ymiIl5iqcKaJvPm0GL6KkYzIuEjrW3KL2k3KXpQmUvqZUgzPD3qswyUMTfVsoa8yIJkiki0dRrS+D5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349830; c=relaxed/simple;
	bh=5S7bewqa2P4aC46GNTPc3Wfn3h92qyoaFLzlTIsn9fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=et/FbP72yPtw+6cxVjqn6UeJybgJh07amNDM3LrxMCf7hhhYxjWYSp4k/HmGwPmha7w9q+I5qUEApEBCrLjI/rFWOG36IwyUn8vhWyPBqhOwuskW2G2R7XvPJv/AEms3e0rjkCRCJwKHtfdqdRbZZ4bJJRsSJIz+jNPld27zHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpT0O9Cr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nKYu023103
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PFM8hA0K00Qfpbxy4GnLDAkU4MBb9gQY5AMWZmJe2JE=; b=LpT0O9CrPnTcFYzj
	8MbWgTkgPBtL0IbGY4HUZOsmlSYkjD3PYjqbe7GlAF8E7SuRVg5EZi0U4etnqVRu
	EdS0nRYbMSeSP144N5YZQix+HAxYv4w7boXYndPT+gihSqhSQLdVrAEytnjh+i4v
	CELYvkaSly6H6NqnS0cCg2XITSL1oWiGR7qoAqMWHuKySmbnIb+8Ai/b69LftVj9
	hlBXnWsyLnAaBQaDOvxQbsewIaTF59d/+h0knD1kM5aJxaFvanzEsom+nDJaF9if
	ALdtlbWMX3YBAFf2/dackKeF/qOhj+Lh8K0s/7s2MJwwxSw+ZkczcI78hX6tycwb
	eqmZXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfv2am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:03:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-792722e4ebeso7163902b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 03:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349827; x=1760954627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFM8hA0K00Qfpbxy4GnLDAkU4MBb9gQY5AMWZmJe2JE=;
        b=okYBA+kczsMh+87a2zeMeoCQW6cg4xAnuEZ0pKg6pP0meTILUjcaX5cK/v/5C+vAqJ
         Hb1q4twY3BEAHkpyQVCr3iOCDI3hLhbnNBvckZnP37MyEpXPO9LANkpolxi281FhjzQp
         96xTp1wDnHoZ2GvnzYcev1aVTh8zpSanCymSfEoqvd9xK/JukqBVbe5Ay1uIULa2Pu5e
         JmWcS50rUS57KixX7LENBosBTreq1lYVMF6/4o2JxBGv1bBABGMXIi3slfy9VoOGPJlC
         2UhD/yQ/i+uEMeRtgdQsGeDmsb8039dliZPS9OgaJGhXD9/vjoQ1ut8/IK9/AIq7JJPC
         iG2w==
X-Forwarded-Encrypted: i=1; AJvYcCUR1n2dglwKRrkUwpouAiQbGR/cVLgDfBa9eduqeKvTLJtRzX120Uch4zl9j1YMPxKCLbUG2o5fFVOQO5/esIPm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxk9TMMZZTzH2I4JperUuV4Vx5yHU1zVJvWQQLzr62l9M89TNw
	K0b54bXxKZcEElWJL93jA3FIN7Gmidv4rNnaK60wrfzLWZcIrIWfQx/hDvbZpFfaeeIpYb++z93
	NrBcngyg8k8k0PP9mheU1DdM43raAQU9/Bukchiq7bOBwP0eIFFDQJH/+mhINNZhf5y6CStL5Vm
	WzArhD
X-Gm-Gg: ASbGncs0KYV+QKOALlVqQw9VICiKrcwit74ACy7XlUeEWJvK2XElnjXyB6Hlv7xMT8H
	jy7aj4sHvSKJsoRyGXKKSfy8nNSnrPdCol9hMeRk8diameve5aRYwqoWtpXyE/hld13FBBZj7Pi
	ebC1JTtO8EeTQuuz/Tbdt9f2POk0nJ0Th2iauNKc9GMyMiL31ZuzSeqqmLjT6ARAYU6tggQORt1
	OsC4zcY6txN41Ir01LMq2uEkB++ZrIr8eZFzdI1Z6I033nCIUb/OzKud8SWq52hHOTflzer/L52
	rHh6JK/+67tDHwcz3lk97DQAr2pcThy+/YuxCaO0KVD8Nbm7P31uR9FWOYfPhLyQ/L8=
X-Received: by 2002:a05:6a00:194d:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7938743fc00mr27742305b3a.18.1760349827328;
        Mon, 13 Oct 2025 03:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYhj8mqzvfx+Gmm8tmdtXN1K43jbXhwEsbYRoGFXxfSqXL1HtAguoQA9+KufJW5UnX9e4VnA==
X-Received: by 2002:a05:6a00:194d:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7938743fc00mr27742259b3a.18.1760349826760;
        Mon, 13 Oct 2025 03:03:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:03:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:05 +0530
Subject: [PATCH v5 01/13] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-1-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=1163;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5S7bewqa2P4aC46GNTPc3Wfn3h92qyoaFLzlTIsn9fM=;
 b=fjwKLRv6UEHiLGsia3ENpOQwDD/Zvg1ps7kKLeEGJYX81++6k8WJg8nxjIF1Z9+vVUXDs3/qI
 fai2B1PgWs5CMbdbTLtJ7yGde6RfpDrovbb5w4N0tqOFiNerbKTmY3R
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX8UiqvJB+b+Ov
 6POVnr46dvVVknHqkX333tjG87uDMRuYTcWVqb/kVg4vWiygyObTtBBHeY32Qd2jBHA/N8llxP9
 9S+Iisk/Qkke6l6+JDSQGu7vr8cJIsTEatXcMj8F8NxDANcjh4sETJ6Bl5R9lF1xoHqdJiFYaAd
 kdLwJ4D1kuyLkn0kmNf+rO/GLuV1gpxdDCdD4tdO+Kj15QcI9d9JLs8zXtO867VPMieGmqatZRc
 vtD60RrGz4+YKxOtTCP+KWRCn2gWQTCDYcg6aoyrpOjQ1Drg/dKA8Hp6ql3bgq1GWC37i6ha5dP
 PXpu0BP0bwS5TUZc8GQduMSzzyIqURrcpWS/LcSTZXzEfHIDG02mv+nkg92pWbAUo+Ke8rHDkIS
 sMeZSzZiVSEuRQn+2Ha4lNIHKT2pIg==
X-Proofpoint-GUID: O36FRwHP13CVwqrBaQcbA-F8z3DOYzQo
X-Proofpoint-ORIG-GUID: O36FRwHP13CVwqrBaQcbA-F8z3DOYzQo
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecce84 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=vdhzk_XxDewY554Buq8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
configuration for remote processor and when it is not present, the
operating system must perform these configurations instead and for that
firmware stream should be presented to the operating system. Hence, add
iommus property as optional property for PAS supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..68c17bf18987 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


