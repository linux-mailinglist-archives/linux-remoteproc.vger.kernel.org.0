Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D82B6BFFCC
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 09:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfI0HLO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 03:11:14 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32922 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfI0HLN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 03:11:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id d22so715578pls.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QRNTfvVyCK5bbHeSG6WJ7G90ba0BRcjEhnvGaZUR3O4=;
        b=Z+7ixFdyDjZdCoa7+16p/WiWMn+KKodd3MLzu1wCZ5xIkH+B+R5rIK0VHDHcL1v+M3
         k55HUqLAHv/FhmSTVDCgI6DJACQn9AoS4wmhcXWd9/QSjQ3x/BSWT9jnKrzlDLez0DAp
         JjM3S4w4Y1upRO5PoxuJ/P68VME6HX4wj7VUz6HlxKrOPMCEf5oLmpAhCqIBL/JZGn3r
         mPQ+aOS202oWHpwI0hGouy7a8PSU90PsmeylYBRwoNKBmkA8x3gOR6eneeo64Qi2hnYE
         S0tgjl96eQgvBK4B0WCQg8NgQHxp/LUvYd6T/cJULd3nZe8bo39xMsmsv6hMyg519gS4
         RA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QRNTfvVyCK5bbHeSG6WJ7G90ba0BRcjEhnvGaZUR3O4=;
        b=IZlOU00F8H+jjhs9BnLEhk6oEti2KQ1P9cM10O3s9KuWHcpxCFCo0l1TSg0yD9ZdZv
         I800E9H8s13zuDlyLaujIeNzGo0q7mvGoLUIFNHa9jK93iKs/+QN/4ycRkf8XZzE0ZN/
         GmNkFfIt4tJykt7gX7X+4DDsn3wu1o2oA0bjAUAei2pAQkLThsGO0USwRHCKUpuFeBb4
         3Gf3QPD5vPIaTbpqsDuUT7vNJ1P41BtvubVv6gOTE/fdBkQD6cj2SsQMkVZM4wkE6hLy
         m3IqN21SddIE/LYMg4D58hA6EP280lxNVg+5V+kiG4Son/rR5RT1T24h1z6GRZ+6VQKg
         mJCw==
X-Gm-Message-State: APjAAAWKFSfxhtxaHEd1CwUgDaSfRGOS7vU9cRcCxpCoYag9cM3gz+fK
        ThYBy3+DFG738tFm0vXsLBhuXA==
X-Google-Smtp-Source: APXvYqyqfHUXWwRMV3DOgX6ALCpaD1faiee6ZVSazk+b4FUfUrv2vIQUnJsVq/3monizvbWaexoD5Q==
X-Received: by 2002:a17:902:a613:: with SMTP id u19mr2998244plq.122.1569568271110;
        Fri, 27 Sep 2019 00:11:11 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f74sm1733288pfa.34.2019.09.27.00.11.08
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 00:11:10 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Some optimization for Spreadtrum hwlock controller
Date:   Fri, 27 Sep 2019 15:10:43 +0800
Message-Id: <cover.1569567749.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch set did some optimization for Spreadtrum hwlock controller,
including using some devm_xxx APIs to simplify code and validating the
return value when enabling clock.

Baolin Wang (4):
  hwspinlock: sprd: Change to use devm_platform_ioremap_resource()
  hwspinlock: sprd: Check the return value of clk_prepare_enable()
  hwspinlock: sprd: Use devm_add_action_or_reset() for calls to
    clk_disable_unprepare()
  hwspinlock: sprd: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/sprd_hwspinlock.c |   33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

-- 
1.7.9.5

