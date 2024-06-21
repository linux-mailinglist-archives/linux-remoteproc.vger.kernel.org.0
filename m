Return-Path: <linux-remoteproc+bounces-1678-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF3912FF1
	for <lists+linux-remoteproc@lfdr.de>; Sat, 22 Jun 2024 00:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92C2D1F25C7D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Jun 2024 22:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B5A17C231;
	Fri, 21 Jun 2024 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u6vy/bHx"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7E16E86A
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jun 2024 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719007425; cv=none; b=HBqL3ybvaXAF/xsNX408vtSBTL+2ypOUALWCSgba0F5/wVNeu7CAMkpWVN3rJ0S/oYmTy6HiFcImQMG9spiDx7mi7sPysUTuLskG58bh4TylX98n2ImFx2qYxS5hHfWLdVAMPVy02Uv3o9qluEwfspsS1YKmQp2UUu0NfST10ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719007425; c=relaxed/simple;
	bh=QiGfCb7xAJwCdsqRNS078eo9ogrHc57anqlf5IYcXTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y9jKle2U1oMzsSreITm2lqqtdyt2kNjqi7+kDIZFIWYFB/DM/VvfpgtvuUeLK/XY1COvjGO9ezZqi3Lm2vZeNoVuO+qm+I/8xAtHcWcEyJcemBRPFyInhESGUXWmZXfnjwbNwncIzNiphSih8IokOslQ/ScjQtylsQw5ISup4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u6vy/bHx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso1077598e87.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jun 2024 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719007422; x=1719612222; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NwX0vsMgO34p3B7o5GXlBpOvsC9uQdArGmCO9pjGW0=;
        b=u6vy/bHx8DtgbFrczv1+GmvgaCrMHQfyg/OyQYIct5h/TWfHmYHlv2LHDu8MSFMKik
         FKdEcTpFDpDXXxeth3qSns/P04IqJ7kRByYVB50/T3rUXq/zc6R1mf5SWG4096QqkdA9
         npz7n2qSkfgSxEulXxOYWjXxCblyAZ93QBAI9LsnlxKVfXz5nmeRCjYJWHjuTBfmSdpX
         eJK/23SIlWskQQzGsFBRjXSNiWJYWIIv/mdW9Lbs4b8tdfoVZRfvZP5ZAq66EBTBpm9r
         L98lhlCJj29XBoAj/IyK14qRlIPH5xDGMtt/3xMqTMTNEeuIx/V2Dz/or+3DMN9LvduM
         X/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007422; x=1719612222;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NwX0vsMgO34p3B7o5GXlBpOvsC9uQdArGmCO9pjGW0=;
        b=IdBi3VeLVBKYZvVgZJE2uRlOivOm4v4IfZFpez+KYfOsQ10KuMIU4x/4A9uGvJzZm5
         gM7ApeACVIX5AlalH8Qydr3Rzh39t+X0ZthwZgIviO07dIU3Bbcov1wD7Y/6YLx+JuMc
         MBgztO4NaggXh3Ah9QxTjFwgBnGMjQQ1OgNu+u8x5CYUVhsgMrtgCRK/qqxfAyMzm+M6
         4g2CG7OyNdXjx2PuN0od0uPqWWNT+qPeWxBcgfCgkIJ7WLQRYHWQaMObFU2Yur18b0Zi
         bJvS7v9AaFar8uU6/cZA926ot5A4ejHCAK1ikkL7pVq9rSoKa0TwLLpxrG+ayiZ50msa
         lQNg==
X-Forwarded-Encrypted: i=1; AJvYcCXt/KScJ+WUlbkm8ubuDfoK7XFgXXwqPWp6/hoWT+Eqv9Oy4ScjkpNkqxaH1sqj86F+HhDsbDGNRO4flqVys58GTXB+fjadUDJGyeTlhQvNNw==
X-Gm-Message-State: AOJu0YwqoZU0zd8AccCvsriB0egA7GkO3Vv9jmOhOGlb9ew6MsnnkaA9
	CNvq+xwbmylRsMInnfmoZWPPwWtVhX7fVmsVicTAu2hsgKa4s7egl06wIbCi2u8=
X-Google-Smtp-Source: AGHT+IF7g61IN9RY8saGZf0+Ui3KxU4FQiRqmWG2LntGRy/RytsWyuFscHusj9cYvIw2TGcxveJUxQ==
X-Received: by 2002:a05:6512:1087:b0:52c:80f6:d384 with SMTP id 2adb3069b0e04-52ccaa5868cmr8124118e87.3.1719007421466;
        Fri, 21 Jun 2024 15:03:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6431fcdsm318293e87.210.2024.06.21.15.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:03:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v9 0/5] soc: qcom: add in-kernel pd-mapper implementation
