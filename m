Return-Path: <linux-remoteproc+bounces-77-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546080A6B8
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Dec 2023 16:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0979D281C12
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Dec 2023 15:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1E1225DE;
	Fri,  8 Dec 2023 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tA1xbQo6"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177C41BD8
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Dec 2023 07:08:50 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1f5cb80a91so183628666b.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Dec 2023 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048128; x=1702652928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADyyGGnuyYVsE20DUsH/ImAyYyUEsvd/x7yinUyvXfA=;
        b=tA1xbQo6EvGz+aode6ogAKiBk5vrS005u47YwLVcXhOxRTvx5NsrZ4wgXy7kTlaWvk
         4n/eYRnuqNAUdc8dBwZsHtITWPkNxJNZcM/hYErNZ7Mrk+b+GvGH8l/dt3DxP4Z+AQno
         MFSWlPeEMN7vVMQasS/xsGs4I4GP3ADRAqIMCPzgQdv0hBiFvtPeuXtUMasbXTQXviMh
         o3PPjBpNp9s3icfnDCRqiTQcgcCegoqzh+wE4G8dkuR9UBaREoXrUhNyret8i8uYIU7g
         o2PxAjwoggGszUySz+d9hacmcdxxoOzpMiCNVGV+XfzUxWw1nYuIkMMXXvR8pdarVcrf
         TYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048128; x=1702652928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADyyGGnuyYVsE20DUsH/ImAyYyUEsvd/x7yinUyvXfA=;
        b=YdOXXJms4+xM9LkR5x/CVuHXEsOofkQYBSklq1iP+Ka5DRaJpQUApH3heOlzYF8R0d
         hr4w4iiX9mdvSQ2rBo9xMu6pFxK/CAhryPf+EM7Ql3UBTamawdmS3AVNrOyjmMhVc4kR
         wIIRSXqKWRDgD954V1eZODDt1o6CfJ4j7AUxkMZ5fvDh7zJQpuskC/U6FYP+w2T0bslB
         982Y7utMZdRX5L96T78x/ytAMPa1Y9vd0zWU/kxQ7MVD4LgiPLYmu75F4qgR6KT+LGv3
         fqv1ryFdAGUixtFE793Dy5fjk4rUEJfipVSRedE5COt+2WkJ0KHet+B2YSsQznw9leLJ
         eNwA==
X-Gm-Message-State: AOJu0YwBl9MdwJMeCfKCFkHEagIE1mOMiBOPNgOWgAi90J7rIWvpVaPg
	Y1Lk45jCw+DTiTMVnjIhxp5wz05RE2ksZLr+k+552A==
X-Google-Smtp-Source: AGHT+IGsSCIr4ijXHWnZzYoOk2/a9DsQsa5DZSvHFnPOefRXTzuE3I7g/8SvqT/wIlriLsyjx/sEeg==
X-Received: by 2002:a17:906:371b:b0:a1d:767:f068 with SMTP id d27-20020a170906371b00b00a1d0767f068mr48853ejc.31.1702048127721;
        Fri, 08 Dec 2023 07:08:47 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:08:47 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:07:57 +0100
Subject: [PATCH v3 01/11] dt-bindings: remoteproc: qcom: sc7180-pas: Fix
 SC7280 MPSS PD-names
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-1-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

The power domains for MPSS on SC7280 are actually named CX and MSS, and
not CX and MX. Adjust the name which also aligns the bindings with the
dts and fixes validation.

Fixes: 8bb92d6fd0b3 ("dt-bindings: remoteproc: qcom,sc7180-pas: split into separate file")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index f10f329677d8..6f0bd6fa5d26 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -114,11 +114,11 @@ allOf:
         power-domains:
           items:
             - description: CX power domain
-            - description: MX power domain
+            - description: MSS power domain
         power-domain-names:
           items:
             - const: cx
-            - const: mx
+            - const: mss
 
 unevaluatedProperties: false
 

-- 
2.43.0


