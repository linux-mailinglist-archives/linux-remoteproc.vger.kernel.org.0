Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83482EBC4C
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Jan 2021 11:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbhAFKYk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 6 Jan 2021 05:24:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:12236 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAFKYk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 05:24:40 -0500
X-Greylist: delayed 165293 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Jan 2021 05:24:38 EST
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlrU="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx06ALj5DX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 6 Jan 2021 11:21:45 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: Add qcom,wcn3660b compatible
Date:   Wed,  6 Jan 2021 11:21:32 +0100
Message-Id: <20210106102134.59801-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106102134.59801-1-stephan@gerhold.net>
References: <20210106102134.59801-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

WCN3660B is a variant of WCN3660, but with the same regulator
requirements as WCN3620/WCN3680. Add a new qcom,wcn3660b compatible
to describe it from device trees.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index cc0b7fc1c29b..da09c0d79ac0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -80,6 +80,7 @@ and its resource dependencies. It is described by the following properties:
 	Definition: must be one of:
 		    "qcom,wcn3620",
 		    "qcom,wcn3660",
+		    "qcom,wcn3660b",
 		    "qcom,wcn3680"
 
 - clocks:
-- 
2.30.0

