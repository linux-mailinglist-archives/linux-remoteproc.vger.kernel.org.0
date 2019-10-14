Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539AED5BE1
	for <lists+linux-remoteproc@lfdr.de>; Mon, 14 Oct 2019 09:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730240AbfJNHIP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 14 Oct 2019 03:08:15 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33742 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbfJNHIP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Oct 2019 03:08:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so7614567pls.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2019 00:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NguePtiRLqxxPERuaTU6qYGHlLMZjTiDWKMVkMyftlI=;
        b=pxXPOhc4f+9VgOl55DLeIiVMic5UpGOtXZyhX9MkkzluVA6Hb9lV7/dwJcIh4u9zy8
         DDhzHzZmg3EfkwS0ZALwQlNWzvM5U9HLaIff2voswp0oRABMadlT8GEAnhxQC+y5OIqI
         CNqnImA3S66tx/nFbxFvfKM2+t7ZNENG3hLw+1ZM0K3VvYlbpcNBPm8lelOFTh3bXhmM
         gMwatu4vE8ZYstGm7fkMssvWoVHgkTQ8bPVXKeqK5HaLs2F/ulm/AW7Jneyb24PLF6Fu
         mSz7/XLFsCEn38aKUkzyf4YkusQEDcWLNREJx9njDl3z9f93jsfexS4ZUlmeCJmzf8gy
         fubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NguePtiRLqxxPERuaTU6qYGHlLMZjTiDWKMVkMyftlI=;
        b=SlwOhb558OTv9gPkPcUXTAIY7GyWD2CUHpveM7km4EurDO8b4zie6lLcXRszUFVZNq
         7NXpmBbLW77P/7ePur5H3KeOVXx0fIn0gLBeKixkEaObLnY5QSyIWToUTBwPJT4BMqhq
         s+fyHBuYMwtlXT6oOZT0Emxn29xuUoj73IZuF8VEtIExMHAXXPT9GAYcX6KQTYvIeFqT
         e1BdnZlxAg70BK/geYQKE80ronQePEZLlI55gikwVm2bH/e5FYoKmX/vDlOCQu9Qbw+Q
         J/AZpb/dRcdvvzDzfncvLDb2LcdJyl544cj144fgTO7tpBsw/XbiqsyXXHVPrWYovFyA
         CLrA==
X-Gm-Message-State: APjAAAUTqCOn95KMfzlyuEdRi5lSiUAvi0pKcEnxiin0cGri31+B+8TJ
        FzzKyUxHdX5wuwamc4p1/pzKrA==
X-Google-Smtp-Source: APXvYqwejRJqYN+1PN+rmvhGFte4RQiA22AwEs1KXqwUn+eV0HR/gMGjIqh5w5+BnvYjRJHsoXZdvQ==
X-Received: by 2002:a17:902:9696:: with SMTP id n22mr26782696plp.252.1571036894371;
        Mon, 14 Oct 2019 00:08:14 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id p190sm20619948pfb.160.2019.10.14.00.08.10
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 14 Oct 2019 00:08:13 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linus.walleij@linaro.org, orsonzhai@gmail.com,
        zhang.lyra@gmail.com, baolin.wang@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Some improvements for hwspinlock
Date:   Mon, 14 Oct 2019 15:07:42 +0800
Message-Id: <cover.1571036463.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch set removes the BUG_ON() from hwspinlock core and changes the
PM runtime support to be optional.

Baolin Wang (4):
  hwspinlock: Remove BUG_ON() from the hwspinlock core
  hwspinlock: Let the PM runtime can be optional
  hwspinlock: sprd: Remove redundant PM runtime implementation
  hwspinlock: u8500_hsem: Remove redundant PM runtime implementation

 drivers/hwspinlock/hwspinlock_core.c |   16 ++++++++--------
 drivers/hwspinlock/sprd_hwspinlock.c |   21 +++------------------
 drivers/hwspinlock/u8500_hsem.c      |   19 ++++---------------
 3 files changed, 15 insertions(+), 41 deletions(-)

-- 
1.7.9.5

