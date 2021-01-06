Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FC72EBC4B
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Jan 2021 11:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbhAFKYk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 6 Jan 2021 05:24:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:34110 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbhAFKYj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 05:24:39 -0500
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlrU="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx06ALk5DZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 6 Jan 2021 11:21:46 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-a5u: Fix iris compatible
Date:   Wed,  6 Jan 2021 11:21:34 +0100
Message-Id: <20210106102134.59801-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106102134.59801-1-stephan@gerhold.net>
References: <20210106102134.59801-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Unlike most MSM8916 boards, samsung-a5u uses WCN3660B instead of
WCN3620 to support the 5 GHz band additionally.

WCN3660B has similar requirements as WCN3620, but it needs the XO
clock to run at 48 MHz instead of 19.2 MHz. So far it was possible
to describe that configuration using the qcom,wcn3680 compatible.

However, as of commit 8490987bdb9a ("wcn36xx: Hook and identify RF_IRIS_WCN3680"),
the wcn36xx driver will now use the qcom,wcn3680 compatible
to enable functionality specific to WCN3680. In particular,
WCN3680 supports 802.11ac, which is not available in WCN3660B.

Use the new qcom,wcn3660b compatible to describe the chip properly.

Fixes: 0d7051999175 ("arm64: dts: msm8916-samsung-a5u: Override iris compatible")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index e39c04d977c2..dd35c3344358 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -38,7 +38,7 @@ touchscreen@48 {
 
 &pronto {
 	iris {
-		compatible = "qcom,wcn3680";
+		compatible = "qcom,wcn3660b";
 	};
 };
 
-- 
2.30.0