Date: Sat, 22 Jun 2024 01:03:39 +0300
Message-Id: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALv4dWYC/3XQy2rDMBAF0F8JXldhNBq9sup/lC5kPWLRJnblY
 BpC/r1yoMRFdHlB585obt0cS45zd9jduhKXPOfxXIN92XV+cOdjZDnU3CEggQDOvvx4YlNgJzd
 NsbDIMSjEQC5AV9FUYsrfj8K395pTqc8vQ4nut0ZwRAUgiPReAJFQknEWTvlSrvveles8fIzL6
 2c+uzLux3Jca4c8X8Zyfay54Fr+70YLMmAycHRgeLCBb6vWlRax9dR4Ub0y0iTHnefeNJ42nrf
 zqXokpa33TnqkxsunJ24bL6uPQvYqGdLR2sarjUdsvKo+WWWlDsARdOP11rf/19WDTDp5RSpCa
 rx5esnb+Wa9f/R9j1ol7+GPv9/vP8d+/BJ0AgAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chris Lew <quic_clew@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4803;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QiGfCb7xAJwCdsqRNS078eo9ogrHc57anqlf5IYcXTs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdfi7v6q9y6IT5vBAD2/Hj0UT8tEyHofz+3EDr
 Pd9K7BCE3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnX4uwAKCRCLPIo+Aiko
 1TkWB/98xsZZXsgIlBG/F3Gxly2Y1aXnU0Zy33Plv0vDt5WqqMKzDt2TZf3XguUFYSy5GvvrwBj
 XgkQXd4xEPv3kTKugmu/NvKDmGITnJX5x1BUMVJidyou0br5ojFtlNAdQ4gjYyCgpFbJlcZWC+F
 oNSG3m85Td9Gogb+aEkFo9JMVVVeKiFNq9F4aQjfobqkddpC62fidWYH+1e74gJoGgqCdyuPoKq
 V7048oJjz3R5+IRLtOuVk6j1PmFG4jdgbkeqyVG0YXOrLexG8vDG6afRFLgjcYHbmqThmgYSsKG
 rT3Xfkqzp2qM6RaKyHQ/vodw9ekqwOX0MsuZ71FIcQTXadj2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

---
Changes in v9:
- Adjust locking in pdr_get_domain_list(), releasing the mutex right
  after qmi_send_request() (Chris Lew)
- Link to v8: https://lore.kernel.org/r/20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org

Changes in v8:
- Reworked pd-mapper to register as an rproc_subdev / auxdev
- Dropped Tested-by from Steev and Alexey from the last patch since the
  implementation was changed significantly.
- Add sensors, cdsp and mpss_root domains to 660 config (Alexey
  Minnekhanov)
- Added platform entry for sm4250 (used for qrb4210 / RB2)
- Added locking to the pdr_get_domain_list() (Chris Lew)
- Remove the call to qmi_del_server() and corresponding API (Chris Lew)
- In qmi_handle_init() changed 1024 to a defined constant (Chris Lew)
- Link to v7: https://lore.kernel.org/r/20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org

Changes in v7:
- Fixed modular build (Steev)
- Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org

Changes in v6:
- Reworked mutex to fix lockdep issue on deregistration
- Fixed dependencies between PD-mapper and remoteproc to fix modular
  builds (Krzysztof)
- Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
- Fixed kerneldocs (Krzysztof)
- Removed extra pr_debug messages (Krzysztof)
- Fixed wcss build (Krzysztof)
- Added platforms which do not require protection domain mapping to
  silence the notice on those platforms
- Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org

Changes in v5:
- pdr: drop lock in pdr_register_listener, list_lock is already held (Chris Lew)
- pd_mapper: reworked to provide static configuration per platform
  (Bjorn)
- Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org

Changes in v4:
- Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
- Added configuration for sm6350 (Thanks to Luca)
- Removed RFC tag (Konrad)
- Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org

Changes in RFC v3:
- Send start / stop notifications when PD-mapper domain list is changed
- Reworked the way PD-mapper treats protection domains, register all of
  them in a single batch
- Added SC7180 domains configuration based on TCL Book 14 GO
- Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org

Changes in RFC v2:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org

---
Dmitry Baryshkov (5):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: enable in-kernel PD mapper

 drivers/remoteproc/qcom_common.c    |  87 +++++
 drivers/remoteproc/qcom_common.h    |  10 +
 drivers/remoteproc/qcom_q6v5_adsp.c |   3 +
 drivers/remoteproc/qcom_q6v5_mss.c  |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c  |   3 +
 drivers/remoteproc/qcom_q6v5_wcss.c |   3 +
 drivers/soc/qcom/Kconfig            |  15 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   8 +-
 drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
 drivers/soc/qcom/qcom_pd_mapper.c   | 676 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
 12 files changed, 1183 insertions(+), 298 deletions(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


