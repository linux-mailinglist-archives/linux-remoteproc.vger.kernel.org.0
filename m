Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C8AA2621
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Aug 2019 20:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfH2Sga (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 29 Aug 2019 14:36:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45277 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbfH2Sga (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Aug 2019 14:36:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id w26so2626740pfq.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Aug 2019 11:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KbKypMZEMo628Sx98GbFT2Lyxp3a3o8vbOSGro2hqs8=;
        b=t3zQUyJMxStChnSzVBHngExmp8QsLonx59qyC0ffBqgubbjGeOyOFMOsHJf8uf6HkB
         CojAknqMdbyB8D+o/RuZItXS57kNsGGjly1qq2ZpZ9joOvjLQ5RVfWeJcCMLtQBpw/zH
         eepAT69hr+gc0hwxvBjbl90PN9iyk0QDzHp5MV7YLfKc5W0wOQ7zGHWbDhWf+GrfcdTh
         wPK7Sxg25ZX5mWRup3BIgWX38rdvTV+rGjVQfpKopTCfmhGLIoh5TTogX8eiT9lPG+F4
         t34bu1vWoK9BI1Ryd083tz1DsL+ZG6939oGqr1RuXw/GymWIu89dLRkNTx/6QIyGSRjj
         NN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KbKypMZEMo628Sx98GbFT2Lyxp3a3o8vbOSGro2hqs8=;
        b=Q65ALpBpVAH3YtxyRFaSDOOMz2SBRPyEY2Fv59p55tMQrFnHJ0Fyxv76cIMM3yO5Vh
         ZzNK/iIIpTeCkV7MctoCtIDfEqo+EUjIxiKROxyvYlcgZIEBbpZNbqUxLSQGheXEeOSU
         zCX0j4/UkzMUV7ZjFa9RfXUi3McmMxoJe2M+k5CSh8XwuO10n1m82NpTNQrTBQpdnkYY
         gI51agEQsJ70yZWi2/KdNHedkVBJ2g6SPdrKoJaismVFE5xGwNVTYvakEr0lXnJnQ3P6
         OQL/FExsOmF6kPOvIBjVAwVTm8b9hd91+RyZfbO5eEMAqXOWfAejmc0ixMXMFt0stXkU
         xZlw==
X-Gm-Message-State: APjAAAVL0gLBp6eRUpBDyzDXV8OGnBRD8CoQW8bbgw+3l2+zmndqm7qt
        9p7+Q1slVdDHkZWQ3DFm7Cl3Y6BxHRw=
X-Google-Smtp-Source: APXvYqxpv+GziRN1zBpbr421YfeGoyK+5VQeDsDe4w/JmyFKe9EoDJcwIteI02M7WGql0t//MIrfew==
X-Received: by 2002:a62:5c5:: with SMTP id 188mr13311302pff.227.1567103789574;
        Thu, 29 Aug 2019 11:36:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id ay7sm2840574pjb.4.2019.08.29.11.36.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 11:36:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: glink-smem: Name the edge based on parent remoteproc
Date:   Thu, 29 Aug 2019 11:36:25 -0700
Message-Id: <20190829183625.32244-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Naming the glink edge device on the parent of_node short name causes
collisions when multiple remoteproc instances with only different unit
address are described on the platform_bus in DeviceTree.

Base the edge's name on the parent remoteproc's name instead, to ensure
that it's unique.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 64a5ce324c7f..4238383d8685 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -201,7 +201,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 	dev->parent = parent;
 	dev->of_node = node;
 	dev->release = qcom_glink_smem_release;
-	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
+	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
-- 
2.18.0

