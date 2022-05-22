Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903085304C5
	for <lists+linux-remoteproc@lfdr.de>; Sun, 22 May 2022 18:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345823AbiEVQzy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 22 May 2022 12:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235505AbiEVQzx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 May 2022 12:55:53 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05D936324
        for <linux-remoteproc@vger.kernel.org>; Sun, 22 May 2022 09:55:52 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f1d5464c48so15700998fac.6
        for <linux-remoteproc@vger.kernel.org>; Sun, 22 May 2022 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=jKBn34OMqrb1ZV6Zy2nT260iMElYSgonAvEup+7zoFXvikbiXjhqSLQrhaqaAZ4GIM
         TOolARk6zwzfQ7SVhgKfk/5hd8+Ssj5mNEWBtNU9Xk+Dl2dlS+29FzS6/c74j72vTzOw
         n9qZwTSvLhAsA615ljwsu7Bz35KaTlJ+Hc87OPRTOHyww93NyIPOW50f5jW1FaRvsehG
         L8JHjYbxdiQDqJFeCtW+gznQfFncScvwG/hPTKgVounDhbAUf8QoSINHWBfKF68S7NqV
         D8Wfoy8rnK8MoUH/kXlRVbGdQZcL+NQeSQcCw1s8cHZAmg+zVyhHxhAdO808EQeUJj9m
         BLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=mGVcoDzF5gJazW2RGFwF2LBouZBVmWArVCnELSGA5i5+gqUwbNoVSufbo9OQPKMbV4
         R5imaBwY6EMz3/1XubkTNIABwybZczUMwd64x2/yt+FkePl8RzZmayoA4QBbn/1lfesA
         TaMDMmMb6zVrT3wE3L0YQKo8XHtFOXzZSwcZImTf5dnYK2HH8ur+RBEnytZFZ9K8UT4O
         7v5CvUb9NGW38PPrtDiRhUjjsLCuY8q40nalP84G3JaxoGXrWdBlNEjY7XyZfPpMW0/L
         gr2vOyXi/CZggs5za+EbRR429zj/5zuWrBngW0fz3dPmOkA9+KJnQKosuX/lTwVR8l45
         3feQ==
X-Gm-Message-State: AOAM533fo27R5xY6uHESumKFzE5upMYYLnysDWcqeg3IRzhvwEfHonjU
        uAeqDnYwg2iWjb0rD81U5O1O1Y84gyILLaPi0hk=
X-Google-Smtp-Source: ABdhPJwrtumWmBtnEP2BTElCVSwshfKKPxisuE3zWaDeWkzyWg7z4vxZAJ3WxY32QmWdt1jyFV7vUUxNNy9wijbGWYw=
X-Received: by 2002:a05:6870:4596:b0:da:b3f:2b1d with SMTP id
 y22-20020a056870459600b000da0b3f2b1dmr11180177oao.188.1653238551829; Sun, 22
 May 2022 09:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:8794:b0:a3:1d9:70e9 with HTTP; Sun, 22 May 2022
 09:55:51 -0700 (PDT)
Reply-To: paulmichael7707@gmail.com
From:   paul michael <gabrielbenjamin22222@gmail.com>
Date:   Sun, 22 May 2022 17:55:51 +0100
Message-ID: <CADch5ANMT9=Qx8cLcnaxKjHGzSHi9KZgQrgfWDLz_kjt6mFfHA@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4490]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [paulmichael7707[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gabrielbenjamin22222[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gabrielbenjamin22222[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
