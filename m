Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A57C1962BC
	for <lists+linux-remoteproc@lfdr.de>; Sat, 28 Mar 2020 01:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgC1A7T (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 20:59:19 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21930 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726212AbgC1A7T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 20:59:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585357158; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ucG8qxJO8nRYPBhl/MNaG6lqgYMEuVpubS292bl3V6k=; b=kmZylB++eWU6g7DgQKYHqU5ppbxBKz0mWcmdR/eex/Rn9vzTO+4giCtgBwjWFhbQ4x/RA0C4
 Ls1mENOm2YMM1Rs//wDCDsNdbPaVBAahiRVw1CUIhB57rleIenCSLMX397iP2DijVXOvUxfH
 dxRhypj1cKDkPV+d0ya8VfGHtGk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ea163.7f4e0c5056f8-smtp-out-n05;
 Sat, 28 Mar 2020 00:59:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 71069C433BA; Sat, 28 Mar 2020 00:59:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 744CFC433D2;
        Sat, 28 Mar 2020 00:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 744CFC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 1/2] remoteproc: qcom: Add bus scaling capability during bootup
Date:   Fri, 27 Mar 2020 17:59:07 -0700
Message-Id: <1585357147-4616-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

During bootup since remote processors cannot request for
additional bus bandwidth from the interconect framework,
platform driver should provide the proxy resources. This
is useful for scenarios where the Q6 tries to access the DDR
memory in the initial stages of bootup. For e.g. during
bootup or after recovery modem Q6 tries to zero out the bss
section in the DDR. Since this is a big chunk of memory if
don't bump up the bandwidth we might encounter timeout issues.
This patch makes a proxy vote for maximizing the bus bandwidth
during bootup and removes it once processor is up.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 43 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index edf9d0e..8f5db8d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -20,6 +20,7 @@
 #include <linux/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
+#include <linux/interconnect.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
@@ -28,6 +29,9 @@
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
 
+#define PIL_TZ_AVG_BW  0
+#define PIL_TZ_PEAK_BW UINT_MAX
+
 struct adsp_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -62,6 +66,7 @@ struct qcom_adsp {
 	int proxy_pd_count;
 
 	int pas_id;
+	struct icc_path *bus_client;
 	int crash_reason_smem;
 	bool has_aggre2_clk;
 
@@ -124,6 +129,25 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 
 }
 
+static int do_bus_scaling(struct qcom_adsp *adsp, bool enable)
+{
+	int rc;
+	u32 avg_bw = enable ? PIL_TZ_AVG_BW : 0;
+	u32 peak_bw = enable ? PIL_TZ_PEAK_BW : 0;
+
+	if (adsp->bus_client) {
+		rc = icc_set_bw(adsp->bus_client, avg_bw, peak_bw);
+		if (rc) {
+			dev_err(adsp->dev, "bandwidth request failed(rc:%d)\n",
+				rc);
+			return rc;
+		}
+	} else
+		dev_info(adsp->dev, "Bus scaling not setup for %s\n",
+			adsp->rproc->name);
+	return 0;
+}
+
 static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -131,9 +155,13 @@ static int adsp_start(struct rproc *rproc)
 
 	qcom_q6v5_prepare(&adsp->q6v5);
 
+	ret = do_bus_scaling(adsp, true);
+	if (ret)
+		goto disable_irqs;
+
 	ret = adsp_pds_enable(adsp, adsp->active_pds, adsp->active_pd_count);
 	if (ret < 0)
-		goto disable_irqs;
+		goto unscale_bus;
 
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
@@ -183,6 +211,8 @@ static int adsp_start(struct rproc *rproc)
 	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 disable_active_pds:
 	adsp_pds_disable(adsp, adsp->active_pds, adsp->active_pd_count);
+unscale_bus:
+	do_bus_scaling(adsp, false);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
@@ -198,6 +228,7 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 	clk_disable_unprepare(adsp->aggre2_clk);
 	clk_disable_unprepare(adsp->xo);
 	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	do_bus_scaling(adsp, false);
 }
 
 static int adsp_stop(struct rproc *rproc)
@@ -280,6 +311,14 @@ static int adsp_init_regulator(struct qcom_adsp *adsp)
 	return PTR_ERR_OR_ZERO(adsp->px_supply);
 }
 
+static void adsp_init_bus_scaling(struct qcom_adsp *adsp)
+{
+	adsp->bus_client = of_icc_get(adsp->dev, NULL);
+	if (!adsp->bus_client)
+		dev_warn(adsp->dev, "%s: unable to get bus client \n",
+			__func__);
+}
+
 static int adsp_pds_attach(struct device *dev, struct device **devs,
 			   char **pd_names)
 {
@@ -410,6 +449,8 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	adsp_init_bus_scaling(adsp);
+
 	ret = adsp_pds_attach(&pdev->dev, adsp->active_pds,
 			      desc->active_pd_names);
 	if (ret < 0)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
