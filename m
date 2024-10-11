Return-Path: <linux-remoteproc+bounces-2400-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1099A487
	for <lists+linux-remoteproc@lfdr.de>; Fri, 11 Oct 2024 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829841F21E77
	for <lists+linux-remoteproc@lfdr.de>; Fri, 11 Oct 2024 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF542219CB8;
	Fri, 11 Oct 2024 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jd8R1O43"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4B521859B
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652180; cv=none; b=kL62uy0Pqtr2/DzIBIM30URXaoimy+x/V4/xgZT68TU6V6rK5UP9ojkfa67S6CmvlNGSFILmRhWkScRL16FEysHAnzeiAo+F4SG5N73DiS7Me1Dq7QuAWfKsb1RdsgggsjVmmgdCJifx9LgA/mEc3liTPj8I0z8o7GXUuEAojkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652180; c=relaxed/simple;
	bh=7kdOoNfMlZbYPfmRo7BU7gqeehZO4mpSsH4l4kVhdVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXRzZErbQ1/m0tmRZQpkk/In1HbI7EEW6cBXsFpujEcsV3Ch2clhojnSyJGwryU5bFPBQX7jf0KnCRXPtbYExUNJQIMhPvkeuVh0mJhCAcDibfk+8ftxIqKLDvAztydbtQjlaKEBjpY+51+nlmamMr3uw6oXwK1hw5pPWuhH6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jd8R1O43; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431157a490eso3290155e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652177; x=1729256977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1REIJgEpdIx863Xckau1T4eHu3s++vgqgq7X+I/+RaE=;
        b=jd8R1O43/eJ7gUCFXMpAqfNeHj7nZuQC6fY3b+XbeN2gg+95IERI55nv2DdQiaQX7z
         XM1ZH7ucZpcUlIg/1e5lbCpoCFosP+YaenJFN5+uwCL3fkZU69sfpQh6MV8HdRCkO2lW
         yGlgkNWkZHKSIT11119pSHuEmYrQji9ruSHKNsRqsZfTZhEB+BbUfURQ3JywM7Glr1ae
         alfdDbY+I3z7bDAWDvch76FLQuyrSTt/i73WBUx2FAmAadz+YP6I3dII/BL/vYQdFRhc
         ctmQPIagcLd+bLDcZgaPB0oSKbzum3TvJDajLkFwG4jNGtzHO3Jn+fXYs9v9H1XVN8M3
         yi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652177; x=1729256977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1REIJgEpdIx863Xckau1T4eHu3s++vgqgq7X+I/+RaE=;
        b=kY3V1b2vxErRF8VbI5ZOSG42UiX5kXU2IN2OFwsCf4O2qG7z5ATv4dd3Gb6xQ5B+Cs
         Y/WxzCN9KUNvjCQ//oLfS5WcR251HCAMmpKeV+6JBg6IwQpocsja5ooRVyNNgoJg6oYR
         ayNIXprceWhKSC7IHvFknSoGn4SaWH4tLH/TPC2dKvRBsVgZAACcffm0Qrk64YgYkQYa
         t99TS4aY/5iAqVg3QFZBg+Bjyf//GGHbhLlxJN9QUG1KqB3HbCb/pb+s7QfBhnAkHG8O
         ejs1ap5pTxrUpL5zzzoV4c5zHJscFcnPmRznk2hAs5WWzVWuXm0PUsu+JNN/CXMjt0lS
         xXYg==
X-Gm-Message-State: AOJu0YwAOQha+gTldhgbrcz1J/AYSUAFmieuaKQtIN+MZrSKELyNxy8U
	iNZ0ROuF0zGXc3oSQxZ3caiFLv9MVmNIHMzjbsgORc94XV8zRw1IanbnvQvqyyI=
X-Google-Smtp-Source: AGHT+IEEkKY/6b0TIyEQcSfAmiz8qvdUcFi/UqnhV9Vtt0lRZyZBwwpEnou/+4xo35nG5z92Ey7g+w==
X-Received: by 2002:a05:600c:4f85:b0:42c:b995:20c2 with SMTP id 5b1f17b1804b1-4311ded2070mr9874195e9.3.1728652177461;
        Fri, 11 Oct 2024 06:09:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:13 +0200
Subject: [PATCH 05/10] remoteproc: qcom_q6v5_adsp: Simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-5-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7kdOoNfMlZbYPfmRo7BU7gqeehZO4mpSsH4l4kVhdVo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSOChz9N3XKg18dB5jGjrrzdkT0/FM1v/WZMT
 Mg/6ZCzNRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjggAKCRDBN2bmhouD
 1+FCD/9OQZ35fwISw9kTwuj+H3KepvqgGpP5+XA36+ilYkXTMPLj0c8xqbs5Vv3xldDmUt3SMca
 ISqxeZnjELmzQt1c2kRIgqC18EevRbmZ7KUpqCmUTauDlE8eNewjUE9m19j3KxVBHr2Msd6apKh
 e7SLStsvyoyXsodwnvkZSxhV8zHmnDF1nO63PsiC1LGe54UyuVpEaNLPpHibzBYfr8rA+y3WYZc
 sh7ah01pZxWqhkcVPT0gNXxw/qmK23S3XLmSALGiYtv1yihK7M9lpLnNWwIYFa6Wuo36FLt1jnn
 oi+0WApEy+FC6cv9xsofkNZqB2PoDhbiC2XV5M1iJknbpuggR5i4Zz/pDS/yRLF0OgBYrlC+oRQ
 PlOzdyyU+STDh4JsYs9FFdovbuJ9XfQ9lENjKzSv8wq+anNdJ+RWMqjpw9Q8GtsgM6m2bQA1RN+
 m89NyKVOm/0mebqd9uc9FZFDgrIzY80Yjf/yEwmnhkMvzCYVX9opp6GFuc14tAdmK9waz+ioWAS
 0mR0vQXDJYc2bHnV9hpWA3meATPYs9DZKvEL5WBm132DeMx/R5gSpNm0+7uxMGaVzwlDCFkhcot
 q31hXet6OCV8BJfL1BqcX5vJIo9MNMu8t12USNKnSwPklLAMIKVsXZe6yjvv0UvTMmTrGHh9J1b
 879wxj+/Q86VILw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b764f36d0da7c851dcc707bb5ff6e..79dfec517d38980e05ef0196138e6f312c84511d 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -534,15 +534,11 @@ static const struct rproc_ops adsp_ops = {
 static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
 {
 	int num_clks = 0;
-	int i, ret;
+	int i;
 
 	adsp->xo = devm_clk_get(adsp->dev, "xo");
-	if (IS_ERR(adsp->xo)) {
-		ret = PTR_ERR(adsp->xo);
-		if (ret != -EPROBE_DEFER)
-			dev_err(adsp->dev, "failed to get xo clock");
-		return ret;
-	}
+	if (IS_ERR(adsp->xo))
+		return dev_err_probe(adsp->dev, PTR_ERR(adsp->xo), "failed to get xo clock");
 
 	for (i = 0; clk_ids[i]; i++)
 		num_clks++;
@@ -708,10 +704,9 @@ static int adsp_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = qcom_rproc_pds_attach(adsp, desc->pd_names, desc->num_pds);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to attach proxy power domains\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to attach proxy power domains\n");
 
 	ret = adsp_init_reset(adsp);
 	if (ret)

-- 
2.43.0


