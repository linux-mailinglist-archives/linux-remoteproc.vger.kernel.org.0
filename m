Return-Path: <linux-remoteproc+bounces-100-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94080E688
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Dec 2023 09:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF55F1C213E6
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Dec 2023 08:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A96199D1;
	Tue, 12 Dec 2023 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMPOOqW7"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A59D2
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Dec 2023 00:45:25 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54cb4fa667bso7659819a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Dec 2023 00:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702370724; x=1702975524; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppbHQCYSLppdUFWWFW0lWAd6TucauVUU4s32x2RiPZ0=;
        b=oMPOOqW7ueV8Vvvu6PcGcwo/lVfPQB8GB7q4rjFuF8Y0DZaHb5o87z0HVoGRuWs4Yt
         iIHxTmxIoQKFhtRZ/dqxdFZE9BspCUUoCxyDfuchKUzXScDdJDrT68VLciB5aUflSiPi
         yWZ9QZqYDS5XUOSFJQ0Ov9/GRIRBvV8jjmudSvwDU9zP/iYxeeduiNtbIYajtYHw7AKk
         uzNiUTI5pGDcgSPEWV+8eRa2UoUYw6ckPa9Eq9bw/rHqpkyfHjvUaj0FJ8Aqx6QUaSHW
         Fs8jaHceq+zQfAuZVtzsEjwW9ZhXzl53RrAaMfj55u4X++7litI6hGc+QmnAxhXpgusi
         tl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370724; x=1702975524;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppbHQCYSLppdUFWWFW0lWAd6TucauVUU4s32x2RiPZ0=;
        b=FSCN3xgPkRKYCMPurR95USLQHucOqKDQqiMOlMGien/QwX2PNj90Vt/Q7XN2WNP7zF
         FJKss2Qk0YIljCuk0Va5ul3MQFslBoOqMOQYYXMQDfc89Oi6+1TlkUGHzi6HuhKUBG+l
         XCG8xiDqySzFrBFmFWjPvW2rMJdn0hLmHnvau0BIAFK9XzMc+1PgLy0YY6pojqxuVpx1
         +PYnAgLGzD1VffPHIdLiBzS9eGC1GHMSxPwOXEXqO4CvZR7WeQxe2yEQZGZJhX+LMb5Q
         f9fylv7UlZL5uC7VaqBmCX9pXVrdfB590VDMwgBWNin4+8NqQsVV1clxWggZXp/RULdn
         /LSg==
X-Gm-Message-State: AOJu0YyYGDnLB5AOy7S+Dx2gYPebQuobI1+bDwmMcImVWhYdpiw3Z+Gw
	Vc1nk1RrL1DTj2KJHTo7LgOzJw==
X-Google-Smtp-Source: AGHT+IG461CE58DfQwEvLrH77MxkX0z0TE6W4JC9lMkEpoJudRh2B5fAl6/htiSe24WyJoA/xUQYXA==
X-Received: by 2002:a50:9b1b:0:b0:551:5646:ade8 with SMTP id o27-20020a509b1b000000b005515646ade8mr663044edi.34.1702370723657;
        Tue, 12 Dec 2023 00:45:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c27-20020a50d65b000000b0054c9bbd07e7sm4650471edj.54.2023.12.12.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:45:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/3] remoteproc: qcom: Introduce DSP support for SM8650
