Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E0525A5F7
	for <lists+linux-remoteproc@lfdr.de>; Wed,  2 Sep 2020 09:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIBHDe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Sep 2020 03:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIBHDd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 03:03:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB30CC061244
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2020 00:03:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so2078201pgl.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2020 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9d3dVKVv3rwmde4FZcFLfrQ3EuricDCMm/xx55xE2gw=;
        b=PpDkPIlbI3pmSeX+Nukr4RIybsQe9cOsOhnwhF5LDJyHWHPXGd+rcWdCE7PnqnNlF5
         W07tcwhKJuHPNdwfHafL5RLfRd/QgdzVfY/Wnj+zfAQQH0kjp3vo5rPIku2m+jV6+M13
         B91XQmD+dEe4ydLr4NHu/OcRPp3UdjNHJ4nJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9d3dVKVv3rwmde4FZcFLfrQ3EuricDCMm/xx55xE2gw=;
        b=CjdoZr7M/UQSJqcnmDRcFgjSVGeOfURbFt5xEzZCs3vKVE1hUqZyj0/ZO68Djg1189
         QXmYLoyiNax8/OkHr/g8LyMUnju++aDIFWJEzciAaM5XIBNMgyC7Aa/lKwdy7ZW5Ld22
         gCsQnx33cIkgNuqcQqaQXHIxYH99AYgTqzBMyqukk4focmVAl4XTt80cvOe5NGYzbuhS
         FRt7iisHY+x3p9HAKTi5BcKPsDxA8SfgkHU/XopCHkOf6DEFm9QKtQMh5Yw2MZPwGEnc
         u4eBBi52tYBB5VK1k6LDhuEcu2AQOCE4aas7poYieKKyrEGOi8T5TQhLgBRAGIrlfEtl
         Uy/w==
X-Gm-Message-State: AOAM531Pptf27kie65VwITUcNz15/J9UfvJqM22l+qJZwZeu+KFumzmS
        sGs/7fS/RyTfl8ASSZFw/62FmVl8Jm3XYA==
X-Google-Smtp-Source: ABdhPJynCCQ9d+vLlAgJ44e3oh8JI6xmdIbGo+8j27KwGUpeuqGpupWGerqTAEwhmi33venFduMCww==
X-Received: by 2002:a63:c441:: with SMTP id m1mr865573pgg.2.1599030212255;
        Wed, 02 Sep 2020 00:03:32 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id g9sm4525543pfo.144.2020.09.02.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 00:03:31 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Date:   Wed,  2 Sep 2020 15:03:19 +0800
Message-Id: <20200902150309.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If rpmsg_register_device fails, it will call
mtk_rpmsg_release_device which already frees mdev.

Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

 drivers/rpmsg/mtk_rpmsg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 83f2b8804ee989d..f43b69c00e8aa44 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -220,10 +220,8 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	rpdev->dev.release = mtk_rpmsg_release_device;
 
 	ret = rpmsg_register_device(rpdev);
-	if (ret) {
-		kfree(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.28.0.402.g5ffc5be6b7-goog

