Return-Path: <linux-remoteproc+bounces-999-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0548935EB
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 23:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FBDE1F21FB2
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 21:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4CF14882E;
	Sun, 31 Mar 2024 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JB3QMRin"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14951487CC
	for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711919447; cv=none; b=nE7eljkkXSk6lbpHDgT7ZlZ1RyKbNFAdxK5STehgtuDo16SmU6o1vkoQaz4Bc3nx6Z/IsEjv26glU56cSkgXCWKwSAKQYXNNq2X0ntNiu65dTmmYLPQtLudBk8WInv2/JrzY/Ptyei4+O0e41NODSeBrn7ul6X8nXl9aict9Xq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711919447; c=relaxed/simple;
	bh=o8kBoQFm7PJzjXGqhBUMrXuaVG7jgswhUcwQnLTI4j4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iW4jNQGwpRY4Ot7Sskk8zKuzlm21m+vJPSJs2pNz7ui3Ym2tsNjGVuj489Te2X07ihbq1dsGI0NeUZ8pAlJtlqpLvKJDI038V5O5e17tfRyh9BdqTpcBma9Cx2AMyTwSuNvzBHFOB7GpTbAnsRDL/NGUmD0z9nBDZEoahil0vcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JB3QMRin; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-515b43b39fdso2969550e87.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711919444; x=1712524244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDv8zJ/AhefbpJoCZDcqkTXe888nW/523sAJ1ru8rg4=;
        b=JB3QMRinYvRs4npfw/aOOonrd/y8fLUNV0VQaenOLIdGgpE95ZW5M+dlhwz0CehRB/
         TtlLrtyrtgatEAC8RzRfR+iCks7Q/eYCtlCwRFFnBmvivvoekJ/7c2DB0l1039P5adHI
         Epl7KDLr0gJmHJa/oBKHoiwJjol9CUF/j98LnnRBSjiOJJwOoBWFR2hHShLSoD29XQTS
         IKO52xwKJWMc/r30uIpIXhfJRe1fGudsieUGdWXfPnllHkJN6ExvxKbeZoqNT7BBqXgG
         i0M4ukP5tLkEoFUnbbgXNbJLy8cTmOgH6NgPktRwlMcpW6GGKOYBYHkj17tEkYAuJowT
         rjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711919444; x=1712524244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDv8zJ/AhefbpJoCZDcqkTXe888nW/523sAJ1ru8rg4=;
        b=OotTLY73uhwdsmDBzGk67Jb57XsUekqSgsnfWzkRc9lp3coTi5mqxlVdDfMjDq7oYN
         yRK0VJOJ1gpr0L4Q8a7LuPotUykX2DtDX0aa9twi3rxF5NPGH2EVQUghSavENfVmMKn6
         rVzM8T5mThCXS+zrKeXKdgS/lDHOEmNGaW4dLM8f/fFBp+ujDd05LIIrIzD+6bPAXiaD
         qVzQKVPIe2eiCEpaPdy4nG1bRpKe91eD2W2aOYc3/dbtofQkDKe4gTPDOlqt0o8U7BGK
         XNafFQCFyt3jKTp2XC9DEzD0ecNbAU9m2LI6imQwxqhltb/gIMBSVvxyjejD2ML9qQQq
         QKZg==
X-Forwarded-Encrypted: i=1; AJvYcCU7kZs5guXwW8v6quQNJ5LnHH9xarFPb7ihWp+oJGomWdDsW2J+KctiNUs9RwqJnQ9pjolXy/Y8nYX9S0XPLCo89+W7Yv1RnDTWSmwtOV9P2A==
X-Gm-Message-State: AOJu0YxS+IL+qh6HPvx/z2u095RuKx3pUGb1KKTTAjV7mWWHXJ6Xi+GZ
	6vwMugrUjnga3+0eSb94z5HLyRuFDuEbR/wjlSvHrlsFWpMbMbt+qeoTg1n+Oz8=
X-Google-Smtp-Source: AGHT+IE8zT3MQMl/IwbngIjgwWHP8wtQwF/fWkHqwfEpgBgp/YH5SLr6ZrCust7uwCAJ0sFmsL1G8Q==
X-Received: by 2002:ac2:532d:0:b0:515:89cc:26ab with SMTP id f13-20020ac2532d000000b0051589cc26abmr2589711lfh.9.1711919443963;
        Sun, 31 Mar 2024 14:10:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i1-20020a0565123e0100b00515cd1d5c99sm1033553lfv.85.2024.03.31.14.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 14:10:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 00:10:42 +0300
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: allow
 glink-edge on msm8996
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-msm8996-remoteproc-v1-1-f02ab47fc728@linaro.org>
References: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
In-Reply-To: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o8kBoQFm7PJzjXGqhBUMrXuaVG7jgswhUcwQnLTI4j4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxrnxaBJc/91LulmKih/vmJ5+cud2XaXbSIX9X2Z1tj9I
 a1+HbtoJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmYpbFwdDPK3j/uCXz7yN/
 1xj8rnVwqwo42Sxjl5U+fZ3UZRPtzQ5t534w5fwIP9R3ykGoMG115N1Zyunv1wbIdH4NzLbcz+C
 c95Pj8cGfJ/n+CWS2cV7mcc1V87Zs8r2p3DHne8Stu2uVouosle63nC1Q4PjFuU87/pvBbfvnLT
 fO2AWdeb9xmdTsXVfiPIqyX6mp8CcUsDyaEON6vYApr5vX2kUhvHG6l2bw9vsblnhf27r7rIzbj
 g+F1fYCpaHZAj56Fy+d3z0/ddk158VuO8ukoxvCpZ/lLo6ZbieWc7N0y/Kdunc/z+pwSm2ycUh9
 fYBX+5ZIqma6QPyq7FVd+2LLL71/t6fJq3aywU8Xl7pdAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

MSM8996 has limited glink support, allow glink-edge node on MSM8996
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 971734085d51..4d2055f283ac 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -231,7 +231,6 @@ allOf:
             - const: snoc_axi
             - const: mnoc_axi
             - const: qdss
-        glink-edge: false
       required:
         - pll-supply
         - smd-edge

-- 
2.39.2


