Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B799B1CD3
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Sep 2019 14:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387584AbfIMMCt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 13 Sep 2019 08:02:49 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:15352 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387553AbfIMMCt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Sep 2019 08:02:49 -0400
X-Greylist: delayed 369 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Sep 2019 08:02:48 EDT
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Sep 2019 17:26:38 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Sep 2019 17:26:14 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 22A703731; Fri, 13 Sep 2019 17:26:12 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V2 08/12] dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
Date:   Fri, 13 Sep 2019 17:26:07 +0530
Message-Id: <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add mailbox support required in IPQ8074 SoCs.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 1232fc9..389c6ce 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -13,6 +13,7 @@ platforms.
 		    "qcom,msm8998-apcs-hmss-global"
 		    "qcom,qcs404-apcs-apps-global"
 		    "qcom,sdm845-apss-shared"
+		    "qcom,ipq8074-apcs-apps-global"
 
 - reg:
 	Usage: required
-- 
1.9.1

