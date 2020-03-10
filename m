Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA8517F08A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 07:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgCJGfL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 02:35:11 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37792 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgCJGfL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 02:35:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id f16so2899066plj.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2020 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nP9PNS9eIJgQJAIRsXlp8n4P+pGeRNDem1/JAJ9CZoo=;
        b=yJby5aKYmht78gbCPLKW/yR9kFDyyMOl0hhOcLl9Yv1XCDJgxKqDFQ/VY/Cm4+78Du
         +IXhtz6sRqDL+pbulDPLtlduJdTc0rLACLbmB2Ldp9LZJkHsAZAWrnhtozeQAnDVoSBI
         styPVyZA5xIQFeRnye0NpOM8eKb1OABAEcMq1qLc3FxW4gDXggoW3CCdKelcxrovDwfy
         JckNwcerrnx3xqbuTV35u5gOMdGzCLXP41n/GdmEWZ4gEReWLNM6aV4BcDHwPs0/9OcX
         xgVyrlM+ScKNfn4uMWnrGj7zEPMfT8CFJnM1bzLHDW9mTBewjXgc9m2s52hNUBAtMyVW
         6/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nP9PNS9eIJgQJAIRsXlp8n4P+pGeRNDem1/JAJ9CZoo=;
        b=CRn5ubZVMT8kGEh3JYwiDdqVeMVNlTCcFLfgPHQ1clW1Xu6pgU/lhlkLxBF7vU8EL5
         NZad4Ty+TpM7HgXkb9Z21Hr3bVOPiYfTN6YA94PFPRHcXAahZp/gR+zqLBOZm0I8/05t
         CFNXPk5D9cwbrO7L9l9FZLeTP0GXpN0lyKoaM4SXmdyMJp8p6Hr6OMNBVnmGhCygWQHb
         OxbUqMN9FX1sGU1YZlBL+Ux23kECtjH4pss/tVJkO1c+g5QNb7pAhLZXcCroWFEixs6w
         JNBRLzRpRr80DNHckXtXu1tBW5zyiq5K5V4eU45MNvI35gqhoLdDEriaAmdHzED6moly
         juRw==
X-Gm-Message-State: ANhLgQ38o/MllILJvUbWiaE7K72soPiyBWefRhYsgw4XW/CLXccBFZfy
        /jBYRayn8kxLdZTylBzUfdXOkQ==
X-Google-Smtp-Source: ADFU+vvNU8SVNQz3C9Imsfqn/W1TG5Peq/nh++Xv6kdj+KouUr/6rTO+KMeCdRN12xY5J1qFbutcuw==
X-Received: by 2002:a17:90b:438d:: with SMTP id in13mr202775pjb.114.1583822110408;
        Mon, 09 Mar 2020 23:35:10 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 0/5] remoteproc: qcom: PIL info support
Date:   Mon,  9 Mar 2020 23:33:33 -0700
Message-Id: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce support for filling out the relocation information in IMEM, to aid
post mortem debug tools to locate the various remoteprocs.

Bjorn Andersson (5):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce driver to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 ++
 drivers/remoteproc/Kconfig                    |   6 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 180 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   8 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  20 +-
 drivers/remoteproc/qcom_q6v5_mss.c            |   7 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  19 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  18 +-
 12 files changed, 335 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.24.0

