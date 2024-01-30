Return-Path: <linux-remoteproc+bounces-354-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918084251A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 30 Jan 2024 13:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6BA1F271D4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 30 Jan 2024 12:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CBD6BB59;
	Tue, 30 Jan 2024 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dz9uGhwL"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8E96A348
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618405; cv=none; b=qOUdTlTT7Ed7emspn2a0APCQifJOMIEYxEpMOJ+ctElCK37lvBQT+CHqzX2t1YwAeQZZNyrsiS62qQbJ2fS0cCCSFAlwB5gnOfZBRBklGOShIOdSZJ96mFTlzzPjPO7bqiZJ5ln3ybE1U3Vb6+LDi5Wbj7yi9GPU0jjW9PEU0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618405; c=relaxed/simple;
	bh=o3yRXujB2ZcDVaB5sQ/vI6zeliCwrOSpjcLdCuR+/9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pc/iYRTfggN9fFtEWaSzX9jBx6/hTxL+4URgg0O0tZhIsPl6mNT9rt3TOzd9RhqAmycqsSK/6jkZNGbuca7dYDZWRVEgl17xrtf8w96O3cb/wJtnPXggQrruuovHcpTWYWRE9wDiCZhIgD1DFCiCdX1q/WSBlk3vUHQbjtwgfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dz9uGhwL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5102b00c2cdso3325037e87.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706618401; x=1707223201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbVDzf0RQ8CWZb11lTphXt2uiDQVbFMo9sNICA+Shc8=;
        b=Dz9uGhwLGTULuinQfJNHexcxlwhxSri6VRSVsz4Uu7mkTK63niySxbvQ1ghPwuLoZR
         p7zGtRNjFYJ97U6LnSBdEHmlI7VZmwuc8u4C/CoLeUXcaNohW4stJak1QnNUXV65iCtz
         9nxMfRnO2OtQJAMa0GDFtO8hdPNbFHJpYeVeRHi9nIvUifRkI7tyLbHRgctG2eWzN05z
         Votu9AhFSfwZG0XciaQnZWd4fkDEil29XO2Bj6vb7wvozESLp5ZbmbcdPOAygfkUc63H
         qwOMJmq3jc6p9yJnMok4rrzMqTRQimyCfv6y/z7eSVyDXcTp3K3bZBLCLV5R10boaKEj
         UWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618401; x=1707223201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbVDzf0RQ8CWZb11lTphXt2uiDQVbFMo9sNICA+Shc8=;
        b=D5b8H9lj8rie0aXjd1xkBMPpRUXnzT1IJ4wMenA9Eb2LMSWZC+h69naNN8pakd/IqK
         PVfJCHcTpvVp+zUWdeCQdb2LJfZXAXPB071Sc4rbAryF88zI4uDTkLuPzyptvJ0H75PL
         IJ6TIAUWicQGExL79mnMK4cnvQQ/VU8nFgAPxcnDvuHPtQonrRsZrnSqV2Ji2Izr/xZ1
         mDsyXbqm98YZn1wqw/pJb26PA95PbxMhyTVUIED0rNRZ6zW1VTpPCFF1DyLtqHsJmJyv
         L05tZNWH5vHUTsE96+xwC6H45HuX2wBSzVoxcJeuRZyM54vuIwJr5itWLXbqj4cSQH2j
         baIA==
X-Gm-Message-State: AOJu0YziQYs5IZv41QJX0WCOBmzDl4qqI7/VyETaUVut+sfI6y8Xx+uQ
	YKxDvWtxiAs+SC9xhbSbOtpwcKJ29DLtmsh0FepUYaVSGaQoTa4azY8PKR6PwPs=
X-Google-Smtp-Source: AGHT+IFdP7vLlAvIRR4VgbZuuYG7S0kg7DlAx+K1o7hFOILkPKnF0MFzVznI27TWxp83yLfHrwOJ2w==
X-Received: by 2002:ac2:5d2f:0:b0:511:1eb5:2284 with SMTP id i15-20020ac25d2f000000b005111eb52284mr810799lfb.0.1706618401156;
        Tue, 30 Jan 2024 04:40:01 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id p10-20020a19f00a000000b005111b28f7c2sm200661lfc.36.2024.01.30.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:40:00 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ben Horgan <Ben.Horgan@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-media@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v3 3/5] remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
