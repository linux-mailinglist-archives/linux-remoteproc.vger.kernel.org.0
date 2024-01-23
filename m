Return-Path: <linux-remoteproc+bounces-260-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA68389A6
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Jan 2024 09:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 538101F29FD8
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Jan 2024 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578A458ADA;
	Tue, 23 Jan 2024 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="azsUhl4s"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44E58216
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705999877; cv=none; b=Rf7rL70rBncOa4YIdzDaHg9BK/197YhFQCH4AQnat014zAJ9g072LuCkrEN32YG7IRFVJTWdb4K6qVWpyg2RnR2corVAEaQ25gWXjP11sqE7Mvh6FCkQM7FgGs4MrfgpnC3U6yudB0facKluHPlb8+wQxA9RQyn6g3FiAeCiHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705999877; c=relaxed/simple;
	bh=yYDIxCgQjILCWDIszMswpsFyQFY+wDMVlcloNET2XWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHtgb79OT32IioHVPy5wD4VtS3ifVoGlBzqlCMd/eEAQRKmkhbWRzu2k0Bm1SFsyvWWoY62UAFeISvdrzCxxkGo8E5vBmxSJGynykpEJayBOvh/yx42+AGiCJEBN0G44UAG31+TXd8kzVNNcVvrbGLohpIr46PuW29htal5vo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=azsUhl4s; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3392b12dd21so2252402f8f.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 00:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705999873; x=1706604673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2ksQJlWEggjhFecVmc9x24iF2N4B56opUimISYFAaM=;
        b=azsUhl4sbHs0Rid/UBUDPGRsP11jc7N+IsCUWiOzuffl1uNYzg//oItskKBWYEnaeu
         Qf/T3+x/ycbticmuTAQGico0ogHiE5uJw2X53zvd2BPmPCHysS+N/hmOl709n7ssfLRj
         /YwOEjS3yKV/pLKcIaYcKvZmoGHjxx5SAvPZhblfDpkQ2GRQnx80R2Wiq7+ex0w2HbVp
         zr3Sdnl0kDWOzskLOcejZURUxn4ErZBbf315PHqLUUSuww2cy/blZs78LqMbzyL7UHHw
         bC5qH/RjjI9/ivna+Aqx1hDDR+jIDbNivi2W/WK6kPm1H5SoRq/lmKrDtgjITRwQ8mRe
         X1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999873; x=1706604673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2ksQJlWEggjhFecVmc9x24iF2N4B56opUimISYFAaM=;
        b=Y9iVjDHxk4l4ExUIyucYCnVP5gkRm4Rjwa4/pNEOJXxWrx0QGSj44M7aW208agUvgv
         j4iBCZB33mM8YfZ8VJhJ7WU/ShkrYCR7fs9oI6nm4QvU2duE1jrtV2mzAQLBT0fM1hZr
         mmtdrRnKoy4i1U06pCssSh0LVbhPeO1dzf9HMr0VCKn0psinb+VcpQ219iP211ERt0i0
         A+rars+xo1FQXP+Ob1IrcG5oqFOLpXhAWX4LEkX8V6I7FIUeDtr2pDpCa81QP09Sinpm
         v6VsKd4RBt+jQ8+WeRHiLScWLmw8cIautVj55Ikp99NKILMVotCCFQLifbv41hODyXch
         4n3A==
X-Gm-Message-State: AOJu0YxdWhw1fk5ooovrsK9qZBKUzZOq/KmYi4wRtYduwkdGkIpZrk5p
	lllPwu1uSZIVsTsYo83Bezgj9OenqZSE4jkYcwOQ58UgwAYIhCkCGp6HKlihgCk=
X-Google-Smtp-Source: AGHT+IGfnJKojIc5LQGtXm1zt5MBCt8OE7HJeyr9GQM3CnMyCdGe5KU2VKNpBTG+93TKBix3ahroOA==
X-Received: by 2002:a05:600c:1f05:b0:40e:49c6:3eb0 with SMTP id bd5-20020a05600c1f0500b0040e49c63eb0mr304204wmb.114.1705999873756;
        Tue, 23 Jan 2024 00:51:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b0040e541ddcb1sm41847342wms.33.2024.01.23.00.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:51:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 23 Jan 2024 09:51:05 +0100
Subject: [PATCH v7 4/4] arm64: dts: qcom: sm8650: add missing qlink_logging
 reserved memory for mpss
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-topic-sm8650-upstream-remoteproc-v7-4-61283f50162f@linaro.org>
References: <20240123-topic-sm8650-upstream-remoteproc-v7-0-61283f50162f@linaro.org>
In-Reply-To: <20240123-topic-sm8650-upstream-remoteproc-v7-0-61283f50162f@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yYDIxCgQjILCWDIszMswpsFyQFY+wDMVlcloNET2XWw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlr338Df2YVIz3cMlmwBY8GIAJXRwjWh+oUcQcDHm/
 wG1pkFyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZa99/AAKCRB33NvayMhJ0W0+D/
 wM1bks4PhCjijqQCwzmOhI8/4YbqqNxrUv4n+KAfrbiU6Z4VDHrppH1IKm2CDNZkBpXS1Y5paaJ0Ow
 DQpcWot2ifIV7oZO8wA5uVVLwxuUar1Nce1KJM8KIFaUYkeG08Txv0X2GYT4A9Hp8OZGlVmTqsmPby
 VI37hyMd6+FAQYwubgiR2l1SUZoFqkq4fPGMC18Db9iW1F3ClenMZd63iUA9PSn81E9Mpt3doqyc/p
 3Xi40YW8Vpaw6PgWRh1rf5YiVwYat1ONLI3PmJGffS2F8OZ43tEzddIn1zc+F1sIHv+b3NLsRAGVIj
 sNGKMFVC15G7RMQ84EMZkBL4QvM8xLGM1eqwCyo1R6fKFr6evATwhisN+JaijYwSBT7fUWy6dvqVia
 pFB2VyctSaFuW4qk9mpO/lvHrwaXnZXYhjYSTq2ftNTVAT0eGqfuaYFCSMwnCCpDccgu2s3aIFED2f
 EhjxIwd+sxWI7xyE2XTnOVMpR3ehSu2ZMUKsng2qrR7RwKQzft+WClIfD81FwINU23PwReDQOhzHMC
 2NfrWrT8KvcnUGkPaHpwoyZnp7sbbEW+aaUJuoL0x9peYu0ToaFL+n34QCmO39IV8VRdh5KsuU3/pB
 16r9+ZXjcINowFfqLFroSDpIyuRZA5Yn7ACSCOVQgglYfI/4antX1Xm5WYcQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The qlink_logging memory region is also used by the modem firmware,
add it to the reserved memories and add it to the MPSS memory regions.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 2df77123a8c7..7a1cbc823306 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -525,6 +525,11 @@ qdss_mem: qdss@82800000 {
 			no-map;
 		};
 
+		qlink_logging_mem: qlink-logging@84800000 {
+			reg = <0 0x84800000 0 0x200000>;
+			no-map;
+		};
+
 		mpss_dsm_mem: mpss-dsm@86b00000 {
 			reg = <0 0x86b00000 0 0x4900000>;
 			no-map;
@@ -2627,7 +2632,8 @@ remoteproc_mpss: remoteproc@4080000 {
 					     "mss";
 
 			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
-					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>;
+					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
+					<&qlink_logging_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
 

-- 
2.34.1


