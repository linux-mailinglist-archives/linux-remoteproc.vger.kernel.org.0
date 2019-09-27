Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BEBC0119
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Sep 2019 10:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfI0I2H (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Sep 2019 04:28:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39825 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfI0I2G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Sep 2019 04:28:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so785536plp.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2019 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NbFqGjxE2PnbU6z1Ec7WUi7n4X/b/Z/rHpPihB2LfiE=;
        b=Nr1+Uv61tYBYR/gUeeunQBRJzDTbsfg0GWvMsad63gteY4RtQNSRpjeTGGNkFBUVd0
         eh4r8/Lw0VLOg1PBeJieR+OzvTouP0Le87sDd7coeFfMNGA/m4uRaKtHUrDnpCDJJvXs
         /r7TGahl1/9m5QxvOjdrjWlikA91e3ITT6tQ/3kE8LQa5pYBxZciKifLi4qH9xvMu3hz
         lpBf0lZ7wph5QmxBqpdso9gt2IexvuFiNBU2YInsUjY57uDWZMWNOh3OA7fCjLkR585v
         EgcvZXWKp777yZplzAiK7Vksf3N5viFUkOGC0LjBqfGPVZE7RrcAStM3v9FnrZ45OtYm
         bkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NbFqGjxE2PnbU6z1Ec7WUi7n4X/b/Z/rHpPihB2LfiE=;
        b=D1mPg50BppzNJy5BdbpJDkGNIcdIg4e3g8qgCRi1S//Xe85Adk0CYd7s/l6tKnHlCE
         3F1mciT4V+fJmkYnkjG8aNBgom+zpcofYXv4DY8nxx704euljc92beJ9Hub9iosxozOz
         pu/eW8V/E6YNMM59ZrfDtJAssgQt/VKoOcdoFiGnvH9zoi1aQS3jab0heRqkp1J8wF+W
         4jOl3Hp0+9QEa3frr6sudScjnPGXFnGSUOFwkOKK3iS9ks/gh8QgGHQjtfEw4hmtie6/
         kk+QgUlalZl+3zi75zUi00nvfWVtME8sSKxWpZNLxoQgCW80PVyUEmuQgQGuJkRRJWoJ
         fCrw==
X-Gm-Message-State: APjAAAV9BlVogEw7MUfXZozNBzUJ7EMG4wCW7RtNuN8259IKhwOpIFvX
        QlicxdNe3yroKVrjTqbYkPife62PYQ9uYQ==
X-Google-Smtp-Source: APXvYqwBR2/4d/E5sZqWUkMQbkc18m5T+0zVPlzOpWrkai8yINxJ1zE85vRfNhXyjmTVdE4u1KlrzQ==
X-Received: by 2002:a17:902:d887:: with SMTP id b7mr3087377plz.297.1569572886073;
        Fri, 27 Sep 2019 01:28:06 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 6sm2043521pfa.162.2019.09.27.01.28.02
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 01:28:04 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     linus.walleij@linaro.org, ohad@wizery.com,
        bjorn.andersson@linaro.org
Cc:     baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Optimize the u8500_hsem hwlock driver
Date:   Fri, 27 Sep 2019 16:27:40 +0800
Message-Id: <cover.1569572448.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch set did some Optimization with changing to use devm_xxx()
APIs to simplify the code and make code more readable.

Baolin Wang (3):
  hwspinlock: u8500_hsem: Change to use
    devm_platform_ioremap_resource()
  hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
  hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register
    hwlock controller

 drivers/hwspinlock/u8500_hsem.c |   46 +++++++++++----------------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

-- 
1.7.9.5