Date: Tue, 30 Jan 2024 13:39:49 +0100
Message-Id: <20240130123951.236243-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130123951.236243-1-ulf.hansson@linaro.org>
References: <20240130123951.236243-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's avoid the boilerplate code to manage the multiple PM domain case, by
converting into using dev_pm_domain_attach|detach_list().

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: <linux-remoteproc@vger.kernel.org>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Added reviewed-by and tested-by tags.

Changes in v2:
	- None.

---
 drivers/remoteproc/imx_rproc.c | 73 +++++-----------------------------
 1 file changed, 9 insertions(+), 64 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8bb293b9f327..3161f14442bc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -92,7 +92,6 @@ struct imx_rproc_mem {
 
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
 static void imx_rproc_free_mbox(struct rproc *rproc);
-static int imx_rproc_detach_pd(struct rproc *rproc);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -113,10 +112,8 @@ struct imx_rproc {
 	u32				rproc_pt;	/* partition id */
 	u32				rsrc_id;	/* resource id */
 	u32				entry;		/* cpu start address */
-	int                             num_pd;
 	u32				core_index;
-	struct device                   **pd_dev;
-	struct device_link              **pd_dev_link;
+	struct dev_pm_domain_list	*pd_list;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -853,7 +850,7 @@ static void imx_rproc_put_scu(struct rproc *rproc)
 		return;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
-		imx_rproc_detach_pd(rproc);
+		dev_pm_domain_detach_list(priv->pd_list);
 		return;
 	}
 
@@ -880,72 +877,20 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
 static int imx_rproc_attach_pd(struct imx_rproc *priv)
 {
 	struct device *dev = priv->dev;
-	int ret, i;
-
-	/*
-	 * If there is only one power-domain entry, the platform driver framework
-	 * will handle it, no need handle it in this driver.
-	 */
-	priv->num_pd = of_count_phandle_with_args(dev->of_node, "power-domains",
-						  "#power-domain-cells");
-	if (priv->num_pd <= 1)
-		return 0;
-
-	priv->pd_dev = devm_kmalloc_array(dev, priv->num_pd, sizeof(*priv->pd_dev), GFP_KERNEL);
-	if (!priv->pd_dev)
-		return -ENOMEM;
-
-	priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_pd, sizeof(*priv->pd_dev_link),
-					       GFP_KERNEL);
-
-	if (!priv->pd_dev_link)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->num_pd; i++) {
-		priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
-		if (IS_ERR(priv->pd_dev[i])) {
-			ret = PTR_ERR(priv->pd_dev[i]);
-			goto detach_pd;
-		}
-
-		priv->pd_dev_link[i] = device_link_add(dev, priv->pd_dev[i], DL_FLAG_STATELESS |
-						       DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
-		if (!priv->pd_dev_link[i]) {
-			dev_pm_domain_detach(priv->pd_dev[i], false);
-			ret = -EINVAL;
-			goto detach_pd;
-		}
-	}
-
-	return 0;
-
-detach_pd:
-	while (--i >= 0) {
-		device_link_del(priv->pd_dev_link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return ret;
-}
-
-static int imx_rproc_detach_pd(struct rproc *rproc)
-{
-	struct imx_rproc *priv = rproc->priv;
-	int i;
+	int ret;
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+	};
 
 	/*
 	 * If there is only one power-domain entry, the platform driver framework
 	 * will handle it, no need handle it in this driver.
 	 */
-	if (priv->num_pd <= 1)
+	if (dev->pm_domain)
 		return 0;
 
-	for (i = 0; i < priv->num_pd; i++) {
-		device_link_del(priv->pd_dev_link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return 0;
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+	return ret < 0 ? ret : 0;
 }
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
-- 
2.34.1


