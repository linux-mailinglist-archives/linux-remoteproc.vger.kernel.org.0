Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF7D33FCA8
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Mar 2021 02:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCRBZB (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 Mar 2021 21:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCRBYg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 21:24:36 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0329C06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 18:24:35 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id p10so8927344qtq.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=re8CFH6xVx7G0rqwkXOZ6zKjwdjnXFBfLwv/BCyY/sU=;
        b=MVQAwNtEJ3VfQl2Ahy3+EYqM87+IwHkdbpVS6q/OySBJjv4Xs8TZuAmqVbocOKx5bf
         R4NqbEKqZhVQMoaGw3oB/yRViFz/mT5p0TLwP/wY77Q39lRMhGkvQf4gC6/4QW6GyWbU
         NkuNCOcRYk5hLWRMEqXVfvil3n2r6mykHz/t+OAY5zI35fg/ux5F1OZK08U/Xx0bUgZK
         IKlAmYZCC47MWrLqaMOvRMicgRcMdgtYSZW3zlOyQYRt0RrMAbN3q5xtLqBK+Kw7QVkn
         2N4kkH3Rr3Qp1H6TK6qAaAihSjrbL7BUQUfTDomuoJHceKC+2ALrSRKbAqn0MMAjYUSb
         yEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=re8CFH6xVx7G0rqwkXOZ6zKjwdjnXFBfLwv/BCyY/sU=;
        b=F2WYgVYxSsPqH5Z5WiECuO5ftZDW0YWX1kUb3vUtX4l39tZFccbz++FhN7lr5WhuBO
         Ls2koq23xBnLFcrmn4Oum17MuMMEmnTHGuphLCmPgWHqw5hrBvVpiBERjD3rFEsKnVq8
         AjZOM6tyZGwiW+ofq3Mo8I7RwxUN4YeqSowhRTdTIj2yXIgeDwihS+ynPMdBsILcVbOJ
         9h0Cw+6JjL+fZbOzq6E16IBkJ/pQSfMHBiL26VFnBLGLiumaVudKwi6qwYa3kxPBcvwJ
         dXCB4lgqQoEAWztBLTVIsZtm9yaE3kpXjJeKU9IvwmyR0+C7SduOHTSuuOYostSRtRG+
         F8Qg==
X-Gm-Message-State: AOAM530UfLeCrUZoaH31jsmCXbk6QulkX+bug4xJ6lnxkNqtfaeCOznT
        VWgsbbNMqiX1lDccB58y+3zL+zd1sDWt
X-Google-Smtp-Source: ABdhPJw+W8qroQ2T+CWFqK7FHAfCwwKrjdsAV9apnPM7oh0e1ffKyi2hS60dRCMTVrmsNNH5gJaoOaieslRu
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:f96a:1dc6:88d5:6b7c])
 (user=tzungbi job=sendgmr) by 2002:ad4:44b4:: with SMTP id
 n20mr2106926qvt.19.1616030675081; Wed, 17 Mar 2021 18:24:35 -0700 (PDT)
Date:   Thu, 18 Mar 2021 09:24:16 +0800
Message-Id: <20210318012416.2816574-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, tzungbi@google.com,
        Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DEVAPC (device access permission control) is a MPU (memory protection
unit) in MT8192.

To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
domain 3.  ATF (Arm trusted firmware) should setup memory range for the
domain.

Co-developed-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1:
- Add "Co-developed-by" tag.

 drivers/remoteproc/mtk_common.h | 2 ++
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 61901f5efa05..2aa9fdf5e59b 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -51,6 +51,8 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8192_SCP_DEVAPC_DOMAIN	0x85080
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..50bdec5a97e3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* set to DEVAPC (device access permission control) domain 3 */
+	writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
+
 	return 0;
 }
 
-- 
2.31.0.rc2.261.g7f71774620-goog

