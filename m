Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376F812B15E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Dec 2019 06:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfL0FdB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Dec 2019 00:33:01 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43571 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfL0Fc6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Dec 2019 00:32:58 -0500
Received: by mail-pl1-f194.google.com with SMTP id p27so11299978pli.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Dec 2019 21:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CACSvkGQXTdbudbrDCr3GVf27K5HI0XInZ9uwni3MXE=;
        b=ylrRXdCYJxPFdRcRwT43YU9htEJXb3RZq6jzea19OthZoBfBd4m9/gGbj4femDTUv9
         KuHvQ1v0+LGkzmPlgXvWU7wHnTpPl0y44bxs+RtiWMm9fZ1ZzxaCPIC+3ueLS5NsksXo
         lExY7XfeYQ1d4pHEXWPRCzBhgaFLJ0FYq/24nd33ipvfzcmOmxessAFWP8ki5PzrQi+z
         wvJ8T//luOhE3WHswVoW8CxcF3xrwCvJRWWm5/6FwIdkW4qzkPTNIZm/IOoAu0ll8/4F
         CNZprkIcdhzbDBj0VccAJpBfZc/0WSl0tCd5Jnp9ljcIrqoX7W0Ujo+pL3dADh5IOv0M
         gfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CACSvkGQXTdbudbrDCr3GVf27K5HI0XInZ9uwni3MXE=;
        b=OPq3pxP5z9aXXMDMLryckFbz2ZERdfKoqSPZ25Bpi/iuG9j2EMXkDlSl1eas/MQkWA
         ezMHq0a9hfTifSzzZAJvS0f79HSBPcw3/qSV61TGl9LPAHCfCEvqYqAnsrbTARbWRDvX
         PXjswvUDNUfIacHZZGIJvenkGRfJ8J0E+5uCvjtPiQhTREx59oLVawGV1yVbfCVXXhIn
         b/N7y960k9lb2VE2ME9r4wUS8ZtOfY9LWHtEEGpsVsOs7oyAHvB6PiubAqVFi1G53BpO
         0c2F56eQFB1+wjZyszVac6MKcv/LL3oppTuN5L+MS+6oID6zx49WapsczRnEDduJWamM
         iLnQ==
X-Gm-Message-State: APjAAAWImxHMNQBBl3opuDuid4PwP068RC+FACjDGntyDPpJZJP5xq6c
        N8lsEAkUN9BqZxfYGtVvldw88w==
X-Google-Smtp-Source: APXvYqwDC4IXipZ7ZUqmtRfUXBo5/Wl/A9WtrtL7RUaMcfUiAMm6gLsuotO/cQTVmLuhTHt1j7S+SQ==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr23852528pjn.64.1577424777538;
        Thu, 26 Dec 2019 21:32:57 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c22sm16789196pfo.50.2019.12.26.21.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 21:32:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Thu, 26 Dec 2019 21:32:12 -0800
Message-Id: <20191227053215.423811-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227053215.423811-1-bjorn.andersson@linaro.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 407d26e92fcc..e1e13d5bfeb3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3020,6 +3020,16 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			pil-reloc {
+				compatible ="qcom,pil-reloc-info";
+				offset = <0x94c>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.24.0

