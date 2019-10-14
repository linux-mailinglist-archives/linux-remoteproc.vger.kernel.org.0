Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C88CD5BE6
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Oct 2019 09:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbfJNHIY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Oct 2019 03:08:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43534 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730263AbfJNHIY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Oct 2019 03:08:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id i32so9530305pgl.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2019 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=c0QsMwW5/HlkG+EyBzY3CChBE/BthJe1X9zmk8IUDUw=;
        b=ro6DrO1FSFrjgnEbuCTFqXVAOUVvaYpkPhUpMZ3QcSfsKg7mJYalOmP12P9nqpUs1I
         ZzuRB2eVsqibk7k7fhjPHQwKoppJIb1DZz+fNE1uUnjV4+53EarSuH/nZTTMHXOHonEq
         IF/3wnllpGOFgEpK3auT7PifBwXLm3WxU3JdX13f0ZzF0I+8e/iaVMUK6Q/DBL2cZu3n
         1g9EkexgpyNk8xDpuzMejRk99CzovZpYavY0EmELdxHBrs9m1SDjcHjfeEWkID4Ip4+Z
         QBtdkzX4/mq7v5Q7tCDLp3N0nXHtiKzUqfQavPSMs5E/ja8WQ3MUEKkamc6pEW/+e3Lw
         05Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=c0QsMwW5/HlkG+EyBzY3CChBE/BthJe1X9zmk8IUDUw=;
        b=jno9U382hOvLAVu8PNk8PjgjqVXj6vir2Sk5ZSDFt02Zyx6dy8SM+Xy9SKtJUUJq30
         HBOukfD5fSyab1/dwjMg+Qv/5hK23Knr5e2FanxAp4P8tU9TkF45/Uj9f1dqbwt1/2d9
         pFnzGZMIvLcTRelTFTyvVY1kexKzO8e/+IY7emfApACZtLG93uOvtMlkLRoVImlba+Uy
         6Whd0QE73QpDToPKp9Sh18R6nzia1sSBDBAoNYKp5iTd+5MtjymOZHKdvPm910RgCgBQ
         LRCYT/WMRidvPIAtgBLhYKa8MIbTK9Qr8KpiJFnMC/6jOqnygaFOvDC6UmGKQPaknAuT
         /9dg==
X-Gm-Message-State: APjAAAV7DfMYseI7yICRF+eaf86K+G35LTlSUWxBi7doOJoDGESXBiAe
        afxU+7bbUBeXhwvLcWKsEIV1xg==
X-Google-Smtp-Source: APXvYqxpj08mz2lldyLGGjWvshFVJheqS7LJzHgtZNqHz5/AArf3lNTOgLpoag2/XVvFk3uStAaTBg==
X-Received: by 2002:a65:44cb:: with SMTP id g11mr32096865pgs.145.1571036901879;
        Mon, 14 Oct 2019 00:08:21 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id p190sm20619948pfb.160.2019.10.14.00.08.18
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 14 Oct 2019 00:08:21 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linus.walleij@linaro.org, orsonzhai@gmail.com,
        zhang.lyra@gmail.com, baolin.wang@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] hwspinlock: Let the PM runtime can be optional
Date:   Mon, 14 Oct 2019 15:07:44 +0800
Message-Id: <6c03ca84b19f0e3a4bd60b4d5ea70fd801ed7555.1571036463.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Now some hwspinlock controllers did not have the requirement to implement
the PM runtime, but drivers must enable the PM runtime to comply with the
hwspinlock core.

Thus we can change the PM runtime support to be optional by validating
the -EACCES error number which means the PM runtime is not enabled, and
removing the return value validating of pm_runtime_put(). So that we
can remove some redundant PM runtime code in drivers.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/hwspinlock_core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a22e252c..fd5f5c5 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -657,13 +657,15 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 
 	/* notify PM core that power is now needed */
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
+	if (ret < 0 && ret != -EACCES) {
 		dev_err(dev, "%s: can't power on device\n", __func__);
 		pm_runtime_put_noidle(dev);
 		module_put(dev->driver->owner);
 		return ret;
 	}
 
+	ret = 0;
+
 	/* mark hwspinlock as used, should not fail */
 	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
 							HWSPINLOCK_UNUSED);
@@ -820,9 +822,7 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	}
 
 	/* notify the underlying device that power is not needed */
-	ret = pm_runtime_put(dev);
-	if (ret < 0)
-		goto out;
+	pm_runtime_put(dev);
 
 	/* mark this hwspinlock as available */
 	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-- 
1.7.9.5

