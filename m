Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612B8616E18
	for <lists+linux-remoteproc@lfdr.de>; Wed,  2 Nov 2022 20:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiKBT6D (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Nov 2022 15:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKBT6C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Nov 2022 15:58:02 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BEA304
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Nov 2022 12:58:02 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id r81so7264612iod.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Nov 2022 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DN7mjlf2XzU1dWqqOaKZ+Ai4p+1KT1CKpDuoctQ1E+c=;
        b=zdWM4fsLa7FPDgAUpVjGxeQytnKMRHdL9RtlOh2WGvQTSwlMJGkU3r7k47tJ/W8au0
         8oXXMSjwOQLgDdVq1f+Lc5QLzSkUSmgu2mQMW71kXbx3ghoR9s/Xiq6YAFVUSuJfB05h
         6pJ14ZTKCMBbrt7NHCxPmKnoWii3jt7yPDIcyF3yNpI50jfDHo1RtcRAgVtcIpaf7TEr
         leYfxO1TE0lHwlAHVJ+dgxZ+Mwm4kL0qBJS2ElImw+GS7xoO+EgeABiU/cy7MOB/GIFL
         aKkZtevxJnEZHq1YPfMCPENxMnYj6cQm8SKCziQGZa7Mendkpu3NLvBVoFVcSLiUWd2d
         Nevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DN7mjlf2XzU1dWqqOaKZ+Ai4p+1KT1CKpDuoctQ1E+c=;
        b=sFYc8sfkhVIMWwqW5zUO6oIWUXGd6uSV6x91n6cuPmLDEJgp0qcz0fZUzYo0s4DHZk
         Bg90TtsP4TGANKJHAqujFBr54hWzf+561aI7KZwh0wPnXj46yO/QJXqrpERjYJiSPRYJ
         q1WbTazOpfu7YufYSYfJDHNK8iv45FgPw0keaTXvyDZ3KnmgYQ8XhlZTM9sYgm6m8/Ws
         RhQlVt40GyQHco/WabYJFHlxVO4lS1KoMm7ZHEJaULnpwDUv6MXq4/hw7W1O47WatkA2
         Cm+X6erMRQyvBJ7b1wKGzm+y7M4Pxm4zGRxRbJxJ85EnLyTKs2667Nt32n9YelM8lDbu
         +JVg==
X-Gm-Message-State: ACrzQf0Zxy/AmClMaK5yVjfV0MxR1Q3OBpo8RooDJMHJPuabs1MNXaPP
        Nf9u1EDAMcWYKtC1G7hg/Nat00Uy7BuuVP1uQN+MlCIUsock+Q==
X-Google-Smtp-Source: AMsMyM5IuDUdQp6fHhzniCsQjous4X0IwtInUfQphulXEC+H/6R9AWFlilkFH4mMrG3/M6JlW6BEpxXlaxjPcC7lX0o=
X-Received: by 2002:a05:6602:3420:b0:6ce:3066:181a with SMTP id
 n32-20020a056602342000b006ce3066181amr13160611ioz.98.1667419081308; Wed, 02
 Nov 2022 12:58:01 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 2 Nov 2022 13:57:50 -0600
Message-ID: <CANLsYkzZJsdA60A9FXJWN4XDuvVoVNHn+DRjssiNpFvJvsDhpw@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for November 2nd 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v7 0/6] Introduce PRU remoteproc consumer API
[PATCH V3 0/3] rpmsg signaling/flowcontrol patches