Date: Tue, 12 Dec 2023 09:45:16 +0100
Message-Id: <20231212-topic-sm8650-upstream-remoteproc-v5-0-e749a1a48268@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwdeGUC/43QTWrDMBAF4KsErasy+rWcVe8RupDlcSKoLTNyR
 Urw3SuHQlqyqJdvFt/jzY1lpIiZHQ83RlhijmmqwbwcWLj46Yw89jUzCVIJEJYvaY6B59FZA/x
 zzguhHznhmBacKQVurXcNYmcHRFaZmXCI13vF6b3mS8xLoq97YxHb9QeX5n+8CA7cu14C6oDCh
 bePOHlKr4nObNOL/CUq2CHKKlpoEU0jEbx8EtVDFLDjAUVVse96HXznsdPNk6gfogS3Q9Tb6tY
 GhWaAVqg/4rqu3yaeVXfHAQAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Iwq0UgF1Yfv2WGtfwDWdmFW885Pn0Zt75TkNM8ie22Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleB2gJrAs43nJqREqAHg1quOoAM11tEKc/BpKQWLA
 UuKNAt2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgdoAAKCRB33NvayMhJ0baOEA
 C27sssh9IXoAtR1jXjfupwN1RCi9y8Y4ylNBJ7kFAm2h+yZDNEnEQfQ8Qa3dSx8A6zcyY540U4nJXN
 e32uSvmE8H1tF5v2UddXzu4ShNIQNpdHdR3FQaM7+N1zOeB7Qe4pAIl497SFfYMuYjA9EnMaOufMqe
 8dGiaGXAdQ2QZR2HYU9B9AWBU8ul2NoDGP6yBEHR8ISNFwaYk9Z8DnE3X5tV/u0E81LlWHzu+Y1iMy
 nmcy9MD3BwokhIRuBCZtoAovGRC1fUFCW6hvWToXA8W7PKvXj0rGAWsqr920DpPzLogf60FqiBswub
 rMM5Lk784pVXDVC1Vr8z8DAAnFH7jogYxSCB5owQfJIgXCstLcEJLYrO4WpWaIoIyyDHmIf0P8Qgzg
 xJouPL7OGltD/6SQcQBfKCO+Ab+1flPAQQ7zqfCGNKfki2JZKJ+toyRFaN7ZL952HEgHzCv7l+2Klb
 zjQ+MVU9Y6gwVqIYGQRBZcfcUs3AsLn3mHuaZbpFmr1oeNSzJrdXvZgtIhQrPWKMZoHwDX2u6aN660
 2CTT0wQlkTWQRCcySiAbM4Rc5tC4vUtBjePNsNnyUWpKihtX/Qk7n+R9iUuMVgT5ewnN9Sabj6mquc
 aiu0JxZER79G0Df/6UWF5NDo27yaUK2pt9IUHLMdPytizNWPsYH5y/zdNzDQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings and driver changes for DSP support on the
SM8650 platform in order to enable the aDSP, cDSP and MPSS
subsystems to boot.

Compared to SM8550, where SM8650 uses the same dual firmware files,
(dtb file and main firmware) the memory zones requirement has changed:
- cDSP: now requires 2 memory zones to be configured as shared
  between the cDSP and the HLOS subsystem
- MPSS: In addition to the memory zone required for the SM8550
  MPSS, another one is required to be configured for MPSS
  usage only.

In order to handle this and avoid code duplication, the region_assign_*
code patch has been made more generic and is able handle multiple
DSP-only memory zones (for MPSS) or DSP-HLOS shared memory zones (cDSP)
in the same region_assign functions.

Dependencies: None

For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Rename _perms to _owners per Konrad suggestion
- Link to v4: https://lore.kernel.org/r/20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org

Changes in v4:
- Collected review from Mukesh Ojha
- Fixed adsp_unassign_memory_region() as suggested by Mukesh Ojha
- Link to v3: https://lore.kernel.org/r/20231106-topic-sm8650-upstream-remoteproc-v3-0-dbd4cabaeb47@linaro.org

Changes in v3:
- Collected bindings review tags
- Small fixes suggested by Mukesh Ojha
- Link to v2: https://lore.kernel.org/r/20231030-topic-sm8650-upstream-remoteproc-v2-0-609ee572e0a2@linaro.org

Changes in v2:
- Fixed sm8650 entries in allOf:if:then to match Krzysztof's comments
- Collected reviewed-by on patch 3
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org

---
Neil Armstrong (3):
      dt-bindings: remoteproc: qcom,sm8550-pas: document the SM8650 PAS
      remoteproc: qcom: pas: make region assign more generic
      remoteproc: qcom: pas: Add SM8650 remoteproc support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  44 +++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 150 ++++++++++++++++-----
 2 files changed, 159 insertions(+), 35 deletions(-)
---
base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
change-id: 20231016-topic-sm8650-upstream-remoteproc-66a87eeb6fee

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


