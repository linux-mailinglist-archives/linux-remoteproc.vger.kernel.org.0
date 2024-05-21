Return-Path: <linux-remoteproc+bounces-1335-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDC8CAAFF
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 May 2024 11:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ABBD1C21A4D
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 May 2024 09:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0BC6EB41;
	Tue, 21 May 2024 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xvx6a4lH"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789F66A8D2
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716284730; cv=none; b=lWMBCA1C2phz/rsFCday9i0AC6WPxfwWj9HaOmOxTBOBvCKSC75gJqqwwGg8PXooPBLVqqO+RwFqY6xVojBsCqMkSqKLXd7aW8AHjxaF/VlvDNk2CKRwT4gGxM7q2FRrB3vc40xw/sgrhoCvP1gIIfYix1ORhl7ME31zcUSGKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716284730; c=relaxed/simple;
	bh=93C6VdWrKA3F4L2pbTvmlVsMwuAb+l57jMfHeI9flc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NW85ARshEZLoqzQ9xVDDBzOKLlKWHMBBCCHADyUA8cUBQVvlHG5f7090+JTtqFpBBiyJnaSz7MmHxzzDlwf7PzmWlLgaYzFK/UgCAkjArM3/NOEbu67tsessTqxRuE/Kl9o0B62fn4t0BBDscvyA2CF4DENK4G1K0z2MS4J0tA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xvx6a4lH; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e52181c228so49328951fa.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716284726; x=1716889526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A25lOkPAYIem0QXdhyIts7q0LCcqMUXPkolw5JT6tE8=;
        b=Xvx6a4lH314okQqJ9pylwxi4TIrQKSzwBTkck4zwg4T41DQWbw9IDxwzmA75eoVE2E
         5RmiAF4uhOnxx2/OpQcDNenWfx8cwBNxwZTLMTRunMlvnK16MlQzaJsq/g2jSgiIbKul
         ylRbCznYVyTwou2m6XCce7y+o/MauvIUr6vlRb6XleH5rJvhf7vAbc8AYRu5BV2jqp64
         SsSw2rBm5XqukLia+jqMG3NLaV3inaKhxslpFInB/mhsKSFs9S5iabrJ2/SxGlfQ4ENW
         DfEzyzpftRYCynI96Ce/O/2JygDHA7aRl/P631s/h7X49NMLra0OAW5makMYpUu+NJsN
         XjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284726; x=1716889526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A25lOkPAYIem0QXdhyIts7q0LCcqMUXPkolw5JT6tE8=;
        b=HmgZ30cuj9BkVJh/2iMMEWOPIhmu8GvPmrHOyFMMogndwbw9vcqvMFR4rh729nQckg
         T1OVOg8R4JU21D/dxu+95NXJnQ/nJ5l3axVd/5s85u1xLFQs4O2zAZZ2YIb8QPp4cUNX
         s7rczDjNtFazof6U7X9V/GlDU5zcXwmfuhKJCffg91Y5Dle++uHa1H/jKfDmo2ZGe+dB
         3EKxmmOBhBNYEkhDFySXYPioOl+DG+hRHXn+wYt3BdXI/rQTuvpFDyrci8481CJkrzhH
         DFwh1GqGrMVHuIl/f06ONLJT1S+Ck8lxIRT5aneFfLBWklYhqipkp8pCNKEGsRz2Y3JL
         5Dzg==
X-Forwarded-Encrypted: i=1; AJvYcCV4jZcjhTpywh6vIvkrV6FIyH8QyWA2Zt9kC8Bsb0fS5QztG7dQhAIgEiGGNK/zC3Ate/rAR4QM7KepW0gvjVmDrvQa/h3YG5661cy7TPsLTQ==
X-Gm-Message-State: AOJu0YwrZH8YM8obV2VJrqCMBZ2EQY4E2Rr/fOgT01SOh4hNMOcfiVN5
	R/7mhNHnjV/S8MFugkADVP5RqgVa7iceryfOcO7Cwe1HIBL9WBS0EaarHqqayk8=
