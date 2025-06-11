Return-Path: <linux-remoteproc+bounces-3932-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB9AD490A
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Jun 2025 04:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72BD77A3A0B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 11 Jun 2025 02:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69639226888;
	Wed, 11 Jun 2025 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcbO4tcQ"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F7322576E
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610723; cv=none; b=E3K2a4MYowTGQzw1zwqBR4azKfT2r8kgeJsJj8BiRTjjf8t2xN2Xpo5P2EdWFuSO23coYIaNPPeW67aBYp82FLYMnpUbcRFoLrLYQnVk8LIys6gLofpNoHdPPiAK0SIqUA+9K7+kE0Lb7VA20EvzUsgr7X/s8dalreUvhDIgLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610723; c=relaxed/simple;
	bh=DJn9NYHqZgqnTw4yMsPNWysi1jIuh/SNHNWMy4qhxPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHtFQM/lVmfAQBmm6oUs4LQd46Dhp4hWOXWBPgAiiim8STxcuaf1gA7VYmO3gcsA0GpNjEGt6E+aVtcKGu8OMiStzdANeLv6cxzwYdVaTHMIGNeV38pNh8JQIBvnMl2+9VGPx79pLfWpY+pQhjFuAVDnLklfU72C0jsrm3qa5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcbO4tcQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AKP2ff010547
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHqKWedYyr0OY6wJ10igxBdQqHVIA6btUlkeWEdA34E=; b=mcbO4tcQ5e+IxFIi
	2gII1o93SHjYQi4LJQzxEWpyqyQqWH0nUZfaUZYYSSmhw5pNopJeC4GAFF+a/PWj
	fi57u1GCEUYhHAu0APylj2TrK9iX3f2WbzLhnzmUShBCzxU5+WHzNC1bmGK12qcv
	eE+q+I4cUIvPdlZzcsojVtU2RdCw/E5jfj60ZR9mybF5RT0dt54e+Qf5EHEbgZe7
	1HizZJ4AiZki5rWTPN64Gi5gleUFv7qhxdRW+BjTN+Lmo06MDFVs8OdIrJR+5gnb
	1kZepFjQds2c2/C8lb/xwjm4/dUtMMk0tB4hzJawohpIbHMniQabmyV7EkmlrRxI
	pZi67A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxupxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 02:58:39 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e92a214e2eso1440854fac.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610719; x=1750215519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHqKWedYyr0OY6wJ10igxBdQqHVIA6btUlkeWEdA34E=;
        b=AgxMV3g0r6CiLO7D9hcK1hQlPdeEq9rkijQqfflzYT4gQ2cYvmqTWFC2IiKfukfOQe
         nRtA3pqfXpMxXWbvUm12AuwDnFk5XPo2Ut5Zaut9twCq0IBUOwGkRqM/LhV3DGw42YPf
         7JTMSPllQMY2y5fvxEXp4IhCfGImyYaCQGm5YX+TbjBn3bX4dFPeCwQSE/rMdnoeXoxM
         Qbdtyuhf8SG0ukuRHuqojwAFBs77rwK83a3HaY2ep80OUqKxm40wQrWKRvPUq56LA2li
         F/+VH1wXGM6uaSR+QiahogaX+pnLwJhzmtdjefepFL4eq4Y29GHm6qpkifS4Z1QzYEIZ
         3qbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUujZfq6pUbcArXWRdapLNY5DvrbPb2KYcuCLAApLfqvMJOV3qcyFCClPqFGNOwtd2bvuPDa9N4sKRWX1rVreBA@vger.kernel.org
X-Gm-Message-State: AOJu0YxgALGNCWT6/UR4F8Xji0aNBTxaqQPhhqw1glu9K5644/VxeH22
	YIuiZatrjP6rFaANmBVDm7zIOtjsB0EK5m0oFGMc2csEBHbaOW8Py14Rk++Q+0/N9ss7Dfx9eu5
	Uz8eR0KAqJxnGYo/yepry66RXGWmr6JV6RWmGX9aYcrRjgDAUvfrIjRtkib04cfwQ2icpu/I4
X-Gm-Gg: ASbGnct4uapA27O+wi95Hrni3CdBsyv0kIwcJ9JB5tdbBmIKVJY23cA1XxKbMfQ9Jnp
	OEQXXm3rijbMZjswW6kE4CsP+zEHuPDpbfS+vxjbtGzFLqRo878Se2t4IjfOTnToa5ztmS9L5HF
	l9kagr9LQIflBeg3/DpioK+gdpnG36vUzWRq9gLP7X/L7A8rNP32KaQPPHSpNPXGaH8GZDnn8b+
	5QdWb0RLSbCu3oJWcLH4Rc4tDmrLBaOoMOZ51Fnb5OfCWsTAzF2p0vzSODtKj2wUt3crt9r4KbL
	Ytf5ym5MkjhL/pGr+TQ/fQ+1cf3dhUdZNJ8UjYAbkOKMmCa9fHCMmYDDlVsf1EewMyqsZ0xQdmG
	Ir7spORvPGLkf92Kjx1io2Q==
