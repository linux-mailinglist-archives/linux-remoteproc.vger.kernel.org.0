Return-Path: <linux-remoteproc+bounces-353-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE5842515
	for <lists+linux-remoteproc@lfdr.de>; Tue, 30 Jan 2024 13:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 612A71C24500
	for <lists+linux-remoteproc@lfdr.de>; Tue, 30 Jan 2024 12:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF0A6A35F;
	Tue, 30 Jan 2024 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4mkefZy"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066B6A032
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618403; cv=none; b=c0jLKlahfGh4hEyBZHuO/Zqv0Z4WN7Yztj7QE+PVggDQlhQ8QsS5rK4DuKhkRuNBjAVVF/251myNwo2sl9PB8s5lasPPrMlTlffAweLKSxNbAQsNDUhjmrtaNW/+jYF6d8ItnJiXuczzqt0/jzq+nRyM/pAabBIp5pvI2EGnJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618403; c=relaxed/simple;
	bh=BFGebA22Zl6KAO1sN62su1KgbqyI+ai5NQ8qVfi/A1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xo/xIm3ebr0mdfR9i7CKDEvqx3uzxBRz71LnMS58mX8Z4/tIBNOxhLuZ7rTPJYgDtLw29h8GhopgueRKgymeFTf1dgmKlg+XHghhv4AIMn1ZFHsoFgRwUaUGQQy7dVa3cEjuAPB5h6Cy2i+cif+GICcJey1aEyTAEYpryEe4/S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4mkefZy; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso6675700e87.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706618400; x=1707223200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojvRls/CWhyJwL4FHVfNMWSRHzs2rXl5HVAGDfoW6nM=;
        b=b4mkefZy/wYZvj24Ln8nyKb26Ue/E7zKxtrqlx60+wxXXzfqwCuclWR8j8W4XHbZ0Q
         ZXkw9dftcJiADz/SM59eTYmCdwegmvuoNjXWcVZ2ieTVVLHSGPgrYMTISWZ45EUTtNWK
         PYwQzZP9WJSt9Wh8K3807xN1x1JvJX9G3ndEfCSmljJi2JjD6Wul8JWLzqriwVHcuFRW
         DYnvdSQe7Hp4qpx4tZuvZJbh+9ExupHJSVMWO8lZ1sxBWzvItyJuTAFDaNFrpM2+HwHo
         zQyd1I7utUQWmikiKt/5uXt8Jp09j79SRDM0M/63VlhU2Eu2PQu2fnA0lyu6BFNb/JjW
         NhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618400; x=1707223200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojvRls/CWhyJwL4FHVfNMWSRHzs2rXl5HVAGDfoW6nM=;
        b=Nxb2PCLnjRnLzb8ZCFb/+H1mFUAmy8yyrwhMmb90DUcWkx7INeDWMLfJnpb0GLuc0L
         RCRCwuGHasVgXI9/FsJ5HI4eiPxn3DWKGGqmYD5OT2qrazNd3Rj3MrK+QWWe/qmMG0gy
         8UTnt1YSSMoepr0SeZHFijJsjqeSBkhYuXmLxToBNfc2JIu0QIOYxc7L7dfxg2g81JeC
         uJa3mJWxkk8JLzLgeYh3t4hktEzl2e4r3Zs1gwm+e7BdZ2bdA7PoQjJVYA160uL8axjd
         UtqrLXImh1AyzTB0W59vMYlpyaSUCCbpf5FRcAUb1bAuqQ6I2sqD6SWM1tGDSc8Hg2EE
         xpOg==
X-Gm-Message-State: AOJu0YzPUqAAS4RdkMShzyOYX49+HcYKXYT9Bvo1RWxoP7J3FA0ypmuK
	d1BhQwrolFJazIM/hlDIWA8kuxC2xgMJS0vthh62H4RUAcnxlyxfHoM0P4UuAD0=
