Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3227F798980
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Sep 2023 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238409AbjIHPDy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 Sep 2023 11:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243458AbjIHPDy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Sep 2023 11:03:54 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363431FC4
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Sep 2023 08:03:49 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so6995778a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Sep 2023 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694185427; x=1694790227; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgbRCToEb5NmEGS74P9h1ZwNZOKwIjjVNc1A6TPphJs=;
        b=oAZ8MtO/TglrT1MY1/eewD/01E9hjVMJb0n4JXttqacYCylmvNjdEw+x4SxF9wY0Fy
         HUOx6st7bk4/5oki9bedcF2bOVkv9Qo3oK2/iG4rayY2RR/CUaTRrM5iwVmE/ZmOogdi
         IDTBppG4Gu1TTh4MBVvyReA3UawjVe/j4fTxZHyvod94FC93I2DaBPPXbdP1M1cEdLb1
         8GlNhfi2h4f85Q6T4zQla5UXPzNqyKpv8h3NAgLx50e3xOu6GJcuy0HfHsmlu2d30PWl
         ABl7vi0GSgegBr+d8QdjMS1nBCX1sNrebfsSVX/FIMpm/uD8uErogLA8D62yUZKJqQlV
         yw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694185427; x=1694790227;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgbRCToEb5NmEGS74P9h1ZwNZOKwIjjVNc1A6TPphJs=;
        b=bBYXiiHmSKXJClfggHgIbKA3OQMMSj8OMDEJR/919RbQmdOp3KK1YRMn9SvV68CxnG
         a7c4GNshNC5LSEq0azkmDSwFwftu7ureU02IFwT8rduGRh81jbsdOUFjNyicTmfltIPH
         mwvbth2391FebA6RoyrzhJAcTflXwRWYoQ3Go8rd/l+gA2kkyKKydxYEGPuhZoGjAFnk
         XPmZMnMsUp7h9//soDcJCwj8oBGTxIzxQURhim5S4IAvYH4Xqhnd2SW298xHC8Ah4dje
         zNyp9Yxe5aPSDuel354GW8id33XA3Cv6XSisVP9SLoL/RxXfaOyXGuq4Q1HClLEewMIX
         Egsg==
X-Gm-Message-State: AOJu0YypNDcf4I842d6rE7X2Z6llXErZ0JQZ3l/8P5b9u+NNcSIERQpY
        2HOv+ZaM6XTudzWCyIiCTc26w55Wu6M9UnSKpGw=
X-Google-Smtp-Source: AGHT+IEEPvFKP5sUKl+TfFd5GNBGbrKhtGba+BcCS4qkr1b8bKTyv15XMXkviGb38ahMzZ8eWnhbXhblw9jddy1/ZQw=
X-Received: by 2002:a17:907:2c62:b0:9a1:eb4f:56f with SMTP id
 ib2-20020a1709072c6200b009a1eb4f056fmr3345882ejc.13.1694185425763; Fri, 08
 Sep 2023 08:03:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:a41:b0:9a5:a231:1330 with HTTP; Fri, 8 Sep 2023
 08:03:45 -0700 (PDT)
Reply-To: PopovAleksander@proton.me
From:   Popov Aleksander <offficeo01@gmail.com>
Date:   Fri, 8 Sep 2023 08:03:45 -0700
Message-ID: <CAKrNddYK4FjcKf7d8SU2j4-D=9vcownBt7QSHH0b5hA8o-aFcQ@mail.gmail.com>
Subject: URGENT RESPONSE!!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.0 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,TVD_PH_SUBJ_META1,UNDISC_MONEY,
        URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2a00:1450:4864:20:0:0:0:535 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [offficeo01[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [offficeo01[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.6 URG_BIZ Contains urgent matter
        *  1.2 TVD_PH_SUBJ_META1 Email has a Phishy looking subject line
        *  0.0 ADVANCE_FEE_4_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Greetings,

Trust you are doing well, I got your email contact from Google
business listing in your country and with your interesting profile, I
decided to contact you.

My name is Popov Aleksander from Ukraine, I'm a businessman reaching
from Kyiv where I am currently stuck due to the restriction of some
age bracket which is not allowed to leave the country as part of
government's martial law by virtue of the ongoing war here in Ukraine.

It has been over 18 months into the war. Many businesses have
collapsed, especially in my region the Mariupol City of Donetsk Oblast
where the Russian Army has invaded and occupied.

Considering the situation in my country, I have decided to make an
investment outside Ukraine so I'm searching for a capable partner who
can manage my resources judiciously, I can fund a multi-million
investment as partnership or loan as long as my fund will be in safe
hands. If you are interested, contact  PopovAleksander@proton.me  for
more discussion.


Regards,
Popov Aleksander
Kyiv, Ukraine.