X-Received: by 2002:a05:6871:230d:b0:2d6:6633:463a with SMTP id 586e51a60fabf-2ea99630c12mr729394fac.8.1749610718961;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLQcilCJwRVztlhp6Tq1XQRDSfon5wVImIcFPTKlDGIIDnxnp7kRLq0y9C6AdKmJ0vdJFaQ==
X-Received: by 2002:a05:6871:230d:b0:2d6:6633:463a with SMTP id 586e51a60fabf-2ea99630c12mr729379fac.8.1749610718647;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:28 -0500
Subject: [PATCH v2 1/3] soc: qcom: mdt_loader: Ensure we don't read past
 the ELF header
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=DJn9NYHqZgqnTw4yMsPNWysi1jIuh/SNHNWMy4qhxPQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDcWMhl8PNhEUSpN0/Q5gk8VSK6rZb/VYHEr
 OGbXJKHVbmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXRow//XIVlajDg/QB4/Ejz8xnsC13HZRwJw6RFbDmviPK
 9+M9T+oSd0oJELF+cVbPGfvsPyDgHgQuWQbnHIi4N4rMhtY0Lvfcm5NJelfBet4oJfwckF8fiyR
 LX9ez77SqzOHBBrWoSOMxQBz/IrB4b/30n0oV3Fkf2GnsgFnbaMU/PImMJirh7hMkfAhxo0pRJx
 7bzA4D2iwOpO3+d7cB8WP7rwyU7QaMngZ2YSElK/cKD2c4kfZav+1KeSwQJRi1sHncuE9+qQXpw
 YuU44pAk4BDRZOPktAt0+vkSdaYRijoE2Dw+JaBj4az0ZZPgbmkgJu5wviMEdlI/gi2J7PLeeJM
 CerjSJEmHdAJii3IvdU953ABtk70tL0FYrgGL5jIUpGDV4+9msLY6NyZdXUmJD5QIDQtQb/wMSg
 nOk1VsbsqPyd1Ud9u8cmB8T29tqTbaCn3L4XUu2yg2LVs/n4xKpdn44cgjrVYYNpqo0GrytATQL
 lX9ROm5A4TopngVk6nT/5257bw7RpMNNZGly1r/J1Bv1TCAYWc4JujZ+c4P72wSDmSgkyKn37gI
 QJU+aJ1k29rR7q8ACOmDdk+t8bTSyf77YA1/g5bNlYXBDD64Lcn1RzVd0yWOY/i3R+zVRzc08lE
 4aEzqmNwJtZ2ftWHoX5/8+FYqiUpTmJJPKe4eS87JI+M=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: -WkinjpmpfxAXnhz-WleiZVsLrMKgaWB
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6848f0df cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=R2NP8FmM25b3pXeoK7YA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: -WkinjpmpfxAXnhz-WleiZVsLrMKgaWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX65bUbRWGvScB
 hjbaz90aHKoE6HGBljyQnjsuquDwUGnfDbRUI7spO8xiP6lBLVSqp4f509nWArpkezbES5/AbSg
 3x0gTUYI6z3A8PyQk+udXiE92Xh+Df9TiOVSssftuKLtIFfq1rKn6xs2p6Fk/+Xulv+lzynslRo
 qf7BMjuX3Pz74PPPo2j0+/9pAhMmzl53qHdTt86s+uR8BRHZhHt3nE+FtxtrA1QhrLKgA1kWkll
 MtlYHetcu5tok0tkg9Cb6qK8d+AQIzEZm75cwTF5SpualNJ5UA44k99wxsA2PPyzwv6eFqomcE6
 zHtpbur5dvYCrby6vOH/hF0c73qL1ZRgtEeRtVtGN+XeEXz7ZnzQj8Ut4UYwH00ecH81Jtum7gc
 jbcEv5M+mN/62cUV0sxg59cHmjztTBWgFRlUEiB7Nl3ymXhLiLnWVzSdsilv3sNJu05OPVsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

When the MDT loader is used in remoteproc, the ELF header is sanitized
beforehand, but that's not necessary the case for other clients.

Validate the size of the firmware buffer to ensure that we don't read
past the end as we iterate over the header. e_phentsize and e_shentsize
are validated as well, to ensure that the assumptions about step size in
the traversal are valid.

Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
Cc: <stable@vger.kernel.org>
Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..b2c9731b6f2afacf4acafe555dd36ca0657444a6 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -18,6 +18,37 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+static bool mdt_header_valid(const struct firmware *fw)
+{
+	const struct elf32_hdr *ehdr;
+	size_t phend;
+	size_t shend;
+
+	if (fw->size < sizeof(*ehdr))
+		return false;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+
+	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
+		return false;
+
+	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
+		return -EINVAL;
+
+	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
+	if (phend > fw->size)
+		return false;
+
+	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+		return -EINVAL;
+
+	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
+	if (shend > fw->size)
+		return false;
+
+	return true;
+}
+
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
@@ -82,6 +113,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	phys_addr_t max_addr = 0;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -134,6 +168,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	ssize_t ret;
 	void *data;
 
+	if (!mdt_header_valid(fw))
+		return ERR_PTR(-EINVAL);
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -214,6 +251,9 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	int ret;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -310,6 +350,9 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!fw || !mem_region || !mem_phys || !mem_size)
 		return -EINVAL;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);

-- 
2.49.0