X-Google-Smtp-Source: AGHT+IHH+o5l9Q/KNftmckjjUBa4Y8b+Gd+GqrxsDzrNG7OhEJZ9M9NcmzEHvh32+taKe6rgdrPpiw==
X-Received: by 2002:a05:6512:2256:b0:50e:aac2:b883 with SMTP id i22-20020a056512225600b0050eaac2b883mr7035952lfu.4.1706618399945;
        Tue, 30 Jan 2024 04:39:59 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id p10-20020a19f00a000000b005111b28f7c2sm200661lfc.36.2024.01.30.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:39:59 -0800 (PST)
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
Subject: [PATCH v3 2/5] remoteproc: imx_dsp_rproc: Convert to dev_pm_domain_attach|detach_list()
Date: Tue, 30 Jan 2024 13:39:48 +0100
Message-Id: <20240130123951.236243-3-ulf.hansson@linaro.org>
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
 drivers/remoteproc/imx_dsp_rproc.c | 82 ++++--------------------------
 1 file changed, 9 insertions(+), 73 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index a1c62d15f16c..d73727a5828a 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -103,12 +103,10 @@ enum imx_dsp_rp_mbox_messages {
  * @tx_ch: mailbox tx channel handle
  * @rx_ch: mailbox rx channel handle
  * @rxdb_ch: mailbox rx doorbell channel handle
- * @pd_dev: power domain device
- * @pd_dev_link: power domain device link
+ * @pd_list: power domain list
  * @ipc_handle: System Control Unit ipc handle
  * @rproc_work: work for processing virtio interrupts
  * @pm_comp: completion primitive to sync for suspend response
- * @num_domains: power domain number
  * @flags: control flags
  */
 struct imx_dsp_rproc {
@@ -121,12 +119,10 @@ struct imx_dsp_rproc {
 	struct mbox_chan			*tx_ch;
 	struct mbox_chan			*rx_ch;
 	struct mbox_chan			*rxdb_ch;
-	struct device				**pd_dev;
-	struct device_link			**pd_dev_link;
+	struct dev_pm_domain_list		*pd_list;
 	struct imx_sc_ipc			*ipc_handle;
 	struct work_struct			rproc_work;
 	struct completion			pm_comp;
-	int					num_domains;
 	u32					flags;
 };
 
@@ -955,74 +951,14 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 {
 	struct device *dev = priv->rproc->dev.parent;
-	int ret, i;
-
-	priv->num_domains = of_count_phandle_with_args(dev->of_node,
-						       "power-domains",
-						       "#power-domain-cells");
-
-	/* If only one domain, then no need to link the device */
-	if (priv->num_domains <= 1)
-		return 0;
-
-	priv->pd_dev = devm_kmalloc_array(dev, priv->num_domains,
-					  sizeof(*priv->pd_dev),
-					  GFP_KERNEL);
-	if (!priv->pd_dev)
-		return -ENOMEM;
-
-	priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_domains,
-					       sizeof(*priv->pd_dev_link),
-					       GFP_KERNEL);
-	if (!priv->pd_dev_link)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->num_domains; i++) {
-		priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
-		if (IS_ERR(priv->pd_dev[i])) {
-			ret = PTR_ERR(priv->pd_dev[i]);
-			goto detach_pm;
-		}
-
-		/*
-		 * device_link_add will check priv->pd_dev[i], if it is
-		 * NULL, then will break.
-		 */
-		priv->pd_dev_link[i] = device_link_add(dev,
-						       priv->pd_dev[i],
-						       DL_FLAG_STATELESS |
-						       DL_FLAG_PM_RUNTIME);
-		if (!priv->pd_dev_link[i]) {
-			dev_pm_domain_detach(priv->pd_dev[i], false);
-			ret = -EINVAL;
-			goto detach_pm;
-		}
-	}
-
-	return 0;
-
-detach_pm:
-	while (--i >= 0) {
-		device_link_del(priv->pd_dev_link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return ret;
-}
-
-static int imx_dsp_detach_pm_domains(struct imx_dsp_rproc *priv)
-{
-	int i;
+	int ret;
 
-	if (priv->num_domains <= 1)
+	/* A single PM domain is already attached. */
+	if (dev->pm_domain)
 		return 0;
 
-	for (i = 0; i < priv->num_domains; i++) {
-		device_link_del(priv->pd_dev_link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return 0;
+	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
+	return ret < 0 ? ret : 0;
 }
 
 /**
@@ -1154,7 +1090,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 err_detach_domains:
-	imx_dsp_detach_pm_domains(priv);
+	dev_pm_domain_detach_list(priv->pd_list);
 err_put_rproc:
 	rproc_free(rproc);
 
@@ -1168,7 +1104,7 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	rproc_del(rproc);
-	imx_dsp_detach_pm_domains(priv);
+	dev_pm_domain_detach_list(priv->pd_list);
 	rproc_free(rproc);
 }
 
-- 
2.34.1


