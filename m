Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB1F21962C5
	for <lists+linux-remoteproc@lfdr.de>; Sat, 28 Mar 2020 02:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgC1BFZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 21:05:25 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:29946 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726956AbgC1BFZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 21:05:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585357524; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Yu/yfc1pdlLgqM2OG91GrsSCmvKtPBtwpqL/H4qG6sU=; b=L6ZPnxgJX7qrWRXyLhCpw+mhxOeC1xCJ4U2V8EjwHu9nKm1htlNbzO07XXXYaCnlAuuJ20wL
 1Vkk6Ihvdt/4OEIAZnOROmEXeER3ylkJP5FzRc0r4Bquk6vAwZIpaJnaBjl7CB4AofLVH6kJ
 kbzTIiQPNioUTMNt7NdyVZrh1ng=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ea2cc.7f5e1caf7b90-smtp-out-n01;
 Sat, 28 Mar 2020 01:05:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1BA49C43637; Sat, 28 Mar 2020 01:05:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D20CC433F2;
        Sat, 28 Mar 2020 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D20CC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Cc:     bjorn.andersson@linaro.org, psodagud@codeaurora.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH] dt-bindings: remoteproc: Add interconnect property
Date:   Fri, 27 Mar 2020 18:04:56 -0700
Message-Id: <1585357496-6368-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allow proxy voting/unvoting of bus bandwidth for remote
processors. This property will specify the bus-master and
slave so that remoteproc platform driver can make the proxy
vote for bus bandwidth.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 9938918..529b0a0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -111,6 +111,17 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sm8150-slpi-pas:
 		    must be "lcx", "lmx", "load_state"
 
+- interconnect:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: Specifies the interconnect bus-master and bus-slave for
+		    bandwidth voting during proxy vote/unvote.
+
+- interconnect-names:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: The interconnect name depends on the compatible string
+
 - memory-region:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
