Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0198727247
	for <lists+linux-remoteproc@lfdr.de>; Thu,  8 Jun 2023 00:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbjFGWze (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Jun 2023 18:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbjFGWzZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jun 2023 18:55:25 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E79268E
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jun 2023 15:55:13 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977c88c9021so498266b.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jun 2023 15:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686178513; x=1688770513;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lwmqmz3SLTAm/5XHn54kA2Qkz1KiGdBlOiEDAaxIk1A=;
        b=h4j71OFNDV5FfvldtjCh/L+Qg71oYHcBnHuDB5srtk996zsBHlbD8SaqVv65TPPNSR
         D55ZWk68qXdEmt+kIdXRugiaujZb/weZnFCTHcuZcbiNqcbtWT0X7OlskYnP/y/1JDzr
         WbOZ68AcZfM/aHW4up57fkOGafclaBar/hLOCFBtTjAlCxKYQtVTvq0W4SECGmO4CUql
         dig397pPxdZX0OTvC2J8JrOzuSqogeJM29duG5G1BgaFsW6donzZWRU1Jz4x6qDKSWR9
         w6/41Hy1gwVz7zf6M5uQKiqeQS7jHj9sppdk3jRa//N+UQ6Qg+lxAaHE7mp4Zy+a5Adc
         Kv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686178513; x=1688770513;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwmqmz3SLTAm/5XHn54kA2Qkz1KiGdBlOiEDAaxIk1A=;
        b=eXzNeRegtB6tUvYQ/vNbaSFtip9Qq6COqdBZnSGuX14QFV2RP/t/fQoi0hDAtlppfJ
         tr8ehTz5PF468m3BY5vXCIq4m01bg4cu3mWU+K26FrfkBoCU3KCE8vSnteaduvx8lDkH
         SDVSt/+bHj/SY4wXtaTwEWMn8yjXOeWDUtyo5q7m4BSAnvUePjgvFRUIIekrBCeIK6an
         bzmhsDcesYI1+4BWc/mcy7UW1D3NFApdz4yeVEatFhyhKPUMp4LDsh9nyPa8ThRcQxpY
         iID5GdHkfJKKiAhXljG4d8vndcOp8dbOrgg06UNitn+Kom6GSW3+UbVWpxsEf5CFDqRl
         iVaA==
X-Gm-Message-State: AC+VfDxOGyTwrDFUkmvKJDyvNHcZ7NCoPqEWGPgZeAlDx95YAW69xBXc
        haBlPJMLhhP3GAb8Mb1aQNOYRM7+O6j1cpm3JHKnKK/nzIoJyQ==
X-Google-Smtp-Source: ACHHUZ5q9v5E8VuN7LGrTh1boUYVANIIUnJnBwlK4YNL8XVT+z7GalrAexguq0b795Op+2qoCUEoHnMN8sFXq0M0ebg=
X-Received: by 2002:a17:907:8a15:b0:96f:d154:54f7 with SMTP id
 sc21-20020a1709078a1500b0096fd15454f7mr7113590ejc.42.1686178492570; Wed, 07
 Jun 2023 15:54:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:2409:0:b0:217:72a9:f646 with HTTP; Wed, 7 Jun 2023
 15:54:52 -0700 (PDT)
Reply-To: unitednationcompensationcoordinatortreasury@hotmail.com
From:   "UNITED NATION DEPUTY SECRETARY-GENERAL (U.N)" 
        <successikolo@gmail.com>
Date:   Wed, 7 Jun 2023 15:54:52 -0700
Message-ID: <CADFNGJ8vkgORi1jPvvhP+FQnPCNqs4cr588+_a-ywDXpqf+qKA@mail.gmail.com>
Subject: CONTACT DHL OFFICE IMMEDIATELY FOR YOUR ATM MASTER CARD 1.5 MILLION,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.6 required=5.0 tests=ADVANCE_FEE_3_NEW_FRM_MNY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FILL_THIS_FORM,FORM_FRAUD_5,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FORM,MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_FILL_THIS_FORM_LOAN,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:633 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [successikolo[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  0.0 T_FILL_THIS_FORM_LOAN Answer loan question(s)
        *  0.0 MONEY_FORM Lots of money if you fill out a form
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_3_NEW_FRM_MNY Advance Fee fraud form and lots of
        *      money
        *  0.2 MONEY_FRAUD_5 Lots of money and many fraud phrases
        *  0.0 FORM_FRAUD_5 Fill a form and many fraud phrases
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

UNITED NATION DEPUTY SECRETARY-GENERAL.

This is to official inform you that we have been having meetings for
the past three (3) weeks which ended two days ago with MR. JIM YONG
KIM the world bank president and other seven continent presidents on
the congress we treated on solution to scam victim problems.

 Note: we have decided to contact you following the reports we
received from anti-fraud international monitoring group your
name/email has been submitted to us therefore the united nations have
agreed to compensate you with the sum of (USD$ 1.5 Million) this
compensation is also including international business that failed you
in the past due to government problems etc.

 We have arranged your payment through our ATM Master Card and
deposited it in DHL Office to deliver it to you which is the latest
instruction from the World Bank president MR. JIM YONG KIM, For your
information=E2=80=99s, the delivery charges already paid by U.N treasury, t=
he
only money you will send to DHL office south Korea is
($500). for security keeping fee, U.N coordinator already paid for
others charges fees for delivery except the security keeping fee, the
director of DHL refused to collect the security keeping fee from U.N
coordinator, the Director of DHL office said that they don=E2=80=99t know
exactly time you will contact them to reconfirm your details to avoid
counting demur-rage that is why they refused collecting the ($500) .
for security keeping fee.

 Therefore be advice to contact DHL Office agent south Korea. Rev:John
Lee Tae-seok
who is in position to deliver your ATM
Master Card to your location address, contact DHL Office immediately
with the bellow email & phone number as listed below.

 Contact name: John Lee Tae-seok

 Email:( dhlgeneralheadquartersrepublic@gmail.com )

 Do not hesitate to Contact Rev: John Lee Tae-seok, as soon as you

 read this message. Email:( dhlgeneralheadquartersrepublic@gmail.com )

 Make sure you reconfirmed DHL Office your details ASAP as stated
below to avoid wrong delivery.

 Your full name..........

 Home address:.........

 Your country...........

 Your city..............

 Telephone......

 Occupation:.......

 Age:=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6..

 Let us know as soon as possible you receive your ATM MasterCard
for proper verification.

 Regards,

 Mrs Vivian kakadu.

 DEPUTY SECRETARY-GENERAL (U.N)
