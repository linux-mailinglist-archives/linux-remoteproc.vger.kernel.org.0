Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C6C1B5156
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Apr 2020 02:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDWAiI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Apr 2020 20:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgDWAiH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 20:38:07 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6788BC03C1AA
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 17:38:07 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 7so3013577pjo.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 17:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75TUGWxKMG+i7tFa2VqXTsbczTpvn8gAWE0prn7/ZWo=;
        b=Bt1mUO+l/1mVfkOUUYZ/vPLooOPPe2yy40kGK8VcjvtAzsSqTHrRzK2SrxdZfESL25
         xIhyrTUVQOpkLdo2Cy3uiDoEjf3Jbz7eT1wgoK9POxngD3LR5FziEYCRZYgW6NJY6GGw
         5Ud1iXBI0aLIgsvXnrO9Y8T07eEsOCqRd2cY1a3kpqOc34nnZoNmeVqri1MpehT38tTX
         mKNE+EGdlZ3oySSoIghIScraOGmz/RuK4j20yUW7xf3Ip2aDehUuteE3XSC4Z0HMKw/L
         IAasCCd0aLdN18dqDWj0SyEPxg+qjZvTRVmlS3aDZvHSjsTdPpuJqqGZxuROsUD9Fcjx
         wvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75TUGWxKMG+i7tFa2VqXTsbczTpvn8gAWE0prn7/ZWo=;
        b=aCVCcPx8txO6LE5YBfH/V2pYb0Pos7bL2CulmTZzlVNn1Hv6UfijjVejZUzhxDFjw2
         Xt2NxEoe/2kDPA/4i3xzfiuFt62d2HMi0DVyBAArjuj9nza7fHMNuSNM6mJ5djmnoHef
         09QTk0UxR3vwFDgiEdZaPlRAaACOf7plwFHAD5n3ocOWOfBcaaVG67t59SaHeYoK8/YB
         K1/gUhIj4KjCZdxsmaEJ2R1XKC/Sw7RF7CO9RE1VLxyKQB7v9td7W3QUMuLlaUXD1Pl9
         zLZWsw74c19R96N44uOvTcQFTAroGvZmSq20tMF5PJ0k3u8+ivNoqkm2ILvCesJUQxo7
         pqlA==
X-Gm-Message-State: AGi0PuaK58nnnduRlhuTRv1RXHbw3eMsqBFizFIwYsgRUHpDaSeaOQV0
        GmBqj07iqTsKe30TRYFJgMFiPg==
X-Google-Smtp-Source: APiQypKajNV82QXE5K2iKfsEJ0r4+uN55Qcwur5XRKTlxsgeo77a7Pr94QQHDYOrM+bNQLwFdLPljQ==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr1435976plr.0.1587602286693;
        Wed, 22 Apr 2020 17:38:06 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm432225pgz.0.2020.04.22.17.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:38:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 0/4] rpmsg: Refactor Qualcomm glink_ssr
Date:   Wed, 22 Apr 2020 17:37:32 -0700
Message-Id: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In order to allow for wider use of the SSR notifier in remoteproc's qcom_common
this series internalizes the notifier chain used by glink_ssr. To simplify the
Kconfig dependencies it also moves the glink_ssr implementation to rpmsg and
merges it with qcom_glink_native, as these do go hand in hand.

Bjorn Andersson (4):
  remoteproc: qcom: Pass ssr_name to glink subdevice
  soc: qcom: glink_ssr: Internalize ssr_notifiers
  rpmsg: glink: Integrate glink_ssr in qcom_glink
  arm64: defconfig: Remove QCOM_GLINK_SSR

 arch/arm64/configs/defconfig                  |  1 -
 drivers/remoteproc/qcom_common.c              | 17 ++++++++++-
 drivers/remoteproc/qcom_common.h              |  5 +++-
 drivers/remoteproc/qcom_q6v5_adsp.c           |  2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |  2 +-
 drivers/rpmsg/Kconfig                         |  6 ++--
 drivers/rpmsg/Makefile                        |  3 +-
 .../glink_ssr.c => rpmsg/qcom_glink_ssr.c}    | 28 +++++++++++++------
 drivers/soc/qcom/Kconfig                      |  9 ------
 drivers/soc/qcom/Makefile                     |  1 -
 include/linux/rpmsg/qcom_glink.h              |  3 +-
 12 files changed, 49 insertions(+), 30 deletions(-)
 rename drivers/{soc/qcom/glink_ssr.c => rpmsg/qcom_glink_ssr.c} (83%)

-- 
2.24.0

