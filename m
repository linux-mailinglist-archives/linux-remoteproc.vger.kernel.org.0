Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286CB190522
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Mar 2020 06:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgCXF3K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 24 Mar 2020 01:29:10 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35742 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgCXF3J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 01:29:09 -0400
Received: by mail-pj1-f65.google.com with SMTP id g9so920623pjp.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2020 22:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra3lKpyRwpXEMv7HLjwjk2xlSk4Do59iXflfneeNh40=;
        b=OVJfwC4b1PEr/2jykKzhhdZvbXbHUcn76l1jFofytmydV+hZD1SG74gGKktPsDAqSN
         zFKJ9gjIseLoywqXUMffqa6z41YelbniVwpLO4cn8k0/mGxSfs7+o5oFd6hvmdDBA392
         TgFhjkqejJ48IaOASEmZVcLA3uow/kBIBJQFR1sTibJHVU9HxbwaajHYFBRxYfkt7Lfc
         nhCBas2c5k3T//9GSC0RH3Dr+dlmRIu9zN8KVHOIwDLqy2qQQJMantm2Ab9ZGL/wN+9z
         m5wDS3bK9tYy8DXYGGxibpI3a8L9q46iPYyA83+bBvhoIk76AogOmzXTIYGzB8UYj+2N
         q1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra3lKpyRwpXEMv7HLjwjk2xlSk4Do59iXflfneeNh40=;
        b=NxriYmrtU/8Opl6gc4rmnxbwjisxG+5h1hy8uLR2YtoNHH9WSnS1p3UOOC/t2D+PJM
         SMx8KoyO1Owy2/K5CXTynjtnuhjsvv4pWNhRBq2FWyzce+K2Mi3+kgRVnxunhWA7/qDe
         Gpc0IrdkoonoCgy8e0cmK0xrgFSMCA6lsl7KAWAYur+Qv7fnH5FOpTJpndIGKDtMP1aR
         ffptCBWG4QzlszLs5KeofjiH9OfDWuVS1xYJN3NQKYXmLGGDQx17pCaW8JHzDSk1eqN+
         eQ2PTnSO3DzFwHXv8XvQ6hYNjz6mL1IXDiL8yhUjDGc46lKTrUh1WCGwjWLHMtH3swIt
         MHBA==
X-Gm-Message-State: ANhLgQ07hM7RbRzo2CsL4ZoRd4d/3enCpyBPNeeRdcVXYL1O6sL9TcM9
        04VLVYgmT7M6y8/k3E1w8oixzw==
X-Google-Smtp-Source: ADFU+vtODNbfRHAyBz68wwxhAstaZapwyPZvFzxoO8Q8NW3QROIugYa6Kgu2ZXMASrFt7wQDdwTfxA==
X-Received: by 2002:a17:90a:bd01:: with SMTP id y1mr3362201pjr.129.1585027748925;
        Mon, 23 Mar 2020 22:29:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j14sm2795413pgk.74.2020.03.23.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 22:29:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] remoteproc: Panic handling
Date:   Mon, 23 Mar 2020 22:29:00 -0700
Message-Id: <20200324052904.738594-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for invoking a panic handler in remoteproc drivers, to allow them
to invoke e.g. cache flushing on the remote processors in response to a kernel
panic - to aid in post mortem debugging of system issues.

Bjorn Andersson (4):
  remoteproc: Traverse rproc_list under RCU read lock
  remoteproc: Introduce "panic" callback in ops
  remoteproc: qcom: q6v5: Add common panic handler
  remoteproc: qcom: Introduce panic handler for PAS and ADSP

 drivers/remoteproc/qcom_q6v5.c       | 20 ++++++++++
 drivers/remoteproc/qcom_q6v5.h       |  1 +
 drivers/remoteproc/qcom_q6v5_adsp.c  |  8 ++++
 drivers/remoteproc/qcom_q6v5_pas.c   |  8 ++++
 drivers/remoteproc/remoteproc_core.c | 57 +++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  3 ++
 6 files changed, 92 insertions(+), 5 deletions(-)

-- 
2.24.0

