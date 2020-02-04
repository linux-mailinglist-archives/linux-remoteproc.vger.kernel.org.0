Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F0D1515F7
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Feb 2020 07:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgBDG0s (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Feb 2020 01:26:48 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39765 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgBDG0r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Feb 2020 01:26:47 -0500
Received: by mail-pf1-f195.google.com with SMTP id 84so8912919pfy.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Feb 2020 22:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAbfKGPHFp5dpRo9OZT4gAhZKpnQ/tm30dsERIZmLtY=;
        b=DV7FYFA2zBtXcTFpKCZDOUo3/HxELPWgA+S/mT54nl7QsTiXhHGgURm3VYtveFUo11
         ugOwDhpr0mzpA1VVN8VABVuM/l0cY6+AooZ5Lwof2mdePv9dA1Gn+d3CG0TkRtAwegeE
         SrH8WppssxK7l8z6QIjBzaCrQ8uYxARt0YE3DNjW02z6Ix2panbgKJwAixdOPD3FTRtA
         Q7fJ5OwZgkMrwfROygPTiEVCs/uyeQPRoxnLgw++QTw0HfmsIVCiJuzfjsEyP468HHNP
         ZGo5Feeuzh/YqEoWfIWGwVvjp8bblLsJnI/Z/D/lOCRb3yeu1+rJ0QLIPclkbScg7FQY
         wJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAbfKGPHFp5dpRo9OZT4gAhZKpnQ/tm30dsERIZmLtY=;
        b=oLv8cJpom6bV6fbLGD+VEY2DfOCTh6gQRrIfhzQTF4OHpEFQC+pwarSkQ+Bv39/p6x
         59F+syJBU2bUBsuUGOxW6FIuDZKPxHcKgYzvCJQ022f/2JCSXAW2yL/n7BjFk3A72A0y
         7hRVMhNrPBgh/mHLopXeBHKPMXwVITfDf+xYSyNMne71uiu1TJadNbEe3g9ZT3Bbo+XG
         DATdXlpq8UKnXkAnmfjKLHuY50UfZUXM8lN9Qh612DXba1ai8Wf/BJ+wnlFN7SBF6tLJ
         VXCF2PqOg2FwphqUgCKv9Yr+riyYGqAPjjfSNNR5as5+OlvXzYNdJDgsFZEYVkDOQ//w
         1xYg==
X-Gm-Message-State: APjAAAWQw80aLyIviqACT3Im0olkaNy5zLea+yemVSv2yANgrXNfHaw0
        xafqfPqvGv2HADL/Wb1x1UHgXZ3EmEQ=
X-Google-Smtp-Source: APXvYqznRtyL0JVHhck6+gFYGWEaG3OcRjT8/aSbV6eXxQXW03/6Bi4PbIcny8W7vDKPM4kYe+O+fQ==
X-Received: by 2002:a62:4ecc:: with SMTP id c195mr29519240pfb.158.1580797605299;
        Mon, 03 Feb 2020 22:26:45 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l69sm6901897pgd.1.2020.02.03.22.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 22:26:44 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 0/2] remoteproc: mss: Improve mem_assign and firmware load
Date:   Mon,  3 Feb 2020 22:26:39 -0800
Message-Id: <20200204062641.393949-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Two things came up in the effort of figuring out why the modem crashed the
entire system when being restarted; the first one solves the actual problem, in
that it's not possible to reclaim the main modem firmware region unless the
modem subsystem is running - causing the crash.

The second patch aligns the firmware loading process to that of the downstream
driver, which seems to be a requirement in 8974 as well.

Bjorn Andersson (2):
  remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
  remoteproc: qcom_q6v5_mss: Validate each segment during loading

 drivers/remoteproc/qcom_q6v5_mss.c | 95 +++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 33 deletions(-)

-- 
2.23.0