X-Google-Smtp-Source: AGHT+IEAWe28pTg85AhhLUeeo7JJ7lfVb04BZMvFFnep7DU1veqKcLN+AogT8YrMcOrIFXgcishk6Q==
X-Received: by 2002:a2e:9053:0:b0:2e7:bc7:b6ea with SMTP id 38308e7fff4ca-2e70bc7b72fmr75487961fa.14.1716284726753;
        Tue, 21 May 2024 02:45:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e706ee0a65sm13906261fa.112.2024.05.21.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:45:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 12:45:22 +0300
Subject: [PATCH 02/12] wifi: wcn36xx: make use of QCOM_FW_HELPER
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-qcom-firmware-name-v1-2-99a6d32b1e5e@linaro.org>
References: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
In-Reply-To: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Loic Poulain <loic.poulain@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=93C6VdWrKA3F4L2pbTvmlVsMwuAb+l57jMfHeI9flc8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5pPrhGrlNQyruXtrrrFAV5mO7lzjzx0qWr/6p8ZZcok6
 9XmGN3JaMzCwMjFICumyOJT0DI1ZlNy2IcdU+thBrEygUxh4OIUgIkkX2b/w3lVbFHDvhj1dTx5
 zJ9idwhd+1Gr82OL/L5D4j5l77dIbV+ktCJm2Xx91oh63TtRWqrV1pV3kitkelPOGvdudGI1fP5
 mR6/o3Aie5c9Kt3XPl8j6b7NDzlbveJsmb+5kX+X/vo7XLIR1d12X+e9Q3L9tsoTMlAuqnya+N2
 1uiK8+Hsaq0prWs4E/drVY9hTRnamP9gV/npM+W2bHBYVFl3O6E6Yd6zqx0Smq+9a+D9+Fjfc//
 rhqzrzm559yZu/esGfzwj3iOsusG2WtDRSFGR6r68v8jfhW5HPWNquGhVlQycyZwWv//Uu+Rha3
 TPJEthr4K2r21UfUvO7tMjqmdKX7h/V2vSOWq9V5mp0B
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make the driver use qcom_fw_helper to autodetect the path to the
calibration data file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/Kconfig | 1 +
 drivers/net/wireless/ath/wcn36xx/main.c  | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/Kconfig b/drivers/net/wireless/ath/wcn36xx/Kconfig
index 5832c7ef9352..90239c89676a 100644
--- a/drivers/net/wireless/ath/wcn36xx/Kconfig
+++ b/drivers/net/wireless/ath/wcn36xx/Kconfig
@@ -4,6 +4,7 @@ config WCN36XX
 	depends on MAC80211 && HAS_DMA
 	depends on QCOM_WCNSS_CTRL || QCOM_WCNSS_CTRL=n
 	depends on RPMSG || RPMSG=n
+	select QCOM_FW_HELPER
 	help
 	  This module adds support for wireless adapters based on
 	  Qualcomm Atheros WCN3660 and WCN3680 mobile chipsets.
diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index e760d8002e09..8d25db81c1d0 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -22,6 +22,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/rpmsg.h>
+#include <linux/soc/qcom/fw_helper.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/soc/qcom/wcnss_ctrl.h>
 #include <net/ipv6.h>
@@ -1609,6 +1610,10 @@ static int wcn36xx_probe(struct platform_device *pdev)
 		goto out_wq;
 	}
 
+	wcn->nv_file = devm_qcom_get_board_fw(wcn->dev, wcn->nv_file);
+	if (!wcn->nv_file)
+		return -ENOMEM;
+
 	wcn->smd_channel = qcom_wcnss_open_channel(wcnss, "WLAN_CTRL", wcn36xx_smd_rsp_process, hw);
 	if (IS_ERR(wcn->smd_channel)) {
 		wcn36xx_err("failed to open WLAN_CTRL channel\n");

-- 
2.39.2


