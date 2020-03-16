Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1811875CB
	for <lists+linux-remoteproc@lfdr.de>; Mon, 16 Mar 2020 23:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732837AbgCPWv3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 16 Mar 2020 18:51:29 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:33182 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732840AbgCPWv3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Mar 2020 18:51:29 -0400
Received: by mail-qt1-f181.google.com with SMTP id d22so15869721qtn.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2020 15:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wZC7KqQ/+MEL0RDvWDxQg83WbFpNiASJj0i4ST9YezU=;
        b=Kckx/+5TKFM6oNsXeSsWaGuvP98pQxJb9gmnW77ZG1854D8UFfynC0jAggJwtrhjIF
         9alhhG9kfxEQB+YNC40JYxo0vD/uSbjJPYBn3dWOpVSm7Fm7MHa2QxeWQqDgZoCbxq1v
         Mq1bg9Vqty9S+tTJnVkHE6ndbYTqoiGaKqmrmetM+FQyOYnjm612DFSChlCtm9z1f0dJ
         bioD/QXFU2jPo3+w520F4CsZnMwAxdi1BqcllQguHryhQeqlK9ZFkb4HF3/LnDnuccc1
         47xOdxBbA4eD8ITBbgNUuFQeuonc70oQp8VFos7CbwrwWNB4S4gh/+n1DIBM8tZ3tuRl
         VQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wZC7KqQ/+MEL0RDvWDxQg83WbFpNiASJj0i4ST9YezU=;
        b=h20/4zpSqTPviTGtzyNeDkgfOuxgerUWGp3BgcKYjlVACKTPDHx8Jk2YpLVQyIHnsi
         Yvi/NlcnhCCblAcayYbfjvGI9XrJr3q6wkQEQkkRrqRvtjmyW0UpyWten+fkncvoTH7x
         Zn6ulA1fHaEFlwSMbcH8NiXFz1c8JgfYQ1PEOgbwpWdxgucPX29qrqseUY64Uur6N6gV
         Lgyyuf5yIoOxkq/MJuSH97mdKWpguUmgRfxjjKw3eXvcrjCCP42OAz5mIprPk6OuhCFH
         hzf538E2R/d5H4fE4xvCpRfDHk4U38pnNctJNvCD4jWdQEk78PCJ8mPNNCkRWXhcXWmZ
         Q99w==
X-Gm-Message-State: ANhLgQ3jfazjzEm85nRAzhV0ur/dcogjr/Qfuhe8rBPWhKzzSry1CUS7
        LuJBlfBjw8CTIq/g91mDyPMHUQ==
X-Google-Smtp-Source: ADFU+vtS5ehGLxCEUNEx01AjWQCPaIOivLegew1i/z6iCJOeLXOM4UVmIMp8KMFPiE9hAtmvjmcsOw==
X-Received: by 2002:aed:37c3:: with SMTP id j61mr2627756qtb.284.1584399086746;
        Mon, 16 Mar 2020 15:51:26 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 31sm838735qta.56.2020.03.16.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 15:51:25 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     "David S . Miller" <davem@davemloft.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] remoteproc: clean up notification config
Date:   Mon, 16 Mar 2020 17:51:21 -0500
Message-Id: <20200316225121.29905-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Rearrange the config files for remoteproc and IPA to fix their
interdependencies.

First, have CONFIG_QCOM_Q6V5_MSS select QCOM_Q6V5_IPA_NOTIFY so the
notification code is built regardless of whether IPA needs it.

Next, represent QCOM_IPA as being dependent on QCOM_Q6V5_MSS rather
than setting its value to match QCOM_Q6V5_COMMON (which is selected
by QCOM_Q6V5_MSS).

Drop all dependencies from QCOM_Q6V5_IPA_NOTIFY.  The notification
code will be built whenever QCOM_Q6V5_MSS is set, and it has no other
dependencies.

Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: - Fix subject line
    - Incorporate a change I thought I had already squashed

Dave,
    I noticed some problems with the interaction between the IPA and
    remoteproc configs, and after some discussion with Bjorn we came
    up with this, which simplifies things a bit.  Both Kconfig files
    are in net-next now, so I'm sending this to you.

    Two other things:
    - I will *not* be implementing the COMPILE_TEST suggestion until
      after the next merge window.
    - I learned of another issue that arises when ARM64 is built
      with PAGE_SIZE > 4096.  I intend to fix that in the next day
      or so.

      					-Alex

 drivers/net/ipa/Kconfig    | 2 +-
 drivers/remoteproc/Kconfig | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
index b8cb7cadbf75..9f0d2a93379c 100644
--- a/drivers/net/ipa/Kconfig
+++ b/drivers/net/ipa/Kconfig
@@ -1,9 +1,9 @@
 config QCOM_IPA
 	tristate "Qualcomm IPA support"
 	depends on ARCH_QCOM && 64BIT && NET
+	depends on QCOM_Q6V5_MSS
 	select QCOM_QMI_HELPERS
 	select QCOM_MDT_LOADER
-	default QCOM_Q6V5_COMMON
 	help
 	  Choose Y or M here to include support for the Qualcomm
 	  IP Accelerator (IPA), a hardware block present in some
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 56084635dd63..ffdb5bc25d6d 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -128,6 +128,7 @@ config QCOM_Q6V5_MSS
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
+	select QCOM_Q6V5_IPA_NOTIFY
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
@@ -169,9 +170,6 @@ config QCOM_Q6V5_WCSS
 
 config QCOM_Q6V5_IPA_NOTIFY
 	tristate
-	depends on QCOM_IPA
-	depends on QCOM_Q6V5_MSS
-	default QCOM_IPA
 
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
-- 
2.20.1

